#ifndef CPP_INTERFACE_IMPL_H
#define CPP_INTERFACE_IMPL_H

#include "Interface.h"
#include <algorithm>

using std::for_each;

class InterfaceImpl: Interface {
public:
    int intMethodName(const int n) {
        return n * n;
    }
    bool booleanMethodName(const bool b) {
        return !b;
    }
    string stringMethodName(const string& text) {
        string out(text.size(), '\0');
        for_each(text.begin(), text.end(), [&](const char& c) {
            out.push_back(toupper((unsigned char)c));
        });
        return out;
    }
    int intArrayMethodName(const vector<int>& intArray) {
        int sum = 0;
        for (auto i : intArray) {
            sum += i;
        }
        return sum;
    }
};

#endif