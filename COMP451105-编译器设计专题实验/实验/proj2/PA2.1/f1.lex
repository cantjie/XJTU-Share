%{
%}
%option noyywrap
%%
%%
int main()
{
	yyin=fopen("text","r");
	yylex();
}

