// RUN: %clang_cc1 -E %s -verify

// We used to crash if a line continuation was followed by a nul byte within a
// preprocessing directive.
# if 1 \
 #if something_else // expected-warning {{null character ignored}} expected-error {{not a valid binary operator}}
#error error
#endif
#endif // expected-error {{#endif without #if}}
