/// @description Weapons have key(index in array), name(string), strentgth(int 1 - 10), single-use(bool), inInventory(bool)

enum weapon {
	name,
	strength,
	singleUse,
	inInventory
}
globalvar globalWeapons;

//initialize new weapons following the template

//fists DEFAULT WEAPON THAT YOU WILL ALWAYS HAVE
globalWeapons[1, weapon.name] = "Bare Fists";
globalWeapons[1, weapon.strength] = 0; //the only weapon that has 0 power
globalWeapons[1, weapon.singleUse] = false;
globalWeapons[1, weapon.inInventory] = false;
AddWeapon(1);

//lobster shell
globalWeapons[0, weapon.name] = "Lobster Shell";
globalWeapons[0, weapon.strength] = 1;
globalWeapons[0, weapon.singleUse] = true;
globalWeapons[0, weapon.inInventory] = false;