ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

local veh = GetClosestVehicle(pos.x,pos.y,pos.z,100.00,0)
 
local checkbomb = HasVehicleGotProjectileAttached(GetPlayerPed(-1),veh,get_hash_key("weapon_stickybomb") ,-1)
	
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
			if IsEntityAVehicle(veh) then
				if checkbomb then
					if IsControlJustReleased(0, 38) then
						RemoveAllStickyBombsFromEntity(veh)
						
					end
				end
			end
	end
end)
