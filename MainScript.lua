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

local key = fetchGame(game.PlaceId)

if key then
 if key == 1 then
  loadstring(game:HttpGet('https://raw.githubusercontent.com/Severity-svc/Ventures/refs/heads/main/Profiles/16732694052%20.lua?token=GHSAT0AAAAAAC4LMTZ7OF4T7EVTWIRG35HGZ3KYK7A'))()
  end
else
    warn("game not supported")
end

