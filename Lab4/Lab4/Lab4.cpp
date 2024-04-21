#include <iostream>

using namespace std;

extern "C" float getak(float x, int n);

int main(int argc, char** argv) {
	float x, n;
	float f;

	cout << "Input x: 5 ";
	x = 5;

	cout << "Input n: 17 ";
	n = 17;

	f = getak(x, n);


	cout << "Result: " << f << endl;

	return 0;
}
