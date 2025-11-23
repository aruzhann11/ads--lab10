Problem G: Fly Me to the Moon
Giving up halfway is worse than never trying at all

— Misato Katsuragi, Evangelion

I think you’ve all heard about Keqing and her love for solving puzzles. But it’s time for you to find out about her friend Ganyu, who also loves to solve various problems. Unlike Keqing, Ganyu likes graph problems more. This time she has a directed graph of 
 vertices and 
 edges. She is very interested to know if she can turn her primordial graph into an acyclic graph. Moreover, she set herself an additional condition — she can delete only one edge from the graph. Unfortunately, Ganyu has a lot to do at work, so she didn’t have time to solve this problem. Therefore, she asked you to help her. Try your best for this problem because she believes in you!

Input format
The first line contains 
 and 
 — the number of vertices and the number of edges. Then 
 lines follow. Each line contains two integers 
 and 
 denoting a directed edge going from vertex 
 to vertex 
. Each ordered pair 
) is listed at most once. However, loops for the vertex itself in the graph are possible. 
.

Output format
Print the answer. YES — if it is possible. NO — otherwise.

Examples
Input
5 6
1 3
2 1
3 5
4 3
5 4
3 2
Output
NO
Input
2 2
1 2
2 1
Output
YES
Input
2 2
1 1
1 2
Output
YES
Notes
Acyclic graph - each edge directed from one vertex to another, such that following those directions will never form a closed loop.

Good Luck & Have Fun!

 



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
