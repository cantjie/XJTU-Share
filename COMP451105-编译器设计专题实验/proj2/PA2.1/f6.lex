%{
int uniqueIndex =1;

%}
TYPEID          [A-Z]+[_A-Za-z0-9]*
OBJECTID        [a-z]+[_a-zA-Z0-9]*
STR_CONST       \".*\"
INT_CONST       [0-9]+
WHITE           [ \t]+
LINE            \n

%s              MutiCom
%%
"program"+[A-Z]+[_A-Za-z0-9]*  {printf("<key word,program>\n");printf("<mark,p>\n");}

"program"	  {printf("<key word,program>\n");}
"var"		  {printf("<key word,var>\n");}
"type"		  {printf("<key word,type>\n");}
"integer"	  {printf("<var type,integer>\n");}
"char"		  {printf("<var type,char>\n");}
"begin"		  {printf("<key word,begin>\n");}
"end"		  {printf("<key word,end>\n");}

"{"               {return '{';}
"}"               {return '}';}
"("               {return '(';}
")"               {return ')';}
":"               {return ':';}
";"               {return ';';}
"+"               {return '+';}
"-"               {return '-';}
"*"               {return '*';}
"/"               {return '/';}
"="               {return '=';}
"<"               {return '<';}
"."               {return '.';}
"~"               {return '~';}
","               {return ',';}
"@"               {return '@';}
":="		  {printf("<assign,:=>\n");}
".."		  {printf("<under range,..>\n");}
%%
int main(){
	yyin=fopen("test3","r");
	yylex();
        //printf("fie");
	
return 0;
}

int yywrap()
{
   return 1;
}


