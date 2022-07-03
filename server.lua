ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('kickplayer')
AddEventHandler('kickplayer', function(target)
    local src = source
    DropPlayer(target, 'You Have Been Kicked Server Because Thiefing Emergency Cars')
end)