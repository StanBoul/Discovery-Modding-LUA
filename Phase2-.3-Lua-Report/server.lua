local playerCooldown = {}

RegisterNetEvent('announce_report')
AddEventHandler('announce_report', function(content)
    local playername = GetPlayerName(source)
    local currentime = os.time()
    local prefix = "[Report: " .. playername .. "]"
    local reportMessage = prefix .. " " .. content

if content == "" then
    TriggerClientEvent('announce_report', source, "Report message is empty.")
else        

if playerCooldown[source] == nil then
    playerCooldown[source] = currentime
    TriggerClientEvent('announce_report', -1, reportMessage)

else 
    local timeSinceLastClaim = currentime - playerCooldown[source]

    if timeSinceLastClaim >= 10 then
        playerCooldown[source] = currentime
        TriggerClientEvent('announce_report', -1, reportMessage)
    else
        local timeLeft = 10 - timeSinceLastClaim
        TriggerClientEvent('announce_report', source, "You must wait " .. timeLeft .. " seconds before sending another report.")
     end
        end
            end
end)