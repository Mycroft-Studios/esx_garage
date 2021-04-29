ESX = nil
local LastGarage, LastPart, LastParking, thisGarage = nil, nil, nil, nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

-- AddEventHandler('esx_g-arage:hasEnteredMarker', function(name, part, parking)
	
-- end)

-- AddEventHandler('esx_property:hasExitedMarker', function(name, part, parking)
-- end)

-- Create Blips
Citizen.CreateThread(function()
		
	for k,v in pairs(Config.Garages) do

		if v.IsClosed then

			local blip = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)

			SetBlipSprite (blip, 357)
			SetBlipDisplay(blip, 4)
			SetBlipScale  (blip, 1.2)
			SetBlipColour (blip, 3)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Garage")
			EndTextCommandSetBlipName(blip)

		end

	end

end)

-- -- Display markers
-- CreateThread(function()
-- end)

-- -- Enter / Exit marker events
-- Citizen.CreateThread(function()

-- end)
