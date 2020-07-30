//
// See copyright.h for copyright notice and limitation of liability
// and disclaimer of warranty provisions.
//
#include "copyright.h"

//////////////////////////////////////////////////////////////////////////////
//
//  utilities.c
//
//  General support code for lexer and parser.
//
//  This file contains:
//      fatal_error            print an error message and exit
//      print_escaped_string   print a string showing escape characters
//      print_cool_token       print a cool token and its semantic value
//      dump_cool_token        dump a readable token representation
//      strdup                 duplicate a string (missing from some libraries)
//
///////////////////////////////////////////////////////////////////////////////

#include <iomanip>
#include <iostream>    // for std::cerr, <<, manipulators
#include <ctype.h>       // for isprint
#include "cool-parse.h"  // defines tokens
#include "stringtab.h"   // Symbol <-> String conversions
#include "utilities.h"

// #define CHECK_TABLES

// sm: fixed an off-by-one error here; code assumed there were 80 spaces, but
// in fact only 79 spaces were there; I've made it 80 now
//                                1         2         3         4         5         6         7
//                      01234567890123456789012345678901234567890123456789012345678901234567890123456789
static char *padding = "                                                                                ";      // 80 spaces for padding

void fatal_error(char *msg)
{
   std::cerr << msg;
   exit(1);
}


void print_escaped_string(std::ostream& str, const char *s)
{
  while (*s) {
    switch (*s) {
    case '\\' : str << "\\\\"; break;
    case '\"' : str << "\\\""; break;
    case '\n' : str << "\\n"; break;
    case '\t' : str << "\\t"; break;
    case '\b' : str << "\\b"; break;
    case '\f' : str << "\\f"; break;

    default:
      if (isprint(*s))
	str << *s;
      else 
	// 
	// Unprintable characters are printed using octal equivalents.
	// To get the sign of the octal number correct, the character
	// must be cast to an unsigned char before coverting it to an
	// integer.
	//
	str << '\\' << oct << setfill('0') << setw(3)
	    << (int) ((unsigned char) (*s))
	    << dec << setfill(' ');
      break;
    }
    s++;
  }
}

//
// The following two functions are used for debugging the parser.
//
char *cool_token_to_string(int tok)
{
  switch (tok) {
  case 0:            return("EOF");        break;
  case (CLASS):      return("CLASS");      break;
  case (ELSE):       return("ELSE");       break;
  case (FI):         return("FI");         break;
  case (IF):         return("IF");         break;
  case (IN):         return("IN");         break;
  case (INHERITS):   return("INHERITS");   break;
  case (LET):        return("LET");        break;
  case (LOOP):       return("LOOP");       break;
  case (POOL):       return("POOL");       break;
  case (THEN):       return("THEN");       break;
  case (WHILE):      return("WHILE");      break;
  case (ASSIGN):     return("ASSIGN");     break;
  case (CASE):       return("CASE");       break;
  case (ESAC):       return("ESAC");       break;
  case (OF):         return("OF");         break;
  case (DARROW):     return("DARROW");     break;
  case (NEW):        return("NEW");        break;
  case (STR_CONST):  return("STR_CONST");  break;
  case (INT_CONST):  return("INT_CONST");  break;
  case (BOOL_CONST): return("BOOL_CONST"); break;
  case (TYPEID):     return("TYPEID");     break;
  case (OBJECTID):   return("OBJECTID");   break;
  case (ERROR):      return("ERROR");      break;
  case (LE):         return("LE");         break;
  case (NOT):        return("NOT");        break;
  case (ISVOID):     return("ISVOID");     break;
  case '+': return("'+'"); break;
  case '/': return("'/'"); break;
  case '-': return("'-'"); break;
  case '*': return("'*'"); break;
  case '=': return("'='"); break;
  case '<': return("'<'"); break;
  case '.': return("'.'"); break;
  case '~': return("'~'"); break;
  case ',': return("','"); break;
  case ';': return("';'"); break;
  case ':': return("':'"); break;
  case '(': return("'('"); break;
  case ')': return("')'"); break;
  case '@': return("'@'"); break;
  case '{': return("'{'"); break;
  case '}': return("'}'"); break;
  default:  return("<Invalid Token>");
  }
}

void print_cool_token(int tok)
{

  std::cerr << cool_token_to_string(tok);

  switch (tok) {
  case (STR_CONST):
    std::cerr << " = ";
    std::cerr << " \"";
    print_escaped_string(std::cerr, cool_yylval.symbol->get_string());
    std::cerr << "\"";
#ifdef CHECK_TABLES
    stringtable.lookup_string(cool_yylval.symbol->get_string());
#endif
    break;
  case (INT_CONST):
    std::cerr << " = " << cool_yylval.symbol;
#ifdef CHECK_TABLES
    inttable.lookup_string(cool_yylval.symbol->get_string());
#endif
    break;
  case (BOOL_CONST):
    std::cerr << (cool_yylval.boolean ? " = true" : " = false");
    break;
  case (TYPEID):
  case (OBJECTID):
    std::cerr << " = " << cool_yylval.symbol;
#ifdef CHECK_TABLES
    idtable.lookup_string(cool_yylval.symbol->get_string());
#endif
    break;
  case (ERROR): 
    std::cerr << " = ";
    print_escaped_string(std::cerr, cool_yylval.error_msg);
    break;
  }
}

// dump the token in format readable by the sceond phase token lexer
void dump_cool_token(std::ostream& out, int lineno, int token, YYSTYPE yylval) {
    out << "#" << lineno << " " << cool_token_to_string(token);

    switch (token) {
    case (STR_CONST):
	out << " \"";
	print_escaped_string(out, cool_yylval.symbol->get_string());
	out << "\"";
#ifdef CHECK_TABLES
	stringtable.lookup_string(cool_yylval.symbol->get_string());
#endif
	break;
    case (INT_CONST):
	out << " " << cool_yylval.symbol;
#ifdef CHECK_TABLES
	inttable.lookup_string(cool_yylval.symbol->get_string());
#endif
	break;
    case (BOOL_CONST):
	out << (cool_yylval.boolean ? " true" : " false");
	break;
    case (TYPEID):
    case (OBJECTID):
	out << " " << cool_yylval.symbol;
#ifdef CHECK_TABLES
	idtable.lookup_string(cool_yylval.symbol->get_string());
#endif
	break;
    case (ERROR): 
        // sm: I've changed assignment 2 so students are supposed to
        // *not* coalesce error characters into one string; therefore,
        // if we see an "empty" string here, we can safely assume the
        // lexer is reporting an occurrance of an illegal NUL in the
        // input stream
        if (cool_yylval.error_msg[0] == 0) {
          out << " \"\\000\"";
        }
        else {
          out << " \"";
          print_escaped_string(out, cool_yylval.error_msg);
          out << "\"";
          break;
        }
    }
    out << std::endl;
}

//
// Decstations don't have strdup in the library.
//
/*
char *strdup(const char *s)
{
  char *news;

  if (s == NULL) return(NULL);

  news = (char *)malloc(strlen(s)+1);
  strcpy(news, s);
  return(news);
}
*/
///////////////////////////////////////////////////////////////////////////
//
// pad
//
// function to add pad
//
///////////////////////////////////////////////////////////////////////////
char *pad(int n) {
    if (n > 80) return padding;
    if (n <= 0)  return "";
    return padding+(80-n);
}
