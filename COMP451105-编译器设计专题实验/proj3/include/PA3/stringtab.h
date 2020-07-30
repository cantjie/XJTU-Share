// -*-Mode: C++;-*-
//
// See copyright.h for copyright notice and limitation of liability
// and disclaimer of warranty provisions.
//
#include "copyright.h"


#ifndef _STRINGTAB_H_
#define _STRINGTAB_H_

#include <assert.h>
#include <string.h>
#include "list.h"    // list template

class Entry;
typedef Entry* Symbol;

extern std::ostream& operator<<(std::ostream& s, const Entry& sym);
extern std::ostream& operator<<(std::ostream& s, Symbol sym);

/////////////////////////////////////////////////////////////////////////
//
//  Entry是符号表的基础类型
//
/////////////////////////////////////////////////////////////////////////

class Entry {
protected:
  char *str;     // 存一个字符串
  int  len;      // 长度
  int index;     // 唯一的索引值
public:
  Entry(char *s, int l, int i);

  int equal_string(char *s, int len) const;  
                         
  bool equal_index(int ind) const           { return ind == index; }

  std::ostream& print(std::ostream& s) const;

  char *get_string() const;
  int get_len() const;
};

class StringEntry : public Entry {
public:
  void code_def(std::ostream& str, int stringclasstag);
  void code_ref(std::ostream& str);
  StringEntry(char *s, int l, int i);
};

class IdEntry : public Entry {
public:
  IdEntry(char *s, int l, int i);
};

class IntEntry: public Entry {
public:
  void code_def(std::ostream& str, int intclasstag);
  void code_ref(std::ostream& str);
  IntEntry(char *s, int l, int i);
};

typedef StringEntry *StringEntryP;
typedef IdEntry *IdEntryP;
typedef IntEntry *IntEntryP;

//////////////////////////////////////////////////////////////////////////
//
//  符号表的模版，模版中方法的实现见stringtab_functions.h
//
//////////////////////////////////////////////////////////////////////////

template <class Elem> 
class StringTable
{
protected:
   List<Elem> *tbl;   // 符号表是个list
   int index;         // 当前的索引
public:
   StringTable(): tbl((List<Elem> *) NULL), index(0) { }   // 初始化一个空的符号表

   Elem *add_string(char *s, int maxchars);

   Elem *add_string(char *s);

   Elem *add_int(int i);


   // 迭代.
   int first();       
   int more(int i);   
   int next(int i);  

   Elem *lookup(int index);      // 根据索引查找
   Elem *lookup_string(char *s); // 根据字符内容查找

   void print();  // 打印整个符号表，调试时使用

};

class IdTable : public StringTable<IdEntry> { };

class StrTable : public StringTable<StringEntry>
{
public: 
   void code_string_table(std::ostream&, int classtag);
};

class IntTable : public StringTable<IntEntry>
{
public:
   void code_string_table(std::ostream&, int classtag);
};

extern IdTable idtable;
extern IntTable inttable;
extern StrTable stringtable;
#endif
