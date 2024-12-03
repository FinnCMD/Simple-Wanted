RegisterCommand("wanted", function(source, args, rawCommand)
    local wantedLevel = tonumber(args[1]) or 5

    if wantedLevel < 1 or wantedLevel > 5 then
        TriggerEvent("chat:addMessage", {
            args = {"^1Error", "Please enter a valid wanted level between 1 and 5."}
        })
        return
    end

    local playerPed = PlayerPedId()
    SetPlayerWantedLevel(PlayerId(), wantedLevel, false)
    SetPlayerWantedLevelNow(PlayerId(), false)

    TriggerEvent("chat:addMessage", {
        args = {"^2Success", "Your wanted level has been set to " .. wantedLevel .. " stars."}
    })
end, false)

RegisterCommand("unwanted", function(source, args, rawCommand)
    local playerPed = PlayerPedId()
    SetPlayerWantedLevel(PlayerId(), 0, false)
    SetPlayerWantedLevelNow(PlayerId(), false)

    TriggerEvent("chat:addMessage", {
        args = {"^2Success", "Your wanted level has been cleared."}
    })
end, false)
