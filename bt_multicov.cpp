//
// Created by ArtTemiy on 08.05.2020.
//

#include <iostream>
#include <fstream>
#include <vector>
using namespace std;

struct Row {
    string name;
    int start, end;
};

Row ReadRow(ifstream& file) {
    Row r;
    file >> r.name >> r.start >> r.end;
    return r;
}

ostream& operator<<(ostream& s, Row& r) {
    s << "(" << r.name << " " << r.start << " " << r.end << ")";
    return s;
}

int main() {
    const string rev_path_from_dir = "../";
    ifstream input(rev_path_from_dir + "E003-H3K27me3.tagAlign");
//    ifstream input;
//    input.open("../test.txt");
    if (!input.is_open()) {
        cout << "openen't file" << endl;
        return 1;
    }
    uint64_t ind = 1;
    Row r1, r2;
    r1 = ReadRow(input);
    while (!input.eof()) {
        r2 = ReadRow(input);
        if (r1.name == r2.name && r1.start >= r2.start) {
            cout << "---> " << ind << " " << r1 << " " << r2 << endl;
        }
        if (ind % 100000000 == 0) {
            cout << ind << endl;
        }
        ++ind;
    }
}