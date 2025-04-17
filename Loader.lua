local Game = tostring(game.PlaceId)
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Severity-svc/Ventures/refs/heads/main/Gui/NewGuiLibrary/GuiLibrary.lua'))()

local Branch = "https://raw.githubusercontent.com/"
local HostName = "Severity-svc/"
local GlobalExtension = ".lua"
local Asserted = Branch .. HostName.. "/Ventures/".. "/refs/heads/main/".. "Profiles/".. Game .. GlobalExtension

local Success, Err = pcall(function()
	loadstring(game:HttpGet(Asserted))()
	if getgenv and getgenv().queue_on_teleport then
		getgenv().queue_on_teleport('loadstring(game:HttpGet("' .. Asserted .. '"))()')
	end
end)

if not Success then
	Library:CreateNotification({
		Title = "Ventures - Unsupported Game",
		Content = "This Game Is Not Supported",
		Duration = 4,
	})
end
