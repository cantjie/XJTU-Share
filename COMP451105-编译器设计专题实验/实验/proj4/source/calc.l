/* recognize tokens for the calculator and print them out */

%{
# include "calc.tab.h"
extern int yyerror(const char *, ...);
%}

%%
"true"  { return TRUE;  }
"false"  { return FALSE;  }
"||" {return OR; }
"&&" {return AND; }
"!" {return NOT; }
"(" { return OP;  }
")" { return CP;  }
\n      { return EOL;  }
"//".*  
[ \t ]   { /* ignore white space */  }
.   { yyerror("Mystery character %c\n", *yytext);  }
%%