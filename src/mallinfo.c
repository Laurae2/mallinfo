#include <malloc.h>
#ifdef USE_BRK
#include <unistd.h>
#include <stdint.h>
#endif
#include <Rinternals.h>

SEXP R_mallinfo() {
  struct mallinfo m = mallinfo();
  SEXP res = PROTECT(Rf_allocVector(INTSXP, 10)), snam;
  const char *names[] = { "arena", "ordblks", "smblks", "hblks", "hblkhd", "usmblks", "fsmblks", "uordblks", "fordblks", "keepcost" };
  int i, *ri = INTEGER(res);
  ri[0] = m.arena;
  ri[1] = m.ordblks;
  ri[2] = m.smblks;
  ri[3] = m.hblks;
  ri[4] = m.hblkhd;
  ri[5] = m.usmblks;
  ri[6] = m.fsmblks;
  ri[7] = m.uordblks;
  ri[8] = m.fordblks;
  ri[9] = m.keepcost;
  Rf_setAttrib(res, R_NamesSymbol, snam = Rf_allocVector(STRSXP, 10));
  for (i = 0; i < 10; i++) SET_STRING_ELT(snam, i, mkChar(names[i]));
  UNPROTECT(1);
  return res;
}

SEXP R_malloc_trim(SEXP keep) {
#ifdef __GLIBC__
  return Rf_ScalarLogical(malloc_trim(Rf_asInteger(keep)));
#else
  Rf_error("malloc.trim is not supported on this platform");
  return R_NilValue; /* make compiler happy */
#endif
}

SEXP R_mallopt(SEXP param, SEXP value) {
  return Rf_ScalarLogical(mallopt(Rf_asInteger(param), Rf_asInteger(value)));
}

#ifdef USE_BRK
SEXP R_query_brk() {
  return Rf_ScalarReal((double) ((uintptr_t)sbrk(0)));
}
#endif
