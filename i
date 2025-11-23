Problem I: Beta Tester
Arman works as a beta tester for a game development company. Today he is testing a game that has quests, and in order to win the game, the player needs to complete all the quests. However, some quests only become available after completing certain other quests. The developers give Arman a list of requirements, which indicates which quest must be completed in order to open the next one. Help Arman determine whether is it possible to complete this game, and if possible, output one of the scenarios for the passage.

Input format
The first line of input contains a pair of numbers n and m (
), the number of quests and requirements, respectively. The next m lines contains a pair of integers i and j (
), which means that in order to make quest j available, you must complete quest i.

Output format
Determine whether it is possible to complete the game, and output ‘Impossible’ if not, otherwise output ‘Possible’ and the scenario of the passage. If there are several of them, output any.

Examples
Input
5 5
1 2
2 3
1 3
4 5
3 4
Output
Possible
1 2 3 4 5 
Input
6 6
4 2
4 3
2 3
1 5
6 2
6 4
Output
Possible
1 5 6 4 2 3 
Input
8 17
8 1
2 3
7 3
5 4
1 7
4 8
1 7
3 6
2 5
7 2
8 7
5 4
5 8
2 8
2 5
2 7
4 8
Output
Impossible
Input
6 7
4 2
4 3
2 3
1 5
6 2
5 1
6 4
Output
Impossible
 


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
