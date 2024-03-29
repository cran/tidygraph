% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/random_walk.R
\name{random_walk_rank}
\alias{random_walk_rank}
\title{Perform a random walk on the graph and return encounter rank}
\usage{
random_walk_rank(n, root = NULL, mode = "out", weights = NULL)
}
\arguments{
\item{n}{The number of steps to perform. If the walk gets stuck before
reaching this number the walk is terminated}

\item{root}{The node to start the walk at. If \code{NULL} a random node will be
used}

\item{mode}{How edges are followed in the search if the graph is directed.
\code{"out"} only follows outbound edges, \code{"in"} only follows inbound edges, and
\code{"all"} or \code{"total"} follows all edges. This is ignored for undirected
graphs.}

\item{weights}{The weights to use for edges when selecting the next step of
the walk. Currently only used when edges are active}
}
\value{
A list with an integer vector for each node or edge (depending on
what is active) each element encode the time the node/edge is encountered
along the walk
}
\description{
A random walk is a traversal of the graph starting from a node and going a
number of steps by picking an edge at random (potentially weighted).
\code{random_walk()} can be called both when nodes and edges are active and will
adapt to return a value fitting to the currently active part. As the
walk order cannot be directly encoded in the graph the return value is a list
giving a vector of positions along the walk of each node or edge.
}
\examples{
graph <- create_notable("zachary")

# Random walk returning node order
graph |>
  mutate(walk_rank = random_walk_rank(200))

# Rank edges instead
graph |>
  activate(edges) |>
  mutate(walk_rank = random_walk_rank(200))

}
