local function fetchGame(id)
    local supported = setmetatable({
        [1] = 16732694052,
        [2] = 17625359962,
    }, {
        __index = function()
            return nil
        end
    })

    for key, value in pairs(supported) do
        if value == id then
            return key
        end
    end
end

local key = fetchGame(game.PlaceId)
setclipboard("discord.gg/v3n")

if key then
 if key == 1 then
  loadstring(game:HttpGet('https://raw.githubusercontent.com/Severity-svc/Ventures/refs/heads/main/Profiles/16732694052%20.lua'))()
    elseif key == 2 then
    loadstring(game:HttpGet(--[[url]]))()-- rep privated, cant use loadstrings as tokens
  end
else
    warn("game not supported")
end

