ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem("lootchest", function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.removeInventoryItem('lootchest', 1)
    TriggerClientEvent('slerba_lootchest:open', _source)
    Citizen.Wait(13400)

    local RandomBracket = math.random(1, #Config.LootChestitems)

    for k,v in pairs(Config.LootChestitems[RandomBracket]) do 
        if v.type == 'item' then
            xPlayer.addInventoryItem(v.itemName, v.howmany)
        elseif v.type == 'weapon' then
            for i=1, v.howmany, 1 do
                xPlayer.addWeapon(v.itemName, v.ammo)
            end
		elseif v.type == 'money' then
            xPlayer.addMoney(v.howmany)
        end
    end
end)
