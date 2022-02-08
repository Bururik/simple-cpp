// in windows you can use #pragma once instead of what you see below
// but many ppl fight about this on stack overflow, so do whatever
#ifndef BIRTHDAY_H
#define BIRTHDAY_H

#include <iostream>

class Birthday {
    // Typically a class' constructor is named after the class itself
    // methods are often public methods to allow acess into their results
    public:
        // the constructor is defined here
        Birthday(int m, int d, int y);

        // destructor is defined here
        ~Birthday();

        // the first and only class method is defined here
        void printDate();
        
    // variables are often private to avoid any kind of data contamination 
    private:
        int month;
        int day;
        int year;
};

#endif