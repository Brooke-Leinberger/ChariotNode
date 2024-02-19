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

SRC_DIR     := src
OBJ_DIR     := build/obj
BIN_DIR		:= build
TEST 		:= $(BIN_DIR)/$(NAME)_test
SRCS        := module.c
#SRCS        += module.c
SRCS        := $(SRCS:%=$(SRC_DIR)/%)
OBJS        := $(SRCS:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)
BINS		:= $(BIN_DIR)/$(NAME)

CC          := gcc
CFLAGS      := -Wall -Wextra -Werror
CPPFLAGS    := -Isrc

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

$(NAME): $(OBJS)
	$(CC) $(OBJS) -o $(BIN_DIR)/$(NAME)
	$(info CREATED $(NAME))

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(DIR_DUP)
	$(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<
	$(info CREATED $@)

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME)

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
# UTEST += src/tmp/tests/tmp_test.cpp
UTEST += src/common/crc16/CRC16_MCRF4XX.c
UTEST += src/common/crc16/tests/CRC16_MCRF4XX_test.cpp

test: re
	g++ $(UTEST) -o $(TEST) $(CPPFLAGS) -lCppUTest -lCppUTestExt
	$(TEST)

#------------------------------------------------#
#   SPEC                                         #
#------------------------------------------------#

.PHONY: clean fclean re
.SILENT:



####################################### END_3 ####
