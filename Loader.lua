local Game = tostring(game.PlaceId)
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Severity-svc/Ventures/refs/heads/main/Gui/NewGuiLibrary/GuiLibrary.lua'))()

local Branch = "https://raw.githubusercontent.com/"
local HostName = "Severity-svc/"
local GlobalExtension = ".lua"
local Asserted = Branch .. HostName .. "Ventures/refs/heads/main/Profiles/" .. Game .. GlobalExtension

local Ventures = "Ventures"
local GuiLibrary = Ventures .. "/GuiLibrary"
local Config = Ventures .. "/Config"

local IsFile = function(Name)
	local isfile = getgenv().isfile
	if not isfile then
		if Library then
			Library:CreateNotification({
				Title = "Ventures - Unsupported Executor",
				Content = "Your Executor Doesn't Support Ventures",
				Duration = 4,
			})
		end
		return false
	end

	local Success, Result = pcall(function()
		return isfile(Name)
	end)
	return Success and Result
end

if not isfolder(Ventures) then
	makefolder(Ventures)
end

if not isfolder(GuiLibrary) then
	makefolder(GuiLibrary)
end

if not isfolder(Config) then
	makefolder(Config)
end

local Success, Err = pcall(function()
	loadstring(game:HttpGet(Asserted))()
	if getgenv and getgenv().queue_on_teleport then
		getgenv().queue_on_teleport('loadstring(game:HttpGet("' .. Asserted .. '"))()')
	end
end)

if not Success and Library then
	Library:CreateNotification({
		Title = "Ventures - Unsupported Game",
		Content = "This Game Is Not Supported",
		Duration = 4,
	})
end
