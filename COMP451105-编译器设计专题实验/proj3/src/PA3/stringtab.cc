//
// See copyright.h for copyright notice and limitation of liability
// and disclaimer of warranty provisions.
//
#include "copyright.h"

#include <assert.h>
#include "stringtab_functions.h"
#include "stringtab.h"

extern char *pad(int n);

//
// Explicit template instantiations.
// Comment out for versions of g++ prior to 2.7
//
template class StringTable<IdEntry>;
template class StringTable<StringEntry>;
template class StringTable<IntEntry>;

Entry::Entry(char *s, int l, int i) : len(l), index(i) {
  str = new char [len+1];
  strncpy(str, s, len);
  str[len] = '\0';
}

int Entry::equal_string(char *string, int length) const
{
  return (len == length) && (strncmp(str,string,len) == 0);
}

ostream& Entry::print(ostream& s) const
{
  return s << "{" << str << ", " << len << ", " << index << "}\n";
}

ostream& operator<<(ostream& s, const Entry& sym) 
{
  return s << sym.get_string();
}


ostream& operator<<(ostream& s, Symbol sym)
{
  return s << *sym;
}

char *Entry::get_string() const
{
  return str;
}

int Entry::get_len() const
{
  return len;
}

// A Symbol is a pointer to an Entry.  Symbols are stored directly
// as nodes of the abstract syntax tree defined by the cool-tree.aps.
// The APS package requires that copy and print (called dump) functions
// be defined for components of the abstract syntax tree.
//
Symbol copy_Symbol(const Symbol s)
{
  return s;
}

void dump_Symbol(ostream& s, int n, Symbol sym)
{
  s << pad(n) << sym << endl;
}

StringEntry::StringEntry(char *s, int l, int i) : Entry(s,l,i) { }
IdEntry::IdEntry(char *s, int l, int i) : Entry(s,l,i) { }
IntEntry::IntEntry(char *s, int l, int i) : Entry(s,l,i) { }

IdTable idtable;
IntTable inttable;
StrTable stringtable;
