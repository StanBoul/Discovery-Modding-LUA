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

RegisterNetEvent('leaderboard')
AddEventHandler('leaderboard', function()

    local message = "Leaderboard: "

    for key, value in pairs(PlayerScore) do 
    
    local name = GetPlayerName(key)
     message = message .. name .. " has " .. value .. " points"
    end
     TriggerClientEvent('announce_leaderboard', source, message)  
end)

RegisterCommand('checkindb', function(source, args, rawCommand)
    MySQL.query('SELECT * FROM test_scores WHERE identifier = ?', { tostring(source) }, function(result)
        if result[1] then
            local score = result[1].score
            local newscore = score + 10
            MySQL.update('UPDATE test_scores SET score = ? WHERE identifier = ?', {newscore, tostring(source)})
            TriggerClientEvent('announce_checkin', source, "Your score from the database is: " .. newscore)
        else
            MySQL.insert('INSERT INTO test_scores (identifier, score) VALUES (?, ?)', { tostring(source), 10 }, function(insertId)
                TriggerClientEvent('announce_checkin', source, "Your score from the database is: 10")
            end)
        end
    end)
end)


