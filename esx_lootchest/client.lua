Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	ESX.Game.MakeEntityFaceEntity = function(entity1, entity2)
		local p1 = GetEntityCoords(entity1, true)
		local p2 = GetEntityCoords(entity2, true)
	
		local dx = p2.x - p1.x
		local dy = p2.y - p1.y
	
		local heading = GetHeadingFromVector_2d(dx, dy)
		SetEntityHeading( entity1, heading )
	end
end)


RegisterNetEvent('slerba_lootchest:open')
AddEventHandler('slerba_lootchest:open', function()
	local coords = GetEntityCoords(PlayerPedId())
	ESX.UI.Menu.CloseAll()
	FreezeEntityPosition(PlayerPedId(), true)
	RequestModel("ch_prop_ch_crate_full_01a")
	local lootchest = CreateObject(GetHashKey("ch_prop_ch_crate_full_01a"), coords.x, coords.y + 1, coords.z + 0.5, true, true, true)
	TaskSetBlockingOfNonTemporaryEvents(lootchest, true)
	PlaceObjectOnGroundProperly(lootchest)
	SetEntityInvincible(lootchest, true)
	ESX.Game.MakeEntityFaceEntity(PlayerPedId(), lootchest)
    ExecuteCommand('e kneel') ----Uses DP-Emotes, you can replace it with some other animation if you want/need to
	exports['progressBars']:startUI(12000, "Opening lootchest...")
	Citizen.Wait(4000)
	ExecuteCommand('e mechanic') --Uses DP-Emotes, you can replace it with some other animation if you want/need to
	Citizen.Wait(9000)
	TriggerEvent('mythic_notify:client:SendAlert', { type = 'success', length = 7000, text = 'You successfully opened the lootchest and found something!' })
	ClearPedTasks(PlayerPedId())
	DeleteObject(lootchest)
	DeleteEntity(lootchest)
	FreezeEntityPosition(PlayerPedId(), false)
end)