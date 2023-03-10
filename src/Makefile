TARGET = SmartCalc_v1
CC = gcc
FLAGS = -Wall -Werror -Wextra -std=c11 
TEST = TEST.c
LIBRARY = SmartCalc_v1.a
SMART=-L. SmartCalc_v1.a
#DEBUG =-g
SRC = $(wildcard  *.c) 
OBJ = $(patsubst %.c, %.o, $(SRC))
CHECK:=$(shell pkg-config --cflags --libs check)

ifeq (${OS}, Linux)
      TEST_FLAGS = -lcheck -lm -lpthread -lrt -lsubunit
else
      TEST_FLAGS = -lcheck -lm
endif



all: $(LIBRARY)

$(LIBRARY): $(SRC)
	$(CC) $(FLAGS) -c $(SRC)
	ar rc $(LIBRARY) $(OBJ)
	ranlib $(LIBRARY) 
	rm -f $(OBJ)

$(TARGET) : $(OBJ)
	$(CC) $(FLAGS) $(OBJ) -o $(TARGET)


%.o : %.c
	$(CC) $(FLAGS) -c $< -o $@

	
test : $(LIBRARY)
	$(CC) $(FLAGS) --coverage $(TEST) $(TEST_FLAGS) $(LIBRARY) -o test
	./test

gcov_report: clean $(LIBRARY)
	$(CC) --coverage $(FLAGS) $(TEST_FLAGS) $(TEST) *.c -o test $(CHECK) $(SMART)
	./test
#	$(CC) $(FLAGS) --coverage $(TEST) $(S21_DECIMAL) s21*.c  -o test $(TEST_FLAGS) 
	lcov -t "test" -o test.info -c -d .
	genhtml -o report test.info
	open ./report/index.html

clean:
	rm -rf *.o *.a *.gcno *.gcda test test.info *.out report
	

style:
	clang-format -style=google -i *.c
	clang-format -style=google -i *.h
	clang-format -style=google -n *.c
	clang-format -style=google -n *.h

	
cpp:
	cppcheck --enable=all --suppress=missingIncludeSystem *.c
