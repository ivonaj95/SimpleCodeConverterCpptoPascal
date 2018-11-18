#include <iostream>
#include <algorithm>

using namespace std;

int main() {
    // krajnje tacke intervala [a1, b1] i intervala [a2, b2]
    double a1, b1, a2, b2;
    cin >> a1 >> b1 >> a2 >> b2;
    
    //odredjujemo i ispisujemo pokrivac intervala
    double aPokrivac = min(a1, a2); //prvi (levlji) pocetak
    double bPokrivac = max(b1, b2); // drugi (desnji) kraj
    cout << aPokrivac << " " << bPokrivac << endl;
    
    //odredjujemo i ispisujemo presek intervala i njegovu duzinu
    double aDesni = max(a1, a2); // drugi (desnji) pocetak
    double bLevi = min(b1, b2); // prvi (levlji) kraj
    double duzinaPreseka;
    if (bLevi >= aDesni) {
        cout << aDesni << " " << bLevi << endl;
        duzinaPreseka = bLevi - aDesni;
    } else {
        cout << "Presek ne postoji" << endl;
        duzinaPreseka = 0.0;
    }
    
    //odredjujemo i ispisujemo duzinu unije intervala
    double duzina1 = b1 - a1, duzina2 = b2 - a2;
    double duzinaUnije = duzina1 + duzina2 - duzinaPreseka;
    cout << duzinaUnije << endl;
    
    return 0;
}
