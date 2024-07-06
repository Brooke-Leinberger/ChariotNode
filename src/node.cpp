#include <stdio.h>
#include "log/log.h"

int main()
{
    LOG_fatal("Fatal error");
    LOG_error("Standard error");
    LOG_IEC();
    LOG_warn("Warning");
    LOG_info("Information");
    LOG_verbose(0, "A little extra info");
    LOG_verbose(1, "Debugging");
    LOG_verbose(2, "A lot of debugging");
    LOG_verbose(9, "Dear god, the debugging");
}