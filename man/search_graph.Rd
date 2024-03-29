% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/search.R
\name{search_graph}
\alias{search_graph}
\alias{bfs_rank}
\alias{bfs_parent}
\alias{bfs_before}
\alias{bfs_after}
\alias{bfs_dist}
\alias{dfs_rank}
\alias{dfs_rank_out}
\alias{dfs_parent}
\alias{dfs_dist}
\title{Search a graph with depth first and breath first}
\usage{
bfs_rank(root, mode = "out", unreachable = FALSE)

bfs_parent(root, mode = "out", unreachable = FALSE)

bfs_before(root, mode = "out", unreachable = FALSE)

bfs_after(root, mode = "out", unreachable = FALSE)

bfs_dist(root, mode = "out", unreachable = FALSE)

dfs_rank(root, mode = "out", unreachable = FALSE)

dfs_rank_out(root, mode = "out", unreachable = FALSE)

dfs_parent(root, mode = "out", unreachable = FALSE)

dfs_dist(root, mode = "out", unreachable = FALSE)
}
\arguments{
\item{root}{The node to start the search from}

\item{mode}{How edges are followed in the search if the graph is directed.
\code{"out"} only follows outbound edges, \code{"in"} only follows inbound edges, and
\code{"all"} or \code{"total"} follows all edges. This is ignored for undirected
graphs.}

\item{unreachable}{Should the search jump to a new component if the search is
terminated without all nodes being visited? Default to \code{FALSE} (only reach
connected nodes).}
}
\value{
An integer vector, the nature of which is determined by the function.
}
\description{
These functions wraps the \code{\link[igraph:bfs]{igraph::bfs()}} and \code{\link[igraph:dfs]{igraph::dfs()}} functions to
provide a consistent return value that can be used in \code{\link[dplyr:mutate]{dplyr::mutate()}}
calls. Each function returns an integer vector with values matching the order
of the nodes in the graph.
}
\section{Functions}{
\itemize{
\item \code{bfs_rank()}: Get the succession in which the nodes are visited in a breath first search

\item \code{bfs_parent()}: Get the nodes from which each node is visited in a breath first search

\item \code{bfs_before()}: Get the node that was visited before each node in a breath first search

\item \code{bfs_after()}: Get the node that was visited after each node in a breath first search

\item \code{bfs_dist()}: Get the number of nodes between the root and each node in a breath first search

\item \code{dfs_rank()}: Get the succession in which the nodes are visited in a depth first search

\item \code{dfs_rank_out()}: Get the succession in which each nodes subtree is completed in a depth first search

\item \code{dfs_parent()}: Get the nodes from which each node is visited in a depth first search

\item \code{dfs_dist()}: Get the number of nodes between the root and each node in a depth first search

}}
\examples{
# Get the depth of each node in a tree
create_tree(10, 2) \%>\%
  activate(nodes) \%>\%
  mutate(depth = bfs_dist(root = 1))

# Reorder nodes based on a depth first search from node 3
create_notable('franklin') \%>\%
  activate(nodes) \%>\%
  mutate(order = dfs_rank(root = 3)) \%>\%
  arrange(order)

}
