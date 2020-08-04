%{
#include <stdio.h>
int chars, words, rows,maxColumn=0,columns; /* 分别记录字符个数、字数和行数 */
%}
%option yylineno
%%
[ \t]                  
\n         {
             rows++;
             if(maxColumn<columns){
                maxColumn=columns;
             }
             columns=0;
           } 
[^ \t\n]+  {
             words++;
             chars+=yyleng;
             columns+=yyleng;
            }
%%
int main()
{ 
   printf("Press CTRL+d to quit.\nInput any text:\n");
   yylex();             /* 调用词法分析器，直到输入结束  */
   printf("chars=%d, words=%d, rows=%d, columns=%d\n", chars, words, rows ,maxColumn);
   return 0;
}
// int yywrap(){ return 1; }
