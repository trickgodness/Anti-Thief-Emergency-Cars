ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('kickplayer')
AddEventHandler('kickplayer', function()
    DropPlayer(source, 'You Have Been Kicked Server Because Thiefing Emergency Cars')
end)
