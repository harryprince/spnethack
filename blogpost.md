The R community can lean on very powerful packages for spatial vector
data analysis ([sf](https://github.com/r-spatial/sf)) and network
analysis ([tidygraph](https://github.com/thomasp85/tidygraph)), that
both support the popular 'tidy' approach to data science. In sf, spatial
vector data are stored as objects of class `sf`, which are flat tables
with a list column that contains the geometry of the features. Tidygraph
is build on top of the widely-used
[igraph](https://github.com/igraph/igraph) package, and stores networks
in objects of class `tbl_graph`. A `tbl_graph` is an igraph-object, but
enables the user to manipulate both the edges and nodes elements as
being flat tables.

Despite the existence of sf and tidygraph, R seems to lack a general,
modern way to store networks whose nodes are embedded in space, i.e.
spatial networks. The [stplanr](https://github.com/ropensci/stplanr)
package contains the `SpatialLinesNetwork` class. This, however, is
based on [sp](https://github.com/edzer/sp/), a package for spatial data
analysis launched in 2005, that is used less since sf entered the stage.
The same yields for [spnetwork](https://github.com/edzer/spnetwork), a
package that combined sp and igraph. More recently,
[dodgr](https://github.com/ATFutures/dodgr) was created. This package
provides very fast analytical tools for spatial networks, but deals
solely with dual-weighted directed graphs, mainly used for calculating
shortest paths in street networks.

This blogpost presents a general approach to store spatial networks in a
tidy way by combining sf and tidygraph. At the same time, improvement
points to make this approach more convenient, are discussed.