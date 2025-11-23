#include <iostream>
#include <vector>
#include <queue>

using namespace std;

void bfs(vector<vector<char>>& grid, vector<vector<bool>>& visited, int startI, int startJ){
    queue<pair<int, int>> q;
    q.push(make_pair(startI, startJ));
    visited[startI][startJ] = true;

    while(!q.empty()){
        int currentI = q.front().first;
        int currentJ = q.front().second;
        q.pop();
        vector<pair<int, int>> directions = {{0, 1}, {1, 0}, {0, -1}, {-1, 0}};

        for(auto direction : directions){
            int tempI = currentI + direction.first;
            int tempJ = currentJ + direction.second;

            if(tempI >= 0 && tempI < grid.size() && tempJ >= 0 && tempJ < grid[0].size() &&
                grid[tempI][tempJ] == '1' && !visited[tempI][tempJ]){
                    visited[tempI][tempJ] = true;
                    q.push(make_pair(tempI, tempJ));
            }
        }
    }
}

int countIslands(int n, int m, vector<vector<char>>& grid){
    vector<vector<bool>> visited(n, vector<bool>(m, false));
    int cnt = 0;

    for(int i = 0; i < n; i++){
        for(int j = 0; j < m; j++){
            if(grid[i][j] == '1' && visited[i][j] == false){
                cnt++;
                bfs(grid, visited, i, j);
            }
        }
    }

    return cnt;
}

int main(){
    int n, m;
    cin >> n >> m;

    vector<vector<char>> grid(n, vector<char>(m));

    for(int i = 0; i < n; i++){
        for(int j = 0; j < m; j++){
            cin >> grid[i][j];
        }
    }

    cout << countIslands(n, m, grid);
}
