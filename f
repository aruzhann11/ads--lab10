Problem F: John's graph
Mom gave John an undirected graph for his birthday. After some time, he came up with a game with a graph. He takes two vertices and checks to see if they are in the same component.

Input format
The first line contains two integers n and m (2 
 n 
 100000, 0 
 m 
 99999), where n is the number of vertices and m is the number of edges. Following m lines contain one edge each in form x, y (1 
 x, y 
 n), where x, y are edge endpoints. The last line contains two integers s and f (1 
 s, f 
 n), vertices you have to check.

Output format
Print "YES", if s and f vertices are in the same component, otherwise print "NO".

Examples
Input
3 3
1 2
2 3
3 1

1 3
Output
YES
Input
4 2
1 2
2 3

1 4
Output
NO


#include <iostream>
#include <vector>
#include <queue>

using namespace std;

bool bfsAdjList(vector<vector<int>> a, int v1, int v2) {
    vector<bool> visited(a.size(), false);
    queue<int> q;

    visited[v1] = true;
    q.push(v1);

    while (!q.empty()) {
        int currentVertex = q.front();
        q.pop();

        if (currentVertex == v2) {
            return true;
        }

        for (int neighbor : a[currentVertex]) {
            if (!visited[neighbor]) {
                visited[neighbor] = true;
                q.push(neighbor);
            }
        }
    }

    return false;
}


int main() {
    int n, m;
    cin >> n >> m;

    vector<vector<int>> a(n);
    vector<int> visited(n, 0);

    for (int i = 0; i < m; i++) {
        int x, y;
        cin >> x >> y;

        a[x-1].push_back(y-1);
        a[y-1].push_back(x-1);
    }

    int s, f;
    cin >> s >> f;

    if (bfsAdjList(a, s - 1, f - 1)) {
        cout << "YES";
    } else {
        cout << "NO";
    }

    return 0;
}
