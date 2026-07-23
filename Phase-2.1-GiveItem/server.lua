RegisterNetEvent('giveitem')
AddEventHandler('giveitem', function(itemName, quantity)
    local player = source
    if itemName ~= nil and quantity ~= nil and quantity > 0 and quantity <= 10 
    then
    print("Player " .. player .. " wants to give " .. quantity .. " of item " .. itemName)
    TriggerClientEvent('ItemGiven', player, "You received " .. quantity .. " of item " .. itemName)
    print("Item " .. itemName .. " given to player " .. player .. " with quantity " .. quantity)

    else
        print("Invalid quantity or item name received from player " .. player .. ". Quantity must be between 1 and 10.")
        TriggerClientEvent('ItemGiven', player, "Invalid quantity or item name.")
end
    end)