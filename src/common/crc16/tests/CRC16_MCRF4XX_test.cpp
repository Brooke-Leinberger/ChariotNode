#include "CppUTest/TestHarness.h"
#include "common/crc16/CRC16_MCRF4XX.h"

TEST_GROUP(CRC16)
{
};

TEST(CRC16, test0)
{
    const uint16_t expected_crc = 0xFFFF;
    const uint8_t input[] = {
    };

    uint16_t actual = CRC_calculate_MCRF4XX (&input[0], sizeof(input));
    CHECK_EQUAL (expected_crc, actual);
}

TEST(CRC16, test1)
{
    const uint16_t expected_crc = 0x1E0E;
    const uint8_t input[] = {
        0x01,
    };

    uint16_t actual = CRC_calculate_MCRF4XX (&input[0], sizeof(input));
    CHECK_EQUAL (expected_crc, actual);
}

TEST(CRC16, test2)
{
    const uint16_t expected_crc = 0x0282;
    const uint8_t input[] = {
        0x01,
        0x02,
        0x03,
        0x04,
        0x05,
        0x06,
        0x07,
        0x08,
        0x09,
    };

    uint16_t actual = CRC_calculate_MCRF4XX (&input[0], sizeof(input));
    CHECK_EQUAL (expected_crc, actual);
}

TEST(CRC16, test3)
{
    const uint16_t expected_crc = 0x6F91;
    const uint8_t input[] = {
        0x31,
        0x32,
        0x33,
        0x34,
        0x35,
        0x36,
        0x37,
        0x38,
        0x39,
    };


    uint16_t actual = CRC_calculate_MCRF4XX (&input[0], sizeof(input));
    CHECK_EQUAL (expected_crc, actual);
}