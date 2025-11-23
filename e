#include <iostream>
#include <vector>

using namespace std;

int main(){
    int n, q;
    cin >> n >> q;

    vector<vector<int>> a;

    for(int i = 0; i < n; i++){
        vector<int> tempRow;
        for(int j = 0; j < n; j++){
            int temp;
            cin >> temp;
            tempRow.push_back(temp);
        }
        a.push_back(tempRow);
    }

    for(int i = 0; i < q; i++){
        int f, s, t;
        cin >> f >> s >> t;

        if(a[f-1][s-1] == 1 && a[f-1][t-1] == 1 && a[s-1][t-1] == 1){
            cout << "YES" << endl;
        }
        else{
            cout << "NO" << endl;
        }
    }
}
