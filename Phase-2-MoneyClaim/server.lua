local playerCooldowns = {}

RegisterNetEvent('claimMoney')
AddEventHandler('claimMoney', function()
    local player = source
    local currentTime = os.time()

    if playerCooldowns[player] == nil then
        playerCooldowns[player] = currentTime
        TriggerClientEvent('claimResult', player, "You received $100!")
        
    else
        local timeSinceLastClaim = currentTime - playerCooldowns[player]

        if timeSinceLastClaim >= 10 then
            playerCooldowns[player] = currentTime
            TriggerClientEvent('claimResult', player, "You received $100!")
        else
            local timeLeft = 10 - timeSinceLastClaim
            TriggerClientEvent('claimResult', player, "Wait " .. timeLeft .. " more seconds!")
        end
    end
end)