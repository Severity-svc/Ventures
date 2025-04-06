```
--[[
 // For people that want to use our lib
 // If you do please dm me first (sentrysvc on discord )
 // 💔
]]
```

**Library Bootup**

```lua
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Severity-svc/Ventures/refs/heads/main/Gui/NewGuiLibrary/GuiLibrary.lua'))()
```
**Notification**
```lua
	Library:CreateNotification({
		Title = "Library - StartUp ",
		Content = "Welcome User",
		Duration = 4,
	})

```

**Window, Settings**
```lua
--// Window
local Window, SettingAssync = Library:CreateWindow({ 
	Title = "Title",

	Keysystem = {
		Enabled = true,--Set to false if you dont want to use the keysystem
	}
})
```

**Tabs**

```lua
--// Tab
local Combat = Window:CreateTab({
	Name = "Combat Tab",
	Icon = "swords",--// Icons are from lucide.dev 
})

local Utility = Window:CreateTab({
	Name = "Utility Tab",
	Icon = "swords",
})
```

**Toggles**

```lua
--// Toggle
local Toggle = Combat:CreateToggle({
	Name = "Toggle1",
	Description = "This toggle is used for something",--// Set to "" if you dont want descriptions
	Default = false,
	Callback = function(bool)
		print("value : ", bool)
	end,
})
```

**Sliders**

```lua
--// Slider
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
```

**Dropdowns**

```lua
--// Dropdown
local Dropdown = Combat:CreateDropdown({
	Name = "Dropdown",
	Description = "This Dropdown does something",
	Default = 1,--//dont use strings for the default value
	Values = {"One", "Two", "Three", "One", "Two", "Three"},
	Callback = function(value)
		print(value)
	end,
})
```

**Color Pickers**

```lua
--// Color Picker
local ColorPicker = Combat:CreateColorPicker({
	Name = "ColorPicker",
	Description = "Changes The Color of something",
	Default = Color3.fromRGB(218, 40, 185),
	Callback = function(color) 
		print(tostring(color))
	end,
})
```

**Sections**

```lua
--// Section
local Section = Combat:CreateSection({
	Title = "Important Stuff,"
})

local Section = Combat:CreateSection({Title = "Important Stuff"})
```

**Inputs**

```lua
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
```

**Keybinds**

```lua
--// Keybind
local Keybind = Combat:CreateKeybind({
	Name = "Keybind",
	Description = "This Keybind Toggles Something",
	Default = Enum.KeyCode.K,
	Callback = function(newkeybind) 
		print("Js")
	end,
})

local key = Enum.KeyCode.P
local Keybind = Combat:CreateKeybind({
	Name = "Keybind",
	Description = "This Keybind Toggles Something",
	Default = Enum.KeyCode.K,
	ChangedCallback = function(NewKey) 
		key = NewKey -- Changes the keybind on new keybind
	end,
})
```

**Buttons**

```lua
--// Button
local Button = Combat:CreateButton({
	Name = "Button",
	Description = "This button does something",
	Callback = function()
		print("clicked")
	end,
})
```

**Misc**

```lua
--// In case you dont want AutoButtonColor
Library:SetAutoButtonColor(false)
```

```lua
--// Activates the settings tab, for gui functionality, looks, and configs ( coming soon )
SettingAssync:StartupSettings()
```

**Usefull Actions**

```lua
Button:Click() --// Simulates the button click
```

--//Dropdown

```lua
Dropdown:AddValue("String") --// Adds a string value to the values table
Dropdown:AddValue(table) --// Changes the values table with a new one

Dropdown:SetValue("String") --// Changes the value to an existing value in the table that matches the name
Dropdown:SetValue(1) --// Changes the value to the first value in the table
```

**Inputs**

```lua
Input:SetValue("String") --// Changes the current input to the new one
```

**Keybinds**

```lua
Keybind:SetKeybind(Enum.KeyCode.P) --// Changes the keybind to the new one
```

**Toggle**

```lua
Toggle:SetValue(true) --// Changes the toggle state to the new one
```

**Sliders**

```lua
Slider:SetValue(20) --// Changes the slider value to the new one
```

**ColorPicker**
```lua
ColorPicker:SetColor(Color3.fromRGB(255,255,255) --// Changes the current colorpicker color to the new one
```

