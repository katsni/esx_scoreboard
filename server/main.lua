ESX = nil
local connectedPlayers = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("scoreboard:show")
AddEventHandler("scoreboard:show", function()
	local src = source
	local xPlayer  = ESX.GetPlayerFromId(src)

	local xPlayers = ESX.GetPlayers()
	lanssi = 0
	poliisi = 0
	meksu = 0
	jobless = 0
	pelaaja = 0
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'ambulance' then
				lanssi = lanssi + 1
		end		
		if xPlayer.job.name == 'police' then
			poliisi = poliisi + 1
		end
		if xPlayer.job.name == 'mechanic' then
			meksu = meksu + 1
		end
		if xPlayer.job.name == 'taxi' then
			jobless = jobless + 1
		end
		if xPlayer.getGroup() then
			pelaaja = pelaaja +1
		end
	end
	TriggerClientEvent("esx:showNotification", src, "Ensihoito: ~b~"..lanssi.."\n~s~Poliisi: ~b~"..poliisi.."\n~s~Mekaanikko: ~b~"..meksu.."\n~s~Taksi: ~b~"..jobless.."\n~s~Pelaajia: ~b~"..pelaaja)
end)