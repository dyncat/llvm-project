# UNSUPPORTED: system-windows
# Test lit.main.add_result_category() extension API.

# RUN: not %{lit} -j 1 %{inputs}/custom-result-category | FileCheck %s

# CHECK: CUSTOM_PASS: custom-result-category :: test1.txt
# CHECK: CUSTOM_FAILURE: custom-result-category :: test2.txt

# TODO(yln): Passed tests shouldn't be printed by default.
# CHECK: My Passed Tests (1)
# CHECK: My Failed Tests (1)
# CHECK:   custom-result-category :: test2.txt

# CHECK: My Passed: 1
# CHECK: My Failed: 1
