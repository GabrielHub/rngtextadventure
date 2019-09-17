/// @description Weapons have key(index in array), name(string), strentgth(int 1 - 10), single-use(bool), inInventory(bool)

enum weapon {
	name,
	strength,
	singleUse,
	inInventory
}
globalvar globalWeapons;

//initialize new weapons following the template

//lobster shell
globalWeapons[0, weapon.name] = "Lobster Shell";
globalWeapons[0, weapon.strength] = 1;
globalWeapons[0, weapon.singleUse] = true;
globalWeapons[0, weapon.inInventory] = false;