LOCAL_PATH:=$(shell pwd)
ASSN = 3

LOCAL_SRC:=$(wildcard $(LOCAL_PATH)/source/*.y)
LOCAL_SRC+=$(wildcard $(LOCAL_PATH)/source/*.l)

LOCAL_OUT_PATH:=$(LOCAL_PATH)/output

LOCAL_OBJ:=$(LOCAL_OUT_PATH)/calc.tab.c
LOCAL_OBJ+=$(LOCAL_OUT_PATH)/lex.yy.c

LOCAL_CFLAGS:=-I ${LOCAL_PATH}/include/PA${ASSN} -I ${CLASSDIR}/src/PA${ASSN}
LOCAL_TARGET:=$(LOCAL_OUT_PATH)/calc

LEX = flex
YYAC = bison
CC = gcc

$(LOCAL_TARGET): $(LOCAL_OBJ)
		$(CC) $(LOCAL_CFLAGS) -o $@ $^ -lfl

$(LOCAL_OUT_PATH)/lex.yy.c: $(LOCAL_PATH)/source/calc.l
		${LEX} -o $@ $^

$(LOCAL_OUT_PATH)/calc.tab.h: $(LOCAL_PATH)/source/calc.y

$(LOCAL_OUT_PATH)/calc.tab.c: $(LOCAL_PATH)/source/calc.y
		${YYAC} -d $^ -o $@


.PHONY:clean run

clean:
		rm $(LOCAL_TARGET) $(LOCAL_OBJ) $(LOCAL_OUT_PATH)/*.h

run:
		$(LOCAL_TARGET)
