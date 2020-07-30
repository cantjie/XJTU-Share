%{
#include <stdio.h>
int flag=0;
%}
%%
.    ECHO;
\n   ECHO;
%%

int yywrap(void) {
return 1;
}
int main(void) {
yylex();
return 0;
}
