#include <iostream>
#include "birthday.h"

class Person {
    public:
        // constructor
        Person(std::string n, Birthday b);
        // destructor
        ~Person();
        // class method
        void printInfo();
        
    private:
        std::string name;
        Birthday bd;
};