#include <bits/stdc++.h>
using namespace std;

int solve(vector<int> &weight, vector<int> &value, int index, int capacity, vector<vector<int>> &dp){
    if(index == 0){
        if(weight[index] <= capacity){
            return value[index];
        }
        else{
            return 0;
        }
    }

    if(dp[index][capacity] != -1){
        return dp[index][capacity];
    }

    int include = 0, exclude = 0;
    if(weight[index] <= capacity){
        include = value[index] + solve(weight, value, index-1, capacity-weight[index], dp);
    }
    exclude = solve(weight, value, index-1, capacity, dp);

    return dp[index][capacity] = max(include, exclude);
}

// int knapsack(int n,vector<int>&val,vector<int>&wt,int W){
// iterative approach
// can be space optimized
//     vector<vector<int>>dp(n,vector<int>(W+1,0));
//     for(int j=wt[0];j<=W;j++)dp[0][j]=val[0];
//     for(int i=1;i<n;i++){
//         for(int j=0;j<=W;j++){
//             int notTake=dp[i-1][j];
//             int take=0;
//             if(wt[i]<=j){
//                 take=val[i]+dp[i-1][j-wt[i]];
//             }
//             dp[i][j]=max(take,notTake);
//         }
//     }
//     return dp[n-1][W];
// }

int main(){
//      The time complexity is O(n*C)
// n is the number of items and 
// C is the capacity of the knapsack. 
// This complexity arises because we have to fill the dp table with n rows (for each item) and C columns (for each possible capacity).
    vector<int>weight = {3, 4, 6, 5};
    vector<int>value = {2, 3, 1, 4};
    int capacity = 8;
    vector<vector<int>> dp(weight.size(), vector<int>(capacity+1, -1));
    cout << "Maximum value: " << solve(weight, value, weight.size()-1, capacity, dp) << endl;
}

