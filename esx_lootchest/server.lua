ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem("lootchest", function(source, itemName, howmany, weaponName, ammo)
	local xPlayer = ESX.GetPlayerFromId(source)
	local item = Config.LootChestitems[math.random(1, #Config.LootChestitems)]
	local wep = Config.LootChestWeapons[math.random(1, #Config.LootChestWeapons)]
	local chance = math.random(1, 100)
	if Config.allowweapons then
		if chance > Config.weaponchance then
			xPlayer.removeInventoryItem('lootchest', 1)
			TriggerClientEvent('slerba_lootchest:open', source)
			Citizen.Wait(13400)
			xPlayer.addInventoryItem(item.itemName, item.howmany)
		else
			xPlayer.removeInventoryItem('lootchest', 1)
			TriggerClientEvent('slerba_lootchest:open', source)
			Citizen.Wait(13400)
			xPlayer.addWeapon(wep.weaponName, wep.ammo)
		end
	else
		xPlayer.removeInventoryItem('lootchest', 1)
		TriggerClientEvent('slerba_lootchest:open', source)
		Citizen.Wait(13400)
		xPlayer.addInventoryItem(item.itemName, item.howmany)
	end
end)
