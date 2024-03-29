% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/local.R
\name{local_graph}
\alias{local_graph}
\alias{local_size}
\alias{local_members}
\alias{local_triangles}
\alias{local_ave_degree}
\alias{local_transitivity}
\title{Measures based on the neighborhood of each node}
\usage{
local_size(order = 1, mode = "all", mindist = 0)

local_members(order = 1, mode = "all", mindist = 0)

local_triangles()

local_ave_degree(weights = NULL)

local_transitivity(weights = NULL)
}
\arguments{
\item{order}{Integer giving the order of the neighborhood.}

\item{mode}{Character constant, it specifies how to use the direction of
the edges if a directed graph is analyzed. For \sQuote{out} only the
outgoing edges are followed, so all vertices reachable from the source
vertex in at most \code{order} steps are counted. For \sQuote{"in"} all
vertices from which the source vertex is reachable in at most \code{order}
steps are counted. \sQuote{"all"} ignores the direction of the edges. This
argument is ignored for undirected graphs.}

\item{mindist}{The minimum distance to include the vertex in the result.}

\item{weights}{An edge weight vector. For \code{local_ave_degree}: If this argument
is given, the average vertex strength is calculated instead of vertex degree.
For \code{local_transitivity}: if given weighted transitivity using the approach by
\emph{A. Barrat} will be calculated.}
}
\value{
A numeric vector or a list (for \code{local_members}) with elements
corresponding to the nodes in the graph.
}
\description{
These functions wraps a set of functions that all measures quantities of the
local neighborhood of each node. They all return a vector or list matching
the node position.
}
\section{Functions}{
\itemize{
\item \code{local_size()}: The size of the neighborhood in a given distance from
the node. (Note that the node itself is included unless \code{mindist > 0}). Wraps \code{\link[igraph:ego]{igraph::ego_size()}}.

\item \code{local_members()}: The members of the neighborhood of each node in a
given distance. Wraps \code{\link[igraph:ego]{igraph::ego()}}.

\item \code{local_triangles()}: The number of triangles each node participate in. Wraps \code{\link[igraph:count_triangles]{igraph::count_triangles()}}.

\item \code{local_ave_degree()}: Calculates the average degree based on the neighborhood of each node. Wraps \code{\link[igraph:knn]{igraph::knn()}}.

\item \code{local_transitivity()}: Calculate the transitivity of each node, that is, the
propensity for the nodes neighbors to be connected. Wraps \code{\link[igraph:transitivity]{igraph::transitivity()}}

}}
\examples{
# Get all neighbors of each graph
create_notable('chvatal') \%>\%
  activate(nodes) \%>\%
  mutate(neighborhood = local_members(mindist = 1))

# These are equivalent
create_notable('chvatal') \%>\%
  activate(nodes) \%>\%
  mutate(n_neighbors = local_size(mindist = 1),
         degree = centrality_degree()) \%>\%
  as_tibble()

}
