RegisterCommand('Report', function(source, args, rawCommand)
    local content = table.concat(args, ' ')

    if  content == ""
    then print ("Report message is empty")
    else TriggerServerEvent('announce_report', content)
    end
end)

RegisterNetEvent('announce_report')
AddEventHandler('announce_report', function(message)  
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    DrawNotification(false, false)
end)

