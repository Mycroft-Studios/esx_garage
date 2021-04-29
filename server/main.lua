ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- RegisterServerEvent('esx_garage:setParking')
-- AddEventHandler('esx_garage:setParking', function(garage, zone, vehicleProps)
-- end)

ESX.RegisterServerCallback('esx_vehicleshop:getVehiclesInGarage', function(source, cb, garage)
	local xPlayer  = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM `user_parkings` WHERE `identifier` = @identifier AND garage = @garage',
	{
		['@identifier'] = xPlayer.identifier,
		['@garage']     = garage
	}, function(result)

		local vehicles = {}
		for i=1, #result, 1 do
			table.insert(vehicles, {
				vehicle = json.decode(result[i].vehicle)
			})
		end

		cb(vehicles)

	end)
end)


function SpawnVehicle(hash, coords)
	CreateVehicle(hash, coords.x, coords.y, coords.z, 0.0, true true)
end

