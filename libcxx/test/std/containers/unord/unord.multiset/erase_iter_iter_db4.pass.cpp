//===----------------------------------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

// <unordered_set>

// Call erase(const_iterator first, const_iterator last); with a bad range

#if _LIBCPP_DEBUG >= 1

#define _LIBCPP_ASSERT(x, m) ((x) ? (void)0 : std::exit(0))

#include <unordered_set>
#include <cassert>
#include <exception>
#include <cstdlib>

#include "test_macros.h"

int main(int, char**)
{
    {
    int a1[] = {1, 2, 3};
    std::unordered_multiset<int> l1(a1, a1+3);
    std::unordered_multiset<int>::iterator i = l1.erase(next(l1.cbegin()), l1.cbegin());
    assert(false);
    }
}

#else

int main(int, char**)
{

  return 0;
}

#endif
