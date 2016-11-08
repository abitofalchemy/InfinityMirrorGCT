Infinity Mirror Test
====================

In selecting a graph generator to build synthetic (or approximate) graphs
how do you assess the usefulness or effectiveness of the genrator to 
produce graphs that retain one or more specific network properties?
Use the Infinity Mirror Test.

## The Paper
This [paper](http://www.mlgworkshop.org/2016/paper/MLG2016_paper_17.pdf) was briefly presented at MLG201 held in conjunction with KDD'16
Aug 14, 2016 - San Francisco, CA. 

### Abstract 
Graph generators learn a model from a source graph in order to generate a new graph that has many of the same prop- erties. The learned models each have implicit and explicit biases built in, and it is important to understand the as- sumptions that are made when generating a new graph. Of course, the differences between the new graph and the origi- nal graph, as compared by any number of graph properties, are important indicators of the biases inherent in any mod- elling task. But these critical differences are subtle and not immediately apparent using standard performance metrics. Therefore, we introduce the infinity mirror test for the anal- ysis of graph generator performance and robustness. This stress test operates by repeatedly, recursively fitting a model to itself. A perfect graph generator would have no deviation from the original or ideal graph, however the implicit biases and assumptions that are cooked into the various models are exaggerated by the infinity mirror test allowing for new insights that were not available before. We show, via hun- dreds of experiments on 6 real world graphs, that several common graph generators do degenerate in interesting and informative ways. We believe that the observed degenera- tive patterns are clues to future development of better graph models.


## Dependencies

This code works with Python 2.7 and uses the HRG graph generator, BTER, 
Chung-Lu, and Kronecker Product Graph.




