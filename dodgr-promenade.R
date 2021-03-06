## From dodgr
muenster = dodgr_streetnet('Muenster, DE')
promenade_dodgr = muenster %>% filter(name == 'Promenade')

promenade_graph = weight_streetnet(promenade_dodgr, wt_profile = 'bicycle')

## Sample points along the route to create flows
start = Sys.time()
from = sample(promenade_graph$from_id, size = 430)
to = sample(promenade_graph$to_id, size = 430)
flows = matrix(10*runif(
  length(from)*length(to)),
  nrow = length (from)
)

graph_f = dodgr_flows_aggregate(promenade_graph, from = from, to = to, flows = flows)
graph_undir = merge_directed_flows(graph_f)

dodgr_flowmap(graph_f, linescale = 5)
end = Sys.time()

duration = end - start
