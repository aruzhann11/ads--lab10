#include <iostream>
#include <vector>
#include <unordered_set>
#include <algorithm>

using namespace std;

bool detectCycle(int current, vector<vector<int>>& adjList, vector<bool>& visited, vector<int>& recursionStack){
    visited[current] = true;
    recursionStack[current] = 1;

    for(int neighbor : adjList[current]){
        if(!visited[neighbor]){
            if(detectCycle(neighbor, adjList, visited, recursionStack)){
                return true;
            }
        }
        else if(recursionStack[neighbor] == 1){
                return true;
        }
    }

    recursionStack[current] = 0;
    return false;
}


bool isThereCycle(int n, vector<vector<int>>& adjList){
    vector<bool> visited(n, false); 
    vector<int> recursionStack(n, 0);

    for(int i = 0; i < n; i++){
        if(!visited[i]){
            if(detectCycle(i ,adjList, visited, recursionStack)){
                return true;
            }
        }
    }
    return false;
}

bool RemoveEdgeAndCheck(int n, vector<vector<int>>& adjList, vector<pair<int, int>>& edges) {
    if(!isThereCycle(n, adjList)){
        return true;
    }

    for(int i = 0; i < edges.size(); i++){
        int x = edges[i].first;
        int y = edges[i].second;

        adjList[x].erase(remove(adjList[x].begin(), adjList[x].end(), y), adjList[x].end());
        if(!isThereCycle(n, adjList)){
            return true;
        }
        adjList[x].push_back(y);
    }
    return false;
}

int main(){
    int n, m;
    cin >> n >> m;

    vector<vector<int>> adjList(n);
    vector<pair<int, int>> edjes;

    for(int i = 0; i < m; i++){
        int x, y;
        cin >> x >> y;
        adjList[x-1].push_back(y-1);
        edjes.push_back({x-1, y-1});
    }

    if(RemoveEdgeAndCheck(n, adjList, edjes)){
        cout << "YES";
    }
    else{
        cout << "NO";
    }

}
