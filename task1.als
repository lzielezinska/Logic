abstract sig Stanowisko {
	pensja: Int
}{
	pensja >= 1 && pensja <= 3
}
one sig Kasjer, Menadzer, Straznik extends Stanowisko {}

abstract sig Osoba {
	stanowisko: Stanowisko
}
one sig Brown, Jones, Smith extends Osoba {}

fact {
	// Brown nie moze byÄ Straznikiem
	Brown.stanowisko != Straznik
	// Smith zarabia wiÄcej niz Menadzer
	Smith.stanowisko.pensja > Menadzer.pensja
	// StraĹźnik zarabia najmniej
	all s: Stanowisko | s != Straznik => s.pensja > Straznik.pensja
	// RoĹźne osoby piastujÄ rĂłĹźne Stanowisko
	//Osoba.stanowisko = Stanowisko
	all disj x,y: Osoba | x.stanowisko != y.stanowisko
}

run {} for 4
