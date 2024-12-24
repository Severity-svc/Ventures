local function fetchGame(id)
    local supported = setmetatable({
        [1] = 16732694052,
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

local id = game.PlaceId
local urls = setmetatable({
    [1] = "https://raw.githubusercontent.com/Severity-svc/Ventures/refs/heads/main/Profiles/16732694052%20.lua?token=GHSAT0AAAAAAC4LMTZ7KT56KHDL5EV7BLOYZ3KXZ3A",
}, {
    __index = function()
        return nil
    end
})

local gameKey = fetchGame(id)

if gameKey then
    local url = urls[gameKey]
    if url then
	loadstring(game:HttpGet(tostring(url)))()
    end
end
