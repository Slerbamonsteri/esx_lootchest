Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local model = Config.model
local ChestOpeningTime = Config.ChestOpeningTime

RegisterNetEvent('slerba_lootchest:open')
AddEventHandler('slerba_lootchest:open', function()
	ESX.UI.Menu.CloseAll()

	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)

	FreezeEntityPosition(ped, true)

	RequestModel(model)

	while not HasModelLoaded(model) do
		Citizen.Wait(0)
	end

	local lootchest = CreateObject(GetHashKey(model), coords.x, coords.y + 1, coords.z + 0.5, true, true, true)

	TaskSetBlockingOfNonTemporaryEvents(lootchest, true)
	PlaceObjectOnGroundProperly(lootchest)
	SetEntityInvincible(lootchest, true)
	MakeEntityFaceEntity(ped, lootchest)

    TaskStartScenarioInPlace(ped, "CODE_HUMAN_MEDIC_KNEEL", -1, "Enter")
	exports['progressBars']:startUI(ChestOpeningTime, "Opening lootchest...")
	Citizen.Wait(ChestOpeningTime / 2)
	if IsPedUsingScenario(ped, "CODE_HUMAN_MEDIC_KNEEL") then
	ClearPedTasksImmediately(ped)
	Wait(200)

	TaskStartScenarioInPlace(ped, "PROP_HUMAN_BUM_BIN", -1, "Enter")
	Citizen.Wait(ChestOpeningTime / 2)
	if IsPedUsingScenario(ped, "PROP_HUMAN_BUM_BIN") then
		ESX.ShowNotification("You successfully opened the lootchest!")
		ClearPedTasksImmediately()
		DeleteObject(lootchest)
		DeleteEntity(lootchest)
		FreezeEntityPosition(ped, false)
	else
		ESX.ShowNotification("Don't abuse!")
		end
	else
		ESX.ShowNotification("Don't abuse!")
	end
end)

function MakeEntityFaceEntity(entity1, entity2)
	local p1 = GetEntityCoords(entity1, true)
	local p2 = GetEntityCoords(entity2, true)

	local dx = p2.x - p1.x
	local dy = p2.y - p1.y

	local heading = GetHeadingFromVector_2d(dx, dy)
	SetEntityHeading( entity1, heading )
end