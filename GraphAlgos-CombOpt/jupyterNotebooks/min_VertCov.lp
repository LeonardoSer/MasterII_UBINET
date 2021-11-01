\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  x[0] + x[1] + x[2] + x[3] + x[4] + x[5]
Subject To
 edge: x[0] + x[1] >= 1
 edge: x[0] + x[5] >= 1
 edge: x[1] + x[5] >= 1
 edge: x[1] + x[2] >= 1
 edge: x[2] + x[4] >= 1
 edge: x[3] + x[4] >= 1
 edge: x[4] + x[5] >= 1
Bounds
Binaries
 x[0] x[1] x[2] x[3] x[4] x[5]
End
