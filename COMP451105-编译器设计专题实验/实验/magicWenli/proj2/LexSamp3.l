%{
#include <stdio.h>
int nif; /* 记录if个数 */
%}
%option yylineno
%%
[ \t]                /* “吃”掉它们 */
\n                   /* “吃”掉它们 */
[^ \t\n]+            /* “吃”掉它们 */
[ (][i][f][ ]  {++nif; }  /* 匹配到if，数字加1 */
%%
int main()
{ 
   yyin=fopen("test.cl","r");
   yylex();             /* 调用词法分析器，直到输入结束  */
   printf("ifs=%d\n", nif);
   return 0;
}
