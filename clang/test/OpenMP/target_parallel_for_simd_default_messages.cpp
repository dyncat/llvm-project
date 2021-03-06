// RUN: %clang_cc1 -verify -fopenmp -ferror-limit 100 -o - %s -Wuninitialized

// RUN: %clang_cc1 -verify -fopenmp-simd -ferror-limit 100 -o - %s -Wuninitialized

void foo();

int main(int argc, char **argv) {
  int i;
#pragma omp target parallel for simd default // expected-error {{expected '(' after 'default'}}
  for (i = 0; i < argc; ++i)
    foo();
#pragma omp target parallel for simd default( // expected-error {{expected 'none' or 'shared' in OpenMP clause 'default'}} expected-error {{expected ')'}} expected-note {{to match this '('}}
  for (i = 0; i < argc; ++i)
    foo();
#pragma omp target parallel for simd default() // expected-error {{expected 'none' or 'shared' in OpenMP clause 'default'}}
  for (i = 0; i < argc; ++i)
    foo();
#pragma omp target parallel for simd default(none // expected-error {{expected ')'}} expected-note {{to match this '('}} expected-note {{explicit data sharing attribute requested here}}
  for (i = 0; i < argc; ++i) // expected-error {{variable 'argc' must have explicitly specified data sharing attributes}}
    foo();
#pragma omp target parallel for simd default(shared), default(shared) // expected-error {{directive '#pragma omp target parallel for simd' cannot contain more than one 'default' clause}}
  for (i = 0; i < argc; ++i)
    foo();
#pragma omp target parallel for simd default(x) // expected-error {{expected 'none' or 'shared' in OpenMP clause 'default'}}
  for (i = 0; i < argc; ++i)
    foo();

#pragma omp target parallel for simd default(none) // expected-note {{explicit data sharing attribute requested here}}
  for (i = 0; i < argc; ++i)  // expected-error {{variable 'argc' must have explicitly specified data sharing attributes}}
    foo();

#pragma omp parallel default(none) // expected-note 2 {{explicit data sharing attribute requested here}}
#pragma omp target parallel for simd default(shared)
  for (i = 0; i < argc; ++i) // expected-error {{variable 'i' must have explicitly specified data sharing attributes}} expected-error {{variable 'argc' must have explicitly specified data sharing attributes}}
    foo();

  return 0;
}
