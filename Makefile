SRC = read.S\
	  write.S\
	  ft_strlen.S\
	  ft_strcpy.S\
	  ft_strcmp.S\
	  ft_strdup.S\

SRC_BONUS = ft_list_size.S\
#SRC = $(addprefix src/, ${SOURCES})
OBJ = $(patsubst %.S, %.o, ${SRC})
MAIN = main.c

ifeq ($(MAKECMDGOALS), bonus)
OBJ = $(patsubst %.S, %.o, ${SRC}) $(patsubst %.S, %.o, ${SRC_BONUS})
endif

ifeq ($(MAKECMDGOALS), cb)
MAIN = main_bonus.c
OBJ = $(patsubst %.S, %.o, ${SRC}) $(patsubst %.S, %.o, ${SRC_BONUS})
endif

NAME = libasm.a
ASM = nasm
CC   = cc
CFLAGS = 
#-no-pie
#-fsanitize=address
#FLAGS = -F dwarf -g -f macho64
FLAGS = -f elf64 -F dwarf -g -DLINUX=1
MAINPRG = main_lol
EXECPRG = exec_lol
LIB 	= -L. -lasm

ifeq ($(MAKECMDGOALS), lr)
FLAGS = -f elf64 -DLINUX=1
endif
ifeq ($(MAKECMDGOALS), l)
FLAGS = -f elf64 -F dwarf -g -DLINUX=1
endif

.PHONY: all clean fclean re

%.o: 	%.S
	${ASM} ${FLAGS} $< 
	

all: 	${NAME}

bonus: 	${NAME}

l: 		all

lr: 	fclean all

x: 		${OBJ}
	ld $? -o ${EXECPRG}

c: 		${NAME}
	${CC} ${CFLAGS} ${OBJ} ${MAIN} -o ${MAINPRG}
#	${CC} ${CFLAGS} -L./ -lasm  main.c -o ${MAINPRG}

cb:		c	

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
