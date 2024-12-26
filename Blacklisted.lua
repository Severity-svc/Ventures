local blacklisted = {
    "1",
}

function fetchlist(id)
    for i,v in pairs(blacklisted) do
        if v == id then
            return true
        end
    end
    return false
end

if fetchlist(game.Players.LocalPlayer.UserId) then
    game.Players.LocalPlayer:Kick("[Ventures] blacklisted, open a ticket at discord.gg/v3n")
end
