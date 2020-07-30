//
// See copyright.h for copyright notice and limitation of liability
// and disclaimer of warranty provisions.
//
#include "copyright.h"

#include "cool.h"
#include "tree.h"
#include "cool-tree.h"
#include "utilities.h"

// defined in stringtab.cc
void dump_Symbol(ostream& stream, int padding, Symbol b); 

// defined in cool.h
void dump_Boolean(ostream& stream, int padding, Boolean b);

//////////////////////////////////////////////////////////////////
//
//  dumptype.cc
//
//  dumptype defines a simple recursive traversal of the abstract
//  syntax tree (AST) that prints each node and any associated
//  type information.  Use dump_with_types to inspect the results of
//  type inference.
//
//  dump_with_types takes two argumenmts:
//     an output stream
//     an indentation "n", the number of blanks to insert at the beginning of
//                         a new line.
//   
//  dump_with_types is just a simple pretty printer, formatting the output
//  to show the AST relationships between nodes and their types.
//  dump_type is a virtual function, with a separate implementation for
//  each kind of AST node.  Using virtual functions is an easy way to
//  implement recursive tree traversals in C++; each kind of tree node
//  has a virtual function that "knows" how to perform the part of
//  the traversal for that one node.  It may help to know the inheritance hierarchy
//  of the classes that define the structure of the Cool AST.  In the 
//  list below, the outer classes are the Phyla which group together
//  related kinds of abstract tree nodes (e.g., the two kinds of Features
//  and the many different kinds of Expression).  The inner, indented classes
//  inherit from the nearest Phyla class; these are the concrete classes that
//  appear in the AST.
//   
//  Program_class
//     program_class
// 
//  Class__class
//     class_
//
//  Feature_class
//     method
//     attr
//
//  Formal_class
//     formal
//
//  Case_class
//     branch_class
//
//  Expression_class
//     assign
//     static_dispatch
//     dispatch
//     cond
//     loop
//     typcase
//     block
//     let
//     plus
//     sub
//     mul
//     divide
//     neg
//     lt
//     eq
//     leq
//     comp
//     int_const
//     bool_const
//     string_const
//     new_
//     isvoid
//     no_expr
//     object
//
//  All of the Phyla inherit from the tree_node class, which has a member
//  called type.  The type member holds the type of the AST node.
//
//  Some AST nodes have lists of other tree nodes as components.  Lists in the
//  AST are built using the class list_node defined in tree.h.  The list
//  classes in the Cool AST are:
//
//  Classes      a list of Class_
//  Features     a list of Feature
//  Expressions  a list of Expression
//  Cases        a list of Case
//


//
//  dump_type prints the type of an Expression on the output stream,
//  after indenting the correct number of spaces.  A check is made to
//  see if no type is assigned to the node.
//
//  Note that the "type" member referred to here is inherited from tree_node
//  by all subclasses of Expression_class.  Note also that dump_type is
//  defined for the Phylum Expression here, and is therefore inherited by
//  every distinct subclass of Expression.
//

void Expression_class::dump_type(ostream& stream, int n)
{
  if (type)
    { stream << pad(n) << ": " << type << endl; }
  else
    { stream << pad(n) << ": _no_type" << endl; }
}

void dump_line(ostream& stream, int n, tree_node *t)
{
  stream << pad(n) << "#" << t->get_line_number() << "\n";
}

//
//  program_class prints "program" and then each of the
//  component classes of the program, one at a time, at a
//  greater indentation. The recursive invocation on
//  "classes->nth(i)->dump_with_types(...)" shows how useful
//  and compact virtual functions are for this kind of computation.
//
//  Note the use of the iterator to cycle through all of the
//  classes.  The methods first, more, next, and nth on AST lists
//  are defined in tree.h.
//
void program_class::dump_with_types(ostream& stream, int n)
{
   dump_line(stream,n,this);
   stream << pad(n) << "_program\n";
   for(int i = classes->first(); classes->more(i); i = classes->next(i))
     classes->nth(i)->dump_with_types(stream, n+2);
}

//
// Prints the components of a class, including all of the features.
// Note that printing the Features is another use of an iterator.
//
void class__class::dump_with_types(ostream& stream, int n)
{
   dump_line(stream,n,this);
   stream << pad(n) << "_class\n";
   dump_Symbol(stream, n+2, name);
   dump_Symbol(stream, n+2, parent);
   stream << pad(n+2) << "\"";
   print_escaped_string(stream, filename->get_string());
   stream << "\"\n" << pad(n+2) << "(\n";
   for(int i = features->first(); features->more(i); i = features->next(i))
     features->nth(i)->dump_with_types(stream, n+2);
   stream << pad(n+2) << ")\n";
}


//
// dump_with_types for method_class first prints that this is a method,
// then prints the method name followed by the formal parameters
// (another use of an iterator, this time access all of the list members
// of type Formal), the return type, and finally calls dump_type recursively
// on the method body. 

void method_class::dump_with_types(ostream& stream, int n)
{
   dump_line(stream,n,this);
   stream << pad(n) << "_method\n";
   dump_Symbol(stream, n+2, name);
   for(int i = formals->first(); formals->more(i); i = formals->next(i))
     formals->nth(i)->dump_with_types(stream, n+2);
   dump_Symbol(stream, n+2, return_type);
   expr->dump_with_types(stream, n+2);
}

//
//  attr_class::dump_with_types prints the attribute name, type declaration,
//  and any initialization expression at the appropriate offset.
//
void attr_class::dump_with_types(ostream& stream, int n)
{
   dump_line(stream,n,this);
   stream << pad(n) << "_attr\n";
   dump_Symbol(stream, n+2, name);
   dump_Symbol(stream, n+2, type_decl);
   init->dump_with_types(stream, n+2);
}

//
// formal_class::dump_with_types dumps the name and type declaration
// of a formal parameter.
//
void formal_class::dump_with_types(ostream& stream, int n)
{
   dump_line(stream,n,this);
   stream << pad(n) << "_formal\n";
   dump_Symbol(stream, n+2, name);
   dump_Symbol(stream, n+2, type_decl);
}

//
// branch_class::dump_with_types dumps the name, type declaration,
// and body of any case branch.
//
void branch_class::dump_with_types(ostream& stream, int n)
{
   dump_line(stream,n,this);
   stream << pad(n) << "_branch\n";
   dump_Symbol(stream, n+2, name);
   dump_Symbol(stream, n+2, type_decl);
   expr->dump_with_types(stream, n+2);
}

//
// assign_class::dump_with_types prints "assign" and then (indented)
// the variable being assigned, the expression, and finally the type
// of the result.  Note the call to dump_type (see above) at the
// end of the method.
//
void assign_class::dump_with_types(ostream& stream, int n)
{
   dump_line(stream,n,this);
   stream << pad(n) << "_assign\n";
   dump_Symbol(stream, n+2, name);
   expr->dump_with_types(stream, n+2);
   dump_type(stream,n);
}

//
// static_dispatch_class::dump_with_types prints the expression,
// static dispatch class, function name, and actual arguments
// of any static dispatch.  
//
void static_dispatch_class::dump_with_types(ostream& stream, int n)
{
   dump_line(stream,n,this);
   stream << pad(n) << "_static_dispatch\n";
   expr->dump_with_types(stream, n+2);
   dump_Symbol(stream, n+2, type_name);
   dump_Symbol(stream, n+2, name);
   stream << pad(n+2) << "(\n";
   for(int i = actual->first(); actual->more(i); i = actual->next(i))
     actual->nth(i)->dump_with_types(stream, n+2);
   stream << pad(n+2) << ")\n";
   dump_type(stream,n);
}

//
//   dispatch_class::dump_with_types is similar to 
//   static_dispatch_class::dump_with_types 
//
void dispatch_class::dump_with_types(ostream& stream, int n)
{
   dump_line(stream,n,this);
   stream << pad(n) << "_dispatch\n";
   expr->dump_with_types(stream, n+2);
   dump_Symbol(stream, n+2, name);
   stream << pad(n+2) << "(\n";
   for(int i = actual->first(); actual->more(i); i = actual->next(i))
     actual->nth(i)->dump_with_types(stream, n+2);
   stream << pad(n+2) << ")\n";
   dump_type(stream,n);
}

//
// cond_class::dump_with_types dumps each of the three expressions
// in the conditional and then the type of the entire expression.
//
void cond_class::dump_with_types(ostream& stream, int n)
{
   dump_line(stream,n,this);
   stream << pad(n) << "_cond\n";
   pred->dump_with_types(stream, n+2);
   then_exp->dump_with_types(stream, n+2);
   else_exp->dump_with_types(stream, n+2);
   dump_type(stream,n);
}

//
// loop_class::dump_with_types dumps the predicate and then the
// body of the loop, and finally the type of the entire expression.
//
void loop_class::dump_with_types(ostream& stream, int n)
{
   dump_line(stream,n,this);
   stream << pad(n) << "_loop\n";
   pred->dump_with_types(stream, n+2);
   body->dump_with_types(stream, n+2);
   dump_type(stream,n);
}

//
//  typcase_class::dump_with_types dumps each branch of the
//  the Case_ one at a time.  The type of the entire expression
//  is dumped at the end.
//
void typcase_class::dump_with_types(ostream& stream, int n)
{
   dump_line(stream,n,this);
   stream << pad(n) << "_typcase\n";
   expr->dump_with_types(stream, n+2);
   for(int i = cases->first(); cases->more(i); i = cases->next(i))
     cases->nth(i)->dump_with_types(stream, n+2);
   dump_type(stream,n);
}

//
//  The rest of the cases for Expression are very straightforward
//  and introduce nothing that isn't already in the code discussed
//  above.
//
void block_class::dump_with_types(ostream& stream, int n)
{
   dump_line(stream,n,this);
   stream << pad(n) << "_block\n";
   for(int i = body->first(); body->more(i); i = body->next(i))
     body->nth(i)->dump_with_types(stream, n+2);
   dump_type(stream,n);
}

void let_class::dump_with_types(ostream& stream, int n)
{
   dump_line(stream,n,this);
   stream << pad(n) << "_let\n";
   dump_Symbol(stream, n+2, identifier);
   dump_Symbol(stream, n+2, type_decl);
   init->dump_with_types(stream, n+2);
   body->dump_with_types(stream, n+2);
   dump_type(stream,n);
}

void plus_class::dump_with_types(ostream& stream, int n)
{
   dump_line(stream,n,this);
   stream << pad(n) << "_plus\n";
   e1->dump_with_types(stream, n+2);
   e2->dump_with_types(stream, n+2);
   dump_type(stream,n);
}

void sub_class::dump_with_types(ostream& stream, int n)
{
   dump_line(stream,n,this);
   stream << pad(n) << "_sub\n";
   e1->dump_with_types(stream, n+2);
   e2->dump_with_types(stream, n+2);
   dump_type(stream,n);
}

void mul_class::dump_with_types(ostream& stream, int n)
{
   dump_line(stream,n,this);
   stream << pad(n) << "_mul\n";
   e1->dump_with_types(stream, n+2);
   e2->dump_with_types(stream, n+2);
   dump_type(stream,n);
}

void divide_class::dump_with_types(ostream& stream, int n)
{
   dump_line(stream,n,this);
   stream << pad(n) << "_divide\n";
   e1->dump_with_types(stream, n+2);
   e2->dump_with_types(stream, n+2);
   dump_type(stream,n);
}

void neg_class::dump_with_types(ostream& stream, int n)
{
   dump_line(stream,n,this);
   stream << pad(n) << "_neg\n";
   e1->dump_with_types(stream, n+2);
   dump_type(stream,n);
}

void lt_class::dump_with_types(ostream& stream, int n)
{
   dump_line(stream,n,this);
   stream << pad(n) << "_lt\n";
   e1->dump_with_types(stream, n+2);
   e2->dump_with_types(stream, n+2);
   dump_type(stream,n);
}


void eq_class::dump_with_types(ostream& stream, int n)
{
   dump_line(stream,n,this);
   stream << pad(n) << "_eq\n";
   e1->dump_with_types(stream, n+2);
   e2->dump_with_types(stream, n+2);
   dump_type(stream,n);
}

void leq_class::dump_with_types(ostream& stream, int n)
{
   dump_line(stream,n,this);
   stream << pad(n) << "_leq\n";
   e1->dump_with_types(stream, n+2);
   e2->dump_with_types(stream, n+2);
   dump_type(stream,n);
}

void comp_class::dump_with_types(ostream& stream, int n)
{
   dump_line(stream,n,this);
   stream << pad(n) << "_comp\n";
   e1->dump_with_types(stream, n+2);
   dump_type(stream,n);
}

void int_const_class::dump_with_types(ostream& stream, int n)
{
   dump_line(stream,n,this);
   stream << pad(n) << "_int\n";
   dump_Symbol(stream, n+2, token);
   dump_type(stream,n);
}

void bool_const_class::dump_with_types(ostream& stream, int n)
{
   dump_line(stream,n,this);
   stream << pad(n) << "_bool\n";
   dump_Boolean(stream, n+2, val);
   dump_type(stream,n);
}

void string_const_class::dump_with_types(ostream& stream, int n)
{
   dump_line(stream,n,this);
   stream << pad(n) << "_string\n";
   stream << pad(n+2) << "\"";
   print_escaped_string(stream,token->get_string());
   stream << "\"\n";
   dump_type(stream,n);
}

void new__class::dump_with_types(ostream& stream, int n)
{
   dump_line(stream,n,this);
   stream << pad(n) << "_new\n";
   dump_Symbol(stream, n+2, type_name);
   dump_type(stream,n);
}

void isvoid_class::dump_with_types(ostream& stream, int n)
{
   dump_line(stream,n,this);
   stream << pad(n) << "_isvoid\n";
   e1->dump_with_types(stream, n+2);
   dump_type(stream,n);
}

void no_expr_class::dump_with_types(ostream& stream, int n)
{
   dump_line(stream,n,this);
   stream << pad(n) << "_no_expr\n";
   dump_type(stream,n);
}

void object_class::dump_with_types(ostream& stream, int n)
{
   dump_line(stream,n,this);
   stream << pad(n) << "_object\n";
   dump_Symbol(stream, n+2, name);
   dump_type(stream,n);
}

