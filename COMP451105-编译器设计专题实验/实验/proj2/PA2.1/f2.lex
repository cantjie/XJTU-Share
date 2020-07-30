%{
#include <stdio.h>
int nchar,nwords,nline;
%}

%%
[ \t]                  /* 匹配到一个空格或Tab键就“吃”掉它们 */
\n         {++nline; }  /* 匹配到一个换行符，行数加1 */
[^ \t\n]+  {
             ++nwords;nchar += yyleng;
            }
%%
int main()
{
	yyin=fopen("text","r");
	yylex();
	printf("nchar=%d,nwords=%d,nline=%d \n",nchar,nwords,nline);
}

