local lib = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local function fetchGame(id)
    local supported = setmetatable({
        [1] = 16732694052,
        [2] = 17625359962,
    }, {
        __index = function()
            return nil
        end
    })

    for k, v in ipairs(supported) do
        if v == id then
            return k
        end
    end
end

local key = fetchGame(game.PlaceId)
setclipboard("discord.gg/v3n")

if key then
 if key == 1 then
  loadstring(game:HttpGet('https://raw.githubusercontent.com/Severity-svc/Ventures/refs/heads/main/Profiles/16732694052%20.lua'))()
    elseif key == 2 then
    loadstring(game:HttpGet("https://github.com/Severity-svc/Ventures/blob/main/Profiles/17625359962.lua"))()
  end
else
    lib:Notify({
        Title = "Ventures",
		Content = "Game Not Supported!",
		SubContent = "",
		Duration = 3 
	})
end

