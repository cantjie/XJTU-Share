/* recognize tokens for the calculator and print them out */

%{
# include "calc.tab.h"
extern int yyerror(const char *, ...);
%}

%%
"+" { return ADD;  }
"-" { return SUB;  }
"*" { return MUL;  }
"/" { return DIV;  }
"(" { return OP;  }
")" { return CP;  }
([1-9][0-9]*)|0|([0-9]+\.[0-9]+) {
    double temp;
    sscanf(yytext, "%lf", &temp);
    yylval.double_value = temp;
    return DOUBLE_NUMBER;
}


\n      { return EOL;  }
"//".*  
[ \t ]   { /* ignore white space */  }
.   { yyerror("Mystery character %c\n", *yytext);  }
%%
