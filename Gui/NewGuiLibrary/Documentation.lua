--[[
 // For people that want to use our lib
 // If you do please dm me first (sentrysvc on discord )
 // :uwuh:
]]

local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Severity-svc/Ventures/refs/heads/main/Gui/NewGuiLibrary/GuiLibrary.lua'))()

--//Notification
	Library:CreateNotification({
		Title = "Ventures - StartUp ",
		Content = "Welcome User",
		Duration = 4,
	})

--//Window ,Settings
local Window, SettingAssync = Library:CreateWindiw({ 
	TItle = "Title",

	Keysystem = {
		Enabled = true,--Set to false if you dont want to use the keysystem
		Key = "Key"
	}
})

local Combat = Window:CreateTab({
	Name = "Combat Tab",
	Icon = "swords",--// Icons are from lucide.dev 
})

local Utility = Window:CreateTab({
	Name = "Utility Tab",
	Icon = "swords",
})

--//Toggle
local Toggle1= Combat:CreateToggle({
	Name = "Toggle1",
	Description = "This toggle is used for something",--// Set to "" if you dont want descriptions
	Default = false,
	Callback = function(bool)
		print("value : ", bool)
	end,
})

--//Slider
local Slider1 = Combat:CreateSlider({
	Name = "WalkSpeed Changer",
	Description = "Changes Your Walkspeed",
	MaxValue = 100,
	MinValue = 1,
	Default = 16,
	Increment = 1,
	Callback = function(value)
		print(value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
	end,
})

--//Dropdown
local Dropdown = Combat:CreateDropdown({
	Name = "Dropdown",
	Description = "This Dropdown does something",
	Default = 1,--//dont use strings for the default value
	Values = {"One", "Two", "Three", "One", "Two", "Three"},
	Callback = function(value)
		print(value)
	end,
})

--//Color Picker
local ColorPicker = Combat:CreateColorPicker({
	Name = "ColorPicker",
	Description = "Changes The Color of something",
	Default = Color3.fromRGB(218, 40, 185),
	Callback = function(color) 
		print(tostring(color))
	end,
})
--//Section
local Section = Combat:CreateSection({
	Title = "Important Stuff, ( Trolling )"
})

local Slider1 = Combat:CreateSlider({
	Name = "WalkSpeed Changer",
	Description = "Changes Your Walkspeed",
	MaxValue = 100,
	MinValue = 1,
	Default = 16,
	Increment = 1,
	Callback = function(value)
		print(value)
		--game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
	end,
})

--// Input
local Input = Combat:CreateInput({
	Name = "Input Thing",
	Description = "Callbacks when you input stuff",
	Numeric = false, --//Only Accepts Numbers
	Placeholder = "Input you name",
	Default = "", --// if you want to use the place holder, then set it to "" 
	IgnoreBlank = false, --//Ignores if the text is "" (nothing)
	Finished = false, --//Only Callbacks on enter press
	Callback = function(value)
		print(value)
	end,
})

--//Keybind
local Keybind = Combat:CreateKeybind({
	Name = "Keybind",
	Description = "This Keybind Toggles Something",
	Default = Enum.KeyCode.K,
	Callback = function(newkeybind) --// The Argument In the table can be used to change keybinds ( var = newkeybind )
		print("Js")
	end,
})

--//Button
local Button = Combat:CreateButton({
	Name = "Button",
	Description = "This button does something",
	Callback = function()
		print("clicked")
	end,
})

--//In case you dont want button colors
Library:SetAutoButtonColor(false)

--//Activates the settings tab, for gui functionality and looks, and configs
SettingAssync:StartupSettings()
