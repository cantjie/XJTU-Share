%{
#include <stdio.h>
int flag=0;
%}
%%
^a {ECHO;flag='a';}
^b {ECHO;flag='b';}
^c {ECHO;flag='c';}
^l {ECHO;flag='c';}
^w  {ECHO;flag='c';}
magic	{switch(flag) {
		case 'a':printf("first");break;
		case  'b':printf("second");break;
		case  'c':printf("third");break;
		case  'l':printf("ll");break;
		case  'w':printf("ww");break;
		default:printf("zero");break;
		}
	}
\n|(\t)+|" "+	{ECHO;flag=0;}
%%
int main()
{
	yyin=fopen("text1","r");
	yylex();
	/*printf("nchar=%d,nwords=%d,nline=%d \n",nchar,nwords,nline);*/
}

