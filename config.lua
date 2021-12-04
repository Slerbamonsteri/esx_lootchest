Config = {}

Config.itemName = "lootchest"

Config.second = 1000

Config.model = "ch_prop_ch_crate_full_01a"

Config.ChestOpeningTime = 12 * Config.second

Config.LootChestitems = {
    [1] = { 
        { itemName = 'bread', howmany = 1, type = 'item'},
		{ itemName = 'weapon_pistol', howmany = 1, ammo = 50, type = 'weapon'},
		{ howmany = 69, type = 'money'},
    },
    
    [2] = { 
        { itemName = 'water', howmany = 1, type = 'item'},
		{ itemName = 'weapon_pistol_mk2', howmany = 1, ammo = 50, type = 'weapon'},
		{ howmany = 1337, type = 'money'},
    },

    [3] = {
        { itemName = 'water', howmany = 1, type = 'item'},
		{ itemName = 'weapon_pistol50', howmany = 1, ammo = 50, type = 'weapon'},
		{ howmany = 420, type = 'money'},
    }
}
