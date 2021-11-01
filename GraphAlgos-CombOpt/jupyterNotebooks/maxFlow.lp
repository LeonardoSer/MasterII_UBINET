\ LP format - for model browsing. Use MPS format to capture full model detail.
Maximize
  x[0,1] + x[0,2]
Subject To
 Balance: - x[0,1] + x[1,2] + x[1,3] - x[4,1] = 0
 Balance: - x[0,2] - x[1,2] + x[2,4] - x[3,2] = 0
 Balance: - x[1,3] + x[3,2] + x[3,5] - x[4,3] = 0
 Balance: - x[2,4] + x[4,1] + x[4,3] + x[4,5] = 0
 Capacity[0,1]: x[0,1] <= 4
 Capacity[0,2]: x[0,2] <= 1
 Capacity[1,2]: x[1,2] <= 2
 Capacity[1,3]: x[1,3] <= 3
 Capacity[2,4]: x[2,4] <= 2
 Capacity[3,2]: x[3,2] <= 2
 Capacity[3,5]: x[3,5] <= 2
 Capacity[4,1]: x[4,1] <= 1
 Capacity[4,3]: x[4,3] <= 1
 Capacity[4,5]: x[4,5] <= 3
Bounds
End
