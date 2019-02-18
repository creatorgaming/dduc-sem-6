#include <iostream>
using namespace std;

inline int gcd(int a, int b) {
    while (a) {
        b %= a;
        a ^= b;
        b ^= a;
        a ^= b;
    }
    return b;
}

int main() {
    ios_base :: sync_with_stdio(false);
    cin.tie(nullptr);
    cout.tie(nullptr);
    int tt;
    cin >> tt;
    while (tt--) {
        long n, k;
        int a, b;
        cin >> n >> a >> b >> k;
        if (gcd(a, b) > 1) {
            if (k == 1 && a != b) {
                cout << "Win\n";
            } else {
                cout << "Lose\n";
            }
            continue;
        }
        int solve = n / a + n / b;
        if (solve >= k) {
            if (a * b <= n) {
                solve -= 2;
            }
            if (solve >= k) {
                cout << "Win\n";
            } else {
                cout << "Lose\n";
            }
        } else {
            cout << "Lose\n";
        }
    }
    return 0;
}
