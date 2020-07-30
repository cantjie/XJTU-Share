/* simplest version of calculator */

%{
#include <stdarg.h>
#include <stdio.h>
int yyerror(const char *, ...);
extern int yylex();
extern int yyparse();
%}
%union {
    int bool_value;
}
/* declare tokens */
%token TRUE FALSE
%token OR AND NOT
%token OP CP
%token EOL
%type <bool_value> exp factor term
%%

calclist: /* nothing */
	    | calclist exp EOL { printf("= %d\n> ", $2);  }
    | calclist EOL { printf("> ");  } /* blank line or a comment */
;

exp: factor
       | exp OR factor { $$ = $1 || $3;  }
    | exp AND factor { $$ = $1 && $3;  }
;

factor: NOT term { $$ =  !$2;  }
        | term { $$ = $1;  }
;

term: OP exp CP { $$ = $2;  }
    | TRUE  { $$ = 1; }
    | FALSE  { $$ = 0; }
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
