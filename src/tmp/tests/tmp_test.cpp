// CPPUTEST testing module

#include "CppUTest/TestHarness.h"

TEST_GROUP(FirstTestGroup)
{
};

TEST(FirstTestGroup, FirstTest)
{
    FAIL("FAIL ME!");
}