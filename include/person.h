#include <iostream>
#include "birthday.h"

class Person {
    public:
        Person(std::string n, Birthday b);
        void printInfo();
        
    private:
        std::string name;
        Birthday bd;
};