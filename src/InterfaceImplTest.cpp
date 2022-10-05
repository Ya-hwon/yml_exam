#include "InterfaceImpl.h"

#include <iostream>

using std::cout;
using std::endl;

int main(void) {
    InterfaceImpl dings;
    cout << "intMethodName(5): " << dings.intMethodName(5) << endl;
    cout << "booleanMethodName(false): " << (dings.booleanMethodName(false) ? "true" : "false") << endl;
    cout << "stringMethodName(string(\"tEst\")): " << dings.stringMethodName(string("tEst")) << endl;
    cout << "intArrayMethodName({1,1,2,3,5,8,13}): " << dings.intArrayMethodName({1,1,2,3,5,8,13}) << endl;
    return EXIT_SUCCESS;
}