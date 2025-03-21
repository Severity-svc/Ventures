--[[
  //Ventures NewLibrary
  //Fully coded by sentrysvc on discord, Coded in pascal case, hope you're happy laera bbg
  //Inspired by Fluent :weary:
]]

--//StartUp
local Library = {}
local Lucide 
local FontType = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
local Ventures = Instance.new("ScreenGui")

local Core
local Rank = "Member"
local RankColor
local WhitelistedName
local Whitelisted 
local IsInColorFrameDrag = false
local IsExecutionEnv = false

--//Config Vars
local GlobalValues = {
	GlobalSliderSpeed = 0.2,
	GlobalToggleSpeed = 0.3,
	GlobalDebounce = false,
	GlobalMainGuiColor = {17,17,17},
	GlobalDescriptionColor = {94, 94, 94},
	GlobalGuiDragSpeed = 0.5,
	GlobalMinimizeKeybind = "RightControl"
}

local FolderName = "Ventures"
local GuiName = FolderName .. "/GuiLibrary"
local SettingsPath = GuiName .. "/Settings.lua"
local ConfigP = FolderName .. "/Config"
local Toggles = ConfigP .. "/Toggles.lua"
local Sliders = ConfigP .. "/Sliders.lua"
local Colors = ConfigP .. "/Colors.lua"
local Keybinds = ConfigP .. "/Keybinds.lua"
local Inputs = ConfigP .. "/Inputs.lua"
local DropdownsP = ConfigP .. "/Dropdowns.lua"

--//Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer

--//Whitelisting, Parenting
if RunService:IsStudio() then
	Core = LocalPlayer:WaitForChild("PlayerGui")
	Lucide = require(script.Parent:WaitForChild("Lucide"))
else
	Lucide =  loadstring(game:HttpGet('https://raw.githubusercontent.com/Severity-svc/Ventures/refs/heads/main/Gui/NewGuiLibrary/Lucide%20Icons.lua'))()
	Core = game:GetService("CoreGui")
	local Analystics = game:GetService("RbxAnalyticsService")

	if not isfolder(FolderName) then
		makefolder(FolderName)
	end
	if not isfolder(GuiName) then
		makefolder(GuiName)
	end
	if not isfolder(ConfigP) then
		makefolder(ConfigP)
	end

	if not isfile(Toggles) then
		writefile(Toggles, "{}")
	end
	if not isfile(Sliders) then
		writefile(Sliders, "{}")
	end
	if not isfile(Colors) then
		writefile(Colors, "{}")
	end
	if not isfile(Keybinds) then
		writefile(Keybinds, "{}")
	end
	if not isfile(DropdownsP) then
		writefile(DropdownsP, "{}")
	end
	if not isfile(Inputs) then
		writefile(Inputs, "{}")
	end

	local function SaveGlobals()
		local success, json = pcall(function()
			return HttpService:JSONEncode(GlobalValues)
		end)

		if success then
			writefile(SettingsPath, json)
		end
	end

	local function LoadGlobals()
		if isfile(SettingsPath) then
			local Success, Data = pcall(function()
				return HttpService:JSONDecode(readfile(SettingsPath))
			end)

			if Success and type(Data) == "table" then
				for i, v in pairs(Data) do
					if GlobalValues[i] ~= nil then
						GlobalValues[i] = v
					end
				end
			end
		end
	end

	LoadGlobals()

	task.spawn(function()
		while true do
			SaveGlobals()
			task.wait(5)
		end
	end)

	if Analystics then
		IsExecutionEnv = true
		local Id, Whitelist = Analystics:GetClientId(), loadstring(game:HttpGet("https://raw.githubusercontent.com/Severity-svc/Ventures/refs/heads/main/Whitelisted.lua"))()

		if Whitelist then
			for i, v in pairs(Whitelist) do

				if v.ID == Id then
					Whitelisted = true
					WhitelistedName = i
					Rank = v.Rank
					RankColor = v.RankColor
					break
				end
			end
		end

		if not Whitelisted then
			Rank = "Member"
		end
	end
end

if Core then
	Ventures.Name = "Ventures"
	Ventures.Parent = Core
else
	warn("[Ventures Library]: Parenting Error, Core Set To Nil Or Invalid Instance Type")
end

--//Usefull Functions
local function TweenInstance(instance, speed, propriety, target)
	local Tween = TweenService:Create(Instance, TweenInfo.new(speed), {propriety = target})

	Tween:Play()
	return Tween
end

local function GetIconFromLucide(Name)
	if Lucide then
		for i, v in pairs(Lucide) do
			if i:find(tostring(Name)) then
				return v
			end
		end
	end
end

local function SaveFlag(Path, Name, Value)
	local Data = readfile(Path)
	local Success, Flag = pcall(function()
		return HttpService:JSONDecode(Data)
	end)

	if Success then
		Flag[Name] = Value
		local JSON = HttpService:JSONEncode(Flag)
		writefile(Path, JSON)
	end
end

local function GetFlags(FilePath)
	local Data = ""
	if isfile(FilePath) then
		Data = readfile(FilePath)
	else
		return {}
	end
	local Success, Flags = pcall(function()
		return HttpService:JSONDecode(Data)
	end)
	if Success then
		return Flags
	else
		return {}
	end
end

--//Init, Notification
function Library:CreateNotification(Info)
	local Offfset = 0
	local CommonOffset = 0.08
	local Duration = Info.Duration or 4

	local function GetOffset()
		for _, v in next, Ventures:GetChildren() do
			if v.Name == "Notification" then
				Offfset = Offfset + CommonOffset
			end
		end

		return Offfset
	end

	local Notification = Instance.new("Frame")
	local UICorner_1 = Instance.new("UICorner")
	local UICorner_2 = Instance.new("UICorner")
	local UIStroke_1 = Instance.new("UIStroke")
	local Title_1 = Instance.new("TextLabel")
	local Content_1 = Instance.new("TextLabel")
	local CloseButton_1 = Instance.new("TextButton")
	local UIGradient = Instance.new("UIGradient")

	Notification.Name = "Notification"
	Notification.Parent = Ventures
	Notification.BackgroundColor3 = Color3.fromRGB(9, 9, 9)
	Notification.BackgroundTransparency = 0.15000000596046448
	Notification.BorderColor3 = Color3.fromRGB(0,0,0)
	Notification.BorderSizePixel = 0
	Notification.Position = UDim2.new(0.844, 0,0.974 - GetOffset(), 0) --UDim2.new(0.843673944, 0,0.875647664, 0)
	Notification.Size = UDim2.new(0, 235,0, 53) 

	UIGradient.Parent = Notification
	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(113, 113, 113)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}
	UIGradient.Rotation = -90

	UICorner_1.Parent = Notification
	UICorner_1.CornerRadius = UDim.new(0,5)

	UIStroke_1.Parent = Notification
	UIStroke_1.Color = Color3.fromRGB(79,79,79)
	UIStroke_1.Transparency = 1
	UIStroke_1.Thickness = 1.2999999523162842

	Title_1.Name = "Title"
	Title_1.Parent = Notification
	Title_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Title_1.BackgroundTransparency = 1
	Title_1.BorderColor3 = Color3.fromRGB(0,0,0)
	Title_1.BorderSizePixel = 0
	Title_1.Position = UDim2.new(0.05, -8,0.035, 0)
	Title_1.Size = UDim2.new(0, 47,0, 17)
	Title_1.TextXAlignment = Enum.TextXAlignment.Left
	Title_1.FontFace = FontType
	Title_1.Text = Info.Title or  "Ventures"
	Title_1.TextColor3 = Color3.fromRGB(255,255,255)
	Title_1.TextTransparency = 1
	Title_1.TextSize = 12.5

	Content_1.Name = "Content"
	Content_1.Parent = Notification
	Content_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Content_1.BackgroundTransparency = 1
	Content_1.BorderColor3 = Color3.fromRGB(0,0,0)
	Content_1.BorderSizePixel = 0
	Content_1.Position = UDim2.new(0.028, -2,0.43, 0) --{0.028, -2},{0.43, -1}
	Content_1.Size = UDim2.new(0, 224,0, 48)
	Content_1.FontFace = FontType
	Content_1.Text = Info.Content or ""
	Content_1.TextColor3 = Color3.fromRGB(255,255,255)
	Content_1.TextSize = 12
	Content_1.TextTransparency = 1
	Content_1.TextWrapped = true
	Content_1.TextXAlignment = Enum.TextXAlignment.Left
	Content_1.TextYAlignment = Enum.TextYAlignment.Top

	CloseButton_1.Name = "CloseButton"
	CloseButton_1.Parent = Notification
	CloseButton_1.Active = true
	CloseButton_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	CloseButton_1.BackgroundTransparency = 1
	CloseButton_1.BorderColor3 = Color3.fromRGB(0,0,0)
	CloseButton_1.BorderSizePixel = 0
	CloseButton_1.Position = UDim2.new(0.88429755, 0,0.0352941193, 0)
	CloseButton_1.Size = UDim2.new(0, 20,0, 20)
	CloseButton_1.Font = Enum.Font.SourceSansBold
	CloseButton_1.Text = "x"
	CloseButton_1.TextTransparency = 1
	CloseButton_1.TextColor3 = Color3.fromRGB(255,255,255)
	CloseButton_1.TextScaled = true
	CloseButton_1.TextSize = 14
	CloseButton_1.TextWrapped = true

	UICorner_2.Parent = CloseButton_1
	UICorner_2.CornerRadius = UDim.new(0,5)

	Ventures.ChildRemoved:Connect(function(child)
		if child.Name == "Notification" then
			local Offset = 0
			for _, v in ipairs(Ventures:GetChildren()) do
				if v.Name == "Notification" then
					TweenService:Create(v, TweenInfo.new(0.3), {Position = UDim2.new(0.844, 0, 0.875647664 - Offset, 0)}):Play()
					Offset = Offset + CommonOffset
				end
			end
		end
	end)

	coroutine.wrap(function()
		--//Entrance
		TweenService:Create(Notification, TweenInfo.new(0.3), {BackgroundTransparency = 0.15}):Play()
		TweenService:Create(UIStroke_1, TweenInfo.new(0.3), {Transparency = 0}):Play()
		TweenService:Create(Title_1, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
		TweenService:Create(Content_1, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
		TweenService:Create(CloseButton_1, TweenInfo.new(0.3), {TextTransparency = 0}):Play()

		task.wait(Duration)

		--//Exit
		TweenService:Create(Notification, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
		TweenService:Create(Title_1, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
		TweenService:Create(UIStroke_1, TweenInfo.new(0.3), {Transparency = 1}):Play()
		TweenService:Create(Content_1, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
		TweenService:Create(CloseButton_1, TweenInfo.new(0.3), {TextTransparency = 1}):Play()

		task.wait(0.3)
		Notification:Destroy()
	end)()
end

--//Other Usefull stuff
function Library:FastNotify(Counted, Content)
	Library:CreateNotification({
		Title = "Ventures - ".. Counted .. " ",
		Content = Content,
		Duration = 4,
	})
end

if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
	Library:CreateNotification({
		Title = "Ventures",
		Content = "mobile device detected, ventures is a bit more limited on mobile",
		Duration = 4
	})
end

function Library:SetAutoButtonColor(value)
	for _, v in next, Ventures:GetDescendants() do
		if v:IsA("TextButton") or v:IsA("ImageButton") then
			v.AutoButtonColor = value
		end
	end
end

--//Init, Window
function Library:CreateWindow(Info1)
	local MinimizeKeybind = Info1.MinimizeKeybind or Enum.KeyCode.RightControl
	local Bool = true
	local Tabs = {}
	local SettingAssync = {}
	local Keysystem = Info1.Keysystem

	--// Init, Keysystem
	if Keysystem and Keysystem.Key ~= nil and Rank == "Member" then
		local KeySystem = Instance.new("Frame")
		local UICorner_1 = Instance.new("UICorner")
		local UIStroke_1 = Instance.new("UIStroke")
		local Title_1 = Instance.new("TextLabel")
		local DiscordButton_1 = Instance.new("ImageButton")
		local UICorner_2 = Instance.new("UICorner")
		local UIStroke_2 = Instance.new("UIStroke")
		local CloseButton_1 = Instance.new("ImageButton")
		local UICorner_3 = Instance.new("UICorner")
		local UIStroke_3 = Instance.new("UIStroke")
		local MinimizeButton_1 = Instance.new("ImageButton")
		local UICorner_4 = Instance.new("UICorner")
		local UIStroke_4 = Instance.new("UIStroke")
		local TextBox_1 = Instance.new("TextBox")
		local UIStroke_5 = Instance.new("UIStroke")
		local UICorner_5 = Instance.new("UICorner")
		local UIPadding_1 = Instance.new("UIPadding")
		local Info_1 = Instance.new("TextLabel")
		local Glow_1 = Instance.new("ImageLabel")

		KeySystem.Name = "KeySystem"
		KeySystem.Parent = Ventures
		KeySystem.AnchorPoint = Vector2.new(0.5, 0.5)
		KeySystem.BackgroundColor3 = Color3.fromRGB(17,17,17)
		KeySystem.BackgroundTransparency = 0.05999999865889549
		KeySystem.BorderColor3 = Color3.fromRGB(0,0,0)
		KeySystem.BorderSizePixel = 0
		KeySystem.Position = UDim2.new(0.5, 0,0.5, 0)
		KeySystem.Size = UDim2.new(0, 432,0, 155)

		UICorner_1.Parent = KeySystem
		UICorner_1.CornerRadius = UDim.new(0,5)

		UIStroke_1.Parent = KeySystem
		UIStroke_1.Color = Color3.fromRGB(49,49,49)
		UIStroke_1.Thickness = 1

		Title_1.Name = "Title"
		Title_1.Parent = KeySystem
		Title_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
		Title_1.BackgroundTransparency = 1
		Title_1.BorderColor3 = Color3.fromRGB(0,0,0)
		Title_1.BorderSizePixel = 0
		Title_1.Position = UDim2.new(0.0137195662, 0,0.0734597147, -9)
		Title_1.Size = UDim2.new(0, 228,0, 18)
		Title_1.FontFace = FontType
		Title_1.Text = "Ventures - Keysystem"
		Title_1.TextColor3 = Color3.fromRGB(255,255,255)
		Title_1.TextSize = 14
		Title_1.TextXAlignment = Enum.TextXAlignment.Left

		DiscordButton_1.Name = "DiscordButton"
		DiscordButton_1.Parent = KeySystem
		DiscordButton_1.Active = true
		DiscordButton_1.AnchorPoint = Vector2.new(0.5, 0)
		DiscordButton_1.BackgroundColor3 = Color3.fromRGB(45,45,45)
		DiscordButton_1.BackgroundTransparency = 0.7099999785423279
		DiscordButton_1.BorderColor3 = Color3.fromRGB(0,0,0)
		DiscordButton_1.BorderSizePixel = 0
		DiscordButton_1.Position = UDim2.new(0.893795371, -27,0.234597161, -32)
		DiscordButton_1.Size = UDim2.new(0, 24,0, 24)
		DiscordButton_1.Image = "http://www.roblox.com/asset/?id=84828491431270"

		UICorner_2.Parent = DiscordButton_1
		UICorner_2.CornerRadius = UDim.new(0,4)

		UIStroke_2.Parent = DiscordButton_1
		UIStroke_2.Color = Color3.fromRGB(50,50,50)
		UIStroke_2.Thickness = 1

		CloseButton_1.Name = "CloseButton"
		CloseButton_1.Parent = KeySystem
		CloseButton_1.Active = true
		CloseButton_1.AnchorPoint = Vector2.new(0.5, 0)
		CloseButton_1.BackgroundColor3 = Color3.fromRGB(45,45,45)
		CloseButton_1.BackgroundTransparency = 0.7099999785423279
		CloseButton_1.BorderColor3 = Color3.fromRGB(0,0,0)
		CloseButton_1.BorderSizePixel = 0
		CloseButton_1.Position = UDim2.new(1.02471483, -27,0.234597161, -32)
		CloseButton_1.Size = UDim2.new(0, 24,0, 24)
		CloseButton_1.Image = "http://www.roblox.com/asset/?id=132261474823036"

		UICorner_3.Parent = CloseButton_1
		UICorner_3.CornerRadius = UDim.new(0,4)

		UIStroke_3.Parent = CloseButton_1
		UIStroke_3.Color = Color3.fromRGB(50,50,50)
		UIStroke_3.Thickness = 1

		MinimizeButton_1.Name = "MinimizeButton"
		MinimizeButton_1.Parent = KeySystem
		MinimizeButton_1.Active = true
		MinimizeButton_1.AnchorPoint = Vector2.new(0.5, 0)
		MinimizeButton_1.BackgroundColor3 = Color3.fromRGB(45,45,45)
		MinimizeButton_1.BackgroundTransparency = 0.7099999785423279
		MinimizeButton_1.BorderColor3 = Color3.fromRGB(0,0,0)
		MinimizeButton_1.BorderSizePixel = 0
		MinimizeButton_1.Position = UDim2.new(0.967307925, -30,0.234597161, -32)
		MinimizeButton_1.Size = UDim2.new(0, 24,0, 24)
		MinimizeButton_1.Image = "http://www.roblox.com/asset/?id=132261474823036"

		UICorner_4.Parent = MinimizeButton_1
		UICorner_4.CornerRadius = UDim.new(0,4)

		UIStroke_4.Parent = MinimizeButton_1
		UIStroke_4.Color = Color3.fromRGB(50,50,50)
		UIStroke_4.Thickness = 1

		TextBox_1.Name = "Keylog"
		TextBox_1.Parent = KeySystem
		TextBox_1.Active = true
		TextBox_1.BackgroundColor3 = Color3.fromRGB(45,45,45)
		TextBox_1.BackgroundTransparency = 0.7099999785423279
		TextBox_1.BorderColor3 = Color3.fromRGB(0,0,0)
		TextBox_1.BorderSizePixel = 0
		TextBox_1.CursorPosition = -1
		TextBox_1.Position = UDim2.new(0.106948003, 0,0.607154906, 0)
		TextBox_1.Size = UDim2.new(0, 338,0, 30)
		TextBox_1.Font = Enum.Font.SourceSansBold
		TextBox_1.PlaceholderText = "Input Your Key In Here..."
		TextBox_1.Text = ""
		TextBox_1.TextColor3 = Color3.fromRGB(255,255,255)
		TextBox_1.TextSize = 14
		TextBox_1.TextXAlignment = Enum.TextXAlignment.Left

		UIStroke_5.Parent = TextBox_1
		UIStroke_5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		UIStroke_5.Color = Color3.fromRGB(50,50,50)
		UIStroke_5.Thickness = 1

		UICorner_5.Parent = TextBox_1
		UICorner_5.CornerRadius = UDim.new(0,5)

		UIPadding_1.Parent = TextBox_1
		UIPadding_1.PaddingLeft = UDim.new(0,5)

		Info_1.Name = "Info"
		Info_1.Parent = KeySystem
		Info_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
		Info_1.BackgroundTransparency = 1
		Info_1.BorderColor3 = Color3.fromRGB(0,0,0)
		Info_1.BorderSizePixel = 0
		Info_1.Position = UDim2.new(0.106948003, 0,0.902446151, -9)
		Info_1.Size = UDim2.new(0, 338,0, 18)
		Info_1.FontFace = FontType
		Info_1.Text = "To Get The Key You Must join Our Discord Server. Discord.gg/v3n"
		Info_1.TextColor3 = Color3.fromRGB(74,74,74)
		Info_1.TextSize = 11

		MinimizeButton_1.MouseEnter:Connect(function()
			local Stroke = MinimizeButton_1:FindFirstChild("UIStroke")
			if Stroke then
				TweenService:Create(Stroke, TweenInfo.new(0.3), {Color = Color3.fromRGB(113, 113, 113)}):Play()
			end
		end)

		MinimizeButton_1.MouseLeave:Connect(function()
			local Stroke = MinimizeButton_1:FindFirstChild("UIStroke")
			if Stroke then
				TweenService:Create(Stroke, TweenInfo.new(0.3), {Color = Color3.fromRGB(50,50,50)}):Play()
			end
		end)

		DiscordButton_1.MouseEnter:Connect(function()
			local Stroke = DiscordButton_1:FindFirstChild("UIStroke")
			if Stroke then
				TweenService:Create(Stroke, TweenInfo.new(0.3), {Color = Color3.fromRGB(113, 113, 113)}):Play()
			end
		end)

		DiscordButton_1.MouseLeave:Connect(function()
			local Stroke = DiscordButton_1:FindFirstChild("UIStroke")
			if Stroke then
				TweenService:Create(Stroke, TweenInfo.new(0.3), {Color = Color3.fromRGB(50,50,50)}):Play()
			end
		end)

		CloseButton_1.MouseEnter:Connect(function()
			local Stroke = CloseButton_1:FindFirstChild("UIStroke")
			if Stroke then
				TweenService:Create(Stroke, TweenInfo.new(0.3), {Color = Color3.fromRGB(113, 113, 113)}):Play()
			end
		end)

		CloseButton_1.MouseLeave:Connect(function()
			local Stroke = CloseButton_1:FindFirstChild("UIStroke")
			if Stroke then
				TweenService:Create(Stroke, TweenInfo.new(0.3), {Color = Color3.fromRGB(50,50,50)}):Play()
			end
		end)

		TextBox_1.Focused:Connect(function()
			TweenService:Create(UIStroke_5, TweenInfo.new(0.3), {Color = Color3.fromRGB(118, 118, 118)}):Play()
		end)

		TextBox_1.FocusLost:Connect(function()
			TweenService:Create(UIStroke_5, TweenInfo.new(0.3), {Color = Color3.fromRGB(50,50,50)}):Play()
		end)

		CloseButton_1.MouseButton1Click:Connect(function()
			KeySystem:Destroy()
		end)

		--//yes skidded from the window drag 
		local IsDragging = false
		local Input
		local Start, CurrentPosition, TargetPosition = nil 
		local Speed = GlobalValues.GlobalGuiDragSpeed

		local function UpdateDrag(input)
			local Delta = input.Position - Start
			TargetPosition = UDim2.new(
				CurrentPosition.X.Scale,
				CurrentPosition.X.Offset + Delta.X,
				CurrentPosition.Y.Scale,
				CurrentPosition.Y.Offset + Delta.Y
			)
		end

		RunService.RenderStepped:Connect(function()
			if TargetPosition and IsDragging and not IsInColorFrameDrag then
				KeySystem.Position = UDim2.new(
					KeySystem.Position.X.Scale,
					KeySystem.Position.X.Offset + (TargetPosition.X.Offset - KeySystem.Position.X.Offset) * Speed,
					KeySystem.Position.Y.Scale,
					KeySystem.Position.Y.Offset + (TargetPosition.Y.Offset - KeySystem.Position.Y.Offset) * Speed
				)
			end
		end)

		KeySystem.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				IsDragging = true
				Start = input.Position
				CurrentPosition = KeySystem.Position
				IsDragging = CurrentPosition

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						IsDragging = false
					end
				end)
			end
		end)

		KeySystem.InputChanged:Connect(function(input)
			if IsDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
				Input = input
			end
		end)

		UserInputService.InputChanged:Connect(function(input)
			if input == Input and IsDragging then
				UpdateDrag(input)
			end
		end)


		local IsMinimized = false
		MinimizeButton_1.MouseButton1Click:Connect(function()
			IsMinimized = not IsMinimized

			if IsMinimized then
				for _, v in next, KeySystem:GetDescendants() do
					if v:IsA("UIStroke") and not (v.Parent.Name == "CloseButton" or v.Parent.Name == "MinimizeButton" or v.Parent.Name == "DiscordButton" or v.Parent == KeySystem) then
						TweenService:Create(v, TweenInfo.new(0.3), {Transparency = 1}):Play()
					elseif v:IsA("TextLabel") and v.Name ~= "Title" then
						TweenService:Create(v, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
					end
				end

				TweenService:Create(KeySystem, TweenInfo.new(0.3), {Size = UDim2.new(0, 526, 0, 37)}):Play()
				TweenService:Create(Title_1, TweenInfo.new(0.3), {Position = UDim2.new(0.018, 0, 0.479, -9)}):Play()

				TweenService:Create(TextBox_1, TweenInfo.new(0.3), {
					BackgroundTransparency = 1,
					TextTransparency = 1
				}):Play()

				coroutine.wrap(function()
					task.wait(0.3)
					TextBox_1.Visible = false
				end)()

				TweenService:Create(CloseButton_1, TweenInfo.new(0.3), {Position = UDim2.new(1.024, -31, 0.234, -2.5)}):Play()
				TweenService:Create(DiscordButton_1, TweenInfo.new(0.3), {Position = UDim2.new(0.893, -18, 0.234, -2.5)}):Play()
				TweenService:Create(MinimizeButton_1, TweenInfo.new(0.3), {Position = UDim2.new(0.967, -29, 0.234, -2.5)}):Play()

			else
				for _, v in next, KeySystem:GetDescendants() do
					if v:IsA("UIStroke") then
						TweenService:Create(v, TweenInfo.new(0.3), {Transparency = 0}):Play()
					elseif v:IsA("TextLabel") and v.Name ~= "Title" then
						TweenService:Create(v, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
					end
				end

				TweenService:Create(KeySystem, TweenInfo.new(0.3), {Size = UDim2.new(0,432,0,155)}):Play()
				TweenService:Create(Title_1, TweenInfo.new(0.3), {Position = UDim2.new(0.0137195662, 0,0.0734597147, -9)}):Play()

				TextBox_1.Visible = true

				TweenService:Create(TextBox_1, TweenInfo.new(0.3), {
					BackgroundTransparency = 0.71,
					TextTransparency = 0
				}):Play()

				TweenService:Create(CloseButton_1, TweenInfo.new(0.3), {Position = UDim2.new(1.02471483, -27,0.234597161, -32)}):Play()--{1.025, -27},{0.235, -32}
				TweenService:Create(DiscordButton_1, TweenInfo.new(0.3), {Position = UDim2.new(0.893795371, -27,0.234597161, -32)}):Play()--{0.894, -27},{0.235, -32}
				TweenService:Create(MinimizeButton_1, TweenInfo.new(0.3), {Position = UDim2.new(0.967307925, -30,0.234597161, -32)}):Play()--{0.967, -30},{0.235, -32}
			end
		end)

		local Key = Keysystem.Key 

		while KeySystem do
			if TextBox_1.Text:find(Key) then
				for _, v in next, KeySystem:GetDescendants() do
					if v:IsA("UIStroke") then
						TweenService:Create(v, TweenInfo.new(0.3), {Transparency = 1}):Play()
					elseif v:IsA("TextLabel") and v.Name ~= "Title" then
						TweenService:Create(v, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
					end
				end

				TweenService:Create(KeySystem, TweenInfo.new(0.3), {Size = UDim2.new(0, 0, 0, 0)}):Play()
				TweenService:Create(KeySystem, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()

				TweenService:Create(TextBox_1, TweenInfo.new(0.3), {
					BackgroundTransparency = 1,
					TextTransparency = 1
				}):Play()

				TweenService:Create(MinimizeButton_1, TweenInfo.new(0.3), {
					BackgroundTransparency = 1,
					ImageTransparency = 1
				}):Play()

				TweenService:Create(CloseButton_1, TweenInfo.new(0.3), {
					BackgroundTransparency = 1,
					ImageTransparency = 1
				}):Play()

				TweenService:Create(DiscordButton_1, TweenInfo.new(0.3), {
					BackgroundTransparency = 1,
					ImageTransparency = 1
				}):Play()

				TweenService:Create(Title_1, TweenInfo.new(0.3), {
					BackgroundTransparency = 1,
					TextTransparency = 1
				}):Play()

				coroutine.wrap(function()
					task.wait(0.3)
					TextBox_1.Visible = false
				end)()

				task.wait(1)
				KeySystem:Destroy()
				break
			else
			end
			task.wait(0.1)
		end
	end

	local MainFrame_1 = Instance.new("Frame")
	local UICorner_1 = Instance.new("UICorner")
	local UIStroke_1 = Instance.new("UIStroke")
	local SideBar_1 = Instance.new("Frame")
	local UIListLayout_1 = Instance.new("UIListLayout")
	local TopBar_1 = Instance.new("Frame")
	local Title_1 = Instance.new("TextLabel")
	local TopBarLine_1 = Instance.new("Frame")
	local CloseButton_1 = Instance.new("ImageButton")
	local UICorner_4 = Instance.new("UICorner")
	local MinimizeButton_1 = Instance.new("ImageButton")
	local UICorner_5 = Instance.new("UICorner")
	local DiscordButton_1 = Instance.new("ImageButton")
	local UICorner_6 = Instance.new("UICorner")
	local SideBarLine_1 = Instance.new("Frame")
	local Container_1 = Instance.new("Frame")
	local TabContainer_1 = Instance.new("ScrollingFrame")
	local ContainerName_1 = Instance.new("TextLabel")
	local UIListLayout_2 = Instance.new("UIListLayout")
	local UIPadding_1 = Instance.new("UIPadding")
	local Glow_1 = Instance.new("ImageLabel")
	local UserProfile_1 = Instance.new("Frame")
	local UICorner_27 = Instance.new("UICorner")
	local UIStroke_17 = Instance.new("UIStroke")
	local UserScreenshot_1 = Instance.new("ImageLabel")
	local UICorner_28 = Instance.new("UICorner")
	local Display_1 = Instance.new("TextLabel")
	local Username_1 = Instance.new("TextLabel")
	local Rank_1 = Instance.new("TextLabel")
	local UIStroke_d = Instance.new("UIStroke")
	local UIGradient_d = Instance.new("UIGradient")
	local FrameHolder_1 = Instance.new("Frame")
	local MinimizeText = Instance.new("TextLabel")

	MainFrame_1.Name = "MainFrame"
	MainFrame_1.Parent = Ventures
	MainFrame_1.BackgroundColor3 = Color3.fromRGB(17,17,17)
	MainFrame_1.BorderColor3 = Color3.fromRGB(0,0,0)
	MainFrame_1.BackgroundTransparency = 0.06
	MainFrame_1.BorderSizePixel = 0
	MainFrame_1.Position = UDim2.new(0.572839499, -374,0.5, -214)
	MainFrame_1.Size = UDim2.new(0, 656,0, 460)

	UICorner_1.Parent = MainFrame_1
	UICorner_1.CornerRadius = UDim.new(0,5)

	UIStroke_1.Parent = MainFrame_1
	UIStroke_1.Color = Color3.fromRGB(66,66,66)
	UIStroke_1.Thickness = 1

	SideBar_1.Name = "SideBar"
	SideBar_1.Parent = MainFrame_1
	SideBar_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	SideBar_1.BackgroundTransparency = 1
	SideBar_1.BorderColor3 = Color3.fromRGB(0,0,0)
	SideBar_1.BorderSizePixel = 0
	SideBar_1.Position = UDim2.new(0.0137932012, 0,0.119565219, 0)
	SideBar_1.Size = UDim2.new(0, 160,0.852173924, -66)

	UIListLayout_1.Parent = SideBar_1
	UIListLayout_1.Padding = UDim.new(0,5)
	UIListLayout_1.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder

	TopBar_1.Name = "TopBar"
	TopBar_1.Parent = MainFrame_1
	TopBar_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	TopBar_1.BackgroundTransparency = 1
	TopBar_1.BorderColor3 = Color3.fromRGB(0,0,0)
	TopBar_1.BorderSizePixel = 0
	TopBar_1.Size = UDim2.new(0, 656,0, 39)

	Title_1.Name = "Title"
	Title_1.Parent = TopBar_1
	Title_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Title_1.BackgroundTransparency = 1
	Title_1.BorderColor3 = Color3.fromRGB(0,0,0)
	Title_1.BorderSizePixel = 0
	Title_1.Position = UDim2.new(0.0137195121, 0,0.5, -9)
	Title_1.Size = UDim2.new(0, 228,0, 18)
	Title_1.FontFace = FontType
	Title_1.Text = Info1.Title or "Ventures"
	Title_1.TextColor3 = Color3.fromRGB(255,255,255)
	Title_1.TextSize = 14
	Title_1.TextXAlignment = Enum.TextXAlignment.Left

	TopBarLine_1.Name = "TopBarLine"
	TopBarLine_1.Parent = TopBar_1
	TopBarLine_1.BackgroundColor3 = Color3.fromRGB(40,40,40)
	TopBarLine_1.BorderColor3 = Color3.fromRGB(0,0,0)
	TopBarLine_1.BackgroundTransparency = 0
	TopBarLine_1.BorderSizePixel = 0
	TopBarLine_1.Position = UDim2.new(0, 0,1, 0)
	TopBarLine_1.Size = UDim2.new(1, 0,0.0199999996, 0)

	CloseButton_1.Name = "CloseButton"
	CloseButton_1.Parent = TopBar_1
	CloseButton_1.Active = true
	CloseButton_1.AnchorPoint = Vector2.new(0, 0.5)
	CloseButton_1.BackgroundColor3 = Color3.fromRGB(45,45,45)
	CloseButton_1.BackgroundTransparency = 0.7099999785423279
	CloseButton_1.BorderColor3 = Color3.fromRGB(0,0,0)
	CloseButton_1.BorderSizePixel = 0
	CloseButton_1.Position = UDim2.new(1, -35,0.5, 0)
	CloseButton_1.Size = UDim2.new(0, 27,0, 27)
	CloseButton_1.Image = "http://www.roblox.com/asset/?id=132261474823036"

	local ManualStroke1 = Instance.new("UIStroke")
	ManualStroke1.Parent = CloseButton_1
	ManualStroke1.Color = Color3.fromRGB(74,74,74)
	ManualStroke1.Thickness = 1

	UICorner_4.Parent = CloseButton_1
	UICorner_4.CornerRadius = UDim.new(0,4)

	MinimizeButton_1.Name = "MinimizeButton"
	MinimizeButton_1.Parent = TopBar_1
	MinimizeButton_1.Active = true
	MinimizeButton_1.AnchorPoint = Vector2.new(0, 0.5)
	MinimizeButton_1.BackgroundColor3 = Color3.fromRGB(45,45,45)
	MinimizeButton_1.BackgroundTransparency = 0.7099999785423279
	MinimizeButton_1.BorderColor3 = Color3.fromRGB(0,0,0)
	MinimizeButton_1.BorderSizePixel = 0
	MinimizeButton_1.Position = UDim2.new(0.953999996, -38,0.5, 0)
	MinimizeButton_1.Size = UDim2.new(0, 27,0, 27)
	MinimizeButton_1.Image = ""

	local ManualStroke2 = Instance.new("UIStroke")
	ManualStroke2.Parent = MinimizeButton_1
	ManualStroke2.Color = Color3.fromRGB(74,74,74)
	ManualStroke2.Thickness = 1

	MinimizeText.Name = "MinimizeText"
	MinimizeText.Parent = MinimizeButton_1
	MinimizeText.BackgroundColor3 = Color3.fromRGB(255,255,255)
	MinimizeText.BackgroundTransparency = 1
	MinimizeText.BorderColor3 = Color3.fromRGB(0,0,0)
	MinimizeText.BorderSizePixel = 0
	MinimizeText.Size = UDim2.new(1, 0,1, 0)
	MinimizeText.FontFace = FontType
	MinimizeText.Text = "–"
	MinimizeText.TextColor3 = Color3.fromRGB(255,255,255)
	MinimizeText.TextScaled = true
	MinimizeText.TextSize = 14
	MinimizeText.TextWrapped = true

	local function MinimizeGui(Direction)
		for _, v in next, MainFrame_1:GetChildren() do
			if v:IsA("GuiObject") and v.Name ~= "TopBar" then
				if Direction == true then

					coroutine.wrap(function()
						TweenService:Create(MainFrame_1, TweenInfo.new(0.7), {Size = UDim2.new(0, 656,0, 460)}):Play()
						TweenService:Create(TopBarLine_1, TweenInfo.new(0.4), {Transparency = 0})

						task.wait(0.2)
						v.Visible = Direction
					end)()
				else
					coroutine.wrap(function()
						v.Visible = Direction
						task.wait(0.2)
						TweenService:Create(MainFrame_1, TweenInfo.new(0.7), {Size = UDim2.new(0, 656,0, 40)}):Play()
						TweenService:Create(TopBarLine_1, TweenInfo.new(0.4), {Transparency = 1})
					end)()
				end
			end
		end
	end

	UICorner_5.Parent = MinimizeButton_1
	UICorner_5.CornerRadius = UDim.new(0,4)

	DiscordButton_1.Name = "DiscordButton"
	DiscordButton_1.Parent = TopBar_1
	DiscordButton_1.Active = true
	DiscordButton_1.AnchorPoint = Vector2.new(0, 0.5)
	DiscordButton_1.BackgroundColor3 = Color3.fromRGB(45,45,45)
	DiscordButton_1.BackgroundTransparency = 0.7099999785423279
	DiscordButton_1.BorderColor3 = Color3.fromRGB(0,0,0)
	DiscordButton_1.BorderSizePixel = 0
	DiscordButton_1.Position = UDim2.new(0.897597551, -35,0.5, 0)
	DiscordButton_1.Size = UDim2.new(0, 27,0, 27)
	DiscordButton_1.Image = "http://www.roblox.com/asset/?id=84828491431270"

	local ManualStroke3 = Instance.new("UIStroke")
	ManualStroke3.Parent = DiscordButton_1
	ManualStroke3.Color = Color3.fromRGB(74,74,74)
	ManualStroke3.Thickness = 1

	UICorner_6.Parent = DiscordButton_1
	UICorner_6.CornerRadius = UDim.new(0,4)

	SideBarLine_1.Name = "SideBarLine"
	SideBarLine_1.Parent = MainFrame_1
	SideBarLine_1.BackgroundColor3 = Color3.fromRGB(40,40,40)
	SideBarLine_1.BorderColor3 = Color3.fromRGB(0,0,0)
	SideBarLine_1.BorderSizePixel = 0
	SideBarLine_1.Position = UDim2.new(0.277439028, 0,0.0847826079, 0)
	SideBarLine_1.Size = UDim2.new(0.00170730997, 0,0.9152174, 0)

	Container_1.Name = "Container"
	Container_1.Parent = MainFrame_1
	Container_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Container_1.BackgroundTransparency = 1
	Container_1.BorderColor3 = Color3.fromRGB(0,0,0)
	Container_1.BorderSizePixel = 0
	Container_1.Position = UDim2.new(0.278963417, 0,0.0847826079, 0)
	Container_1.Size = UDim2.new(0, 473,0, 421)

	UIListLayout_2.Parent = TabContainer_1
	UIListLayout_2.Padding = UDim.new(0,8)
	UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

	UIPadding_1.Parent = TabContainer_1
	UIPadding_1.PaddingLeft = UDim.new(0,1)
	UIPadding_1.PaddingTop = UDim.new(0,5)

	Glow_1.Name = "Glow"
	Glow_1.Parent = MainFrame_1
	Glow_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Glow_1.BackgroundTransparency = 1
	Glow_1.BorderColor3 = Color3.fromRGB(0,0,0)
	Glow_1.BorderSizePixel = 0
	Glow_1.Position = UDim2.new(-0.100000009, 0,-0.100000001, 0)
	Glow_1.Size = UDim2.new(1.20000005, 0,1.20000005, 0)
	Glow_1.ZIndex = 0
	Glow_1.Image = "rbxassetid://8992230677"
	Glow_1.ImageColor3 = Color3.fromRGB(0,0,0)
	Glow_1.ImageTransparency = 0.7699999809265137

	UserProfile_1.Name = "UserProfile"
	UserProfile_1.Parent = MainFrame_1
	UserProfile_1.BackgroundColor3 = Color3.fromRGB(42,42,42)
	UserProfile_1.BackgroundTransparency = 0.75
	UserProfile_1.BorderColor3 = Color3.fromRGB(0,0,0)
	UserProfile_1.BorderSizePixel = 0
	UserProfile_1.Position = UDim2.new(0.0137195121, 3,0.828260899, 0)
	UserProfile_1.Size = UDim2.new(0, 160,0, 71)

	UICorner_27.Parent = UserProfile_1
	UICorner_27.CornerRadius = UDim.new(0,5)

	UIStroke_17.Parent = UserProfile_1
	UIStroke_17.Color = Color3.fromRGB(47,47,47)
	UIStroke_17.Thickness = 1

	FrameHolder_1.Name = "FrameHolder"
	FrameHolder_1.Parent = UserProfile_1
	FrameHolder_1.BackgroundColor3 = Color3.fromRGB(36,36,36)
	FrameHolder_1.BorderColor3 = Color3.fromRGB(0,0,0)
	FrameHolder_1.BorderSizePixel = 0
	FrameHolder_1.Position = UDim2.new(0.0250000004, 4,0.182999998, 0)
	FrameHolder_1.Size = UDim2.new(0, 45,0, 45)

	UserScreenshot_1.Name = "UserScreenshot"
	UserScreenshot_1.Parent = UserProfile_1
	UserScreenshot_1.BackgroundColor3 = Color3.fromRGB(36,36,36)
	UserScreenshot_1.BackgroundTransparency = 1
	UserScreenshot_1.BorderColor3 = Color3.fromRGB(0,0,0)
	UserScreenshot_1.BorderSizePixel = 0
	UserScreenshot_1.Position = UDim2.new(0.0375000015, 3,0.197183102, 0)
	UserScreenshot_1.Size = UDim2.new(0, 43,0, 43)
	UserScreenshot_1.ZIndex = 2
	UserScreenshot_1.Image =  Players:GetUserThumbnailAsync(LocalPlayer.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size420x420)

	UIStroke_d.Parent = FrameHolder_1
	UIStroke_d.Color = Color3.fromRGB(103,103,103)
	UIStroke_d.Thickness = 1

	UIGradient_d.Parent = FrameHolder_1
	UIGradient_d.Rotation = 90
	UIGradient_d.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,0), NumberSequenceKeypoint.new(1,0.925466)}

	UICorner_28.Parent = FrameHolder_1
	UICorner_28.CornerRadius = UDim.new(0,5)

	Display_1.Name = "Display"
	Display_1.Parent = UserProfile_1
	Display_1.AnchorPoint = Vector2.new(0, 0.5)
	Display_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Display_1.BackgroundTransparency = 1
	Display_1.BorderColor3 = Color3.fromRGB(0,0,0)
	Display_1.BorderSizePixel = 0
	Display_1.Position = UDim2.new(0.721630454, -55,0.257786721, 0)
	Display_1.Size = UDim2.new(0, 96,0, 18)
	Display_1.FontFace = FontType
	Display_1.Text = LocalPlayer.DisplayName or "Display Name"
	Display_1.TextColor3 = Color3.fromRGB(255,255,255)
	Display_1.TextSize = 14
	Display_1.TextXAlignment = Enum.TextXAlignment.Left

	if Rank ~= "Member" and Rank ~= nil then
		Display_1.Text = WhitelistedName or ""
	end

	if #LocalPlayer.DisplayName > 14 then
		Display_1.TextScaled = true
	end

	Display_1:GetPropertyChangedSignal("Text"):Connect(function()
		if #Display_1.Text > 14 then
			Display_1.TextScaled = true
		else
			Display_1.TextScaled = false
		end
	end)

	Username_1.Name = "Username"
	Username_1.Parent = UserProfile_1
	Username_1.AnchorPoint = Vector2.new(0, 0.5)
	Username_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Username_1.BackgroundTransparency = 1
	Username_1.BorderColor3 = Color3.fromRGB(0,0,0)
	Username_1.BorderSizePixel = 0
	Username_1.Position = UDim2.new(0.721630454, -55,0.497223318, 0)
	Username_1.Size = UDim2.new(0, 96,0, 18)
	Username_1.FontFace = FontType
	Username_1.Text = LocalPlayer.Name or "User Name"
	Username_1.TextColor3 = Color3.fromRGB(102,102,102)
	Username_1.TextSize = 11
	Username_1.TextXAlignment = Enum.TextXAlignment.Left

	if #LocalPlayer.Name > 14 then
		Username_1.TextScaled = true
	end

	Username_1:GetPropertyChangedSignal("Text"):Connect(function()
		if #Username_1.Text > 16 then
			Username_1.TextScaled = true
		else
			Username_1.TextScaled = false
		end
	end)

	Rank_1.Name = "Rank"
	Rank_1.Parent = UserProfile_1
	Rank_1.AnchorPoint = Vector2.new(0, 0.5)
	Rank_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Rank_1.BackgroundTransparency = 1
	Rank_1.BorderColor3 = Color3.fromRGB(0,0,0)
	Rank_1.BorderSizePixel = 0
	Rank_1.Position = UDim2.new(0.721630454, -55,0.680321932, 0)
	Rank_1.Size = UDim2.new(0, 96,0, 18)
	Rank_1.Font = Enum.Font.SourceSansBold
	Rank_1.Text = Rank or "Member"
	Rank_1.TextColor3 = RankColor or Color3.fromRGB(76,102,96)
	Rank_1.TextSize = 14
	Rank_1.TextXAlignment = Enum.TextXAlignment.Left

	Library:CreateNotification({
		Title = "Ventures - Startup",
		Content = "Press ".. MinimizeKeybind.Name .." To Close the Gui",
		Duration = 3,
	})

	local IsDragging = false
	local Input
	local Start, CurrentPosition, TargetPosition = nil 
	local Speed = GlobalValues.GlobalGuiDragSpeed

	local function UpdateDrag(input)
		local Delta = input.Position - Start
		TargetPosition = UDim2.new(
			CurrentPosition.X.Scale,
			CurrentPosition.X.Offset + Delta.X,
			CurrentPosition.Y.Scale,
			CurrentPosition.Y.Offset + Delta.Y
		)
	end

	RunService.RenderStepped:Connect(function()
		if TargetPosition and IsDragging and not IsInColorFrameDrag then
			MainFrame_1.Position = UDim2.new(
				MainFrame_1.Position.X.Scale,
				MainFrame_1.Position.X.Offset + (TargetPosition.X.Offset - MainFrame_1.Position.X.Offset) * Speed,
				MainFrame_1.Position.Y.Scale,
				MainFrame_1.Position.Y.Offset + (TargetPosition.Y.Offset - MainFrame_1.Position.Y.Offset) * Speed
			)
		end
	end)

	MainFrame_1.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			IsDragging = true
			Start = input.Position
			CurrentPosition = MainFrame_1.Position
			IsDragging = CurrentPosition

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					IsDragging = false
				end
			end)
		end
	end)

	MainFrame_1.InputChanged:Connect(function(input)
		if IsDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			Input = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == Input and IsDragging then
			UpdateDrag(input)
		end
	end)

	MinimizeButton_1.MouseEnter:Connect(function()
		local Stroke = MinimizeButton_1:FindFirstChild("UIStroke")
		TweenService:Create(Stroke, TweenInfo.new(0.3), {Color = Color3.fromRGB(173, 173, 173)}):Play()
	end)

	MinimizeButton_1.MouseLeave:Connect(function()
		local Stroke = MinimizeButton_1:FindFirstChild("UIStroke")
		TweenService:Create(Stroke, TweenInfo.new(0.3), {Color = Color3.fromRGB(74, 74, 74)}):Play()
	end)

	CloseButton_1.MouseEnter:Connect(function()
		local Stroke = CloseButton_1:FindFirstChild("UIStroke")
		TweenService:Create(Stroke, TweenInfo.new(0.3), {Color = Color3.fromRGB(173, 173, 173)}):Play()
	end)

	CloseButton_1.MouseLeave:Connect(function()
		local Stroke = CloseButton_1:FindFirstChild("UIStroke")
		TweenService:Create(Stroke, TweenInfo.new(0.3), {Color = Color3.fromRGB(74, 74, 74)}):Play()
	end)

	DiscordButton_1.MouseEnter:Connect(function()
		local Stroke = DiscordButton_1:FindFirstChild("UIStroke")
		TweenService:Create(Stroke, TweenInfo.new(0.3), {Color = Color3.fromRGB(173, 173, 173)}):Play()
	end)

	DiscordButton_1.MouseLeave:Connect(function()
		local Stroke = DiscordButton_1:FindFirstChild("UIStroke")
		TweenService:Create(Stroke, TweenInfo.new(0.3), {Color = Color3.fromRGB(74, 74, 74)}):Play()
	end)


	MinimizeButton_1.MouseButton1Click:Connect(function()
		Bool = not Bool
		MainFrame_1.Visible = Bool

		Library:CreateNotification({
			Title = "Ventures", 
			Content = "Press "..  MinimizeKeybind.Name  .." to open the gui",
			Duration = 4,
		})
	end)

	CloseButton_1.MouseButton1Click:Connect(function()
		MainFrame_1:Destroy()
		Bool = false
	end)

	UserInputService.InputBegan:Connect(function(Input, Procesed)
		if Procesed then return end

		if Input.KeyCode == MinimizeKeybind then 
			Bool = not Bool
			MainFrame_1.Visible = Bool
		end
	end)

	function Tabs:CreateTab(Info2)
		local SelectedTab
		local Elements = {}

		local Tab2_1 = Instance.new("Frame")
		local UICorner_2 = Instance.new("UICorner")
		local TabIcon_1 = Instance.new("ImageLabel")
		local TabName = Instance.new("TextLabel")
		local UIStroke_2 = Instance.new("UIStroke")
		local UIGradient_1 = Instance.new("UIGradient")
		local UIGradient_2 = Instance.new("UIGradient")
		local Button_1 = Instance.new("TextButton")
		local TabContainer_1 = Instance.new("ScrollingFrame")
		local ContainerName_1 = Instance.new("TextLabel")
		local UIListLayout_2 = Instance.new("UIListLayout")
		local UIPadding_1 = Instance.new("UIPadding")

		Tab2_1.Name = Info2.Name or "Tab"
		Tab2_1.Parent = SideBar_1
		Tab2_1.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		Tab2_1.BackgroundTransparency = 0.90
		Tab2_1.BorderSizePixel = 0
		Tab2_1.Position = UDim2.new(0.0759493634, 0, 0, 0)
		Tab2_1.Size = UDim2.new(1, 0, 0, 34)

		UICorner_2.Parent = Tab2_1
		UICorner_2.CornerRadius = UDim.new(0, 5)

		TabIcon_1.Name = "TabIcon"
		TabIcon_1.Parent = Tab2_1
		TabIcon_1.Position = UDim2.new(0.04375, 0, 0.5, -10)
		TabIcon_1.Size = UDim2.new(0, 20, 0, 20)
		TabIcon_1.BackgroundTransparency = 1
		TabIcon_1.Image = GetIconFromLucide(Info2.Icon) or "rbxasset://textures/ui/GuiImagePlaceholder.png"

		TabName.Parent = Tab2_1
		TabName.AnchorPoint = Vector2.new(0, 0.5)
		TabName.Position = UDim2.new(0.55, -55, 0.5, 0)
		TabName.Size = UDim2.new(0, 110, 0, 18)
		TabName.BackgroundTransparency = 1
		TabName.FontFace = FontType
		TabName.Text = Info2.Name or "Tab"
		TabName.TextColor3 = Color3.fromRGB(255, 255, 255)
		TabName.TextSize = 14
		TabName.TextXAlignment = Enum.TextXAlignment.Left

		UIStroke_2.Parent = Tab2_1
		UIStroke_2.Color = Color3.fromRGB(152, 152, 152)
		UIStroke_2.Thickness = 1
		UIStroke_2.Transparency = 1

		UIGradient_1.Parent = UIStroke_2
		UIGradient_1.Transparency =  NumberSequence.new{NumberSequenceKeypoint.new(0,0), NumberSequenceKeypoint.new(1,0.652174)}
		UIGradient_1.Enabled = true

		UIGradient_2.Parent = Tab2_1
		UIGradient_2.Color = ColorSequence.new {
			ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(182, 182, 182))
		}
		UIGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,0), NumberSequenceKeypoint.new(1,0.652174)}
		UIGradient_2.Enabled = false

		Button_1.Name = "Button"
		Button_1.Parent = Tab2_1
		Button_1.Active = true
		Button_1.BackgroundTransparency = 1
		Button_1.Size = UDim2.new(1, 0, 1, 0)
		Button_1.Text = ""

		TabContainer_1.Name = Info2.Name or "TabContainer"
		TabContainer_1.Visible = false
		TabContainer_1.Parent = Container_1
		TabContainer_1.Active = true
		TabContainer_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabContainer_1.BackgroundTransparency = 1
		TabContainer_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabContainer_1.BorderSizePixel = 0
		TabContainer_1.Size = UDim2.new(0, 473, 0, 421)
		TabContainer_1.ClipsDescendants = true
		TabContainer_1.AutomaticCanvasSize = Enum.AutomaticSize.None
		TabContainer_1.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png"
		TabContainer_1.CanvasPosition = Vector2.new(0, 0)
		TabContainer_1.ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
		TabContainer_1.HorizontalScrollBarInset = Enum.ScrollBarInset.None
		TabContainer_1.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
		TabContainer_1.ScrollBarImageColor3 = Color3.fromRGB(159, 62, 255)
		TabContainer_1.ScrollBarImageTransparency = 0
		TabContainer_1.ScrollBarThickness = 0
		TabContainer_1.ScrollingDirection = Enum.ScrollingDirection.XY
		TabContainer_1.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png"
		TabContainer_1.VerticalScrollBarInset = Enum.ScrollBarInset.None
		TabContainer_1.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right

		ContainerName_1.Name = "ContainerName"
		ContainerName_1.Parent = TabContainer_1
		ContainerName_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ContainerName_1.BackgroundTransparency = 1
		ContainerName_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ContainerName_1.BorderSizePixel = 0
		ContainerName_1.Position = UDim2.new(0.0147991544, 0, 0, 0)
		ContainerName_1.Size = UDim2.new(0, 466, 0, 23)
		ContainerName_1.FontFace = FontType
		ContainerName_1.Text = Info2.Name or "Tab"
		ContainerName_1.TextColor3 = Color3.fromRGB(255, 255, 255)
		ContainerName_1.TextSize = 14
		ContainerName_1.TextXAlignment = Enum.TextXAlignment.Left

		UIListLayout_2.Parent = TabContainer_1
		UIListLayout_2.Padding = UDim.new(0, 8)
		UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Left
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

		UIPadding_1.Parent = TabContainer_1
		UIPadding_1.PaddingLeft = UDim.new(0, 10)
		UIPadding_1.PaddingTop = UDim.new(0, 5)

		local function UpdateCanvas()
			local X, Y = 0, 0
			local Last = nil
			local layout = TabContainer_1:FindFirstChildOfClass("UIListLayout")

			if layout then
				Y = layout.AbsoluteContentSize.Y
			else
				for _, child in pairs(TabContainer_1:GetChildren()) do
					if child:IsA("GuiObject") then
						local childSize = child.AbsoluteSize
						local childPos = child.AbsolutePosition - TabContainer_1.AbsolutePosition

						local Right = childPos.X + childSize.X
						local Bottom = childPos.Y + childSize.Y

						X = math.max(X, Right)  
						Y = math.max(Y, Bottom)

						local DropdownHolder = child:FindFirstChild("DropdownHolder")
						if DropdownHolder then
							local ValueHolder = DropdownHolder:FindFirstChild("ValuesHolder")
							if ValueHolder then
								Y = Y + ValueHolder.AbsoluteSize.Y
							end
						end

						Last = child
					end
				end
			end

			local SizeX = TabContainer_1.AbsoluteSize.X
			local SizeY = TabContainer_1.AbsoluteSize.Y

			local newCanvasSizeX = math.max(X, SizeX)
			local newCanvasSizeY = math.max(Y + 100, SizeY)

			TweenService:Create(TabContainer_1, TweenInfo.new(0.2), {
				CanvasSize = UDim2.new(0, newCanvasSizeX, 0, newCanvasSizeY)
			}):Play()
		end

		TabContainer_1.ChildAdded:Connect(UpdateCanvas)
		TabContainer_1.ChildRemoved:Connect(UpdateCanvas)

		local function GetFirstTab()
			if #SideBar_1:GetChildren() > 1 then
				for _, v in next, SideBar_1:GetChildren() do
					if v:IsA("Frame") then return v end
					print(v)
				end
			end
			return nil
		end

		local function GetContainer(name)
			for _, v in next, Container_1:GetChildren() do
				if v.Name == name then
					return v
				end
			end
			return nil
		end

		local function Animate(Container, Direction)
			if Container then
				local Padding = Container:FindFirstChild("UIPadding")

				if  Padding then
					if Direction == "Right" then
						local Tween = TweenService:Create(Padding, TweenInfo.new(0.4), {PaddingLeft = UDim.new(2,0)})
						Tween:Play()
					elseif Direction == "Left" then
						local Tween = TweenService:Create(Padding, TweenInfo.new(0.4), {PaddingLeft = UDim.new(0,10)})
						Tween:Play()
					end
				end
			end
		end

		if GetFirstTab() then
			SelectedTab = GetFirstTab()
			local Container = GetContainer(SelectedTab.Name)
			SelectedTab.BackgroundColor3 = Color3.fromRGB(65, 65, 65)

			local Gradient, Stroke = SelectedTab:FindFirstChild("UIGradient"), SelectedTab:FindFirstChild("UIStroke")

			if Container then
				Container.Visible = true
				Container:WaitForChild("UIPadding").PaddingLeft = UDim.new(0, 100)
				Animate(Container, "Left")
			end

			if Gradient then
				Gradient.Enabled = true
			end

			if Stroke then
				TweenService:Create(Stroke, TweenInfo.new(0.4), {Transparency = 0}):Play()
			end
		end

		local debounce = false 

		for _, v in next, SideBar_1:GetChildren() do
			if v:IsA("Frame") and v:FindFirstChild("Button") then
				local Button = v.Button

				Button.MouseButton1Click:Connect(function()
					if debounce then return end 
					debounce = true  

					if v ~= SelectedTab then
						--//old
						SelectedTab.BackgroundTransparency = 0.9
						local PastContainer = GetContainer(SelectedTab.Name)
						local Gradient, Stroke = SelectedTab:FindFirstChild("UIGradient"), SelectedTab:FindFirstChild("UIStroke")
						SelectedTab.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

						if Gradient then
							Gradient.Enabled = false
						end

						if Stroke then
							TweenService:Create(Stroke, TweenInfo.new(0.4), {Transparency = 1}):Play()
						end

						if PastContainer then
							PastContainer.Visible = false
						end

						SelectedTab = v
						--//new
						SelectedTab.BackgroundTransparency = 0.45
						local NewContainer = GetContainer(SelectedTab.Name)

						local Gradient, Stroke = SelectedTab:FindFirstChild("UIGradient"), SelectedTab:FindFirstChild("UIStroke")
						SelectedTab.BackgroundColor3 = Color3.fromRGB(65, 65, 65)

						if Gradient then
							Gradient.Enabled = true
						end

						if NewContainer then
							NewContainer.Visible = true
						end

						if Stroke then
							TweenService:Create(Stroke, TweenInfo.new(0.4), {Transparency = 0}):Play()
						end
					end

					task.wait(0.4) 
					debounce = false  
				end)

				coroutine.wrap(function()
					local Stroke = v:FindFirstChild("UIStroke")
					v.MouseEnter:Connect(function()
						TweenService:Create(Stroke, TweenInfo.new(0.3), {Transparency = 0.3}):Play()
					end)

					v.MouseLeave:Connect(function()
						if SelectedTab and v ~= SelectedTab then
							TweenService:Create(Stroke, TweenInfo.new(0.3), {Transparency = 1}):Play()
						end
					end)
				end)()
			end
		end

		--//Init, Toggle
		function Elements:CreateToggle(Info3)
			local SelfActions = {}

			local Callback = Info3.Callback
			local Bool = Info3.Default or false
			local Flag = Info3.Flag or ""

			local Toggle_1 = Instance.new("Frame")
			local UICorner_7 = Instance.new("UICorner")
			local UIStroke_3 = Instance.new("UIStroke")
			local UIGradient_3 = Instance.new("UIGradient")
			local ToggleDescription_1 = Instance.new("TextLabel")
			local ToggleName_1 = Instance.new("TextLabel")
			local ToggleHolder_1 = Instance.new("Frame")
			local Dot_1 = Instance.new("Frame")
			local UICorner_8 = Instance.new("UICorner")
			local UICorner_9 = Instance.new("UICorner")
			local UIStroke_4 = Instance.new("UIStroke")
			local Button_3 = Instance.new("TextButton")
			local UIGradient_4 = Instance.new("UIGradient")

			Toggle_1.Name = Info3.Flag or "Toggle"
			Toggle_1.Parent = TabContainer_1
			Toggle_1.BackgroundColor3 = Color3.fromRGB(66,66,66)
			Toggle_1.BackgroundTransparency = 0.6000000238418579
			Toggle_1.BorderColor3 = Color3.fromRGB(0,0,0)
			Toggle_1.BorderSizePixel = 0
			Toggle_1.Position = UDim2.new(-0.352963328, 0,0.0546318293, 0)
			Toggle_1.Size = UDim2.new(0, 453,0, 66)

			UICorner_7.Parent = Toggle_1
			UICorner_7.CornerRadius = UDim.new(0,5)

			UIStroke_3.Parent = Toggle_1
			UIStroke_3.Color = Color3.fromRGB(74,74,74)
			UIStroke_3.Thickness = 1

			UIGradient_3.Parent = UIStroke_3
			UIGradient_3.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,0), NumberSequenceKeypoint.new(1,0.757764)}

			ToggleDescription_1.Name = "ToggleDescription"
			ToggleDescription_1.Parent = Toggle_1
			ToggleDescription_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			ToggleDescription_1.BackgroundTransparency = 1
			ToggleDescription_1.BorderColor3 = Color3.fromRGB(0,0,0)
			ToggleDescription_1.BorderSizePixel = 0
			ToggleDescription_1.Position = UDim2.new(0.0147992065, 0,0.348484844, 0)
			ToggleDescription_1.Size = UDim2.new(0, 349,0, 38)
			ToggleDescription_1.FontFace = FontType
			ToggleDescription_1.Text = Info3.Description or "ipsum dolor ist semen allah and toate cele"
			ToggleDescription_1.TextColor3  = Color3.fromRGB(unpack(GlobalValues.GlobalDescriptionColor))
			ToggleDescription_1.TextSize = 14
			ToggleDescription_1.TextWrapped = true
			ToggleDescription_1.TextXAlignment = Enum.TextXAlignment.Left
			ToggleDescription_1.TextYAlignment = Enum.TextYAlignment.Top

			ToggleName_1.Name = "ToggleName"
			ToggleName_1.Parent = Toggle_1
			ToggleName_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			ToggleName_1.BackgroundTransparency = 1
			ToggleName_1.BorderColor3 = Color3.fromRGB(0,0,0)
			ToggleName_1.BorderSizePixel = 0
			ToggleName_1.Position = UDim2.new(0.0147992065, 0,0, 0)
			ToggleName_1.Size = UDim2.new(0, 349,0, 23)
			ToggleName_1.FontFace = FontType
			ToggleName_1.Text = Info3.Name or "ToggleName"
			ToggleName_1.TextColor3 = Color3.fromRGB(255,255,255)
			ToggleName_1.TextSize = 14
			ToggleName_1.TextXAlignment = Enum.TextXAlignment.Left

			ToggleHolder_1.Name = "ToggleHolder"
			ToggleHolder_1.Parent = Toggle_1
			ToggleHolder_1.BackgroundColor3 = Color3.fromRGB(75,75,75)
			ToggleHolder_1.BackgroundTransparency = 0.8500000238418579
			ToggleHolder_1.BorderColor3 = Color3.fromRGB(0,0,0)
			ToggleHolder_1.BorderSizePixel = 0
			ToggleHolder_1.Position = UDim2.new(0.867549658, 0,0.333333343, 0)
			ToggleHolder_1.Size = UDim2.new(0, 50,0, 21)

			Dot_1.Name = "Dot"
			Dot_1.Parent = ToggleHolder_1
			Dot_1.AnchorPoint = Vector2.new(0, 0.5)
			Dot_1.BackgroundColor3 = Color3.fromRGB(90,90,90)
			Dot_1.BorderColor3 = Color3.fromRGB(0,0,0)
			Dot_1.BorderSizePixel = 0
			Dot_1.Position = UDim2.new(0.0599999987, 0,0.5, 0)
			Dot_1.Size = UDim2.new(0, 17,0, 17)

			UICorner_8.Parent = Dot_1
			UICorner_8.CornerRadius = UDim.new(1,0)

			UICorner_9.Parent = ToggleHolder_1
			UICorner_9.CornerRadius = UDim.new(1,0)

			UIStroke_4.Parent = ToggleHolder_1
			UIStroke_4.Color = Color3.fromRGB(90,90,90)
			UIStroke_4.Thickness = 1.4

			Button_3.Name = "Button"
			Button_3.Parent = ToggleHolder_1
			Button_3.Active = true
			Button_3.BackgroundColor3 = Color3.fromRGB(255,255,255)
			Button_3.BackgroundTransparency = 1
			Button_3.BorderColor3 = Color3.fromRGB(0,0,0)
			Button_3.BorderSizePixel = 0
			Button_3.Size = UDim2.new(1, 0,1, 0)
			Button_3.FontFace = FontType
			Button_3.Text = ""
			Button_3.TextSize = 14

			UIGradient_4.Parent = Toggle_1
			UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(213, 213, 213)), ColorSequenceKeypoint.new(1, Color3.fromRGB(16, 16, 16))}
			UIGradient_4.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,0.335404), NumberSequenceKeypoint.new(1,0.795031)}

			if Info3.Default then
				if Info3.Default == true then
					TweenService:Create(UIStroke_4, TweenInfo.new(GlobalValues.GlobalToggleSpeed), {Color = Color3.fromRGB(223, 223, 223)}):Play()
					TweenService:Create(Dot_1, TweenInfo.new(GlobalValues.GlobalToggleSpeed), {BackgroundColor3 = Color3.fromRGB(223, 223, 223)}):Play()
					TweenService:Create(Dot_1, TweenInfo.new(GlobalValues.GlobalToggleSpeed), {Position = UDim2.new(0.58, 0, 0.5, 0)}):Play()
				else
					TweenService:Create(UIStroke_4, TweenInfo.new(GlobalValues.GlobalToggleSpeed), {Color = Color3.fromRGB(90, 90, 90)}):Play()
					TweenService:Create(Dot_1, TweenInfo.new(GlobalValues.GlobalToggleSpeed), {BackgroundColor3 = Color3.fromRGB(90, 90, 90)}):Play()
					TweenService:Create(Dot_1, TweenInfo.new(GlobalValues.GlobalToggleSpeed), {Position = UDim2.new(0.06, 0, 0.5, 0)}):Play()
				end

				coroutine.wrap(function()
					local Success, Error = pcall(function() Callback(Bool) end)
					if not Success then
						Library:FastNotify("Toggle Error", tostring(Error))
					end
				end)()
			end

			if type(Callback) == "function" then
				Button_3.MouseButton1Click:Connect(function()
					Bool = not Bool

					if IsExecutionEnv then
						SaveFlag(Toggles, Flag, Bool)
					end

					if Bool then
						TweenService:Create(UIStroke_4, TweenInfo.new(GlobalValues.GlobalToggleSpeed), {Color = Color3.fromRGB(223, 223, 223)}):Play()
						TweenService:Create(Dot_1, TweenInfo.new(GlobalValues.GlobalToggleSpeed), {BackgroundColor3 = Color3.fromRGB(223, 223, 223)}):Play()
						TweenService:Create(Dot_1, TweenInfo.new(GlobalValues.GlobalToggleSpeed), {Position = UDim2.new(0.58, 0, 0.5, 0)}):Play()
					else
						TweenService:Create(UIStroke_4, TweenInfo.new(GlobalValues.GlobalToggleSpeed), {Color = Color3.fromRGB(90, 90, 90)}):Play()
						TweenService:Create(Dot_1, TweenInfo.new(GlobalValues.GlobalToggleSpeed), {BackgroundColor3 = Color3.fromRGB(90, 90, 90)}):Play()
						TweenService:Create(Dot_1, TweenInfo.new(GlobalValues.GlobalToggleSpeed), {Position = UDim2.new(0.06, 0, 0.5, 0)}):Play()
					end

					coroutine.wrap(function()
						local Success, Error = pcall(function() Callback(Bool) end)
						if not Success then
							Library:FastNotify("Toggle Error", tostring(Error))
						end
					end)()
				end)
			end

			SelfActions =  {
				SetValue = function(self, value)
					if type(value) == "boolean" then
						coroutine.wrap(function()
							local Success, Error = pcall(function() Callback(value) end)
							if not Success then
								Library:FastNotify("Toggle Error", tostring(Error))
							end
						end)()

						if value == true then
							TweenService:Create(UIStroke_4, TweenInfo.new(GlobalValues.GlobalToggleSpeed), {Color = Color3.fromRGB(223, 223, 223)}):Play()
							TweenService:Create(Dot_1, TweenInfo.new(GlobalValues.GlobalToggleSpeed), {BackgroundColor3 = Color3.fromRGB(223, 223, 223)}):Play()
							TweenService:Create(Dot_1, TweenInfo.new(GlobalValues.GlobalToggleSpeed), {Position = UDim2.new(0.58, 0, 0.5, 0)}):Play()
						else
							TweenService:Create(UIStroke_4, TweenInfo.new(GlobalValues.GlobalToggleSpeed), {Color = Color3.fromRGB(90, 90, 90)}):Play()
							TweenService:Create(Dot_1, TweenInfo.new(GlobalValues.GlobalToggleSpeed), {BackgroundColor3 = Color3.fromRGB(90, 90, 90)}):Play()
							TweenService:Create(Dot_1, TweenInfo.new(GlobalValues.GlobalToggleSpeed), {Position = UDim2.new(0.06, 0, 0.5, 0)}):Play()
						end
					else
						Library:CreateNotification({
							Title = "Ventures - action error",
							Content = "SetValue failed, make sure the value is a boolean.",
							Duration = 4
						})
					end
				end
			}

			if IsExecutionEnv then
			local Flags = GetFlags(Toggles)
				for i, v in next, Flags do
					if i == Flag and v ~= nil then
						SelfActions:SetValue(v)
					end
				end
			end
			return SelfActions
		end

		--//Init, Slider
		function Elements:CreateSlider(Info4)
			local SelfActions = {}

			local Flag = Info4.Flag or ""
			local Callback = Info4.Callback
			local Default, MaxValue, MinValue, Increment = Info4.Default, Info4.MaxValue, Info4.MinValue, Info4.Increment

			local Slider_1 = Instance.new("Frame")
			local UICorner_13 = Instance.new("UICorner")
			local UIStroke_7 = Instance.new("UIStroke")
			local UIGradient_7 = Instance.new("UIGradient")
			local SliderDescription_1 = Instance.new("TextLabel")
			local SliderName_1 = Instance.new("TextLabel")
			local SliderHolder_1 = Instance.new("Frame")
			local Maximum_1 = Instance.new("Frame")
			local Percent_1 = Instance.new("Frame")
			local UICorner_14 = Instance.new("UICorner")
			local Dot_3 = Instance.new("TextButton")
			local UICorner_15 = Instance.new("UICorner")
			local UICorner_16 = Instance.new("UICorner")
			local ValueInput_1 = Instance.new("TextLabel")
			local UIGradient_8 = Instance.new("UIGradient")

			Slider_1.Name = "Slider"
			Slider_1.Parent = TabContainer_1
			Slider_1.BackgroundColor3 = Color3.fromRGB(66,66,66)
			Slider_1.BackgroundTransparency = 0.6000000238418579
			Slider_1.BorderColor3 = Color3.fromRGB(0,0,0)
			Slider_1.BorderSizePixel = 0
			Slider_1.Position = UDim2.new(-0.352963328, 0,0.0546318293, 0)
			Slider_1.Size = UDim2.new(0, 453,0, 66)

			UICorner_13.Parent = Slider_1
			UICorner_13.CornerRadius = UDim.new(0,5)

			UIStroke_7.Parent = Slider_1
			UIStroke_7.Color = Color3.fromRGB(74,74,74)
			UIStroke_7.Thickness = 1

			UIGradient_7.Parent = UIStroke_7
			UIGradient_7.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,0), NumberSequenceKeypoint.new(1,0.757764)}

			SliderDescription_1.Name = "SliderDescription"
			SliderDescription_1.Parent = Slider_1
			SliderDescription_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			SliderDescription_1.BackgroundTransparency = 1
			SliderDescription_1.BorderColor3 = Color3.fromRGB(0,0,0)
			SliderDescription_1.BorderSizePixel = 0
			SliderDescription_1.Position = UDim2.new(0.0147996107, 0,0.348484844, 0)
			SliderDescription_1.Size = UDim2.new(0, 265,0, 38)
			SliderDescription_1.FontFace = FontType
			SliderDescription_1.Text = Info4.Description or ""
			SliderDescription_1.TextColor3 = Color3.fromRGB(unpack(GlobalValues.GlobalDescriptionColor))
			SliderDescription_1.TextSize = 14
			SliderDescription_1.TextWrapped = true
			SliderDescription_1.TextXAlignment = Enum.TextXAlignment.Left
			SliderDescription_1.TextYAlignment = Enum.TextYAlignment.Top

			SliderName_1.Name = "SliderName"
			SliderName_1.Parent = Slider_1
			SliderName_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			SliderName_1.BackgroundTransparency = 1
			SliderName_1.BorderColor3 = Color3.fromRGB(0,0,0)
			SliderName_1.BorderSizePixel = 0
			SliderName_1.Position = UDim2.new(0.0147992065, 0,0, 0)
			SliderName_1.Size = UDim2.new(0, 349,0, 23)
			SliderName_1.FontFace = FontType
			SliderName_1.Text =  Info4.Name or "Slider"
			SliderName_1.TextColor3 = Color3.fromRGB(255,255,255)
			SliderName_1.TextSize = 14
			SliderName_1.TextXAlignment = Enum.TextXAlignment.Left

			SliderHolder_1.Name = "SliderHolder"
			SliderHolder_1.Parent = Slider_1
			SliderHolder_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			SliderHolder_1.BackgroundTransparency = 1
			SliderHolder_1.BorderColor3 = Color3.fromRGB(0,0,0)
			SliderHolder_1.BorderSizePixel = 0
			SliderHolder_1.Position = UDim2.new(0.619656146, 0,0.227272734, 0)
			SliderHolder_1.Size = UDim2.new(0, 162,0, 36)

			Maximum_1.Name = "Maximum"
			Maximum_1.Parent = SliderHolder_1
			Maximum_1.BackgroundColor3 = Color3.fromRGB(103,103,103)
			Maximum_1.BorderColor3 = Color3.fromRGB(0,0,0)
			Maximum_1.BorderSizePixel = 0
			Maximum_1.Position = UDim2.new(-0.00666666683, 0,0.472222209, 0)
			Maximum_1.Size = UDim2.new(0, 130,0, 2)

			Percent_1.Name = "Percent"
			Percent_1.Parent = Maximum_1
			Percent_1.BackgroundColor3 = Color3.fromRGB(188,188,188)
			Percent_1.BorderColor3 = Color3.fromRGB(0,0,0)
			Percent_1.BorderSizePixel = 0
			Percent_1.Size = UDim2.new(0.600000024, 0,1, 0)

			UICorner_14.Parent = Percent_1
			UICorner_14.CornerRadius = UDim.new(1,0)

			Dot_3.Name = "Dot"
			Dot_3.Parent = Percent_1
			Dot_3.Active = true
			Dot_3.AnchorPoint = Vector2.new(0, 0.5)
			Dot_3.BackgroundColor3 = Color3.fromRGB(188,188,188)
			Dot_3.BorderColor3 = Color3.fromRGB(0,0,0)
			Dot_3.BorderSizePixel = 0
			Dot_3.Position = UDim2.new(1, 0,0.5, 0)
			Dot_3.Size = UDim2.new(0, 10,0, 10)
			Dot_3.FontFace = FontType
			Dot_3.Text = ""
			Dot_3.TextSize = 14

			UICorner_15.Parent = Dot_3
			UICorner_15.CornerRadius = UDim.new(1,0)

			UICorner_16.Parent = Maximum_1
			UICorner_16.CornerRadius = UDim.new(1,0)

			ValueInput_1.Name = "ValueInput"
			ValueInput_1.Parent = SliderHolder_1
			ValueInput_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			ValueInput_1.BackgroundTransparency = 1
			ValueInput_1.BorderColor3 = Color3.fromRGB(0,0,0)
			ValueInput_1.BorderSizePixel = 0
			ValueInput_1.Position = UDim2.new(0.872196138, 0,0.166666672, 0)
			ValueInput_1.Size = UDim2.new(0, 25,0, 23)
			ValueInput_1.FontFace = FontType
			ValueInput_1.Text = tostring(Default) or "error!"
			ValueInput_1.TextColor3 = Color3.fromRGB(255,255,255)
			ValueInput_1.TextSize = 14
			ValueInput_1.TextWrapped = true
			ValueInput_1.TextXAlignment = Enum.TextXAlignment.Left

			UIGradient_8.Parent = Slider_1
			UIGradient_8.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(213, 213, 213)), ColorSequenceKeypoint.new(1, Color3.fromRGB(16, 16, 16))}
			UIGradient_8.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,0.335404), NumberSequenceKeypoint.new(1,0.795031)}

			local Value = Default or MinValue
			local IsDragging = false

			if Default ~= nil then
				local percentv = (Default - MinValue) / (MaxValue - MinValue)
				Percent_1.Size = UDim2.new(percentv, 0, 1, 0)
				Dot_3.Position = UDim2.new(1, 0,0.5, 0)
				ValueInput_1.Text = tostring(Default)

				if type(Callback) == "function" then
					coroutine.wrap(function()
						local Success, Error = pcall(function() Callback(Default) end)
						if not Success then
							Library:FastNotify("Slider Error", tostring(Error))
						end
					end)()
				end

			elseif MinValue ~= nil then
				Percent_1.Size = UDim2.new(0, 0, 1, 0)
				Dot_3.Position = UDim2.new(1, 0,0.5, 0)
				ValueInput_1.Text = tostring(MinValue)

				if type(Callback) == "function" then
					coroutine.wrap(function()
						local Success, Error = pcall(function() Callback(MinValue) end)
						if not Success then
							Library:FastNotify("Slider Error", tostring(Error))
						end
					end)()
				end
			end

			Dot_3.MouseButton1Down:Connect(function()
				IsDragging = true
			end)

			UserInputService.InputEnded:Connect(function(inp)
				if inp.UserInputType == Enum.UserInputType.MouseButton1 then
					IsDragging = false
				end
			end)

			RunService.RenderStepped:Connect(function()
				if IsDragging then
					local Position = UserInputService:GetMouseLocation().X
					local abss = Maximum_1.AbsolutePosition.X
					local widthq = Maximum_1.AbsoluteSize.X
					local percentv = math.clamp((Position - abss) / widthq, 0, 1)

					Value = math.floor(((MinValue + ((MaxValue - MinValue) * percentv)) / Increment) + 0.5) * Increment
					ValueInput_1.Text = string.format("%." .. tostring(math.log10(1 / Increment)) .. "f", Value)
					if IsExecutionEnv then
						SaveFlag(Sliders, Flag, Value)
					end
					local Tween1 = TweenService:Create(Dot_3, TweenInfo.new(GlobalValues.GlobalSliderSpeed, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(1, 0, 0.5, 0)})
					local Tween2 = TweenService:Create(Percent_1, TweenInfo.new(GlobalValues.GlobalSliderSpeed, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(percentv, 0, 1, 0)})

					Tween1:Play()
					Tween2:Play()

					if type(Callback) == "function" then
						coroutine.wrap(function()
							local Success, Error = pcall(function() Callback(Value) end)
							if not Success then
								Library:FastNotify("Slider Error", tostring(Error))
							end
						end)()
					end
				end
			end)

			SelfActions =  {
				SetValue = function(self, value)
					value = math.clamp(value, MinValue, MaxValue)
					local percentv = (value - MinValue) / (MaxValue - MinValue)

					Value = value
					ValueInput_1.Text = string.format("%." .. tostring(math.log10(1 / Increment)) .. "f", Value)

					local Tween1 = TweenService:Create(Dot_3, TweenInfo.new(GlobalValues.GlobalSliderSpeed, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(percentv, 0, 0.5, 0)})
					local Tween2 = TweenService:Create(Percent_1, TweenInfo.new(GlobalValues.GlobalSliderSpeed, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(percentv, 0, 1, 0)})

					Tween1:Play()
					Tween2:Play()

					if type(Callback) == "function" then
						coroutine.wrap(function()
							local Success, Error = pcall(function() Callback(value) end)
							if not Success then
								Library:FastNotify("Slider Error", tostring(Error))
							end
						end)()
					end
				end,
			}

			local Flags = GetFlags(Sliders)

			for i, v in next, Flags do
				if i == Flag and v ~= nil then
					SelfActions:SetValue(v)
				end
			end

			return SelfActions
		end
		--//Init, Section
		function Elements:CreateSection(Info5)
			local Section_1 = Instance.new("TextLabel")

			Section_1.Name = Info5.Title or "Section"
			Section_1.Parent = TabContainer_1
			Section_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			Section_1.BackgroundTransparency = 1
			Section_1.BorderColor3 = Color3.fromRGB(0,0,0)
			Section_1.BorderSizePixel = 0
			Section_1.Position = UDim2.new(0.0201271195, 0,0.430288464, 0)
			Section_1.Size = UDim2.new(0, 453,0, 20)
			Section_1.FontFace = FontType
			Section_1.Text = Info5.Title or "Section"
			Section_1.TextColor3 = Color3.fromRGB(222,222,222)
			Section_1.TextSize = 14
			Section_1.TextXAlignment = Enum.TextXAlignment.Left
		end

		--//Init, Input
		function Elements:CreateInput(Info6)
			local SelfActions = {}

			local Flag = Info6.Flag or ""
			local Default = Info6.Default or "Text"
			local Placeholder = Info6.Placeholder or "Text"
			local Callback = Info6.Callback

			local Input = Instance.new("Frame")
			local UICorner_1 = Instance.new("UICorner")
			local UIStroke_1 = Instance.new("UIStroke")
			local UIGradient_1 = Instance.new("UIGradient")
			local UIGradient_2 = Instance.new("UIGradient")
			local InputDescription_1 = Instance.new("TextLabel")
			local InputHolder_1 = Instance.new("Frame")
			local Input_1 = Instance.new("TextBox")
			local UIStroke_2 = Instance.new("UIStroke")
			local UICorner_2 = Instance.new("UICorner")
			local InputName_1 = Instance.new("TextLabel")

			Input.Name = "Input"
			Input.Parent = TabContainer_1
			Input.BackgroundColor3 = Color3.fromRGB(66,66,66)
			Input.BackgroundTransparency = 0.6000000238418579
			Input.BorderColor3 = Color3.fromRGB(0,0,0)
			Input.BorderSizePixel = 0
			Input.Position = UDim2.new(-0.352963328, 0,0.0546318293, 0)
			Input.Size = UDim2.new(0, 453,0, 66)

			UICorner_1.Parent = Input
			UICorner_1.CornerRadius = UDim.new(0,5)

			UIStroke_1.Parent = Input
			UIStroke_1.Color = Color3.fromRGB(74,74,74)
			UIStroke_1.Thickness = 1

			UIGradient_1.Parent = UIStroke_1
			UIGradient_1.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,0), NumberSequenceKeypoint.new(1,0.757764)}

			UIGradient_2.Parent = Input
			UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(213, 213, 213)), ColorSequenceKeypoint.new(1, Color3.fromRGB(16, 16, 16))}
			UIGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,0.335404), NumberSequenceKeypoint.new(1,0.795031)}

			InputDescription_1.Name = "InputDescription"
			InputDescription_1.Parent = Input
			InputDescription_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			InputDescription_1.BackgroundTransparency = 1
			InputDescription_1.BorderColor3 = Color3.fromRGB(0,0,0)
			InputDescription_1.BorderSizePixel = 0
			InputDescription_1.Position = UDim2.new(0.0147992065, 0,0.348484844, 0)
			InputDescription_1.Size = UDim2.new(0, 300,0, 38)
			InputDescription_1.FontFace = FontType
			InputDescription_1.Text = Info6.Description or ""
			InputDescription_1.TextColor3  = Color3.fromRGB(unpack(GlobalValues.GlobalDescriptionColor))
			InputDescription_1.TextSize = 14
			InputDescription_1.TextWrapped = true
			InputDescription_1.TextXAlignment = Enum.TextXAlignment.Left
			InputDescription_1.TextYAlignment = Enum.TextYAlignment.Top

			InputHolder_1.Name = "InputHolder"
			InputHolder_1.Parent = Input
			InputHolder_1.BackgroundColor3 = Color3.fromRGB(63,63,63)
			InputHolder_1.BackgroundTransparency = 1
			InputHolder_1.BorderColor3 = Color3.fromRGB(0,0,0)
			InputHolder_1.BorderSizePixel = 0
			InputHolder_1.Position = UDim2.new(0.699125648, 0,0.227272734, 0)
			InputHolder_1.Size = UDim2.new(0, 119,0, 35)

			local SpecialUiList = Instance.new("UIListLayout")
			SpecialUiList.Parent = InputHolder_1
			SpecialUiList.VerticalAlignment = Enum.VerticalAlignment.Center
			SpecialUiList.HorizontalAlignment = Enum.HorizontalAlignment.Right

			Input_1.Name = "Input"
			Input_1.Parent = InputHolder_1
			Input_1.Active = true
			Input_1.BackgroundColor3 = Color3.fromRGB(63,63,63)
			Input_1.BackgroundTransparency = 0.6000000238418579
			Input_1.BorderColor3 = Color3.fromRGB(0,0,0)
			Input_1.BorderSizePixel = 0
			Input_1.CursorPosition = -1
			Input_1.Position = UDim2.new(0.310255557, 0,0, 0)
			Input_1.Size = UDim2.new(0.676299095, 0,1, 0)
			Input_1.Font = Enum.Font.SourceSansBold
			Input_1.PlaceholderColor3 = Color3.fromRGB(126,126,126)
			Input_1.PlaceholderText = Placeholder or "Input"
			Input_1.Text = Default or "Input"
			Input_1.TextColor3 = Color3.fromRGB(255,255,255)
			Input_1.TextWrapped = true
			Input_1.TextSize = 14

			UIStroke_2.Parent = Input_1
			UIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			UIStroke_2.Color = Color3.fromRGB(108,108,108)
			UIStroke_2.Thickness = 1.2999999523162842

			UICorner_2.Parent = Input_1
			UICorner_2.CornerRadius = UDim.new(0,5)

			InputName_1.Name = "InputName"
			InputName_1.Parent = Input
			InputName_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			InputName_1.BackgroundTransparency = 1
			InputName_1.BorderColor3 = Color3.fromRGB(0,0,0)
			InputName_1.BorderSizePixel = 0
			InputName_1.Position = UDim2.new(0.0147992065, 0,0, 0)
			InputName_1.Size = UDim2.new(0, 349,0, 23)
			InputName_1.FontFace = FontType
			InputName_1.Text = Info6.Name or "Input"
			InputName_1.TextColor3 = Color3.fromRGB(255,255,255)
			InputName_1.TextSize = 14
			InputName_1.TextXAlignment = Enum.TextXAlignment.Left

			if type(Callback) == "function" then
				Input_1:GetPropertyChangedSignal("Text"):Connect(function()
					if #Input_1.Text > 14 then Input_1.TextScaled = true end
				end)

				Input_1.FocusLost:Connect(function(Prsd)
					if Info6.IgnoreBlank and Input_1.Text == "" then
						return
					end
					if (not Info6.Finished or Prsd) and Info6.Callback then
						if Info6.Numeric then
							local Number = tonumber(Input_1.Text)
							if Number then
								coroutine.wrap(function()
									local Success, Error = pcall(function() Callback(Number) end)
									SaveFlag(Inputs, Flag, Number)
									if not Success then
										Library:FastNotify("Input Error", tostring(Error))
									end
								end)()
							else
								Library:FastNotify("Input Error", "Error at Input: ".. Info6.Title .. "")
							end
						else
							coroutine.wrap(function()
								local Success, Error = pcall(function() Callback(Input_1.Text) end)
								SaveFlag(Inputs, Flag, Input_1.Text)
								if not Success then
									Library:FastNotify("Input Error", tostring(Error))
								end
							end)()
						end
					end
				end)

				SelfActions =  {
					SetValue = function(self, value)
						Input_1.Text = value
						if Callback then
							coroutine.wrap(function()
								local Success, Error = pcall(function() Callback(value) end)
								if not Success then
									Library:FastNotify("Input Error", tostring(Error))
								end
							end)()
						end
					end,
				}
			else
				Library:FastNotify("Input Error", "Use a function for callback!")
			end

			local Flags = GetFlags(Inputs)

			for i, v in next, Flags do
				if i == Flag and v ~= nil then
					SelfActions:SetValue(v)
				end
			end

			return SelfActions
		end

		--//Init, Keybind
		function Elements:CreateKeybind(Info7)
			local SelfActions = {}

			local Flag = Info7.Flag or ""
			local CurrentKeybind = Info7.Default or Enum.KeyCode.RightControl
			local IsSelecting = false
			local Callback = Info7.Callback

			local Keybind_1 = Instance.new("Frame")
			local UICorner_19 = Instance.new("UICorner")
			local UIStroke_10 = Instance.new("UIStroke")
			local UIGradient_11 = Instance.new("UIGradient")
			local UIGradient_12 = Instance.new("UIGradient")
			local KeybindDescription_1 = Instance.new("TextLabel")
			local KeybindHolder_1 = Instance.new("Frame")
			local Keybind_2 = Instance.new("TextButton")
			local UIStroke_11 = Instance.new("UIStroke")
			local UICorner_20 = Instance.new("UICorner")
			local KeybindName_1 = Instance.new("TextLabel")
			local SpecialUiList = Instance.new("UIListLayout")

			Keybind_1.Name = Info7.Name or "Keybind"
			Keybind_1.Parent = TabContainer_1
			Keybind_1.BackgroundColor3 = Color3.fromRGB(66,66,66)
			Keybind_1.BackgroundTransparency = 0.6000000238418579
			Keybind_1.BorderColor3 = Color3.fromRGB(0,0,0)
			Keybind_1.BorderSizePixel = 0
			Keybind_1.Position = UDim2.new(-0.352963328, 0,0.0546318293, 0)
			Keybind_1.Size = UDim2.new(0, 453,0, 66)

			UICorner_19.Parent = Keybind_1
			UICorner_19.CornerRadius = UDim.new(0,5)

			UIStroke_10.Parent = Keybind_1
			UIStroke_10.Color = Color3.fromRGB(74,74,74)
			UIStroke_10.Thickness = 1

			UIGradient_11.Parent = UIStroke_10
			UIGradient_11.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,0), NumberSequenceKeypoint.new(1,0.757764)}

			UIGradient_12.Parent = Keybind_1
			UIGradient_12.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(213, 213, 213)), ColorSequenceKeypoint.new(1, Color3.fromRGB(16, 16, 16))}
			UIGradient_12.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,0.335404), NumberSequenceKeypoint.new(1,0.795031)}

			KeybindDescription_1.Name = "KeybindDescription"
			KeybindDescription_1.Parent = Keybind_1
			KeybindDescription_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			KeybindDescription_1.BackgroundTransparency = 1
			KeybindDescription_1.BorderColor3 = Color3.fromRGB(0,0,0)
			KeybindDescription_1.BorderSizePixel = 0
			KeybindDescription_1.Position = UDim2.new(0.0147992065, 0,0.348484844, 0)
			KeybindDescription_1.Size = UDim2.new(0, 340,0, 38)
			KeybindDescription_1.FontFace = FontType
			KeybindDescription_1.Text = Info7.Description or ""
			KeybindDescription_1.TextColor3  = Color3.fromRGB(unpack(GlobalValues.GlobalDescriptionColor))
			KeybindDescription_1.TextSize = 14
			KeybindDescription_1.TextWrapped = true
			KeybindDescription_1.TextXAlignment = Enum.TextXAlignment.Left
			KeybindDescription_1.TextYAlignment = Enum.TextYAlignment.Top

			KeybindHolder_1.Name = "KeybindHolder"
			KeybindHolder_1.Parent = Keybind_1
			KeybindHolder_1.BackgroundColor3 = Color3.fromRGB(63,63,63)
			KeybindHolder_1.BackgroundTransparency = 1
			KeybindHolder_1.BorderColor3 = Color3.fromRGB(0,0,0)
			KeybindHolder_1.BorderSizePixel = 0
			KeybindHolder_1.Position = UDim2.new(0.780627549, 0,0.227272734, 0)
			KeybindHolder_1.Size = UDim2.new(0, 85,0, 35)

			SpecialUiList.Parent = KeybindHolder_1
			SpecialUiList.VerticalAlignment = Enum.VerticalAlignment.Center
			SpecialUiList.HorizontalAlignment = Enum.HorizontalAlignment.Right

			Keybind_2.Name = "Keybind"
			Keybind_2.Parent = KeybindHolder_1
			Keybind_2.Active = true
			Keybind_2.BackgroundColor3 = Color3.fromRGB(63,63,63)
			Keybind_2.BackgroundTransparency = 0.6000000238418579
			Keybind_2.BorderColor3 = Color3.fromRGB(0,0,0)
			Keybind_2.BorderSizePixel = 0
			Keybind_2.Size = UDim2.new(1, 0,1, 0)
			Keybind_2.Font = Enum.Font.SourceSansBold
			Keybind_2.Text = CurrentKeybind.Name or ""
			Keybind_2.TextColor3 = Color3.fromRGB(255,255,255)
			Keybind_2.TextSize = 14

			UIStroke_11.Parent = Keybind_2
			UIStroke_11.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			UIStroke_11.Color = Color3.fromRGB(108,108,108)
			UIStroke_11.Thickness = 1.2999999523162842

			UICorner_20.Parent = Keybind_2
			UICorner_20.CornerRadius = UDim.new(0,5)

			KeybindName_1.Name = "KeybindName"
			KeybindName_1.Parent = Keybind_1
			KeybindName_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			KeybindName_1.BackgroundTransparency = 1
			KeybindName_1.BorderColor3 = Color3.fromRGB(0,0,0)
			KeybindName_1.BorderSizePixel = 0
			KeybindName_1.Position = UDim2.new(0.0147992065, 0,0, 0)
			KeybindName_1.Size = UDim2.new(0, 349,0, 23)
			KeybindName_1.FontFace = FontType
			KeybindName_1.Text = Info7.Name or "Keybind"
			KeybindName_1.TextColor3 = Color3.fromRGB(255,255,255)
			KeybindName_1.TextSize = 14
			KeybindName_1.TextXAlignment = Enum.TextXAlignment.Left

			Keybind_2.MouseButton1Click:Connect(function()
				Keybind_2.Text = "Press any key..."
				IsSelecting = true
			end)

			Keybind_2:GetPropertyChangedSignal("Text"):Connect(function()
				local TextSize = Keybind_2.TextBounds.X

				TweenService:Create(Keybind_2, TweenInfo.new(0.2), {Size = UDim2.new(0, TextSize + 12, Keybind_2.Size.Y.Scale, 0)}):Play()
				TweenService:Create(Keybind_2, TweenInfo.new(0.3), {Position = UDim2.new(0, 85 - Keybind_2.Position.X.Offset, 0,0)}):Play()
			end)

			local TextSize = Keybind_2.TextBounds.X

			TweenService:Create(Keybind_2, TweenInfo.new(0.3), {Size = UDim2.new(0, TextSize + 12, Keybind_2.Size.Y.Scale, 0)}):Play()
			TweenService:Create(Keybind_2, TweenInfo.new(0.3), {Position = UDim2.new(0, 85 - Keybind_2.Position.X.Offset, 0,0)}):Play()

			UserInputService.InputBegan:Connect(function(input, procesed)
				if IsSelecting and not procesed then
					if input.UserInputType == Enum.UserInputType.Keyboard then
						CurrentKeybind = input.KeyCode
						Keybind_2.Text = input.KeyCode.Name
					elseif input.UserInputType == Enum.UserInputType.MouseButton1 or 
						input.UserInputType == Enum.UserInputType.MouseButton2 then
						CurrentKeybind = input.UserInputType
						Keybind_2.Text = input.UserInputType.Name
					end
					IsSelecting = false
				elseif input.KeyCode == CurrentKeybind and not IsSelecting then
					coroutine.wrap(function()
						local Success, Error = pcall(function() Callback(CurrentKeybind) end)
						SaveFlag(Keybinds, Flag, CurrentKeybind)
						if not Success then
							Library:FastNotify("Keybind Error", tostring(Error))
						end
					end)()
				elseif input.UserInputType == CurrentKeybind and not IsSelecting then
					coroutine.wrap(function()
						local Success, Error = pcall(function() Callback(CurrentKeybind) end)
						SaveFlag(Keybinds, Flag, CurrentKeybind)
						if not Success then
							Library:FastNotify("Keybind Error", tostring(Error))
						end
					end)()
				end
			end)

			SelfActions = {
				SetKeybind = function(self, NewKeybind)
					CurrentKeybind = NewKeybind

					if typeof(NewKeybind) == "EnumItem" then
						Keybind_2.Text = NewKeybind.Name
					else
						Keybind_2.Text = tostring(NewKeybind)
					end

					if Callback then
						local Success, Error = pcall(function() Callback(CurrentKeybind) end)
						if not Success then
							Library:FastNotify("Keybind Error", tostring(Error))
						end
					end
					SaveFlag(Keybinds, Flag, CurrentKeybind)
				end
			}

			local Flags = GetFlags(Keybinds)

			for i, v in next, Flags do
				if i == Flag and v ~= nil then
					SelfActions:SetKeybind(v)
				end
			end

			return SelfActions
		end

		--//Init, Button
		function Elements:CreateButton(Info8)
			local Callback = Info8.Callback

			local Button_5 = Instance.new("Frame")
			local UICorner_17 = Instance.new("UICorner")
			local UIStroke_8 = Instance.new("UIStroke")
			local UIGradient_9 = Instance.new("UIGradient")
			local ButtonDescription_1 = Instance.new("TextLabel")
			local ButtonName_1 = Instance.new("TextLabel")
			local ButtonHolder_1 = Instance.new("Frame")
			local UICorner_18 = Instance.new("UICorner")
			local UIStroke_9 = Instance.new("UIStroke")
			local PickButton_1 = Instance.new("TextButton")
			local ImageLabel_1 = Instance.new("ImageLabel")
			local UIGradient_10 = Instance.new("UIGradient")

			Button_5.Name = "Button"
			Button_5.Parent = TabContainer_1
			Button_5.BackgroundColor3 = Color3.fromRGB(66,66,66)
			Button_5.BackgroundTransparency = 0.6000000238418579
			Button_5.BorderColor3 = Color3.fromRGB(0,0,0)
			Button_5.BorderSizePixel = 0
			Button_5.Position = UDim2.new(-0.352963328, 0,0.0546318293, 0)
			Button_5.Size = UDim2.new(0, 453,0, 66)

			UICorner_17.Parent = Button_5
			UICorner_17.CornerRadius = UDim.new(0,5)

			UIStroke_8.Parent = Button_5
			UIStroke_8.Color = Color3.fromRGB(74,74,74)
			UIStroke_8.Thickness = 1

			UIGradient_9.Parent = UIStroke_8
			UIGradient_9.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,0), NumberSequenceKeypoint.new(1,0.757764)}

			ButtonDescription_1.Name = "ButtonDescription"
			ButtonDescription_1.Parent = Button_5
			ButtonDescription_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			ButtonDescription_1.BackgroundTransparency = 1
			ButtonDescription_1.BorderColor3 = Color3.fromRGB(0,0,0)
			ButtonDescription_1.BorderSizePixel = 0
			ButtonDescription_1.Position = UDim2.new(0.0147992065, 0,0.348484844, 0)
			ButtonDescription_1.Size = UDim2.new(0, 349,0, 38)
			ButtonDescription_1.FontFace = FontType
			ButtonDescription_1.Text = Info8.Description or ""
			ButtonDescription_1.TextColor3  = Color3.fromRGB(unpack(GlobalValues.GlobalDescriptionColor))
			ButtonDescription_1.TextSize = 14
			ButtonDescription_1.TextWrapped = true
			ButtonDescription_1.TextXAlignment = Enum.TextXAlignment.Left
			ButtonDescription_1.TextYAlignment = Enum.TextYAlignment.Top

			ButtonName_1.Name = "ButtonName"
			ButtonName_1.Parent = Button_5
			ButtonName_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			ButtonName_1.BackgroundTransparency = 1
			ButtonName_1.BorderColor3 = Color3.fromRGB(0,0,0)
			ButtonName_1.BorderSizePixel = 0
			ButtonName_1.Position = UDim2.new(0.0147992065, 0,0, 0)
			ButtonName_1.Size = UDim2.new(0, 349,0, 23)
			ButtonName_1.FontFace = FontType
			ButtonName_1.Text = Info8.Name or "Button"
			ButtonName_1.TextColor3 = Color3.fromRGB(255,255,255)
			ButtonName_1.TextSize = 14
			ButtonName_1.TextXAlignment = Enum.TextXAlignment.Left

			ButtonHolder_1.Name = "ButtonHolder"
			ButtonHolder_1.Parent = Button_5
			ButtonHolder_1.BackgroundColor3 = Color3.fromRGB(63,63,63)
			ButtonHolder_1.BackgroundTransparency = 1
			ButtonHolder_1.BorderColor3 = Color3.fromRGB(0,0,0)
			ButtonHolder_1.BorderSizePixel = 0
			ButtonHolder_1.Position = UDim2.new(0.878587186, 0,0.196969703, 0)
			ButtonHolder_1.Size = UDim2.new(0, 40,0, 40)

			local SpecialUiList = Instance.new("UIListLayout")
			SpecialUiList.Parent= ButtonHolder_1
			SpecialUiList.VerticalAlignment = Enum.VerticalAlignment.Center
			SpecialUiList.HorizontalAlignment = Enum.HorizontalAlignment.Center

			PickButton_1.Name = "PickButton"
			PickButton_1.Parent = ButtonHolder_1
			PickButton_1.Active = true
			PickButton_1.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
			PickButton_1.BackgroundTransparency = 0.6
			PickButton_1.BorderColor3 = Color3.fromRGB(0,0,0)
			PickButton_1.BorderSizePixel = 0
			PickButton_1.Size = UDim2.new(1, 0,1, 0)
			PickButton_1.FontFace = FontType
			PickButton_1.Text = ""
			PickButton_1.TextSize = 14

			UICorner_18.Parent = PickButton_1
			UICorner_18.CornerRadius = UDim.new(0,5)

			UIStroke_9.Parent = PickButton_1
			UIStroke_9.Color = Color3.fromRGB(108,108,108)
			UIStroke_9.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			UIStroke_9.Thickness = 1.2999999523162842

			ImageLabel_1.Parent = PickButton_1
			ImageLabel_1.AnchorPoint = Vector2.new(0.5, 0.5)
			ImageLabel_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			ImageLabel_1.BackgroundTransparency = 1
			ImageLabel_1.BorderColor3 = Color3.fromRGB(0,0,0)
			ImageLabel_1.BorderSizePixel = 0
			ImageLabel_1.Position = UDim2.new(0.5, 0,0.5, 0)
			ImageLabel_1.Size = UDim2.new(0.75, 0,0.75, 0)
			ImageLabel_1.Image = "rbxassetid://10734898355"

			UIGradient_10.Parent = Button_5
			UIGradient_10.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(213, 213, 213)), ColorSequenceKeypoint.new(1, Color3.fromRGB(16, 16, 16))}
			UIGradient_10.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,0.335404), NumberSequenceKeypoint.new(1,0.795031)}

			local Debounce2 = false
			PickButton_1.MouseButton1Click:Connect(function()
				if Debounce2 then return end
				Debounce2 = true

				coroutine.wrap(function()
					local Success, Error = pcall(function() Callback() end)

					TweenService:Create(UIStroke_9, TweenInfo.new(0.3), {Color = Color3.fromRGB(255, 255, 255)}):Play()
					TweenService:Create(PickButton_1, TweenInfo.new(0.17), {Size = UDim2.new(0.9,0,0.9,0)}):Play()
					task.wait(0.2)
					TweenService:Create(UIStroke_9, TweenInfo.new(0.3), {Color = Color3.fromRGB(108,108,108)}):Play()
					TweenService:Create(PickButton_1, TweenInfo.new(0.17), {Size = UDim2.new(1,0,1,0)}):Play()

					if not Success then
						Library:FastNotify("Button Error", tostring(Error))
					end
				end)()

				task.wait(0.3)
				Debounce2 = false
			end)

			return {
				Click = function(self)
					coroutine.wrap(function()
						local Success, Error = pcall(function() Callback() end)

						TweenService:Create(UIStroke_9, TweenInfo.new(0.3), {Color = Color3.fromRGB(165, 165, 165)}):Play()
						TweenService:Create(PickButton_1, TweenInfo.new(0.17), {Size = UDim2.new(0.9,0,0.9,0)}):Play()
						task.wait(0.2)
						TweenService:Create(UIStroke_9, TweenInfo.new(0.3), {Color = Color3.fromRGB(108,108,108)}):Play()
						TweenService:Create(PickButton_1, TweenInfo.new(0.17), {Size = UDim2.new(1,0,1,0)}):Play()

						if not Success then
							Library:FastNotify("Button Error", tostring(Error))
						end
					end)()
				end,
			}
		end

		--//init, dropdown
		function Elements:CreateDropdown(Info9)
			local SelfActions = {}

			local Flag = Info9.Flag or ""
			local Callback = Info9.Callback
			local Values = Info9.Values or {}
			local CallbackOnDefault = Info9.CallbackOnDefault or false

			local Dropdown_1 = Instance.new("Frame")
			local UICorner_21 = Instance.new("UICorner")
			local UIStroke_12 = Instance.new("UIStroke")
			local UIGradient_13 = Instance.new("UIGradient")
			local UIGradient_14 = Instance.new("UIGradient")
			local DropdownDescription_1 = Instance.new("TextLabel")
			local DropdownHolder_1 = Instance.new("Frame")
			local DropdownButton_1 = Instance.new("TextButton")
			local UIPadding_2 = Instance.new("UIPadding")
			local UICorner_22 = Instance.new("UICorner")
			local UIStroke_13 = Instance.new("UIStroke")
			local ClickIcon_1 = Instance.new("ImageLabel")
			local ValuesHolder_1 = Instance.new("Frame")
			local UICorner_23 = Instance.new("UICorner")
			local UIStroke_14 = Instance.new("UIStroke")
			local UIListLayout_3 = Instance.new("UIListLayout")
			local DropdownName_1 = Instance.new("TextLabel")

			Dropdown_1.Name = "Dropdown"
			Dropdown_1.Parent = TabContainer_1
			Dropdown_1.BackgroundColor3 = Color3.fromRGB(66,66,66)
			Dropdown_1.BackgroundTransparency = 0.6000000238418579
			Dropdown_1.BorderColor3 = Color3.fromRGB(0,0,0)
			Dropdown_1.BorderSizePixel = 0
			Dropdown_1.Position = UDim2.new(-0.352963328, 0,0.0546318293, 0)
			Dropdown_1.Size = UDim2.new(0, 453,0, 66)
			Dropdown_1.ZIndex = 2

			UICorner_21.Parent = Dropdown_1
			UICorner_21.CornerRadius = UDim.new(0,5)

			UIStroke_12.Parent = Dropdown_1
			UIStroke_12.Color = Color3.fromRGB(74,74,74)
			UIStroke_12.Thickness = 1

			UIGradient_13.Parent = UIStroke_12
			UIGradient_13.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,0), NumberSequenceKeypoint.new(1,0.757764)}

			UIGradient_14.Parent = Dropdown_1
			UIGradient_14.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(213, 213, 213)), ColorSequenceKeypoint.new(1, Color3.fromRGB(16, 16, 16))}
			UIGradient_14.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,0.335404), NumberSequenceKeypoint.new(1,0.795031)}

			DropdownDescription_1.Name = "DropdownDescription"
			DropdownDescription_1.Parent = Dropdown_1
			DropdownDescription_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			DropdownDescription_1.BackgroundTransparency = 1
			DropdownDescription_1.BorderColor3 = Color3.fromRGB(0,0,0)
			DropdownDescription_1.BorderSizePixel = 0
			DropdownDescription_1.Position = UDim2.new(0.0147992065, 0,0.348484844, 0)
			DropdownDescription_1.Size = UDim2.new(0, 340,0, 38)
			DropdownDescription_1.FontFace = FontType
			DropdownDescription_1.Text = Info9.Description or ""
			DropdownDescription_1.TextColor3  = Color3.fromRGB(unpack(GlobalValues.GlobalDescriptionColor))
			DropdownDescription_1.TextSize = 14
			DropdownDescription_1.TextWrapped = true
			DropdownDescription_1.TextXAlignment = Enum.TextXAlignment.Left
			DropdownDescription_1.TextYAlignment = Enum.TextYAlignment.Top

			DropdownHolder_1.Name = "DropdownHolder"
			DropdownHolder_1.Parent = Dropdown_1
			DropdownHolder_1.BackgroundColor3 = Color3.fromRGB(63,63,63)
			DropdownHolder_1.BackgroundTransparency = 0.6000000238418579
			DropdownHolder_1.BorderColor3 = Color3.fromRGB(0,0,0)
			DropdownHolder_1.BorderSizePixel = 0
			DropdownHolder_1.Position = UDim2.new(0.751929939, 0,0.227272734, 0)
			DropdownHolder_1.Size = UDim2.new(0, 98,0, 35)

			DropdownButton_1.Name = "DropdownButton"
			DropdownButton_1.Parent = DropdownHolder_1
			DropdownButton_1.Active = true
			DropdownButton_1.BackgroundColor3 = Color3.fromRGB(76,58,93)
			DropdownButton_1.BackgroundTransparency = 1
			DropdownButton_1.BorderColor3 = Color3.fromRGB(0,0,0)
			DropdownButton_1.BorderSizePixel = 0
			DropdownButton_1.Size = UDim2.new(0.738527894, 0,1, 0)
			DropdownButton_1.FontFace = FontType
			DropdownButton_1.Text = Values[Info9.Default] or "Select..."
			DropdownButton_1.TextColor3 = Color3.fromRGB(255,255,255)
			DropdownButton_1.TextSize = 14
			DropdownButton_1.TextWrapped = true

			UIPadding_2.Parent = DropdownButton_1
			UIPadding_2.PaddingLeft = UDim.new(0,1)

			UICorner_22.Parent = DropdownHolder_1
			UICorner_22.CornerRadius = UDim.new(0,5)

			UIStroke_13.Parent = DropdownHolder_1
			UIStroke_13.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			UIStroke_13.Color = Color3.fromRGB(108,108,108)
			UIStroke_13.Thickness = 1.2999999523162842

			ClickIcon_1.Name = "ClickIcon"
			ClickIcon_1.Parent = DropdownHolder_1
			ClickIcon_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			ClickIcon_1.BackgroundTransparency = 1
			ClickIcon_1.BorderColor3 = Color3.fromRGB(0,0,0)
			ClickIcon_1.BorderSizePixel = 0
			ClickIcon_1.Position = UDim2.new(1.22619045, -39,0.614285707, -11)
			ClickIcon_1.Size = UDim2.new(0, 13,0, 13)
			ClickIcon_1.Image = "http://www.roblox.com/asset/?id=12338898398"

			ValuesHolder_1.Name = "ValuesHolder"
			ValuesHolder_1.Parent = DropdownHolder_1
			ValuesHolder_1.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
			ValuesHolder_1.BackgroundTransparency = 0
			ValuesHolder_1.BorderColor3 = Color3.fromRGB(0,0,0)
			ValuesHolder_1.BorderSizePixel = 0
			ValuesHolder_1.ZIndex = 2
			ValuesHolder_1.Position = UDim2.new(0.5, -49,2.31428576, -35)
			ValuesHolder_1.Size = UDim2.new(0, 98,0, 40)
			ValuesHolder_1.Visible = false

			UICorner_23.Parent = ValuesHolder_1
			UICorner_23.CornerRadius = UDim.new(0,5)

			UIStroke_14.Parent = ValuesHolder_1
			UIStroke_14.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			UIStroke_14.Color = Color3.fromRGB(79,79,79)
			UIStroke_14.Thickness = 1.2999999523162842

			UIListLayout_3.Parent = ValuesHolder_1
			UIListLayout_3.Padding = UDim.new(0,10)
			UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_3.VerticalAlignment = Enum.VerticalAlignment.Center

			DropdownName_1.Name = "DropdownName"
			DropdownName_1.Parent = Dropdown_1
			DropdownName_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			DropdownName_1.BackgroundTransparency = 1
			DropdownName_1.BorderColor3 = Color3.fromRGB(0,0,0)
			DropdownName_1.BorderSizePixel = 0
			DropdownName_1.Position = UDim2.new(0.0147992065, 0,0, 0)
			DropdownName_1.Size = UDim2.new(0, 349,0, 23)
			DropdownName_1.FontFace = FontType
			DropdownName_1.Text = Info9.Name or "Dropdown"
			DropdownName_1.TextColor3 = Color3.fromRGB(255,255,255)
			DropdownName_1.TextSize = 14
			DropdownName_1.TextXAlignment = Enum.TextXAlignment.Left

			if Info9.Default ~= nil and CallbackOnDefault then
				local Success, Error = pcall(function() Callback(Values[Info9.Default]) end)

				if not Success then
					Library:FastNotify("Dropdown Error", tostring(Error))
				end
			end

			local function UpdateDropdown()
				for _, v in pairs(ValuesHolder_1:GetChildren()) do
					if v:IsA("TextButton") then
						v:Destroy()
					end
				end

				for _, v in ipairs(Values) do
					local Value_1 = Instance.new("TextButton")
					local UICorner_24 = Instance.new("UICorner")
					local UIStroke_15 = Instance.new("UIStroke")

					Value_1.Name = "Value"
					Value_1.Parent = ValuesHolder_1
					Value_1.Active = true
					Value_1.BackgroundColor3 = Color3.fromRGB(50,50,50)
					Value_1.BorderColor3 = Color3.fromRGB(0,0,0)
					Value_1.BorderSizePixel = 0
					Value_1.Position = UDim2.new(0.00510204071, 0,0, 0)
					Value_1.Size = UDim2.new(0, 86,0, 22)
					Value_1.FontFace = FontType
					Value_1.Text = v or  "Valu"
					Value_1.TextColor3 = Color3.fromRGB(255,255,255)
					Value_1.TextSize = 14
					Value_1.TextWrapped = true
					Value_1.ZIndex = 2

					UICorner_24.Parent = Value_1
					UICorner_24.CornerRadius = UDim.new(0,5)

					UIStroke_15.Parent = Value_1
					UIStroke_15.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					UIStroke_15.Color = Color3.fromRGB(139,139,139)
					UIStroke_15.Transparency = 1
					UIStroke_15.Thickness = 1.2999999523162842

					Value_1.MouseEnter:Connect(function()
						TweenService:Create(UIStroke_15, TweenInfo.new(0.2), {Transparency = 0}):Play()
						TweenService:Create(UIStroke_15, TweenInfo.new(0.4), {Color = Color3.fromRGB(180, 180, 180)}):Play()
						TweenService:Create(Value_1, TweenInfo.new(0.4), {BackgroundColor3 = Color3.fromRGB(70, 70, 70)}):Play()
					end)

					Value_1.MouseLeave:Connect(function()
						TweenService:Create(UIStroke_15, TweenInfo.new(0.4), {Color = Color3.fromRGB(139,139,139)}):Play()
						TweenService:Create(UIStroke_15, TweenInfo.new(0.2), {Transparency = 1}):Play()
						TweenService:Create(Value_1, TweenInfo.new(0.4), {BackgroundColor3 = Color3.fromRGB(50,50,50)}):Play()
					end)

					Value_1.MouseButton1Click:Connect(function()
						DropdownButton_1.Text = v

						SaveFlag(DropdownsP, Flag, v)
						coroutine.wrap(function()
							local Success, Error = pcall(function() Callback(v) end)
							if not Success then
								Library:FastNotify("Dropdown Error", tostring(Error))
							end
						end)()

						ValuesHolder_1.Visible = false
						TweenService:Create(ClickIcon_1, TweenInfo.new(0.2), {Rotation = 0}):Play()
					end)
				end

				ValuesHolder_1.Size = UDim2.new(1, 0, #Values * 0.9,0)
			end

			DropdownButton_1.MouseButton1Click:Connect(function()
				local IsOpened = not ValuesHolder_1.Visible
				ValuesHolder_1.Visible = IsOpened

				if IsOpened then
					TweenService:Create(ClickIcon_1, TweenInfo.new(0.2), {Rotation = 180}):Play()
				else
					TweenService:Create(ClickIcon_1, TweenInfo.new(0.2), {Rotation = 0}):Play()
				end
			end)

			UpdateDropdown()

			SelfActions = {
				SetValue = function(self, value)
					if table.find(Values, value) then
						DropdownButton_1.Text = value
						coroutine.wrap(function()
							local Success, Error = pcall(function() Callback(value) end)
							if not Success then
								Library:FastNotify("Button Error", tostring(Error))
							end
						end)()
					else
						Library:FastNotify("Action Failed", "SetValue failed for dropdown: ".. Info9.Name .. "")
					end
				end,

				AddValue = function(self, value)
					if type(value) == "string" then
						table.insert(Values, value)
					elseif type(value) == "table" then
						for i, v in value do
							table.insert(Values, v)
						end
					end
					UpdateDropdown()
				end,
			}

			local Flags = GetFlags(DropdownsP)

			for i, v in next, Flags do
				if i == Flag and v ~= nil then
					SelfActions:SetValue(v)
				end
			end

			return SelfActions
		end

		function Elements:CreateColorPicker(Info10)
			local SelfActions = {}

			local Flag = Info10.Flag or ""
			local Callback = Info10.Callback
			local Default = Info10.Default

			local IsOpened = false

			local ColorPicker = Instance.new("Frame")
			local UICorner_1 = Instance.new("UICorner")
			local UIStroke_1 = Instance.new("UIStroke")
			local UIGradient_1 = Instance.new("UIGradient")
			local UIGradient_2 = Instance.new("UIGradient")
			local ColorPickerDescription_1 = Instance.new("TextLabel")
			local ColorPickerName_1 = Instance.new("TextLabel")
			local ColorFrame_1 = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local PickButton_1 = Instance.new("TextButton")
			local ColorPickingHolder_1 = Instance.new("Frame")
			local UICorner_3 = Instance.new("UICorner")
			local UIGradient_3 = Instance.new("UIGradient")
			local WhiteOverlay_1 = Instance.new("Frame")
			local UIGradient_4 = Instance.new("UIGradient")
			local UICorner_4 = Instance.new("UICorner")
			local Cursor = Instance.new("Frame")
			local UICorner_c = Instance.new("UICorner")
			local UIStroke_c = Instance.new("UIStroke")
			local DarknessFrame = Instance.new("Frame")
			local UICorner_c3 = Instance.new("UICorner")
			local UIGradient_c2 = Instance.new("UIGradient")
			local Cursor2_1 = Instance.new("Frame")
			local UICorner_c2 = Instance.new("UICorner")
			local UIStroke_c2 = Instance.new("UIStroke")

			ColorPicker.Name = "ColorPicker"
			ColorPicker.Parent = TabContainer_1
			ColorPicker.BackgroundColor3 = Color3.fromRGB(66,66,66)
			ColorPicker.BackgroundTransparency = 0.6000000238418579
			ColorPicker.BorderColor3 = Color3.fromRGB(0,0,0)
			ColorPicker.BorderSizePixel = 0
			ColorPicker.Position = UDim2.new(0.0149892932, 0,0.290865391, 0)
			ColorPicker.Size = UDim2.new(0, 453,0,66)   --UDim2.new(0, 453,0, 205)

			UICorner_c.Parent = ColorPicker
			UICorner_c.CornerRadius = UDim.new(0,5)

			UIStroke_c.Parent = ColorPicker
			UIStroke_c.Color = Color3.fromRGB(74,74,74)
			UIStroke_c.Thickness = 1

			UIGradient_1.Parent = UIStroke_c
			UIGradient_1.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,0), NumberSequenceKeypoint.new(1,0.757764)}

			UIGradient_2.Parent = ColorPicker
			UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(213, 213, 213)), ColorSequenceKeypoint.new(1, Color3.fromRGB(16, 16, 16))}
			UIGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,0.335404), NumberSequenceKeypoint.new(1,0.795031)}

			ColorPickerDescription_1.Name = "ColorPickerDescription"
			ColorPickerDescription_1.Parent = ColorPicker
			ColorPickerDescription_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			ColorPickerDescription_1.BackgroundTransparency = 1
			ColorPickerDescription_1.BorderColor3 = Color3.fromRGB(0,0,0)
			ColorPickerDescription_1.BorderSizePixel = 0
			ColorPickerDescription_1.Position = UDim2.new(00.015,0,0.348,0) --//UDim2.new(0.0147992065, 0,0.143606797, 0)
			ColorPickerDescription_1.Size = UDim2.new(0, 349,0, 38)
			ColorPickerDescription_1.FontFace = FontType
			ColorPickerDescription_1.Text = Info10.Description or ""
			ColorPickerDescription_1.TextColor3  = Color3.fromRGB(unpack(GlobalValues.GlobalDescriptionColor))
			ColorPickerDescription_1.TextSize = 14
			ColorPickerDescription_1.TextWrapped = true
			ColorPickerDescription_1.TextXAlignment = Enum.TextXAlignment.Left
			ColorPickerDescription_1.TextYAlignment = Enum.TextYAlignment.Top

			ColorPickerName_1.Name = "ColorPickerName"
			ColorPickerName_1.Parent = ColorPicker
			ColorPickerName_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			ColorPickerName_1.BackgroundTransparency = 1
			ColorPickerName_1.BorderColor3 = Color3.fromRGB(0,0,0)
			ColorPickerName_1.BorderSizePixel = 0
			ColorPickerName_1.Position = UDim2.new(0.0147992065, 0,0, 0)
			ColorPickerName_1.Size = UDim2.new(0, 349,0, 23)
			ColorPickerName_1.FontFace = FontType
			ColorPickerName_1.Text = Info10.Name or "ColorPicker"
			ColorPickerName_1.TextColor3 = Color3.fromRGB(255,255,255)
			ColorPickerName_1.TextSize = 14
			ColorPickerName_1.TextXAlignment = Enum.TextXAlignment.Left

			ColorFrame_1.Name = "ColorFrame"
			ColorFrame_1.Parent = ColorPicker
			ColorFrame_1.BackgroundColor3 = Default or Color3.fromRGB(255, 255, 255)
			ColorFrame_1.BorderColor3 = Color3.fromRGB(0,0,0)
			ColorFrame_1.BorderSizePixel = 0
			ColorFrame_1.Position = UDim2.new(0.874,0,0.136,0) --//UDim2.new(0.878587067, 0,0.0485588275, 0)
			ColorFrame_1.Size = UDim2.new(0, 47,0, 47)

			local ManualStroke = Instance.new("UIStroke")
			ManualStroke.Parent = ColorFrame_1
			ManualStroke.Thickness = 1.3
			ManualStroke.Color = Color3.fromRGB(255, 255, 255)

			UICorner_2.Parent = ColorFrame_1
			UICorner_2.CornerRadius = UDim.new(0,5)

			PickButton_1.Name = "PickButton"
			PickButton_1.Parent = ColorFrame_1
			PickButton_1.Active = true
			PickButton_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			PickButton_1.BackgroundTransparency = 1
			PickButton_1.BorderColor3 = Color3.fromRGB(0,0,0)
			PickButton_1.BorderSizePixel = 0
			PickButton_1.Size = UDim2.new(1, 0,1, 0)
			PickButton_1.FontFace = FontType
			PickButton_1.Text = ""
			PickButton_1.TextSize = 14

			ColorPickingHolder_1.Name = "ColorPickingHolder"
			ColorPickingHolder_1.Parent = ColorPicker
			ColorPickingHolder_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			ColorPickingHolder_1.BorderColor3 = Color3.fromRGB(0,0,0)
			ColorPickingHolder_1.Visible = false
			ColorPickingHolder_1.BorderSizePixel = 0
			ColorPickingHolder_1.Position = UDim2.new(0.0176596399, 0,0.326829255, 0)
			ColorPickingHolder_1.Size = UDim2.new(0, 390,0, 127)
			ColorPickingHolder_1.BackgroundTransparency = 1 -- 0

			UICorner_3.Parent = ColorPickingHolder_1
			UICorner_3.CornerRadius = UDim.new(0,5)

			UIGradient_3.Parent = ColorPickingHolder_1
			UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 1)), ColorSequenceKeypoint.new(0.166667, Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(0.333333, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 225)), ColorSequenceKeypoint.new(0.666667, Color3.fromRGB(0, 255, 0)), ColorSequenceKeypoint.new(0.833333, Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))}
			UIGradient_3.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,0), NumberSequenceKeypoint.new(0.480697,0.29375), NumberSequenceKeypoint.new(1,0)}

			WhiteOverlay_1.Name = "WhiteOverlay"
			WhiteOverlay_1.Parent = ColorPickingHolder_1
			WhiteOverlay_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			WhiteOverlay_1.BorderColor3 = Color3.fromRGB(0,0,0)
			WhiteOverlay_1.BorderSizePixel = 0
			WhiteOverlay_1.BackgroundTransparency = 1
			WhiteOverlay_1.Size = UDim2.new(1, 0,1, 0)
			WhiteOverlay_1.ZIndex = 1

			UIGradient_4.Parent = WhiteOverlay_1
			UIGradient_4.Rotation = 270
			UIGradient_4.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,0), NumberSequenceKeypoint.new(1,1)}

			UICorner_4.Parent = WhiteOverlay_1
			UICorner_4.CornerRadius = UDim.new(0,5)

			Cursor.Name = "Cursor"
			Cursor.Parent = ColorPickingHolder_1
			Cursor.BackgroundColor3 = Color3.fromRGB(255,255,255)
			Cursor.BackgroundTransparency = 1
			Cursor.BorderColor3 = Color3.fromRGB(0,0,0)
			Cursor.BorderSizePixel = 0
			Cursor.ZIndex = 2
			Cursor.Position = UDim2.new(0, 0,0, 0)
			Cursor.Size = UDim2.new(0, 10,0, 10)

			UICorner_1.Parent = Cursor
			UICorner_1.CornerRadius = UDim.new(1,0)

			UIStroke_1.Parent = Cursor
			UIStroke_1.Color = Color3.fromRGB(0, 0, 0)
			UIStroke_1.Transparency = 1
			UIStroke_1.Thickness = 1.899999976158142

			DarknessFrame.Name = "DarknessFrame"
			DarknessFrame.Parent = ColorPicker
			DarknessFrame.BackgroundColor3 = Color3.fromRGB(255,38,38)
			DarknessFrame.BorderColor3 = Color3.fromRGB(0,0,0)
			DarknessFrame.Visible = false
			DarknessFrame.BorderSizePixel = 0
			DarknessFrame.Position = UDim2.new(0.891832113, 0,0.328972638, 0)
			DarknessFrame.Size = UDim2.new(0, 39,0, 126)

			UICorner_c3.Parent = DarknessFrame
			UICorner_c3.CornerRadius = UDim.new(0,5)

			UIGradient_c2.Parent = DarknessFrame
			UIGradient_c2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}
			UIGradient_c2.Rotation = 90

			Cursor2_1.Name = "Cursor2"
			Cursor2_1.Parent = DarknessFrame
			Cursor2_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			Cursor2_1.BackgroundTransparency = 1
			Cursor2_1.BorderColor3 = Color3.fromRGB(0,0,0)
			Cursor2_1.BorderSizePixel = 0
			Cursor2_1.Size = UDim2.new(0, 10,0, 10)
			Cursor2_1.ZIndex = 2

			UICorner_c2.Parent = Cursor2_1
			UICorner_c2.CornerRadius = UDim.new(1,0)

			UIStroke_c2.Parent = Cursor2_1
			UIStroke_c2.Thickness = 1.899999976158142

			local Debounce3 = false
			PickButton_1.MouseButton1Click:Connect(function()
				IsOpened = not IsOpened

				if Debounce3 then return end
				Debounce3 = true
				ColorPickingHolder_1.Visible = IsOpened
				DarknessFrame.Visible = IsOpened

				if IsOpened then
					TweenService:Create(ColorPicker, TweenInfo.new(0.3), {Size = UDim2.new(0, 453, 0, 205)}):Play()
					TweenService:Create(ColorFrame_1, TweenInfo.new(0.3), {Position = UDim2.new(0.878587067, 0,0.0485588275, 0)}):Play()
					TweenService:Create(ColorPickingHolder_1, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()
					TweenService:Create(DarknessFrame, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()
					TweenService:Create(ColorPickerDescription_1, TweenInfo.new(0.3), {Position = UDim2.new(0.0147992065, 0,0.143606797, 0)}):Play()
					TweenService:Create(WhiteOverlay_1, TweenInfo.new(0.3), {Transparency = 0}):Play()
					TweenService:Create(UIStroke_1, TweenInfo.new(0.3), {Transparency = 0}):Play()
				else
					TweenService:Create(ColorPicker, TweenInfo.new(0.3), {Size = UDim2.new(0, 453, 0, 66)}):Play()
					TweenService:Create(ColorFrame_1, TweenInfo.new(0.3), {Position =  UDim2.new(0.874,0,0.136,0)}):Play()
					TweenService:Create(ColorPickerDescription_1, TweenInfo.new(0.3), {Position = UDim2.new(00.015,0,0.348,0)}):Play()
					TweenService:Create(ColorPickingHolder_1, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
					TweenService:Create(DarknessFrame, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
					TweenService:Create(UIStroke_1, TweenInfo.new(0.3), {Transparency = 1}):Play()
					TweenService:Create(WhiteOverlay_1, TweenInfo.new(0.3), {Transparency = 1}):Play()

					UpdateCanvas()
				end
				task.wait(0.3)
				Debounce3 = false
			end)

			local function GetColor(X, Y, Darkness)
				local Hue = 1 - (X / ColorPickingHolder_1.AbsoluteSize.X) 
				local Saturation = 1 - (Y / ColorPickingHolder_1.AbsoluteSize.Y)
				local Value = 1 - (Darkness / DarknessFrame.AbsoluteSize.Y)

				return Color3.fromHSV(Hue, Saturation, Value)
			end

			local function SetDefaultColor(DefaultColor)
				local H, S, V = DefaultColor:ToHSV()
				local DefaultX = (1 - H) * ColorPickingHolder_1.AbsoluteSize.X 
				local DefaultY = (1 - S) * ColorPickingHolder_1.AbsoluteSize.Y
				local DefaultDarkness = (1 - V) * DarknessFrame.AbsoluteSize.Y

				Cursor.Position = UDim2.new(0, DefaultX - 5, 0, DefaultY - 5)
				Cursor2_1.Position = UDim2.new(0.5, -5, 0, DefaultDarkness - 5)
				DarknessFrame.BackgroundColor3 = DefaultColor

				local Success, Error = pcall(function() Callback(DefaultColor) end)
				SaveFlag(Colors, Flag, DefaultColor)
				if not Success then
					Library:FastNotify("ColorPicker Error: ", tostring(Error))
				end
			end

			local function UpdateCursor(Input)
				local X = math.clamp(Input.Position.X - ColorPickingHolder_1.AbsolutePosition.X, 0, ColorPickingHolder_1.AbsoluteSize.X)
				local Y = math.clamp(Input.Position.Y - ColorPickingHolder_1.AbsolutePosition.Y, 0, ColorPickingHolder_1.AbsoluteSize.Y)
				local Darkness = math.clamp(Cursor2_1.Position.Y.Offset, 0, DarknessFrame.AbsoluteSize.Y)

				Cursor.Position = UDim2.new(0, X - 5, 0, Y - 5)
				local NewColor = GetColor(X, Y, Darkness)
				ColorFrame_1.BackgroundColor3 = NewColor
				DarknessFrame.BackgroundColor3 = NewColor

				local Success, Error = pcall(function() Callback(NewColor) end)
				SaveFlag(Colors, Flag, NewColor)
				if not Success then
					Library:FastNotify("ColorPicker Error: ", tostring(Error))
				end
			end

			local function UpdateDarkness(input)
				local Y = math.clamp(input.Position.Y - DarknessFrame.AbsolutePosition.Y, 0, DarknessFrame.AbsoluteSize.Y)
				Cursor2_1.Position = UDim2.new(0.5, -5, 0, Y - 5)

				UpdateCursor({Position = Vector2.new(Cursor.AbsolutePosition.X + 5, Cursor.AbsolutePosition.Y + 5)})
			end

			ColorPickingHolder_1.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					IsInColorFrameDrag = true  
					UpdateCursor(input)
				end
			end)

			ColorPickingHolder_1.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
					if IsInColorFrameDrag then
						UpdateCursor(input)
					end
				end
			end)

			ColorPickingHolder_1.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					IsInColorFrameDrag = false  
				end
			end)

			DarknessFrame.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					IsInColorFrameDrag = true  
					UpdateDarkness(input)
				end
			end)

			DarknessFrame.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
					if IsInColorFrameDrag then
						UpdateDarkness(input)
					end
				end
			end)

			DarknessFrame.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					IsInColorFrameDrag = false  
				end
			end)

			if Default then
				SetDefaultColor(Default)
			end

			SelfActions = {
				SetColor = function(self, Color)
					if typeof(Color) == "Color3" then
						SetDefaultColor(Default)
					end
				end,
			}

			local Flags = GetFlags(Colors)

			for i, v in next, Flags do
				if i == Flag and v ~= nil then
					SelfActions:SetColor(Color3.fromRGB(v.R * 255, v.G * 255, v.B * 255))
				end
			end

			return SelfActions
		end
		return Elements
	end

	--//Init, Settings
	function SettingAssync:StartupSettings()
		local Settings = Tabs:CreateTab({
			Name = "Settings",
			Icon = "settings",
		})

		local MinimizeKeybind = Settings:CreateKeybind({
			Name = "Gui Minimize Keybind", 
			Description = "Changes The Keybind For Minimizing The Gui",
			Default = Enum.KeyCode[GlobalValues.GlobalMinimizeKeybind],
			Callback = function(Keybind)
				GlobalValues.GlobalMinimizeKeybind = Keybind.Name

				MinimizeKeybind = Enum.KeyCode[GlobalValues.GlobalMinimizeKeybind]
			end,
		})

		local GuiDragSpeed = Settings:CreateSlider({
			Name = "Gui Dragging Speed",
			Description = "Changes How Powerful The Dragging Speed Is",
			Default = GlobalValues.GlobalGuiDragSpeed,
			MinValue = 0,
			MaxValue = 2,
			Increment = 0.01,
			Callback = function(value)
				GlobalValues.GlobalGuiDragSpeed = value

				Speed = GlobalValues.GlobalGuiDragSpeed
			end
		})

		local SliderAnimationSpeed = Settings:CreateSlider({
			Name  = "Slider Animation Speed",
			Description = "Changes How Fast The Slider Animation Is",
			Default = GlobalValues.GlobalSliderSpeed,
			MinValue = 0,
			MaxValue = 2,
			Increment = 0.01,
			Callback = function(value)
				GlobalValues.GlobalSliderSpeed = value
			end
		})

		local ToggleAnimationSpeed = Settings:CreateSlider({
			Name  = "Toggle Animation Speed",
			Description = "Changes How Fast The Toggle Animation Is",
			Default = GlobalValues.GlobalToggleSpeed,
			MinValue = 0,
			MaxValue = 2,
			Increment = 0.01,
			Callback = function(value)
				GlobalValues.GlobalToggleSpeed = value
			end
		})

		local Section = Settings:CreateSection({
			Title = "GuiAppearence"
		})

		local MainGuiColor = Settings:CreateColorPicker({
			Name = "Main Gui Color",
			Description = "Changes The Color Of The MainGui",
			Default = Color3.fromRGB(unpack(GlobalValues.GlobalMainGuiColor)),
			Callback = function(Color)
				GlobalValues.GlobalMainGuiColor = {Color.R * 255, Color.G * 255, Color.B * 255}

				MainFrame_1.BackgroundColor3 = Color
			end,
		})
	end
	return Tabs, SettingAssync
end
return Library
