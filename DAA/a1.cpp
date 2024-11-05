#include <bits/stdc++.h>
using namespace std;

// Iterative Fibonacci Function
// Time Complexity: O(n) - The loop runs n times to calculate the Fibonacci number.
// Space Complexity: O(1) - Only a few integer variables are used.
int fibonacci_iterative(int n) {
    if (n <= 1)
        return n;

    int prev = 0, curr = 1, next = 0;

    for (int i = 2; i <= n; ++i) {
        next = prev + curr;
        prev = curr;
        curr = next;
    }

    return curr;
}

// Recursive Fibonacci Function
// Time Complexity: O(2^n) - The function makes two recursive calls for each input, leading to exponential growth in calls.
// Space Complexity: O(n) - The maximum depth of the recursion stack is n.
int fibonacci_recursive(int n) {
    if (n <= 1)
        return n;

    return fibonacci_recursive(n - 1) + fibonacci_recursive(n - 2);
}
int main(){
    int n;
    cout << "Enter the number: ";
    cin >> n;

    // Calling both functions
    cout << "Fibonacci (Iterative) of " << n << " is: " << fibonacci_iterative(n) << endl;
    cout << "Fibonacci (Recursive) of " << n << " is: " << fibonacci_recursive(n) << endl;
    return 0;
}