Config = {}

Config.allowweapons = true --set True, if you want players to have a chance to get weapon from lootchest
Config.weaponchance = 33 --Percentage for getting weapon from lootchest

Config.LootChestitems = { --You can add as many brackets as you wish, just remember to index them correctly; [1], [2] and so on.
	[1] = {itemName = 'rolex', howmany = 1},
	[2] = {itemName = 'goldwatch', howmany = 1},
	[3] = {itemName = 'bulletproof', howmany = 10},
	[4] = {itemName = 'rifle', howmany = 1},
}

Config.LootChestWeapons = {
	[1] = {weaponName = 'weapon_pistol50', ammo = 30},
	[2] = {weaponName = 'weapon_pistol', ammo = 30},
	[3] = {weaponName = 'weapon_vintagepistol', ammo = 30},
}