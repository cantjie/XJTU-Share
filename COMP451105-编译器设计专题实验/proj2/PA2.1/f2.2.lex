%{
#include <stdio.h>
int nchar,nwords,nline,nwordif;
%}

%%

  integer     {++nchar; }             /* 匹配到一个空格或Tab键就“吃”掉它们 */
[a-z]+      {++nline; }  /* 匹配到一个换行符，行数加1 */


%%
int main()
{
	
	yylex();
	printf("nchar=%d,nwords=%d,nline=%d \n",nchar,nwords,nline);
	
}

