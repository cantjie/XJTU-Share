%{
#include <stdio.h>
int nchar,nwords,nline,nwordif;
%}

%%

[ \t]                  /* 匹配到一个空格或Tab键就“吃”掉它们 */
\n         {++nline; }  /* 匹配到一个换行符，行数加1 */
[^ \t\n]+  {
             ++nwords;nchar += yyleng;
            }
[a-z|A-Z]*|[1-9]*(if)[a-z|A-Z]*|[1-9]*     {++nwordif;}

%%
int main()
{
	yyin=fopen("text1","r");
	yylex();
	printf("nchar=%d,nwords=%d,nline=%d \n",nchar,nwords,nline);
	printf("nwordif=%d \n",nwordif);
}

