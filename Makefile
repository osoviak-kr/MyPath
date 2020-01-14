NAME = pathfinder

INC = pathfinder.h

INCI = inc/pathfinder.h

SRC = main.c\
	mx_file_to_str.c\
	mx_split.c\
	mx_parser.c\
	mx_atoi.c\
	mx_printerr.c\
	mx_rec_struct.c\
	mx_isdigit.c\
	mx_get_index.c\
	mx_m_distance.c\
	mx_m_floyd.c\
	mx_floyd.c\
	mx_printmatrix.c\
	mx_line1_is_invalid.c\
	mx_usage.c\
	mx_file_does_not_exist.c\
	mx_file_is_empty.c\
	mx_back_path.c\
	mx_int_print.c\
	mx_ret_trip_output.c\
	mx_find_all_paths.c\
	mx_isalpha.c

SRCS = $(addprefix src/, main.c\
	mx_file_to_str.c\
	mx_split.c\
	mx_parser.c\
	mx_atoi.c\
	mx_printerr.c\
	mx_rec_struct.c\
	mx_isdigit.c\
	mx_get_index.c\
	mx_m_distance.c\
	mx_m_floyd.c\
	mx_floyd.c\
	mx_printmatrix.c\
	mx_line1_is_invalid.c\
	mx_usage.c\
	mx_file_does_not_exist.c\
	mx_file_is_empty.c\
	mx_back_path.c\
	mx_int_print.c\
	mx_ret_trip_output.c\
	mx_find_all_paths.c\
	mx_isalpha.c)

OBJ = main.o\
	mx_file_to_str.o\
	mx_split.o\
	mx_parser.o\
	mx_atoi.o\
	mx_printerr.o\
    mx_rec_struct.o\
    mx_isdigit.o\
    mx_get_index.o\
    mx_m_distance.o\
    mx_m_floyd.o\
    mx_floyd.o\
    mx_printmatrix.o\
    mx_line1_is_invalid.o\
    mx_usage.o\
    mx_file_does_not_exist.o\
    mx_file_is_empty.o\
    mx_back_path.o\
    mx_int_print.o\
    mx_ret_trip_output.o\
    mx_find_all_paths.o\
    mx_isalpha.o

CFLAGS = -std=c11 -Wall -Wextra -Werror -Wpedantic

all: install clean

install:
	@make -C libmx
	@cp $(SRCS) .
	@cp $(INCI) .
	@clang $(CFLAGS) -c $(SRC) -I $(INC)
	@mkdir -p obj
	@clang $(CFLAGS) libmx/libmx.a $(OBJ) -o $(NAME)
	@mv $(OBJ) ./obj

uninstall:
	@make uninstall -C libmx
	@rm -rf $(NAME)

clean:
	@make clean -C libmx
	@rm -rf $(INC)
	@rm -rf $(SRC)
	@rm -rf $(OBJ)
	@rm -rf ./obj
reinstall: uninstall all
