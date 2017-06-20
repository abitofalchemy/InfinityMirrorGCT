import networkx as nx 
import scipy as sp
import scipy.io
import os

ifile = "c_elegans_neural_male_1.txt"
ifile = '../demo_graphs/karate.txt'

G = nx.read_edgelist(ifile)
A = nx.to_scipy_sparse_matrix(G)
print type(A)
print A
#LoadedUGraph = snap.LoadEdgeList(snap.PUNGraph, "c_elegans_simple.tsv", 0, 1, '\t')
#snap.SaveMatlabSparseMtx(A, "c_elegans_neural_male_1.mtx")

fname, ext = os.path.splitext(ifile)
ofile = fname + ".mtx" 
sp.io.mmwrite(ofile, A)
print('Written: {}'.format(ofile))  
