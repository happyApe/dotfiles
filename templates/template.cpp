#include <bits/stdc++.h>
 
using namespace std;
 
typedef long long ll;
typedef long double ld;

int solve(vector<int>&nums) {
 
 
}
 
int32_t main() {
 
    int T = 1;
    cin >> T;
    while(T--) {
        vector<int>nums;
        int n;
        cin >>n;
        int x;
        for(int i = 0;i<n;i++){
            cin>>x;
            nums.push_back(x);
        }
        cout<<solve(nums)<<endl;

    }
 
	return 0;
}
 
 
