add_mlir_library(MLIRParser
  Lexer.cpp
  Parser.cpp
  Token.cpp

  ADDITIONAL_HEADER_DIRS
  ${MLIR_MAIN_INCLUDE_DIR}/mlir/Parser

  LINK_LIBS PUBLIC
  MLIRIR
  )
