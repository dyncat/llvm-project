add_header_library(
  fputil
  HDRS
    BitPatterns.h
    FloatOperations.h
    FloatProperties.h
  DEPS
    libc.utils.CPP.standalone_cpp
)
