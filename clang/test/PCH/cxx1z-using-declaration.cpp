// No PCH:
// RUN: %clang_cc1 -pedantic -std=c++1z -include %s -verify %s
//
// With PCH:
// RUN: %clang_cc1 -pedantic -std=c++1z -emit-pch %s -o %t
// RUN: %clang_cc1 -pedantic -std=c++1z -include-pch %t -verify %s

#ifndef HEADER
#define HEADER

template<typename ...T> struct A : T... {
  using T::f ...;
  template<typename ...U> void g(U ...u) { f(u...); }
};

struct X { void f(); };
struct Y { void f(int); };
struct Z { void f(int, int); };

inline A<X, Y, Z> a;

#else

void test() {
  a.g();
  a.g(0);
  a.g(0, 0);
  // expected-error@13 {{no match}}
  // expected-note@16 {{candidate}}
  // expected-note@17 {{candidate}}
  // expected-note@18 {{candidate}}
  a.g(0, 0, 0); // expected-note {{instantiation of}}
}

#endif
