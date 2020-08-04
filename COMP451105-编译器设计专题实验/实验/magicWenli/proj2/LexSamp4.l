%{
#include <stdio.h>
int commitsInline,commitsCrossline; /* 记录注释数 */
%}
%option yylineno
%%
\/\*(\s|.)*?\*\/   {
                        commitsCrossline++;
                     }
\/\/               {
                        commitsInline++;
                     }
[ \t]                /* “吃”掉它们 */
\n                   /* “吃”掉它们 */
[^ \t\n]+            /* “吃”掉它们 */
%%
int main()
{ 
   yyin=fopen("samp1.c","r");
   yylex();             /* 调用词法分析器，直到输入结束  */
   printf("open samp1.c:\nInline-commits=%d, Crossline-commits=%d\n", commitsInline,commitsCrossline);
   return 0;
}
