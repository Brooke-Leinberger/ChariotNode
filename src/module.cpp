#include <stdio.h>
#include "log/log.h"

#ifdef __cplusplus
extern "C" {
#endif


int main()
{
    long num = 5853565705;
    LOG_info("(%03d)%03d-%04d\n", num/10000000, (num/10000)%1000, num % 1000);
}

#ifdef __cplusplus
}
#endif
