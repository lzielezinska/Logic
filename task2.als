abstract sig Stanowisko {}
one sig Zaopatrzeniowiec, Kasjer, Ekspedient, Pietrowy, Menadzer, Straznik extends Stanowisko {}

abstract sig Plec {}
one sig kobieta, mezczyzna extends Plec {}

abstract sig Relacja {}
one sig para, sam extends Relacja {}

abstract sig Osoba {
	stanowisko: Stanowisko
	plec: Plec
	relacja: Relacja
}
one sig Anderson, Crowford, Smith, Evans, Davis.  extends Osoba {}

fact {
	Anderson.plec = kobieta
	Crowford.plec = kobieta
	Smith.plec = mezczyzna
	Evans.plec = mezczyzna
	Davis.plec = mezczyzna
	//Kasjer i Menadżer mieszkali w jednym pokoju w internacie, kiedy byli w szkole.
	all s: Stanowisko | s != Straznik => s.pensja > Straznik.pensja
	//Zaopatrzeniowiec jest „starym kawalerem”. 
	//Pana Davis i pannę Anderson łączą (i kiedykolwiek łączyły) jedynie stosunki służbowe. j
	//Pani Smith była bardzo rozczarowana kiedy mąż powiedział jej, że Menadżer nie wyraził zgody na podwyżkę dla niego.
	//Pan Evans będzie świadkiem na ślubie osób pracujących jako Kasjer i Ekspedient. Zakładamy tutaj „tradycyjny model rodziny”.  

	all o,p: Osoba | o == Kasjer =>
}

run {} for 4
