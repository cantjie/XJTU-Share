%{
#include<stdio.h>
int LineNo=0,num=0;
%}
%x comment c_comment
%option noyywrap
%%
"//"	{BEGIN comment;num++;}
<comment>.	;
<comment>\n {BEGIN 0;LineNo ++;}
"/*" 	{BEGIN c_comment;}
<c_comment>"*/" {BEGIN 0;num++;}
<c_comment>.	;
<c_comment>\n	{LineNo++;}
%%
int main()
{
	yyin=fopen("text2","r");
	yylex();
	printf("lineno=%d,num=%d",LineNo,num);
}


