/*
 *  这个文件用来生成一个COOL语言的词法分析程序.
 */

/*
 *  lex文件的第一个部分，也就是包含在“%{”和“ %}”之间的部分，是用来像未来的词法分析程序输出代  
 *  码的，也就是说这里的需要include头文件，extern外部变量，因为这部分是要直接照搬到以后的.c文 
 *  件中去的 
 */
%{
#include <cool-parse.h>  //记号的定义放在cool-parse.h文件中
#include <stringtab.h>
#include <utilities.h>

/* 词法分析程序需要的宏定义 */
#define yylval cool_yylval
#define yylex  cool_yylex

/* 字符串常量的最大长度 */
#define MAX_STR_CONST 1025
#define YY_NO_UNPUT   /* 让g++的编译结果变得友好 */

extern FILE *fin; /* 从这个文件指针读取记号 */

/* 定义YY_INPUT以后我们就可以从fin中读取记号了:
 */
#undef YY_INPUT
#define YY_INPUT(buf,result,max_size) \
	if ( (result = fread( (char*)buf, sizeof(char), max_size, fin)) < 0) \
		YY_FATAL_ERROR( "read() in flex scanner failed");

char string_buf[MAX_STR_CONST]; /* 记录字符串的字符数组*/
char *string_buf_ptr;

extern int curr_lineno;
extern int verbose_flag;

extern YYSTYPE cool_yylval;

/*
 *  在这里添加你自己的头文件和变量
 */

int uniqueIndex =1;

%}

/*
 * 第二部分用来定义正则表达式需要的“元素”
 */

/* 下面是我们给出的基本实例 */
TYPEID          [A-Z]+[_A-Za-z0-9]*
OBJECTID        [a-z]+[_a-zA-Z0-9]*

STR_CONST       \".*\"
INT_CONST       [0-9]+

WHITE           [ \t]+
LINE            \n

%s              MutiCom

%%

"--"[^\n]*        {/* 忽略掉一行的注释 */}
"(*"              {BEGIN(MutiCom);}

<MutiCom>[^\n*]*   {}
<MutiCom>"*"+[^*)\n]* {}
<MutiCom>\n       {++curr_lineno;}
<MutiCom>"*"+")"  {BEGIN(INITIAL);}
<MutiCom><<EOF>>           {   
                    BEGIN(INITIAL);
                    cool_yylval.error_msg = "EOF in comment";
                    return(ERROR);
                   }


"class"           {return CLASS;}
"inherits"        {return INHERITS;}

"if"              {return IF;}
"else"            {return ELSE;}
"then"            {return THEN;}
"fi"              {return FI;}

"let"             {return LET;}
"in"              {return IN;}

"while"           {return WHILE;}
"loop"            {return LOOP;}
"pool"            {return POOL;}

"case"            {return CASE;}
"esac"            {return ESAC;}
"of"              {return OF;}

"new"             {return NEW;}

"isvoid"          {return ISVOID;}

"true"            {
                     cool_yylval.boolean = 1;
                     return BOOL_CONST;
                  }
"false"           {
                     cool_yylval.boolean=0;
                     return BOOL_CONST;
                  }
"not"             {return NOT;}

"SELF_TYPE"       {
                     cool_yylval.symbol=new IdEntry(yytext,strlen(yytext),uniqueIndex++);
                     return TYPEID;
                  }
  
"self"            { 
                     cool_yylval.symbol=new IdEntry(yytext,strlen(yytext),uniqueIndex++);
                     return OBJECTID;               
                  }

"le"              {return LE;}

"<-"              {return ASSIGN;} 
"=>"              {return DARROW;}

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


{TYPEID}          {  
                    cool_yylval.symbol = new IdEntry(yytext,strlen(yytext),uniqueIndex++);
                    return TYPEID;
                  }

{OBJECTID}        {
                    cool_yylval.symbol = new IdEntry(yytext,strlen(yytext),uniqueIndex++);
                    return OBJECTID;
                  } 


{STR_CONST}       {
                    cool_yylval.symbol = new StringEntry(yytext,strlen(yytext),uniqueIndex++);
                    return STR_CONST;
                  }

{INT_CONST}       {
                    cool_yylval.symbol = new IntEntry(yytext,strlen(yytext),uniqueIndex++);
                    return INT_CONST;
                  }

{WHITE}           {}

{LINE}            {curr_lineno++;}

.                {
                    cool_yylval.error_msg = new char[strlen(yytext+1)];
                    strcpy(cool_yylval.error_msg,yytext);
                    return ERROR;
                  }



%%

int yywrap()
{
   return 1;
}
