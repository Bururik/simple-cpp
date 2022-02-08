/*
    NOTE: type this into your terminal if on linux to get an executable

    $ g++ -O3 -Wall main.cpp birthday.cpp person.cpp -std=c++17 -o main.out

*/

// #include <iostream>
#include "birthday.h"
#include "person.h"

int main() {
    // initialized object Birthday as bd
    Birthday bd(2, 21, 1985);

    // initialized object Person and 
    // used object birthday (bd) as input data
    Person p("David", bd);

    // ran the method defined in object person to get a console output
    p.printInfo();
}

