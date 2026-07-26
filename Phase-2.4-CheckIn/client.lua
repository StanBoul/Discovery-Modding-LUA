RegisterCommand('checkin', function()
    TriggerServerEvent('checkin')
end)

RegisterNetEvent('announce_checkin')
AddEventHandler('announce_checkin', function(message)  
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    DrawNotification(false, false)
end)

