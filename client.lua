local currentJob = nil

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	currentJob = xPlayer.job.name
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	currentJob = job
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if veh ~= nil then
            if GetVehicleClass(veh) == 18 or GetVehicleClass(veh) == 15 then
				if PlayerData.job ~= nil and PlayerData.job.name ~= 'police' and PlayerData.job.name ~= 'ambulance' then
					if (GetPedInVehicleSeat(veh, -1) == ped) then
						TaskLeaveVehicle(ped,veh,0)
						if Config.KickPlayer then
							TriggerServerEvent('kickplayer')
						end
					end
				end        
            else
				Citizen.Wait(100)
			end
		end
	end
end)
