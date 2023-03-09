SRC = read.S\
	  write.S\
	  ft_strlen.S\
	  ft_strcpy.S\
	  ft_strcmp.S\
	  ft_strdup.S\
#SRC = $(addprefix src/, ${SOURCES})
OBJ = $(patsubst %.S, %.o, ${SRC})
NAME = libasm.a
ASM = nasm
CC   = cc
CFLAGS = -Wall -Werror -Wextra -fsanitize=address
#FLAGS = -F dwarf -g -f macho64
FLAGS = -f elf64 -F dwarf -g -DLINUX=1
MAINPRG = main_lol
EXECPRG = exec_lol
LIB 	= -L. -lasm

ifeq ($(MAKECMDGOALS), lr)
FLAGS = -f elf64 -F dwarf -g -DLINUX=1
endif
ifeq ($(MAKECMDGOALS), l)
FLAGS = -f elf64 -F dwarf -g -DLINUX=1
endif

.PHONY: all clean fclean re

%.o: 	%.S
	${ASM} ${FLAGS} $< 
	

all: 	${NAME}

l: 		all

lr: 	fclean all

x: 		${OBJ}
	ld $? -o ${EXECPRG}

c: 		${NAME}
	${CC} ${CFLAGS} ${OBJ} main.c -o ${MAINPRG}
#	${CC} ${CFLAGS} -L./ -lasm  main.c -o ${MAINPRG}

${NAME}: 	${OBJ}
	ar -rc ${NAME} $?

clean:
	rm -f ${OBJ}
	rm -f main.o

fclean: 	clean
	rm -f ${NAME}
	rm -f ${MAINPRG}
	rm -f ${EXECPRG}

re: 	fclean all
