local playerCooldown = {}
local PlayerScore = {}


RegisterNetEvent('checkin')
AddEventHandler('checkin', function()

local playerName = GetPlayerName(source)
local currentime = os.time()
local couldownTime = 30

if PlayerScore[source] == nil then
    PlayerScore[source] = 0
end

    if 
playerCooldown[source] == nil or (currentime - playerCooldown[source]) >= couldownTime

        then

        playerCooldown[source] = currentime
        PlayerScore[source] = PlayerScore[source] + 10
        local message1 = playerName .. " has checked in!" .. " Your score is now: " .. PlayerScore[source]
        TriggerClientEvent('announce_checkin', -1, message1)
    else
        local remainingTime = couldownTime - (currentime - playerCooldown[source])
        local message2 = "You must wait " .. remainingTime .. " seconds before checking in again."
        TriggerClientEvent('announce_checkin', source, message2)
    end
end)