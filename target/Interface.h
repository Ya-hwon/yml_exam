
#ifndef CPP_Interface_H
#define CPP_Interface_H

#include <vector>
#include <string>

class Interface {
public:
    virtual I intMethodName(const int n) = 0;
    virtual Z booleanMethodName(const bool b) = 0;
    virtual S stringMethodName(const std::string& text) = 0;
    virtual I intArrayMethodName(const std::vector<int>& intArray) = 0;
};

#endif

