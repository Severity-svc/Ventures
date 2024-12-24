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

local key = fetchGame(game.PlaceID)
print(tostring(key))
