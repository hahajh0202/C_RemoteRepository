# 변수 설정
CC = gcc					# 컴파일러 지정 (gcc)
CFLAGS = -Wall				# 컴파일 옵션, 경고 메시지 출력
TARGET = PrintProgram		# 생성할 실행 파일 이름
SRC = main.c remote_1.c		# 소스 파일
OBJ = $(SRC:.c=.o)			# 오브젝트 파일

# 기본 타겟 (make 명령을 실행하면 기본적으로 이 타겟이 실행됨)
all: $(TARGET)

# .o 파일들을 묶어서 실행파일을 만드는 규칙
$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC)

# 컴파일: .c -> .o
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@
# %.o: .o 파일을 생성하겠다는 의미
# %.c: .c 파일을 대상으로 규칙을 적용하겠다는 의미 (.c파일 = 소스 파일)
# %: %는 와일드카드로, 모든 파일 이름에 대해 적용됨. %.c에서 %는 .o와 매칭되는 동일한 파일 이름을 가리킨다.

# # .c 파일을 .o 파일로 컴파일하는 규칙
# $(OBJ): $(SRC)
# 	$(CC) $(CFLAGS) -c $(SRC)

# 빌드 후 실행 파일과 오브젝트 파일을 삭제하는 clean 규칙
clean:
	rm -f $(OBJ) $(TARGET)