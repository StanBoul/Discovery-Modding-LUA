RegisterCommand('giveitem', function(source, args, rawCommand)
    local itemName = args[1]
    local quantity = tonumber(args[2])

if quantity ~= nil and quantity > 0 and quantity <= 10 and itemName ~= nil
 then
    TriggerServerEvent('giveitem', itemName, quantity)
 else 
    print("Invalid quantity or item name. Quantity must be between 1 and 10.")  
end
end)
RegisterNetEvent('ItemGiven')
    AddEventHandler('ItemGiven', function(message)
        SetNotificationTextEntry("STRING")
        AddTextComponentString(message)
        DrawNotification(false, false)
    end)