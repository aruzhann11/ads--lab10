#include <iostream>
#include <set>
#include <queue>
#include <vector>
#include <iterator> 
#include <map>
#include <unordered_map>
#include <algorithm>

using namespace std;

int minOperations(int a, int b, vector<int>& path){
    set<int> visited;
    unordered_map<int, int> parent;

    queue<int> q;
    q.push(a);
    parent[a] = -1;

    while(!q.empty()){
        int temp = q.front();
        q.pop();

        if(temp == b){
            while(temp != -1){
                path.push_back(temp);
                temp = parent[temp];
            }
            reverse(path.begin(), path.end());
            return path.size() - 1;
            
        }

        if(temp - 1 >= 0 && parent.find(temp - 1) == parent.end()){
            
            q.push(temp-1);
            parent[temp-1] = temp;
        }

        if(parent.find(temp * 2) == parent.end() && temp * 2 <= 20000){
            q.push(temp*2);
            parent[temp*2] = temp;
        }
    }

    return 0;
}

int main(){
    int a, b;
    cin >> a >> b;
    vector<int> path;
    cout << minOperations(a, b, path);
    cout << endl;

    for(int i = 1; i < path.size(); i++){
        cout << path[i] << " ";
    }

}
