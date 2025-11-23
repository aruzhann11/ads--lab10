Problem B: Path
In an undirected graph, you need to find the shortest path between two vertices.

Input format
In the first line given one number n, number of vertices (
). In 
 lines given, and 
 elements in each line ‘0’ or ‘1’ where 0 indicates the absence of an edge, 1 indicates the presence of an edge. In the next line two numbers are given: start and end of a path.

Output format
Print the length of the shortest path. If the path does not exist, print a single number 
.

Examples
Input
5
0 1 0 0 1
1 0 1 0 0
0 1 0 0 0
0 0 0 0 0
1 0 0 0 0
3 5
Output
3
Input
5
0 1 1 1 1
1 0 0 0 0
1 0 0 0 0
1 0 0 0 0
1 0 0 0 0
3 5
Output
2



#include <iostream>
#include <vector>
#include <queue>

using namespace std;

int bfs(vector<vector<int>>& a, int start, int end){
    int n = a.size();

    vector<int> visited(n, false);
    vector<int> distance(n, -1);

    queue<int> q;

    visited[start] = true;
    distance[start] = 0;
    q.push(start);

    while(!q.empty()){
        int currentVertex = q.front();
        q.pop();

        for(int neighbor = 0; neighbor < n; neighbor++){
            if(a[currentVertex][neighbor] == 1 && visited[neighbor] == false){
                visited[neighbor] = true;
                q.push(neighbor);
                distance[neighbor] = distance[currentVertex] + 1;                
            }
        }

        if(distance[end] != -1){
            return distance[end];
        }
    }

    return -1;
}

int main(){
    int n;
    cin >> n;

    vector<vector<int>> a; 

    for (int i = 0; i < n; i++) {
        vector<int> tempRow;
        for (int j = 0; j < n; j++) {
            int temp;
            cin >> temp;
            tempRow.push_back(temp);
        }
        a.push_back(tempRow);
    }

    int start, end;
    cin >> start >> end;

    cout << bfs(a, start - 1, end - 1);
}
