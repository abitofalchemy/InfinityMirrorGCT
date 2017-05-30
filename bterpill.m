files = dir('../demo_graphs/*.mtx');
for file = files'
  gfile = fullfile('../','demo_graphs',file.name)
  [pathstr,name,ext] = fileparts(file.name);
  % ofile = strcat('../demo_graphs/bter_',name,'_',int2str(r),'th.tsv');
  % fprintf('output filename: %s\n', ofile);
  % exit(1)
  % if exist(ofile, 'file')  == 2
  %   fprintf('TSV filename exists: %s\n', ofile);
  %   continue % if the ofile exists, load the next input file
  % end
  % otherwise 
  edgelist = load(gfile);
  sz = max(edgelist(:));
  G = sparse(edgelist(:,1), edgelist(:,2), 1, sz, sz);
  G = spconvert(G);
  graphname=file.name;
  G = G + G'; %<- Make the graph undirected
  G = spones(G); %<- Make the graph unweighted
  % 
  G = spdiags(zeros(size(G,1),1),0,G); %<- Remove self-loops

  nnodes = size(G,1);
  nedges = nnz(G)/2;
  fprintf('Graph name: %s\n', graphname);
  fprintf('Number of nodes: %d\n', nnodes);
  fprintf('Number of edges: %d\n', nedges);
  % Do some stuff
  
  
  %fprintf('Mean degree:    %f\n', mean(av));
  for r = drange(1:10)
    nd = accumarray(nonzeros(sum(G,2)), 1);
    maxdegree = find(nd>0,1,'last');
    avgdegree = mean(nd);
    fprintf('Maximum degree: %d\n', maxdegree);

    [ccd,gcc] = ccperdeg(G);
    fprintf('Global clustering coefficient: %.2f\n', gcc);

    fprintf('Running BTER...\n');
    t1=tic;
    [E1,E2] = bter(nd,ccd);
    toc(t1)
    fprintf('Number of edges created by BTER: %d\n', size(E1,1) + size(E2,1));
    
    fprintf('-----------------------------\n');
    fprintf('Turning edge list into adjacency matrix (including dedup)...\n');
    t2=tic;
    G_bter = bter_edges2graph(E1,E2);

    toc(t2);
    fprintf('Number of edges in dedup''d graph: %d\n', nnz(G_bter)/2);
    
    ofile = strcat('../demo_graphs/bter_',name,'_',int2str(r),'th.tsv')
    
    % dlmwrite(ofile,[E1;E2],'delimiter','\t') 
    [r,c] = find(G_bter);
    edges = [r,c];
    dlmwrite(ofile, edges, 'delimiter','\t')
    G = G_bter;
  end
end
