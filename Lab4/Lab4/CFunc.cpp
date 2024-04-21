#include <iostream>
#include <math.h>

using namespace std;

extern "C" float cfunc(float x, int k) {
	float ak;
	float mone = -1;
	float kk = k;
	cout << x << '\t' << k << endl;
	ak = pow(x, (mone / kk)) / (sin(x));
	return ak;
}
