Problem J: Who has a big Family?
Given a graph without cycles or self loops. In any connected component of the graph, vertex with the lowest value in that component serves as the root. A vertex is BigFam if it is a root or it has more children than its parent. Count the number of BigFam vertices in the given graph.

Input format
On the first line there are two separated integers 
 and 
 (
) and the following 
 lines consist of two separated integers 
 and 
 meaning that there is an edge between vertices X and Y.

Output format
Print the number of BigFam vertices.

Examples
Input
4 3
1 2
2 3
2 4
Output
2
 


#include <iostream>
#include <vector>
#include <map>
#include <queue>

using namespace std;

int bfs(vector<vector<int>>& adjList, int start, int n, vector<int>& visited){
    queue<int> q;
    q.push(start);
    vector<int> childred(n, 0);
    map<int, int> parents;

    for(int i = 0; i < n; i++){
        parents[i] = -1;
    }

    int cnt = 0;

    while(!q.empty()){
        int current = q.front();
        q.pop();
        visited[current] = true;
        for(int neighbor : adjList[current]){
            if(parents[neighbor] == -1){
                q.push(neighbor);
                parents[neighbor] = current;
                childred[current]++;
            }
        }

        if(parents[current] == -1 || childred[current] > childred[parents[current]]){
            cnt++;
        }
    }

    return cnt;
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

    int cnt = 0;
    vector<int> visited(n, false);
    for(int i = 0; i < n; i++){
        if(!visited[i]) cnt += bfs(adjList, i, n, visited);
    }

    cout << cnt << endl;
}
