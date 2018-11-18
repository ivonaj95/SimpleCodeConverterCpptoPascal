
uses math;

Var
    a1, a2, aDesni, aPokrivac, b1, b2, bLevi, bPokrivac, duzina1, duzina2, duzinaPreseka, duzinaUnije : real;
begin
    { krajnje tacke intervala [a1, b1] i intervala [a2, b2] }
    read(a1, b1, a2, b2);

    {odredjujemo i ispisujemo pokrivac intervala }
    aPokrivac := min(a1, a2);    {prvi (levlji) pocetak }
    bPokrivac := max(b1, b2);    { drugi (desnji) kraj }
    writeln(aPokrivac, ' ', bPokrivac);

    {odredjujemo i ispisujemo presek intervala i njegovu duzinu }
    aDesni := max(a1, a2);    { drugi (desnji) pocetak }
    bLevi := min(b1, b2);    { prvi (levlji) kraj }

    if ( bLevi >= aDesni ) then 
    begin
        writeln(aDesni, ' ', bLevi);
        duzinaPreseka := bLevi - aDesni;
    end
    else
    begin
        writeln('Presek ne postoji');
        duzinaPreseka := 0.0;
    end;

    {odredjujemo i ispisujemo duzinu unije intervala }
    duzina1 := b1 - a1;
    duzina2 := b2 - a2;
    duzinaUnije := duzina1 + duzina2 - duzinaPreseka;
    writeln(duzinaUnije);


end.
