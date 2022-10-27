#ifndef CPP_INTERFACE_H
#define CPP_INTERFACE_H

#include <vector>
#include <string>

using std::string;
using std::vector;

class Interface {
public:
    virtual int intMethodName(const int n) = 0;
    virtual bool booleanMethodName(const bool b) = 0;
    virtual string stringMethodName(const string& text) = 0;
    virtual int intArrayMethodName(const vector<int>& intArray) = 0;
};

#endif