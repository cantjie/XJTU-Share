//
// See copyright.h for copyright notice and limitation of liability
// and disclaimer of warranty provisions.
//
#include "copyright.h"

//////////////////////////////////////////////////////////////////////////////
//
//  parser-phase.cc
//
//  Reads a COOL token stream from a file and builds the abstract syntax tree.
//
//////////////////////////////////////////////////////////////////////////////

#include <stdio.h>     // for Linux system
#include <iostream>
#include <unistd.h>    // for getopt
#include "cool-tree.h"
#include "utilities.h"  // for fatal_error
#include "cool-parse.h"


//
// These globals keep everything working.
//
FILE *token_file = stdin;		// we read from this file
extern Classes parse_results;	 // list of classes; used for multiple files 
extern Program ast_root;	 // the AST produced by the parse

int curr_lineno;               // needed for lexical analyzer
char *curr_filename = "<stdin>";

extern int omerrs;             // a count of lex and parse errors

extern int cool_yyparse();
void handle_flags(int argc, char *argv[]);

int main(int argc, char *argv[]) {
    handle_flags(argc, argv);
    cool_yyparse();
    if (omerrs != 0) {
	std::cerr << "Compilation halted due to lex and parse errors\n";
	exit(1);
    }
    ast_root->dump_with_types(cout,0);
    return 0;
}

