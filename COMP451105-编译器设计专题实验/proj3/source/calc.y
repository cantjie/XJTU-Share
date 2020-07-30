/* simplest version of calculator */

%{
#include <stdarg.h>
#include <stdio.h>
int yyerror(const char *, ...);
extern int yylex();
extern int yyparse();
%}
/* declare tokens */
%union {
    int int_value;
    double double_value;
}
%token <double_value> DOUBLE_NUMBER
%token ADD SUB MUL DIV
%token OP CP
%token EOL
%type <double_value> exp factor term
%%

calclist: /* nothing */
	    | calclist exp EOL { printf("= %lf\n> ", $2);  }
    | calclist EOL { printf("> ");  } /* blank line or a comment */
;

exp: factor
       | exp ADD factor { $$ = $1 + $3;  }
    | exp SUB factor { $$ = $1 - $3;  }
;

factor: term
        | factor MUL term { $$ = $1 * $3;  }
    | factor DIV term { $$ = $1 / $3;  }
;

term: SUB DOUBLE_NUMBER { $$ = -$2; }
        | DOUBLE_NUMBER
    | OP exp CP { $$ = $2;  }
;
%%

int main()
{
    printf("> "); 
    yyparse();
    return 0;

}

int yyerror(const char *s, ...)
{
    int ret;
    va_list va;
    va_start(va, s);
    ret = vfprintf(stderr, s, va);
    va_end(va);
    return ret;

}
