#include "a.h"
#include <gtest/gtest.h>

TEST(LibA, TestGetA) { EXPECT_EQ(getA(), 0xa); }
