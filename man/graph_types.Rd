% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/graph_types.R
\name{graph_types}
\alias{graph_types}
\alias{graph_is_simple}
\alias{graph_is_directed}
\alias{graph_is_bipartite}
\alias{graph_is_connected}
\alias{graph_is_tree}
\alias{graph_is_forest}
\alias{graph_is_dag}
\alias{graph_is_chordal}
\alias{graph_is_complete}
\alias{graph_is_isomorphic_to}
\alias{graph_is_subgraph_isomorphic_to}
\alias{graph_is_eulerian}
\title{Querying graph types}
\usage{
graph_is_simple()

graph_is_directed()

graph_is_bipartite()

graph_is_connected()

graph_is_tree()

graph_is_forest()

graph_is_dag()

graph_is_chordal()

graph_is_complete()

graph_is_isomorphic_to(graph, method = "auto", ...)

graph_is_subgraph_isomorphic_to(graph, method = "auto", ...)

graph_is_eulerian(cyclic = FALSE)
}
\arguments{
\item{graph}{The graph to compare structure to}

\item{method}{The algorithm to use for comparison}

\item{...}{Arguments passed on to the comparison methods. See
\code{\link[igraph:isomorphic]{igraph::is_isomorphic_to()}} and \code{\link[igraph:subgraph_isomorphic]{igraph::is_subgraph_isomorphic_to()}}}

\item{cyclic}{should the eulerian path start and end at the same node}
}
\value{
A logical scalar
}
\description{
This set of functions lets the user query different aspects of the graph
itself. They are all concerned with wether the graph implements certain
properties and will all return a logical scalar.
}
\section{Functions}{
\itemize{
\item \code{graph_is_simple()}: Is the graph simple (no parallel edges)

\item \code{graph_is_directed()}: Is the graph directed

\item \code{graph_is_bipartite()}: Is the graph bipartite

\item \code{graph_is_connected()}: Is the graph connected

\item \code{graph_is_tree()}: Is the graph a tree

\item \code{graph_is_forest()}: Is the graph an ensemble of multiple trees

\item \code{graph_is_dag()}: Is the graph a directed acyclic graph

\item \code{graph_is_chordal()}: Is the graph chordal

\item \code{graph_is_complete()}: Is the graph fully connected

\item \code{graph_is_isomorphic_to()}: Is the graph isomorphic to another graph. See \code{\link[igraph:isomorphic]{igraph::is_isomorphic_to()}}

\item \code{graph_is_subgraph_isomorphic_to()}: Is the graph an isomorphic subgraph to another graph. see \code{\link[igraph:subgraph_isomorphic]{igraph::is_subgraph_isomorphic_to()}}

\item \code{graph_is_eulerian()}: Can all the edges in the graph be reaches by a single
path or cycle that only goes through each edge once

}}
\examples{
gr <- create_tree(50, 4)

with_graph(gr, graph_is_tree())

}
