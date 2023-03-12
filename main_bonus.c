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
void ft_list_push_front(t_list **begin_list, void *data);
void ft_list_sort(t_list **begin_list, int (*cmp)());

//(*cmp)(list_ptr->data, list_other_ptr->data);
int cmp(void *d1, void *d2) { return (d1 > d2 ? 1 : d1 == d2 ? 0 : -1); }

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

  if (!nb)
    return (NULL);
  cp = begin = new_elem((void *)0);
  while (nb-- > 1) {
    cp->next = new_elem((void *)++i);
    cp = cp->next;
  }
  return (begin);
}

int main() {
  //    int     fd=open("lol", O_RDONLY);
  char *buf = malloc(33333);
  t_list **beg;

  t_list *arr = elem_array(4);
  beg = &arr;
  printf("ft_list_size: %d\n", ft_list_size(arr));
  printf("sizeof: %ld\n", sizeof(t_list));
  ft_list_push_front(beg, (void *)0xdeadbeaf);
  printf("ft_list_push_front: %p\n", (*beg)->data);
  printf("ft_list_push_front: %p\n", (*beg)->next);
  printf("ft_list_push_front: %p\n", arr);

  free(buf);
  return (0);
}
