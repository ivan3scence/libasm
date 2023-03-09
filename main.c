#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

ssize_t	ft_read(int fd, void *buf, size_t nbyte);
ssize_t	ft_write(int fd, void *buf, size_t nbyte);
size_t	ft_strlen(const char *buf);
char	*ft_strcpy(char * dst, const char * src);
int		ft_strcmp(const char *s1, const char *s2);

int     main()
{
//    int     fd=open("lol", O_RDONLY);
    char    *buf=malloc(33333);

  //  buf[16] = 0;
//    printf("my:%ld\n", ft_read(fd, &buf, 3));
//    write(1, buf, 3);
//    printf("st:%ld\n", read(fd, &buf, 3));
//    write(1, buf, 3);
//    printf("my:%ld\n", ft_read(fd, buf, 333));
//    write(1, buf, 3);
//    printf("st:%ld\n", read(fd, buf, 333));
//    write(1, buf, 3);
 //   printf("my:%ld\n", ft_write(1, "lol", 3));
 //   printf("st:%ld\n", write(1, "lol", 3));
 //   printf("my:%ld\n", ft_write(1, NULL, 3));
 //   printf("st:%ld\n", write(1, NULL, 3));
 //   printf("my:%ld\n", ft_write(1, "", 333));
 //   printf("st:%ld\n", write(1, "", 333));
//    printf("my:%lu\n", ft_strlen("lol"));
//    printf("st:%lu\n", strlen("lol"));
//    printf("my:%lu\n", ft_strlen(NULL));
//    printf("st:%lu\n", strlen(NULL));
//    printf("my:%lu\n", ft_strlen(""));
//    printf("st:%lu\n", strlen( ""));
//    printf("my:%s\n", ft_strcpy(buf,"lol"));
 //   printf("st:%s\n", strcpy(buf,"lol"));
 //   printf("my:%s\n", ft_strcpy(buf,""));
 //   printf("st:%s\n", strcpy(buf,""));
 //   printf("my:%s\n", ft_strcpy(buf,NULL));
 //   printf("st:%s\n", strcpy(buf,NULL));


    printf("my:%d\n", ft_strcmp("lol","lol"));
    printf("st:%d\n", strcmp("lol","lol"));
    printf("my:%d\n", ft_strcmp("lom","lol"));
    printf("st:%d\n", strcmp("lom","lol"));
    printf("my:%d\n", ft_strcmp("loa","lol"));
    printf("st:%d\n", strcmp("loa","lol"));
    printf("my:%d\n", ft_strcmp("lo","lol"));
    printf("st:%d\n", strcmp("lo","lol"));




	free(buf);
    return (0);
}
