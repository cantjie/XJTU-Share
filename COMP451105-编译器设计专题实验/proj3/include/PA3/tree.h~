
#include "copyright.h"

#ifndef TREE_H
#define TREE_H
///////////////////////////////////////////////////////////////////////////
//
// file: tree.h
//
// 这个文件定义了语法树中的结点类型
//
///////////////////////////////////////////////////////////////////////////
 

#include "stringtab.h"
#include <iostream>

/////////////////////////////////////////////////////////////////////
//
//  tree_node
//  所有的APS结点都继承自tree_node.  以下是类中的属性介绍
//
////////////////////////////////////////////////////////////////////////////
class tree_node {
protected:
    int line_number;            //   结点被创建的时候，记录对应内容在源文件中的行数
public:
    tree_node();                //   创建一个新的tree_node. line_number将被设置为全局的yylineno.
    virtual tree_node *copy() = 0;
    virtual void dump(std::ostream& stream, int n) = 0;  //n表示需要输出间隔的空格数量
    int get_line_number();      //获取行数
    tree_node *set(tree_node *); //设置一个tree_node
};

///////////////////////////////////////////////////////////////////
//
//  Lists of APS objects are implemented by the "list_node"
//  template.  List elements have type Elem.  The interface is:
//
//     tree_node *copy()
//     list_node<Elem> *copy_list()
//
//     These functions have identical behavior; they return a deep
//     copy of the list (i.e., all elements of the list are copied).
//     When possible, the second function should be used, as it
//     has a more accurate result type.  The "copy" function is for
//     copying an entire APS tree of which a list is just one component
//     (see the definition of copy() in class tree_node).
//
//     Elem nth(int n);
//     returns the nth element of a list.  If the list has fewer than n
//     elements, an error is generated.
//
//     int first();
//     int next(int n);
//     int more(int n);
//       These three functions define a simple iterator for stepping through
//     list elements in order.  If l is a list, a typical use would be:
//
//     for(int i = l->first(); l->more(i); i = l->next(i))
//         ... operate on l->nth(i) ...
//
//      
//     int len()
//     returns the length of the list
//
//     nth_length(int n, int &len);
//     Returns the nth element of the list or NULL if there are not n elements.
//     "len" is set to the length of the list.  This method is used internally
//     by the APS package to efficiently traverse the list representation.  
//
//     static list_node<Elem> *nil();
//     static list_node<Elem> *single(Elem);
//     static list_node<Elem> *append(list_node<Elem> *, list_node<Elem> *);
//
//     These three functions construct an empty list, a list of one element,
//     and append two lists, respectively.  Note that the functions are static;
//     there is no "this" parameter.  Example uses:
//
//     list_node<Elem>::nil();
//     list_node<Elem>::single(e);     where "e" has type Elem
//     list_node<Elem>::append(l1,l2);
//
//////////////////////////////////////////////////////////////////////////////

template <class Elem> 
class list_node : public tree_node {
public:
    tree_node *copy()            { return copy_list(); }
    Elem nth(int n);
    //
    // The next three define a simple iterator.
    //
    int first()      { return 0; }
    int next(int n)  { return n + 1; }
    int more(int n)  { return (n < len()); }

    virtual list_node<Elem> *copy_list() = 0;
    virtual int len() = 0;
    virtual Elem nth_length(int n, int &len) = 0;

    static list_node<Elem> *nil();
    static list_node<Elem> *single(Elem);
    static list_node<Elem> *append(list_node<Elem> *l1,list_node<Elem> *l2);
};

char *pad(int n);

extern int info_size;

template <class Elem> 
class nil_node : public list_node<Elem> {
public:
    list_node<Elem> *copy_list();
    int len();
    Elem nth_length(int n, int &len);
    void dump(std::ostream& stream, int n);
};

template <class Elem> 
class single_list_node : public list_node<Elem> {
    Elem elem;
public:
    single_list_node(Elem t) {
	elem = t;
    }
    list_node<Elem> *copy_list();
    int len();
    Elem nth_length(int n, int &len);
    void dump(std::ostream& stream, int n);
};


template <class Elem> 
class append_node : public list_node<Elem> {
private:
    list_node<Elem> *some, *rest;
public:
    append_node(list_node<Elem> *l1, list_node<Elem> *l2) {
	some = l1; 
	rest = l2;
    }
    list_node<Elem> *copy_list();
    int len();
    Elem nth_length(int n, int &len);
    void dump(std::ostream& stream, int n);
};


template <class Elem> single_list_node<Elem> *list(Elem x);
template <class Elem> append_node<Elem> *cons(Elem x, list_node<Elem> *l);
template <class Elem> append_node<Elem> *xcons(list_node<Elem> *l, Elem x);


template <class Elem> list_node<Elem> *list_node<Elem>::nil() { return new nil_node<Elem>(); }
template <class Elem> list_node<Elem> *list_node<Elem>::single(Elem e) { return new single_list_node<Elem>(e); }
template <class Elem> list_node<Elem> *list_node<Elem>::append(list_node<Elem> *l1,list_node<Elem> *l2) {
   return new append_node<Elem>(l1,l2);
}


///////////////////////////////////////////////////////////////////////////
//
// list_node::nth
//
// 找到list当中第n个元素
//
///////////////////////////////////////////////////////////////////////////

template <class Elem> Elem list_node<Elem>::nth(int n)
{
    int len;
    Elem tmp = nth_length(n ,len);

    if (tmp)
	return tmp;
    else {
	std::cerr << "error: outside the range of the list\n";
	exit(1);
    }
}

///////////////////////////////////////////////////////////////////////////
//
// nil_node::copy_list
//
// 拷贝nil_node，深拷贝
//
///////////////////////////////////////////////////////////////////////////
template <class Elem> list_node<Elem> *nil_node<Elem>::copy_list()
{
    return new nil_node<Elem>();
}


///////////////////////////////////////////////////////////////////////////
//
// nil_node::len
//
// 返回nil_node的长度
//
///////////////////////////////////////////////////////////////////////////
template <class Elem> int nil_node<Elem>::len()
{
    return 0;
}



///////////////////////////////////////////////////////////////////////////
//
// nil_node::nth_length
//
// return the nth element on the list
//
///////////////////////////////////////////////////////////////////////////
template <class Elem> Elem nil_node<Elem>::nth_length(int, int &len)
{
    len = 0;
    return NULL;
}


///////////////////////////////////////////////////////////////////////////
//
// nil_node::dump
//
// dump for list node
//
///////////////////////////////////////////////////////////////////////////
template <class Elem> void nil_node<Elem>::dump(std::ostream& stream, int n)
{
    stream << pad(n) << "(nil)\n";
}


///////////////////////////////////////////////////////////////////////////
//
// single_list_node::copy_list
//
// return the deep copy of the single_list_node
//
///////////////////////////////////////////////////////////////////////////
template <class Elem> list_node<Elem> *single_list_node<Elem>::copy_list()
{
    return new single_list_node<Elem>((Elem) elem->copy());
}


///////////////////////////////////////////////////////////////////////////
//
// single_list_node::len
//
// return the length of the single_list_node
//
///////////////////////////////////////////////////////////////////////////
template <class Elem> int single_list_node<Elem>::len()
{
    return 1;
}


///////////////////////////////////////////////////////////////////////////
//
// single_list_node::nth_length
//
// return the nth element on the list
//
///////////////////////////////////////////////////////////////////////////
template <class Elem> Elem single_list_node<Elem>::nth_length(int n, int &len)
{
    len = 1;
    if (n)
	return NULL;
    else
	return elem;
}


///////////////////////////////////////////////////////////////////////////
//
// single_list_node::dump
//
// dump for list node
//
///////////////////////////////////////////////////////////////////////////
template <class Elem> void single_list_node<Elem>::dump(std::ostream& stream, int n)
{
    elem->dump(stream, n);
}


///////////////////////////////////////////////////////////////////////////
//
// append_node::copy_list
//
// return the deep copy of the append_node
//
///////////////////////////////////////////////////////////////////////////
template <class Elem> list_node<Elem> *append_node<Elem>::copy_list()
{
    return new append_node<Elem>(some->copy_list(), rest->copy_list());
}


///////////////////////////////////////////////////////////////////////////
//
// append_node::len
//
// return the length of the append_node
//
///////////////////////////////////////////////////////////////////////////
template <class Elem> int append_node<Elem>::len()
{
    return some->len() + rest->len();
}


///////////////////////////////////////////////////////////////////////////
//
// append_node::nth_length
//
// return the nth element on the list
//
///////////////////////////////////////////////////////////////////////////
template <class Elem> Elem append_node<Elem>::nth_length(int n, int &len)
{
    int rlen;
    Elem tmp = some->nth_length(n, len);

    if (!tmp) {
	tmp = rest->nth_length(n-len, rlen);
	len += rlen;
    }
    return tmp;
}


///////////////////////////////////////////////////////////////////////////
//
// append_node::dump
//
// dump for list node
//
///////////////////////////////////////////////////////////////////////////
template <class Elem> void append_node<Elem>::dump(std::ostream& stream, int n)
{
    int i, size;

    size = len();
    stream << pad(n) << "list\n";
    for (i = 0; i < size; i++)
	list_node<Elem>::nth(i)->dump(stream, n+2);
    stream << pad(n) << "(end_of_list)\n";
}


///////////////////////////////////////////////////////////////////////////
//
// list
//
///////////////////////////////////////////////////////////////////////////
template <class Elem> single_list_node<Elem> *list(Elem x)
{
    return new single_list_node<Elem>(x);
}


///////////////////////////////////////////////////////////////////////////
//
// cons
//
///////////////////////////////////////////////////////////////////////////
template <class Elem> append_node<Elem> *cons(Elem x, list_node<Elem> *l)
{
    return new append_node<Elem>(list(x), l);
}


///////////////////////////////////////////////////////////////////////////
//
// xcons
//
///////////////////////////////////////////////////////////////////////////
template <class Elem> append_node<Elem> *xcons(list_node<Elem> *l, Elem x)
{
    return new append_node<Elem>(l, list(x));
}

#endif /* TREE_H */
