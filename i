#include <iostream>
#include <vector>
#include <stack>

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

void dfs(int at, vector<bool>& visited, vector<int>& visitedNodes, vector<vector<int>>& adjList){
    visited[at] = true;

    vector<int> edges = adjList[at];
    for(auto edge: edges){
        if(visited[edge] == false){
            dfs(edge, visited, visitedNodes, adjList);
        }
    }

    visitedNodes.push_back(at);
}

void topSort(vector<vector<int>>& adjList){
    int n = adjList.size();
    vector<bool> visited(n, false);

    vector<int> ordering(n, 0);

    int i = n - 1;

    for(int at = 0; at < n; at++){
        if(!visited[at]){
            vector<int> visitedNodes;
            dfs(at, visited, visitedNodes, adjList);
            for(auto node : visitedNodes){
                ordering[i] = node;
                i = i - 1;
            }
        }
    }

    for(auto i : ordering){
        cout << i + 1 << " ";
    }
}

int main(){
    int n, m;
    cin >> n >> m;

    vector<vector<int>> adjList(n);

    for(int i = 0; i < m; i++){
        int x, y;
        cin >> x >> y;

        adjList[x-1].push_back(y-1);
    }

    if(isThereCycle(n, adjList)){
        cout << "Impossible";
        return 0;
    }

    cout << "Possible" << endl;
    topSort(adjList);
}
