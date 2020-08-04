%{
/* 
 * PASCAL 程序的词法分析器
 *可识别PASCAL源程序的词法分析器
 * 如给定PASCAL源程序文件：
program p
type t=integer;
var  v1:t;
     v2:char;
begin
   read(v1);
   v1:=v1*10;
   v1:="d";
   v2:='a';
   write(v1);
end.

** 编译步骤如下:
   flex -o pas.c
   gcc -o pas pas.c
  即生成了可执行文件pas
  运行时， 给一个文件名为参数,如：
  ./pas file1
  其中file1是pascal源文件
*/

/*SECTION to .c */
#include <stdio.h>
#include <string.h>

typedef enum { /*Token的种类定义*/
  /* 特殊单词符号 */
    ENDFILE,  /* 输入结束标志 */   ERROR1, /* 输入序列存在错误 */
    ENDOFPROG, /*程序结束标志*/
  /* 保留关键字 */
    PROGRAM, /* program */   PROCEDURE, /* precedure */
    TYPE, VAR, IF, THEN, ELSE, FI, WHILE, DO,
    ENDWH, BEGIN1, END1, READ, WRITE,
    ARRAY, OF, RECORD, RETURN1,
  /*PASCAL中的类型*/
    INTEGER, /* integer */     CHAR1, /* char */
  /*多字符单词符号*/
    ID, /* 一般的标识符 */
    INTC,  /*整型字面值 */
    CHARC, /*字符型字面值*/
  /*特殊符号，操作符 */
    ASSIGN, EQ, LT, PLUS, MINUS,
    TIMES,  OVER, LPAREN, RPAREN, DOT,
    COLON, SEMI, COMMA, LMIDPAREN, RMIDPAREN,
    UNDERANGE
}LexType;

/*PASCAL语言的保留关键字表*/
static struct keyWord{
  char * str; /* name of the reserved word */
  LexType  t_tok; /*Token的种类*/
} reservedWords[] = {
  {"program", PROGRAM},  {"type", TYPE},
  {"var", VAR}, {"procedure", PROCEDURE},
  {"begin", BEGIN1}, {"end", END1},
  {"array", ARRAY}, {"of", OF}, {"record", RECORD},
  {"if", IF}, {"then", THEN}, {"else", ELSE},
  {"fi", FI}, {"while", WHILE}, {"do", DO},
  {"endwh", ENDWH},{"read", READ}, {"write", WRITE},
  {"return", RETURN1},
  {"integer", INTEGER}, {"char", CHAR1}
};

/* 提前声明一些函数 */
LexType reservedLookup(char* s);
 /*定义LEX的变量yylval的类型
  * 若不定义，则缺省为int yylval
  */
char yylval[100];
/*全局标志变量，为了处理程序中的注释 */
int flag = 0; /* 1: 表示当前分析的是注释本身(lexer不处理)，0表示非注释 */
%}

%%
[0-9]+  if(flag == 0){
          strcpy(yylval, yytext);
          return INTC;
        }

"end."  if(flag == 0){
          strcpy(yylval, yytext);
          return ENDOFPROG;
        }

[a-z][a-z0-9]*  if(flag == 0){
           strcpy(yylval, yytext);
            /*返回记号种类，并表明是否为关键字 */
           return reservedLookup(yytext);
         }

'[a-z,0-9]'    if(flag == 0){ /*字符常量*/
                 strcpy(yylval, yytext); return CHARC;
               }

"+"  if(flag == 0) return PLUS; 
"-"  if(flag == 0) return MINUS; 
"*"  if(flag == 0) return TIMES; 
"/"  if(flag == 0) return OVER; 
"("  if(flag == 0) return LPAREN; 
")"  if(flag == 0) return RPAREN; 
"."  if(flag == 0) return DOT; 
"["  if(flag == 0) return LMIDPAREN; 
"]"  if(flag == 0) return RMIDPAREN; 
";"  if(flag == 0) return SEMI; 
":"  if(flag == 0) return COLON; 
","  if(flag == 0) return COMMA; 
"<"  if(flag == 0) return LT; 
"="  if(flag == 0) return EQ; 
":="  if(flag == 0) return ASSIGN; 
".."  if(flag == 0) return UNDERANGE; 
"EOF"  if(flag == 0) return ENDFILE; 
"{"    {flag = 1 /*PASCAL注释开始*/;}
"}"    {flag = 0 /*PASCAL注释结束*/;}
[ \t\n\r]  {/*忽略空格、制表符、换行符*/} 
.      if(flag == 0){
          strcpy(yylval, yytext);
          return ERROR1;
       }

%%
/*保留关键字查找函数
 - 查看一个标识符s是否为保留关键字；
 - 若标识符s在保留关键字表中，则返回相应单词的种类；
 - 否则返回 种类ID
 */
LexType reservedLookup(char* s)
{
   int i, n;
   n = sizeof(reservedWords) / sizeof(reservedWords[0]);
   for(i=0; i<n; i++){
     if( strcmp(s, reservedWords[i].str) == 0 ){
         return reservedWords[i].t_tok;
     }
   }
   return ID;
}

/* 显示种类为token的记号 */
void printToken(int token)
{
   printf("type=%d,", token);
   switch( token ){
     case ID:
        printf("ID, name=[%s]\n", yylval);
        break;
     case ASSIGN: case EQ:     case LT:
     case PLUS:   case MINUS:  case TIMES:
     case OVER:   case LPAREN: case RPAREN:
     case DOT:    case COLON:  case SEMI:
     case COMMA:  case LMIDPAREN: case RMIDPAREN:
     case UNDERANGE:
       printf("operator [%s]\n", yytext);
       break;
     case CHARC:
       printf("Char literal '%c'\n", yylval[0]);
       break;
     case INTC:
       printf("Integer literal %s\n", yylval);
       break;
     /* ....... */
     case ERROR1:
        printf("ERROR tokentype=%d, string=[%s]\n", token, yytext);
        break;
     default:
       if(reservedLookup(yytext) != ID){
          printf("keyword, string=[%s]\n", yylval);
       } else {
          if( token == ENDFILE )
            printf(" string=[%s]\n", "EOF");
          else
            printf(" string=[%s]\n", yytext);
       }
       break;
   }
}

int main( int argc, char *argv[])
{
   int n;
   FILE* fp_input;
   if( argc < 2 ){
     printf("Usage: %s sourcefile\n", argv[0]);
     return 1;
   }
   fp_input = fopen(argv[1], "r");
   if( fp_input == NULL ){
     printf("File %s can't open.\n", argv[1]);
     return 2;
   }
   yyin = fp_input;
   while(n){
      n = yylex(); 
      printToken(n);
      yylval[0] = yytext[0] = '\0';
      if( n == ENDOFPROG ) break;
   }
   fclose(fp_input);
   return 0;
}
int yywrap(){return 1;}
