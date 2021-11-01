\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  4 x[0,1] + x[0,2] + 2 x[1,2] + 3 x[1,3] + 2 x[2,4] + 2 x[3,2] + 2 x[3,5]
   + x[4,1] + 3 x[4,5]
Subject To
 s_out_edges: x[0,1] + x[0,2] = 1
 s_out_edges: x[3,5] + x[4,5] = 1
Bounds
Binaries
 x[0,1] x[0,2] x[1,2] x[1,3] x[2,4] x[3,2] x[3,5] x[4,1] x[4,5]
End
