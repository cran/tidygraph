% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/map.R
\name{map_dfs_back}
\alias{map_dfs_back}
\alias{map_dfs_back_lgl}
\alias{map_dfs_back_chr}
\alias{map_dfs_back_int}
\alias{map_dfs_back_dbl}
\title{Apply a function to nodes in the reverse order of a depth first search}
\usage{
map_dfs_back(root, mode = "out", unreachable = FALSE, .f, ...)

map_dfs_back_lgl(root, mode = "out", unreachable = FALSE, .f, ...)

map_dfs_back_chr(root, mode = "out", unreachable = FALSE, .f, ...)

map_dfs_back_int(root, mode = "out", unreachable = FALSE, .f, ...)

map_dfs_back_dbl(root, mode = "out", unreachable = FALSE, .f, ...)
}
\arguments{
\item{root}{The node to start the search from}

\item{mode}{How should edges be followed? \code{'out'} only follows outbound
edges, \code{'in'} only follows inbound edges, and \code{'all'} follows all edges. This
parameter is ignored for undirected graphs.}

\item{unreachable}{Should the search jump to an unvisited node if the search
is completed without visiting all nodes.}

\item{.f}{A function to map over all nodes. See Details}

\item{...}{Additional parameters to pass to \code{.f}}
}
\value{
\code{map_dfs_back()} returns a list of the same length as the number of
nodes in the graph, in the order matching the node order in the graph (that
is, not in the order they are called). \verb{map_dfs_back_*()} tries to coerce
its result into a vector of the classes \code{logical} (\code{map_dfs_back_lgl}),
\code{character} (\code{map_dfs_back_chr}), \code{integer} (\code{map_dfs_back_int}), or \code{double}
(\code{map_dfs_back_dbl}). These functions will throw an error if they are
unsuccesful, so they are type safe.
}
\description{
These functions allow you to map over the nodes in a graph, by first
performing a depth first search on the graph and then mapping over each
node in the reverse order they are visited. The mapping function will have
access to the result and search statistics for all the nodes following itself
in the search. To map over the nodes in the original direction use
\code{\link[=map_dfs]{map_dfs()}}.
}
\details{
The function provided to \code{.f} will be called with the following arguments in
addition to those supplied through \code{...}:
\itemize{
\item \code{graph}: The full \code{tbl_graph} object
\item \code{node}: The index of the node currently mapped over
\item \code{rank}: The rank of the node in the search
\item \code{rank_out}: The rank of the completion of the nodes subtree
\item \code{parent}: The index of the node that led to the current node
\item \code{dist}: The distance of the current node from the root
\item \code{path}: A table containing \code{node}, \code{rank}, \code{rank_out}, \code{parent}, dist\verb{, and }result\verb{columns giving the values for each node reached from the current node. The}result` column will contain the result of the mapping
of each node in a list.
}

Instead of spelling out all of these in the function it is possible to simply
name the ones needed and use \code{...} to catch the rest.
}
\examples{
# Collect values from the 2 closest layers of children in a dfs search
create_tree(40, children = 3, directed = TRUE) \%>\%
  mutate(value = round(runif(40)*100)) \%>\%
  mutate(child_acc = map_dfs_back(node_is_root(), .f = function(node, path, dist, ...) {
    if (nrow(path) == 0) .N()$value[node]
    else {
      unlist(path$result[path$dist - dist <= 2])
    }
  }))
}
\seealso{
Other node map functions: 
\code{\link{map_bfs}()},
\code{\link{map_bfs_back}()},
\code{\link{map_dfs}()}
}
\concept{node map functions}
