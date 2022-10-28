#ifndef CPP_GeneratedInterface_H
#define CPP_GeneratedInterface_H

#include <vector>
#include <string>

using std::vector;
using std::string;

class GeneratedInterface {
public:
    virtual int intMethodName(const int n) = 0;
    virtual bool booleanMethodName(const bool b) = 0;
    virtual string stringMethodName(const string& text) = 0;
    virtual int intArrayMethodName(const vector<int>& intArray) = 0;
};

#endif
