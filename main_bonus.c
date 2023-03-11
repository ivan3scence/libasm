#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

// ssize_t ft_read(int fd, void *buf, size_t nbyte);
// ssize_t ft_write(int fd, void *buf, size_t nbyte);
// size_t ft_strlen(const char *buf);
// char *ft_strcpy(char *dst, const char *src);
// int ft_strcmp(const char *s1, const char *s2);
// char *ft_strdup(const char *s);

typedef struct s_list {
  void *data;
  struct s_list *next;
} t_list;

int ft_list_size(t_list *begin_list);

t_list *new_elem(void *data) {
  t_list *new_elem = (t_list *)malloc(sizeof(t_list));
  if (!new_elem)
    exit(228);
  new_elem->next = NULL;
  new_elem->data = data;
  return (new_elem);
}

t_list *elem_array(size_t nb) {
  t_list *begin;
  t_list *cp;
  int i = 0;

  cp = begin = new_elem((void *)0);
  while (nb--) {
    cp->next = new_elem((void *)++i);
    cp = cp->next;
  }
  return (begin);
}

int main() {
  //    int     fd=open("lol", O_RDONLY);
  char *buf = malloc(33333);

  t_list *arr = elem_array(4);
  printf("ft_list_size: %d\n", ft_list_size(arr));

  free(buf);
  return (0);
}
