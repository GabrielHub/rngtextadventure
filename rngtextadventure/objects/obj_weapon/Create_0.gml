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

//lobster shell
globalWeapons[0, weapon.name] = "Lobster Shell";
globalWeapons[0, weapon.strength] = 1;
globalWeapons[0, weapon.singleUse] = true;
globalWeapons[0, weapon.inInventory] = false;

//weaponized word of galifianakis
globalWeapons[2, weapon.name] = "Weaponized Galifianakis";
globalWeapons[2, weapon.strength] = 7;
globalWeapons[2, weapon.singleUse] = true;
globalWeapons[2, weapon.inInventory] = false;

//mysterious sword (rng)
globalWeapons[3, weapon.name] = "Mysterious Sword";
globalWeapons[3, weapon.strength] = irandom_range(1, 10);
globalWeapons[3, weapon.singleUse] = false;
globalWeapons[3, weapon.inInventory] = false;

//Sign taken from skeleton
globalWeapons[4, weapon.name] = "Stolen Sign";
globalWeapons[4, weapon.strength] = irandom_range(1, 7);
globalWeapons[4, weapon.singleUse] = false;
globalWeapons[4, weapon.inInventory] = false;

//key from tv monster
globalWeapons[5, weapon.name] = "Golden Key";
globalWeapons[5, weapon.strength] = irandom_range(1, 3);
globalWeapons[5, weapon.singleUse] = true;
globalWeapons[5, weapon.inInventory] = false;

//pen weapon
globalWeapons[6, weapon.name] = "Mighty Pen";
globalWeapons[6, weapon.strength] = irandom_range(2, 5);
globalWeapons[6, weapon.singleUse] = false;
globalWeapons[6, weapon.inInventory] = false;