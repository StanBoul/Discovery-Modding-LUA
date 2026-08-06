RegisterCommand('checkin', function()
    TriggerServerEvent('checkin')
end)

RegisterNetEvent('announce_checkin')
AddEventHandler('announce_checkin', function(message)  
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    DrawNotification(false, false)
end)

RegisterCommand('leaderboard', function()
    TriggerServerEvent('leaderboard')
end)

RegisterNetEvent('announce_leaderboard')
AddEventHandler('announce_leaderboard', function(message)
    print(message)
end)