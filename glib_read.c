#include <unistd.h>
#include <fcntl.h>

int     main()
{
    int     fd = open("test.file", O_RDONLY);
    char    buf[17];

    read(fd, &buf, 16);
    buf[16] = 0;
    write(1, buf, 17);
}
