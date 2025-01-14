# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tmarcos <tmarcos@student.42berlin.de>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/12/22 16:40:49 by tmarcos           #+#    #+#              #
#    Updated: 2025/01/07 19:25:28 by tmarcos          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


NAME		= libftprintf.a

GREEN		= \033[0;32m
GREY		= \033[0;90m
RED			= \033[0;31m
RESET		= \033[0m

CC 			= cc

FLAGS 		= -Wall -Werror -Wextra

REMOVE 		= rm -f

INCLUDE		= -I .

SRCS 		= ft_printf.c			\
				print_char_string.c			\
				print_integer.c				\
				print_hex.c				\


OBJS 		= $(SRCS:.c=.o)

all:		$(NAME)

$(NAME): 	$(OBJS)
			@ar -rcs $(NAME) $(OBJS)
			@echo "$(GREY)libftprintf: $(GREEN)$(NAME) was created$(RESET)"

%.o: %.c ft_printf.h
			@$(CC) $(FLAGS) $(INCLUDE) -c $< -o $@

clean:
			@$(REMOVE) $(OBJS)
			@echo "$(GREY)libftprintf: object files were deleted$(RESET)"

fclean:		clean
			@$(REMOVE) $(NAME)
			@echo "$(GREY)libftprintf: $(NAME) was deleted$(RESET)"

re:			fclean all 

# Alvo para rodar os testes
test:       $(NAME)
			@$(CC) $(FLAGS) $(INCLUDE) -o test test.c $(NAME)
			@./test
			@echo "$(GREY)libftprintf: $(GREEN)test was completed$(RESET)"

# Limpeza dos arquivos de testes
clean_test:
			@$(REMOVE) test
			@echo "$(GREY)Test: $(GREEN)test was deleted$(RESET)"

# Recompila e roda os testes
re_test:    clean_test $(NAME) test
			@./test
			@echo "$(GREY)Test: $(GREEN)test was recompiled and completed$(RESET)"

.PHONY:		all clean fclean
