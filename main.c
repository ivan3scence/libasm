#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

ssize_t	ft_read(int fd, void *buf, size_t nbyte);

int     main()
{
    int     fd=open("lol", O_RDONLY);
    char    *buf=malloc(33333);

    buf[16] = 0;
    printf("my:%ld\n", ft_read(fd, &buf, 3));
    write(1, buf, 3);
    printf("st:%ld\n", read(fd, &buf, 3));
    write(1, buf, 3);
    printf("my:%ld\n", ft_read(fd, buf, 333));
    write(1, buf, 3);
    printf("st:%ld\n", read(fd, buf, 333));
    write(1, buf, 3);
 
    return (0);
}
