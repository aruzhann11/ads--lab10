Problem D: Try Again
You are given undirected graph with 
 vertices, 
 edges, and 
 queries. Initially all vertices are black. There are two types of queries.

1.  
 - Change the color of vertex 
 to red.

2.  
 - Output the distance to the nearest red vertex to 
, or -1 is there is no such vertex.

Input format
First line contains three integers 
. Next 
 lines contain information about edges. Next 
 lines contain queries as described in the statement.

Output format
Output answer to queries of type 
.

Examples
Input
5 4 7
1 2
2 3
3 4
4 5
2 1
1 1
2 1
2 2
2 5
1 3
2 5
Output
-1
0
1
4
2


#include <iostream>
#include <vector>
#include <queue>


using namespace std;


void bfsFindDistOfRed(vector<vector<int> >& data, int vertex, vector<int>& distance){
    queue<int> q;
    q.push(vertex);
    while(!q.empty()){
        int curr = q.front();
        q.pop();
        vector<int> neighbours = data[curr];
        for(int i = 0; i < neighbours.size(); i++){
            int neighbour = neighbours[i];
            if(distance[neighbour] != 0 && distance[curr] + 1 < distance[neighbour]){
                distance[neighbour] = distance[curr] + 1;
                q.push(neighbour);
            }
        }
    }
}


int main(){
    int n,m,q;
    cin >> n >> m >> q;

    vector<vector<int> > data(n, vector<int>());
    vector<int> distance(n, 1e9);
    for(int i = 0; i < m; i++){
        int first, second;
        cin >> first >> second;
        if(first == second) continue;
        data[first - 1].push_back(second - 1);
        data[second - 1].push_back(first - 1);
    }



    for(int i = 0; i < q; i++){
        int type, vertex;
        cin >> type >> vertex;
        if(type == 1){
            distance[vertex - 1] = 0;
            bfsFindDistOfRed(data, vertex - 1, distance);
        }else{
            if(distance[vertex - 1] == 1e9) cout << -1 << endl;
            else{
                cout << distance[vertex - 1] << endl;
            };
        }

    }
}
