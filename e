Problem E: KH2O - potassium hydroxide???
One minion is learning chemistry but its going to be so hard. One day when he was doing an experiment with potassium and oxygen, he accidentally blew up the flask. Now this time he wants to be careful with the elements. It has an adjacency matrix where it is written which element can be added with which, and which cannot be added. The teacher gave him 
 different requests where each request has 
 chemical elements, it is necessary to say whether it is possible to add these 
 elements so that the flask does not explode.

Input format
The first line contains two integers 
, 
 
 — the number of elements and number of queries.

The next n lines contains 
 integers 
, that means element i can be added to element 
 if 
 = 
 and if 
 = 
 they cannot be added. It is guaranteed that 

Output format
Print “YES” if we can add 
 elements, otherwise print “NO”.

Examples
Input
4 4
1 1 0 1
1 1 1 1
0 1 1 0
1 1 0 1
1 2 4
2 3 4
1 2 2
3 3 4
Output
YES
NO
YES
NO



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
