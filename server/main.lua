ESX = nil
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
	SendInfo(src, lanssi, poliisi, meksu, jobless, pelaaja)
end)


function SendInfo(src, ems, cops, mechs, taxi, players)
	if cops > 0 and cops < 5 then
		cops = "+1"
	elseif cops > 5 and cops < 8 then
		cops = "+5"
	elseif cops > 8 then
		cops = "+8"
	end
	TriggerClientEvent("esx:showNotification", src, "Ensihoito: ~b~"..ems.."\n~s~Poliisi: ~b~"..cops.."\n~s~Mekaanikko: ~b~"..mechs.."\n~s~Taksi: ~b~"..taxi.."\n~s~Pelaajia: ~b~"..players)
end
