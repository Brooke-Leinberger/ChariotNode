# @author   clemedon (Clément Vidon)
# Modified by Brooke Leinberger
####################################### BEG_3 ####

NAME        := module

#------------------------------------------------#
#   INGREDIENTS                                  #
#------------------------------------------------#
# SRC_DIR   source directory
# OBJ_DIR   object directory
# SRCS      source files
# OBJS      object files
#
# CC        compiler
# CFLAGS    compiler flags
# CPPFLAGS  preprocessor flags

SUB_DIR		:= ChariotModule
SRC_DIR     := $(SUB_DIR)/src
OBJ_DIR     := build/obj
BIN_DIR		:= build/bin
TEST 		:= $(BIN_DIR)/$(NAME)_test
SRCS        := module.cpp
SRCS        += tmp/tmp.cpp
EXT_SRC		:= common/src 


SRCS        := $(SRCS:%=$(SRC_DIR)/%)
OBJS_CPP    := $(SRCS:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/$(SUB_DIR)/%.o)

BINS		:= $(BIN_DIR)/$(NAME)

CC          := gcc
CFLAGS      := -Wall -Wextra -Werror
CPPFLAGS    := -I include

#------------------------------------------------#
#   UTENSILS                                     #
#------------------------------------------------#
# RM        force remove
# MAKEFLAGS make flags
# DIR_DUP   duplicate directory tree

RM          := rm -f
MAKEFLAGS   += --no-print-directory
DIR_DUP     = mkdir -p $(@D)

#------------------------------------------------#
#   RECIPES                                      #
#------------------------------------------------#
# all       default goal
# $(NAME)   linking .o -> binary
# %.o       compilation .c -> .o
# clean     remove .o
# fclean    remove .o + binary
# re        remake default goal

all: $(NAME)

$(NAME): $(OBJS_CPP)
	$(CC) $(OBJS_CPP) -o $(BIN_DIR)/$(NAME)
	$(info CREATED $(NAME))

# $(OBJ_DIR)/$(NAME).o: $(SRC_DIR)/$(NAME).cpp
# 	$(DIR_DUP)
# 	$(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<
# 	$(info CREATED $@)

$(OBJ_DIR)/$(SUB_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(DIR_DUP)
	$(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<
	$(info CREATED $@)

# $(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
# 	$(DIR_DUP)
# 	$(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<
# 	$(info CREATED $@)

clean:
	$(RM) $(OBJS_CPP)

fclean: clean
	$(RM) $(NAME)
	mkdir -p $(BIN_DIR)
	mkdir -p $(OBJ_DIR)

re:
	$(MAKE) fclean
	$(MAKE) all


#------------------------------------------------#
#   Tests                                        #
#------------------------------------------------#

# CPPFLAGS += -I$(CPPUTEST_HOME)/include
# CXXFLAGS += -include $(CPPUTEST_HOME)/include/CppUTest/MemoryLeakDetectorNewMacros.h
# CFLAGS += -include $(CPPUTEST_HOME)/include/CppUTest/MemoryLeakDetectorMallocMacros.h
# LD_LIBRARIES = -L$(CPPUTEST_HOME)/lib -lCppUTest -lCppUTestExt
# TEST_MAIN = $(SRC_DIR)/all_tests.cpp

UTEST := src/all_tests.cpp
UTEST += src/tmp/tests/tmp_test.cpp
UTEST += src/tmp/tmp.cpp

UTEST := $(UTEST:%=$(SUB_DIR)/%)
test: re
	g++ $(UTEST) -o $(TEST) -lCppUTest -lCppUTestExt -I$(SRC_DIR)
	$(TEST)

#------------------------------------------------#
#   SPEC                                         #
#------------------------------------------------#

.PHONY: clean fclean re
.SILENT:



####################################### END_3 ####
