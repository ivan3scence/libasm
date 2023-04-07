#include <stdio.h>
#include <stdlib.h>

int ft_iswhitespace(char const c) {
  if (c == ' ' || c == '\n' || c == '\t' || c == '\v' || c == '\r' || c == '\f')
    return (1);
  return (0);
}

int base(int c, int base) {
  char *str = "0123456789abcdef";
  char *str2 = "0123456789ABCDEF";
  int i = 0;

  while (i < base) {
    if (c == str[i] || c == str2[i])
      return (i);
    i++;
  }
  return (-1);
}

int ft_atoi_base(const char *str, int str_base) {
  int nb = 0;
  int negatif = 0;
  int i = 0;
  int next;

  while (ft_iswhitespace(str[i]))
    i++;
  if (str[i] == '+' || str[i] == '-') {
    if (str[i] == '-')
      negatif = 1;
    i++;
  }
  do {
    next = base(str[i], str_base);
    nb = nb * str_base;
    nb = nb + next;
    i++;
  } while (next != -1);
  if (negatif)
    return (-nb);
  return (nb);
}
