#include <stdio.h>
#include "log/log.h"

#define LOG_THRESHOLD_THIS LOG_THRESHOLD_SILENT

int main()
{
    LOG_FATAL("Fatal error");
    LOG_ERROR("Standard error");
    LOG_IEC();
    LOG_WARN("Warning");
    LOG_INFO("Information");
    LOG_VERBOSE(0, "A little extra info");
    LOG_VERBOSE(1, "Debugging");
    LOG_VERBOSE(2, "A lot of debugging");
    LOG_VERBOSE(9, "Dear god, the debugging");
}