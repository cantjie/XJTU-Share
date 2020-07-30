//
// See copyright.h for copyright notice and limitation of liability
// and disclaimer of warranty provisions.
//
#include "copyright.h"

//
// Garbage collection options
//

extern enum Memmgr { GC_NOGC, GC_GENGC, GC_SNCGC } cgen_Memmgr;

extern enum Memmgr_Test { GC_NORMAL, GC_TEST } cgen_Memmgr_Test;

extern enum Memmgr_Debug { GC_QUICK, GC_DEBUG } cgen_Memmgr_Debug;
