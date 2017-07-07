// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// get_paths
List get_paths(IntegerVector parent);
RcppExport SEXP tidygraph_get_paths(SEXP parentSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< IntegerVector >::type parent(parentSEXP);
    rcpp_result_gen = Rcpp::wrap(get_paths(parent));
    return rcpp_result_gen;
END_RCPP
}
// collect_offspring
List collect_offspring(ListOf<IntegerVector> offspring, IntegerVector order);
RcppExport SEXP tidygraph_collect_offspring(SEXP offspringSEXP, SEXP orderSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< ListOf<IntegerVector> >::type offspring(offspringSEXP);
    Rcpp::traits::input_parameter< IntegerVector >::type order(orderSEXP);
    rcpp_result_gen = Rcpp::wrap(collect_offspring(offspring, order));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"tidygraph_get_paths", (DL_FUNC) &tidygraph_get_paths, 1},
    {"tidygraph_collect_offspring", (DL_FUNC) &tidygraph_collect_offspring, 2},
    {NULL, NULL, 0}
};

RcppExport void R_init_tidygraph(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
