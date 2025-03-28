local lib = {}
local lucide = loadstring(game:HttpGet('https://raw.githubusercontent.com/Severity-svc/Ventures/refs/heads/main/Gui/LucideIcons.lua'))()
local rubik = Font.new("rbxassetid://12187365977", Enum.FontWeight.Bold)

--//Services
local ts = game:GetService("TweenService")
local run = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local players = game:GetService("Players")

--//Undefined
local p
local whitelisted
local device
local keybind

if run:IsStudio() then
	p = players.LocalPlayer:WaitForChild("PlayerGui")
else
	p = game:GetService("CoreGui")
end

if not run:IsStudio() then
	local ans = game:GetService("RbxAnalyticsService")

	if ans and ans:GetClientId() then
		local hwid, whitelist = ans:GetClientId(), {"E234A003-18E6-4546-996E-CC216EEDAC75"}

		for _, v in pairs(whitelist) do
			if v == hwid then
				whitelisted = true
			end
		end
	end
end

local function getscriptkeybind(invert, keycode)
	if invert then
		return "Enum.KeyCode." .. keycode:gsub(" ", ""):gsub("(%l)(%u)", "%1%2")
	else
		return keycode.Name:gsub("(%u)", " %1"):sub(2)
	end
end

--//Main
local Ventures = Instance.new("ScreenGui")
Ventures.Name = "Ventures"
Ventures.Parent = p
Ventures.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

--//Function:Notify
function lib:Notify(t)
	local Notification = Instance.new("Frame")
	local UIGradient = Instance.new("UIGradient")
	local Background = Instance.new("ImageLabel")
	local Title = Instance.new("TextLabel")
	local Content = Instance.new("TextLabel")
	local CloseButton = Instance.new("TextButton")
	local UICorner = Instance.new("UICorner")
	local UICorner2 = Instance.new("UICorner")
	local Stroke1 = Instance.new("UIStroke")
	local Stroke2 = Instance.new("UIStroke")

	local function GetOffset()
		local offset = 0
		for _, v in ipairs(Ventures:GetChildren()) do
			if v:IsA("Frame") and v.Name == "Notification" then
				offset = offset + 0.13
			end
		end
		return offset
	end

	Notification.Name = "Notification"
	Notification.Parent = Ventures
	Notification.BackgroundColor3 = Color3.fromRGB(31, 23, 34)
	Notification.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Notification.BackgroundTransparency = 0.15
	Notification.BorderSizePixel = 0
	Notification.Position = UDim2.new(1.3, 0, 0.764779866 - GetOffset(), 0)
	Notification.Size = UDim2.new(0, 301, 0, 89)
	Notification.Visible = true

	Stroke2.Parent = Notification
	Stroke2.Color = Color3.fromRGB(91, 67, 100)
	Stroke2.Thickness = 1.3
	Stroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

	Notification.MouseEnter:Connect(function()
		ts:Create(Stroke2, TweenInfo.new(0.4), {Color = Color3.fromRGB(199, 148, 220)}):Play()
		ts:Create(Stroke2, TweenInfo.new(0.4), {Thickness = 1.6}):Play()
	end)

	Notification.MouseLeave:Connect(function()
		ts:Create(Stroke2, TweenInfo.new(0.4), {Color = Color3.fromRGB(91, 67, 100)}):Play()
		ts:Create(Stroke2, TweenInfo.new(0.4), {Thickness = 1.3}):Play()
	end)

	UIGradient.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0.00, Color3.fromRGB(72, 72, 72)),
		ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))
	}
	
	UIGradient.Rotation = -90
	UIGradient.Parent = Notification

	Background.Name = "Background"
	Background.Parent = Notification
	Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Background.BackgroundTransparency = 1
	Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Background.BorderSizePixel = 0
	Background.Size = UDim2.new(1, 0, 1, 0)
	Background.Image = "rbxassetid://138515717272375"
	Background.ImageTransparency = 0.66

	Title.Name = "Title"
	Title.Parent = Notification
	Title.BackgroundTransparency = 1
	Title.Position = UDim2.new(0.0177, 0, 0.0385, 0)
	Title.Size = UDim2.new(0, 199, 0, 14)
	Title.FontFace = rubik
	Title.Text = t.Title or "Notification"
	Title.TextColor3 = Color3.fromRGB(194, 131, 183)
	Title.TextSize = 14
	Title.TextXAlignment = Enum.TextXAlignment.Left
	Title.TextYAlignment = Enum.TextYAlignment.Bottom

	Content.Name = "Content"
	Content.Parent = Notification
	Content.BackgroundTransparency = 1
	Content.Position = UDim2.new(0.04095, 0, 0.3509, 0)
	Content.Size = UDim2.new(0, 242, 0, 57)
	Content.FontFace = rubik
	Content.Text = t.Content or "Default content"
	Content.TextColor3 = Color3.fromRGB(94, 63, 89)
	Content.TextSize = 14
	Content.TextWrapped = true
	Content.TextXAlignment = Enum.TextXAlignment.Left
	Content.TextYAlignment = Enum.TextYAlignment.Top

	CloseButton.Name = "CloseButton"
	CloseButton.Parent = Notification
	CloseButton.BackgroundColor3 = Color3.fromRGB(39, 29, 43)
	CloseButton.BorderSizePixel = 0
	CloseButton.AutoButtonColor = false
	CloseButton.Position = UDim2.new(0.895, 0, 0.07, 0)
	CloseButton.Size = UDim2.new(0, 25, 0, 25)
	CloseButton.FontFace = rubik
	CloseButton.Text = "X"
	CloseButton.TextColor3 = Color3.fromRGB(235, 159, 221)
	CloseButton.TextSize = 14

	Stroke1.Parent = CloseButton
	Stroke1.Color = Color3.fromRGB(91, 67, 100)
	Stroke1.Thickness = 1.3
	Stroke1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

	CloseButton.MouseEnter:Connect(function()
		ts:Create(Stroke1, TweenInfo.new(0.4), {Color = Color3.fromRGB(186, 139, 206)}):Play()
		ts:Create(CloseButton, TweenInfo.new(0.4), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
	end)

	CloseButton.MouseLeave:Connect(function()
		ts:Create(Stroke1, TweenInfo.new(0.4), {Color = Color3.fromRGB(91, 67, 100)}):Play()
		ts:Create(CloseButton, TweenInfo.new(0.4), {TextColor3 = Color3.fromRGB(235, 159, 221)}):Play()
	end)

	UICorner.CornerRadius = UDim.new(0, 5)
	UICorner.Parent = CloseButton
	UICorner2.Parent = Notification

	local duration = t.Duration or 3.5

	ts:Create(Notification, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.8, 0, 0.764779866 - GetOffset(), 0)}):Play()
	ts:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Position = UDim2.new(0.81, 0, 0.764779866 - GetOffset(), 0)}):Play()

	CloseButton.MouseButton1Click:Connect(function()
		ts:Create(Notification, TweenInfo.new(0.5), {Position = UDim2.new(1.3, 0, 0.764779866 - GetOffset(), 0)}):Play()

		task.wait(0.5)
		Notification:Destroy()

		local offset = 0
		for _, v in ipairs(Ventures:GetChildren()) do
			if v:IsA("Frame") and v.Name == "Notification" then
				ts:Create(v, TweenInfo.new(0.3), {Position = UDim2.new(0.81, 0, 0.764779866 - offset, 0)}):Play()
				offset = offset + 0.13
			end
		end
	end)

	task.wait(duration)

	local out = ts:Create(Notification, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(1.3, 0, 0.764779866 - GetOffset(), 0)})
	out:Play()

	out.Completed:Wait()
	Notification:Destroy()

	while Notification do
		task.wait(0.1)
		local offset = 0
		for _, v in ipairs(Ventures:GetChildren()) do
			if v:IsA("Frame") and v.Name == "Notification" then
				ts:Create(v, TweenInfo.new(0.3), {Position = UDim2.new(0.81, 0, 0.764779866 - offset, 0)}):Play()
				offset = offset + 0.13
			end
		end
	end

	return Notification
end

local function fastnotify(ty)
	if ty == "callback error" then
		lib:Notify({
			Title = "Ventures - Callback Error",
			Content = "there's an error in the callback function!",
		})
	elseif ty == "library error" then
		lib:Notify({
			Title = "Ventures - Library Error",
			Content = "there's an error in the library, please dm sentrysvc for help and what you did to get this erorr.",
		})
	end
end

--//Function:CreateWindow
function lib:CreateWindow(tablew)
	local tab = {}

	local keysystem = tablew.KeySystem
	if type(keysystem) == "table" then
		local enabled, key = keysystem.Enabled or false, keysystem.Key or nil

		--//CreateWindow:KeySystem
		if enabled and key ~= nil and not whitelisted then
			local KeySystem = Instance.new("Frame")
			local UIGradient = Instance.new("UIGradient")
			local UICorner = Instance.new("UICorner")
			local TextBox = Instance.new("TextBox")
			local UICorner_2 = Instance.new("UICorner")
			local UIPadding = Instance.new("UIPadding")
			local TextLabel = Instance.new("TextLabel")
			local TextLabel_2 = Instance.new("TextLabel")
			local ImageLabel = Instance.new("ImageLabel")
			local UIGradient_2 = Instance.new("UIGradient")
			local Frame = Instance.new("Frame")
			local UIListLayout = Instance.new("UIListLayout")
			local ImageButton = Instance.new("ImageButton")
			local UICorner_3 = Instance.new("UICorner")
			local TextButton = Instance.new("TextButton")
			local UICorner_4 = Instance.new("UICorner")
			local str6 = Instance.new("UIStroke")
			local str7 = Instance.new("UIStroke")
			local str8  = Instance.new("UIStroke")
			local str9 = Instance.new("UIStroke")
			local Loading = Instance.new("Frame")
			local AnimationFrame = Instance.new("Frame")
			local Square1 = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local UIListLayout = Instance.new("UIListLayout")
			local Square2 = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local Square3 = Instance.new("Frame")
			local UICorner_3 = Instance.new("UICorner")
			local Square4 = Instance.new("Frame")
			local UICorner_4 = Instance.new("UICorner")
			local MidFrame = Instance.new("Frame")
			local UICorner_5 = Instance.new("UICorner")
			local Logo = Instance.new("ImageLabel")
			local UIGradient = Instance.new("UIGradient")
			local Stroke2 = Instance.new("UIStroke")

			if _G.UseAnimation then
				Loading.Name = "Loading"
				Loading.Parent = Ventures
				Loading.BackgroundColor3 = Color3.new(1, 1, 1)
				Loading.BackgroundTransparency = 1
				Loading.BorderColor3 = Color3.new(0, 0, 0)
				Loading.BorderSizePixel = 0
				Loading.Position = UDim2.new(0.5, -223, 0.5, -147)
				Loading.Size = UDim2.new(0, 446, 0, 295)

				AnimationFrame.Name = "AnimationFrame"
				AnimationFrame.Parent = Loading
				AnimationFrame.BackgroundColor3 = Color3.new(1, 1, 1)
				AnimationFrame.BackgroundTransparency = 1
				AnimationFrame.BorderColor3 = Color3.new(0, 0, 0)
				AnimationFrame.BorderSizePixel = 0
				AnimationFrame.Position = UDim2.new(0.5, -163, 0.5, -122)
				AnimationFrame.Size = UDim2.new(0, 326, 0, 244)

				Square1.Name = "Square1"
				Square1.Parent = nil
				Square1.BackgroundColor3 = Color3.new(0.152941, 0.113725, 0.168627)
				Square1.BorderColor3 = Color3.new(0, 0, 0)
				Square1.BorderSizePixel = 0
				Square1.Position = UDim2.new(0, 0, 0.5, -50)
				Square1.Size = UDim2.new(0, 50, 0, 50)

				UICorner.Parent = Square1

				UIListLayout.Parent = AnimationFrame
				UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
				UIListLayout.Wraps = false
				UIListLayout.Padding = UDim.new(0, 0)

				Square2.Name = "Square2"
				Square2.Parent = nil
				Square2.BackgroundColor3 = Color3.new(0.152941, 0.113725, 0.168627)
				Square2.BorderColor3 = Color3.new(0, 0, 0)
				Square2.BorderSizePixel = 0
				Square2.Position = UDim2.new(0, 0, 0.5, -50)
				Square2.Size = UDim2.new(0, 50, 0, 50)

				UICorner_2.Parent = Square2

				Square3.Name = "Square3"
				Square3.Parent = nil
				Square3.BackgroundColor3 = Color3.new(0.152941, 0.113725, 0.168627)
				Square3.BorderColor3 = Color3.new(0, 0, 0)
				Square3.BorderSizePixel = 0
				Square3.Position = UDim2.new(0, 0, 0.5, -50)
				Square3.Size = UDim2.new(0, 50, 0, 50)

				UICorner_3.Parent = Square3

				Square4.Name = "Square4"
				Square4.Parent = nil
				Square4.BackgroundColor3 = Color3.new(0.152941, 0.113725, 0.168627)
				Square4.BorderColor3 = Color3.new(0, 0, 0)
				Square4.BorderSizePixel = 0
				Square4.Position = UDim2.new(0, 0, 0.5, -50)
				Square4.Size = UDim2.new(0, 50, 0, 50)

				UICorner_4.Parent = Square4

				MidFrame.Name = "MidFrame"
				MidFrame.Parent = Loading
				MidFrame.BackgroundColor3 = Color3.new(0.152941, 0.113725, 0.168627)
				MidFrame.BorderColor3 = Color3.new(0, 0, 0)
				MidFrame.BorderSizePixel = 0
				MidFrame.Position = UDim2.new(0.5, -50, 0.5, -50)
				MidFrame.Size = UDim2.new(0, 100, 0, 100)

				Stroke2.Color = Color3.fromRGB(62, 46, 68)
				Stroke2.Thickness = 1.6
				Stroke2.Parent = MidFrame

				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(72, 72, 72)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
				UIGradient.Rotation = -90
				UIGradient.Parent = MidFrame

				UICorner_5.Parent = MidFrame

				Logo.Name = "Logo"
				Logo.Parent = Loading
				Logo.BackgroundColor3 = Color3.new(1, 1, 1)
				Logo.BackgroundTransparency = 1
				Logo.BorderColor3 = Color3.new(0, 0, 0)
				Logo.BorderSizePixel = 0
				Logo.Position = UDim2.new(0.5, -50, 0.5, -50)
				Logo.Size = UDim2.new(0, 100, 0, 100)
				Logo.Image = "rbxassetid://138872283376721"

				local rr = ts:Create(UIListLayout, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Padding = UDim.new(0, 110)}):Play()
				UIListLayout.Wraps = true

				Square1.Parent = AnimationFrame
				Square2.Parent = AnimationFrame
				Square3.Parent = AnimationFrame
				Square4.Parent = AnimationFrame

				for _, v in pairs(AnimationFrame:GetChildren()) do
					if v:IsA("Frame") then
						local Stroke = Instance.new("UIStroke")
						Stroke.Color = Color3.fromRGB(231, 170, 255)
						Stroke.Thickness = 1.5
						Stroke.Parent = v
					end
				end

				local children = AnimationFrame:GetChildren()

				for i = 1, 3 do
					local rt1 = AnimationFrame.Rotation + 90
					local rt2 = MidFrame.Rotation + 90
					local rt3 = UIGradient.Rotation - 90

					local r1 = ts:Create(AnimationFrame, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Rotation = rt1})
					local r2 = ts:Create(MidFrame, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Rotation = rt2})

					local r3 = ts:Create(UIListLayout, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Padding = UDim.new(0, 140)})
					local r4 = ts:Create(UIListLayout, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Padding = UDim.new(0, 110)})

					local r5 = ts:Create(UIGradient, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Rotation = rt3})

					local r6 = ts:Create(Stroke2, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Color = Color3.fromRGB(231, 170, 255)})
					local r7 = ts:Create(Stroke2, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Color = Color3.fromRGB(62, 46, 68)})

					r1:Play()

					coroutine.wrap(function()
						r3:Play()
						task.wait(0.2)
						r4:Play()
					end)()

					r1.Completed:Wait()
					task.wait(0.3)

					r2:Play()

					coroutine.wrap(function()
						r6:Play()
						task.wait(0.35)
						r7:Play()
					end)()

					r5:Play()
					r2.Completed:Wait()
					task.wait(0.3)
				end

				ts:Create(UIListLayout, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Padding = UDim.new(0, 0)}):Play()

				ts:Create(Square1, TweenInfo.new(0.8), {BackgroundTransparency = 1}):Play()
				ts:Create(Square2, TweenInfo.new(0.8), {BackgroundTransparency = 1}):Play()
				ts:Create(Square3, TweenInfo.new(0.8), {BackgroundTransparency = 1}):Play()
				ts:Create(Square4, TweenInfo.new(0.8), {BackgroundTransparency = 1}):Play()

				task.wait(0.8)

				Square1.Parent = nil
				Square2.Parent = nil
				Square3.Parent = nil
				Square4.Parent = nil

				task.wait(1.4)

				ts:Create(Loading, TweenInfo.new(0.4), {Position = UDim2.new(0.5, -223, 1.5, -147)}):Play()
				task.wait(0.5)

				coroutine.wrap(function()
					task.wait(0.5)
					Loading:Destroy()
				end)()
			else
				KeySystem.Name = "KeySystem"
				KeySystem.Parent = Ventures
				KeySystem.AnchorPoint = Vector2.new(0.5, 0.5)
				KeySystem.BackgroundColor3 = Color3.fromRGB(31, 23, 34)
				KeySystem.BorderColor3 = Color3.fromRGB(0, 0, 0)
				KeySystem.BackgroundTransparency = 0.09
				KeySystem.BorderSizePixel = 0
				KeySystem.Position = UDim2.new(0.488421053, 0, 1.3, 0) --  UDim2.new(0.488421053, 0, 0.494339615, 0)
				KeySystem.Size = UDim2.new(0, 419, 0, 199)

				str9.Parent = KeySystem
				str9.Color = Color3.fromRGB(91, 67, 100)
				str9.Thickness = 1.3
				str9.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(72, 72, 72)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
				UIGradient.Rotation = -90
				UIGradient.Parent = KeySystem

				UICorner.Parent = KeySystem

				TextBox.Parent = KeySystem
				TextBox.AnchorPoint = Vector2.new(0.5, 0)
				TextBox.BackgroundColor3 = Color3.fromRGB(31, 23, 34)
				TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextBox.BorderSizePixel = 0
				TextBox.Position = UDim2.new(0.5, 0, 0.707000017, 0)
				TextBox.Size = UDim2.new(0, 287, 0, 27)
				TextBox.FontFace = rubik
				TextBox.PlaceholderColor3 = Color3.fromRGB(98, 66, 92)
				TextBox.PlaceholderText = "Input Your Key Here..."
				TextBox.Text = ""
				TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextBox.TextSize = 14.000
				TextBox.TextXAlignment = Enum.TextXAlignment.Left

				str6.Parent = TextBox
				str6.Color = Color3.fromRGB(91, 67, 100)
				str6.Thickness = 1.3
				str6.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

				UICorner_2.CornerRadius = UDim.new(0, 5)
				UICorner_2.Parent = TextBox

				UIPadding.Parent = TextBox
				UIPadding.PaddingLeft = UDim.new(0, 8)

				TextLabel.Parent = KeySystem
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.BackgroundTransparency = 1.000
				TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel.BorderSizePixel = 0
				TextLabel.Position = UDim2.new(0.017699115, 0, 0.0384615399, 0)
				TextLabel.Size = UDim2.new(0, 199, 0, 11)
				TextLabel.FontFace = rubik
				TextLabel.Text = "Ventures KeySystem"
				TextLabel.TextColor3 = Color3.fromRGB(235, 159, 221)
				TextLabel.TextSize = 14.000
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left

				TextLabel_2.Parent = KeySystem
				TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_2.BackgroundTransparency = 1.000
				TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextLabel_2.BorderSizePixel = 0
				TextLabel_2.Position = UDim2.new(0.157517895, 0, 0.842481434, 0)
				TextLabel_2.Size = UDim2.new(0, 286, 0, 31)
				TextLabel_2.FontFace = rubik
				TextLabel_2.Text = "To get the key join our discord server, discord.gg/v3n"
				TextLabel_2.TextColor3 = Color3.fromRGB(72, 49, 68)
				TextLabel_2.TextSize = 11.000

				ImageLabel.Parent = KeySystem
				ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ImageLabel.BackgroundTransparency = 1.000
				ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ImageLabel.BorderSizePixel = 0
				ImageLabel.Size = UDim2.new(1, 0, 1, 0)
				ImageLabel.Image = "rbxassetid://138515717272375"
				ImageLabel.ImageTransparency = 0.660

				UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
				UIGradient_2.Rotation = -90
				UIGradient_2.Parent = ImageLabel

				Frame.Parent = KeySystem
				Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Frame.BackgroundTransparency = 1.000
				Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Frame.BorderSizePixel = 0
				Frame.Position = UDim2.new(0.711217165, 0, 0.0351758786, 0)
				Frame.Size = UDim2.new(0, 116, 0, 25)

				UIListLayout.Parent = Frame
				UIListLayout.FillDirection = Enum.FillDirection.Horizontal
				UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.Padding = UDim.new(0, 5)

				ImageButton.Parent = Frame
				ImageButton.BackgroundColor3 = Color3.fromRGB(39, 29, 43)
				ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ImageButton.BorderSizePixel = 0
				ImageButton.Position = UDim2.new(0.75938803, 0, 0.0384615026, 0)
				ImageButton.Size = UDim2.new(0, 25, 0, 25)
				ImageButton.Image = "http://www.roblox.com/asset/?id=84828491431270"
				ImageButton.ImageColor3 = Color3.fromRGB(235, 159, 221)

				str7.Parent = ImageButton
				str7.Color = Color3.fromRGB(91, 67, 100)
				str7.Thickness = 1.3
				str7.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

				UICorner_3.CornerRadius = UDim.new(0, 5)
				UICorner_3.Parent = ImageButton

				TextButton.Parent = Frame
				TextButton.BackgroundColor3 = Color3.fromRGB(39, 29, 43)
				TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextButton.BorderSizePixel = 0
				TextButton.Position = UDim2.new(0.918141603, 0, 0.0384615399, 0)
				TextButton.Size = UDim2.new(0, 25, 0, 25)
				TextButton.FontFace = rubik
				TextButton.Text = "X"
				TextButton.TextColor3 = Color3.fromRGB(235, 159, 221)
				TextButton.TextSize = 14.000

				str8.Parent = TextButton
				str8.Color = Color3.fromRGB(91, 67, 100)
				str8.Thickness = 1.3
				str8.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

				UICorner_4.CornerRadius = UDim.new(0, 5)
				UICorner_4.Parent = TextButton

				ts:Create(KeySystem, TweenInfo.new(0.3), {Position =  UDim2.new(0.488421053, 0, 0.494339615, 0)}):Play()

				while KeySystem do
					if TextBox.Text:find(key) then
						ts:Create(KeySystem, TweenInfo.new(0.3), {Position =  UDim2.new(0.488421053, 0, 1.3, 0)}):Play()
						task.wait(0.8)
						KeySystem:Destroy()
						break
					else
					end
					task.wait(0.1)
				end
			end
		end
	end

	--//CreateWindow:Main
	local TabName2 = Instance.new("TextLabel")
	local Holder = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local SideBar = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local Logo = Instance.new("ImageLabel")
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	local Line = Instance.new("Frame")
	local Line_2 = Instance.new("Frame")
	local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
	local TabContainer1 = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local UIAspectRatioConstraint_30 = Instance.new("UIAspectRatioConstraint")
	local UIGradient = Instance.new("UIGradient")
	local UIGradient_2 = Instance.new("UIGradient")
	local UIGradient_3 = Instance.new("UIGradient")
	local ImageLabel = Instance.new("ImageLabel")
	local UIAspectRatioConstraint_31 = Instance.new("UIAspectRatioConstraint")
	local blur = Instance.new("ImageLabel")
	local grd4 = Instance.new("UIGradient")
	local actionholder = Instance.new("Frame")
	local uls4 = Instance.new("UIListLayout")
	local settings = Instance.new("ImageButton")
	local UICorner1 = Instance.new("UICorner")
	local discord = Instance.new("ImageButton")
	local UICorner2 = Instance.new("UICorner")
	local closebutton2 = Instance.new("TextButton")
	local UICorner3 = Instance.new("UICorner")

	if uis.TouchEnabled and not uis.KeyboardEnabled then
		lib:Notify({
			Title = "Ventures",
			Content = "mobile device detected, ventures is a bit more limited on mobile",
		})
	end

	Holder.Name = "Holder"
	Holder.Parent = Ventures
	Holder.BackgroundColor3 = Color3.fromRGB(31, 23, 34)
	Holder.AnchorPoint = Vector2.new(0.5,0.5)
	Holder.BackgroundTransparency = 0.06
	Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Holder.BorderSizePixel = 0
	Holder.Active = true
	Holder.Position = UDim2.new(0.5, 0, 0.5, 0)
	Holder.Size = UDim2.new(0, 961, 0, 520)

	local str98 = Instance.new("UIStroke")
	str98.Parent = Holder 
	str98.Thickness = 0
	str98.Color = Color3.fromRGB(228, 201, 234)

	local original = {}

	local function saveoriginal(element)
		if not original[element] then
			if element:IsA("GuiObject") then
				if element:IsA("TextLabel") or element:IsA("TextButton") then
					original[element] = {TextTransparency = element.TextTransparency, BackgroundTransparency = element.BackgroundTransparency}
				elseif element:IsA("ImageButton") or element:IsA("ImageLabel") then
					original[element] = {ImageTransparency = element.ImageTransparency, BackgroundTransparency = element.BackgroundTransparency}
				else
					original[element] = {Transparency = element.Transparency}
				end
			elseif element:IsA("UIStroke") then
				original[element] = {Transparency = element.Transparency}
			end
		end
	end

	local function close(way)
		if way == "out" then
			saveoriginal(Holder)
			ts:Create(Holder, TweenInfo.new(0.4), {Transparency = 1, Size = UDim2.new(0, 0, 0, 0)}):Play()

			for _, v in pairs(Holder:GetDescendants()) do
				if v:IsA("GuiObject") or v:IsA("UIStroke") then
					saveoriginal(v)
					if v:IsA("TextLabel") or v:IsA("TextButton") then
						ts:Create(v, TweenInfo.new(0.4), {TextTransparency = 1, BackgroundTransparency = 1}):Play()
					elseif v:IsA("ImageButton") or v:IsA("ImageLabel") then
						ts:Create(v, TweenInfo.new(0.4), {ImageTransparency = 1, BackgroundTransparency = 1}):Play()
					else
						ts:Create(v, TweenInfo.new(0.4), {Transparency = 1}):Play()
					end
				end
			end
			task.wait(0.5)

			Holder.Visible = false
		elseif way == "in" then
			Holder.Size = UDim2.new(0, 0, 0, 0)
			Holder.Transparency = 1
			Holder.Visible = true

			for _, v in pairs(Holder:GetDescendants()) do
				if v:IsA("GuiObject") or v:IsA("UIStroke") then
					if v:IsA("TextLabel") or v:IsA("TextButton") then
						v.TextTransparency = original[v] and original[v].TextTransparency or 1
						v.BackgroundTransparency = original[v] and original[v].BackgroundTransparency or 1
					elseif v:IsA("ImageButton") or v:IsA("ImageLabel") then
						v.ImageTransparency = original[v] and original[v].ImageTransparency or 1
						v.BackgroundTransparency = original[v] and original[v].BackgroundTransparency or 1
					else
						v.Transparency = original[v] and original[v].Transparency or 1
					end
				end
			end

			ts:Create(Holder, TweenInfo.new(0.4), {Transparency = 0, Size = UDim2.new(0, 961, 0, 520)}):Play()

			for _, v in pairs(Holder:GetDescendants()) do
				if v:IsA("GuiObject") or v:IsA("UIStroke") then
					if v:IsA("TextLabel") or v:IsA("TextButton") then
						ts:Create(v, TweenInfo.new(0.4), {TextTransparency = original[v] and original[v].TextTransparency or 0, BackgroundTransparency = original[v] and original[v].BackgroundTransparency or 0}):Play()
					elseif v:IsA("ImageButton") or v:IsA("ImageLabel") then
						ts:Create(v, TweenInfo.new(0.4), {ImageTransparency = original[v] and original[v].ImageTransparency or 0, BackgroundTransparency = original[v] and original[v].BackgroundTransparency or 0}):Play()
					else
						ts:Create(v, TweenInfo.new(0.4), {Transparency = original[v] and original[v].Transparency or 0}):Play()
					end
				end
			end
		end
	end

	close("in")
	local bool2 = true
	local keybind = tablew.MinimizeKeybind or Enum.KeyCode.RightControl 

	coroutine.wrap(function()
		if keybind then
			lib:Notify({
				Title = "Ventures - StartUp",
				Content = "Press " .. getscriptkeybind(false, keybind) .. " To Toggle The Ui!",
			})
		end
	end)()

	uis.InputBegan:Connect(function(input, gpe)
		if input.KeyCode == keybind then
			bool2 = not bool2

			if bool2 then
				close("in")
			else
				close("out")
			end
		end
	end)

	local dragging, inp, start, cpos, target
	local speed = 0.4

	local function update(input)
		local delta = input.Position - start
		target = UDim2.new(
			cpos.X.Scale,
			cpos.X.Offset + delta.X,
			cpos.Y.Scale,
			cpos.Y.Offset + delta.Y
		)
	end

	run.RenderStepped:Connect(function()
		if target and dragging then
			Holder.Position = UDim2.new(
				Holder.Position.X.Scale,
				Holder.Position.X.Offset + (target.X.Offset - Holder.Position.X.Offset) * speed,
				Holder.Position.Y.Scale,
				Holder.Position.Y.Offset + (target.Y.Offset - Holder.Position.Y.Offset) * speed
			)
		end

		if dragging then
			ts:Create(str98, TweenInfo.new(0.5), {Thickness = 1.6}):Play()
		else
			ts:Create(str98, TweenInfo.new(0.3), {Thickness = 0}):Play()
		end
	end)

	Holder.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			start = input.Position
			cpos = Holder.Position
			target = cpos

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	Holder.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			inp = input
		end
	end)

	uis.InputChanged:Connect(function(input)
		if input == inp and dragging then
			update(input)
		end
	end)

	actionholder.Parent = Holder
	actionholder.BackgroundColor3 = Color3.new(1, 1, 1)
	actionholder.BackgroundTransparency = 1
	actionholder.BorderColor3 = Color3.new(0, 0, 0)
	actionholder.BorderSizePixel = 0
	actionholder.Position = UDim2.new(0, 0, 0.013, 0)
	actionholder.Size = UDim2.new(0.989,0,0.055,0)

	local s1 = Instance.new("UIStroke")
	local s2 = Instance.new("UIStroke")
	local s3 = Instance.new("UIStroke")

	uls4.Parent = actionholder
	uls4.HorizontalAlignment = Enum.HorizontalAlignment.Right
	uls4.SortOrder = Enum.SortOrder.LayoutOrder
	uls4.Wraps = true
	uls4.VerticalAlignment = Enum.VerticalAlignment.Center
	uls4.Padding = UDim.new(0, 8)

	settings.Name = "settings"
	settings.Parent = actionholder
	settings.BackgroundColor3 = Color3.new(0.121569, 0.0901961, 0.133333)
	settings.BorderColor3 = Color3.new(0, 0, 0)
	settings.BorderSizePixel = 0
	settings.Size = UDim2.new(0, 23, 0, 23)
	settings.Image = "http://www.roblox.com/asset/?id=7059346373"

	s1.Parent = settings
	s1.Color = Color3.fromRGB(91, 67, 100)
	s1.Thickness = 1.3

	settings.MouseEnter:Connect(function()
		ts:Create(s1, TweenInfo.new(0.2), {Color = Color3.fromRGB(225, 166, 249)}):Play()
		ts:Create(settings, TweenInfo.new(0.2), {BackgroundColor3 = Color3.new(0.207843, 0.152941, 0.227451)}):Play()
	end)

	settings.MouseLeave:Connect(function()
		ts:Create(s1, TweenInfo.new(0.2), {Color = Color3.fromRGB(91, 67, 100)}):Play()
		ts:Create(settings, TweenInfo.new(0.2), {BackgroundColor3 = Color3.new(0.121569, 0.0901961, 0.133333)}):Play()
	end)

	settings.MouseButton1Click:Connect(function()
		lib:Notify({
			Title = "Ventures",
			Content = "Settings are not avalible now, will be in future updates ;3",
		})
	end)

	UICorner1.Parent = settings
	UICorner1.CornerRadius = UDim.new(0, 5)

	discord.Name = "discord"
	discord.Parent = actionholder
	discord.BackgroundColor3 = Color3.new(0.121569, 0.0901961, 0.133333)
	discord.BorderColor3 = Color3.new(0, 0, 0)
	discord.BorderSizePixel = 0
	discord.Size = UDim2.new(0, 23, 0, 23)
	discord.Image = "http://www.roblox.com/asset/?id=84828491431270"

	discord.MouseButton1Click:Connect(function()
		--setclipboard("discord.gg/v3n")
		lib:Notify({
			Title = "Ventures",
			Content = "Discord link copied to clipboard!"
		})
	end)

	s2.Parent = discord
	s2.Color = Color3.fromRGB(91, 67, 100)
	s2.Thickness = 1.3

	discord.MouseEnter:Connect(function()
		ts:Create(s2, TweenInfo.new(0.2), {Color = Color3.fromRGB(225, 166, 249)}):Play()
		ts:Create(discord, TweenInfo.new(0.2), {BackgroundColor3 = Color3.new(0.207843, 0.152941, 0.227451)}):Play()
	end)

	discord.MouseLeave:Connect(function()
		ts:Create(s2, TweenInfo.new(0.2), {Color = Color3.fromRGB(91, 67, 100)}):Play()
		ts:Create(discord, TweenInfo.new(0.2), {BackgroundColor3 = Color3.new(0.121569, 0.0901961, 0.133333)}):Play()
	end)

	UICorner2.Parent = discord
	UICorner2.CornerRadius = UDim.new(0, 5)

	closebutton2.Name = "closebutton2"
	closebutton2.Parent = actionholder
	closebutton2.BackgroundColor3 = Color3.new(0.121569, 0.0901961, 0.133333)
	closebutton2.BorderColor3 = Color3.new(0, 0, 0)
	closebutton2.BorderSizePixel = 0
	closebutton2.Size = UDim2.new(0, 23, 0, 23)
	closebutton2.AutoButtonColor = false
	closebutton2.FontFace = rubik
	closebutton2.Text = "X"
	closebutton2.TextColor3 = Color3.new(1, 1, 1)
	closebutton2.TextSize = 17
	closebutton2.TextWrapped = true

	closebutton2.MouseEnter:Connect(function()
		ts:Create(s3, TweenInfo.new(0.2), {Color = Color3.fromRGB(225, 166, 249)}):Play()
		ts:Create(closebutton2, TweenInfo.new(0.2), {BackgroundColor3 = Color3.new(0.207843, 0.152941, 0.227451)}):Play()
	end)

	closebutton2.MouseLeave:Connect(function()
		ts:Create(s3, TweenInfo.new(0.2), {Color = Color3.fromRGB(91, 67, 100)}):Play()
		ts:Create(closebutton2, TweenInfo.new(0.2), {BackgroundColor3 = Color3.new(0.121569, 0.0901961, 0.133333)}):Play()
	end)

	closebutton2.MouseButton1Click:Connect(function()
		close("out")
		task.wait(2)
		Ventures:Destroy()
	end)

	s3.Parent = closebutton2
	s3.Color = Color3.fromRGB(91, 67, 100)
	s3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	s3.Thickness = 1.3

	UICorner3.Parent = closebutton2
	UICorner3.CornerRadius = UDim.new(0, 5)

	ImageLabel.Parent = Holder
	ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabel.BackgroundTransparency = 1.000
	ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ImageLabel.BorderSizePixel = 0
	ImageLabel.Size = UDim2.new(1, 0, 1, 0)
	ImageLabel.Image = "rbxassetid://138515717272375"
	ImageLabel.ImageColor3 = Color3.fromRGB(177, 177, 177)
	ImageLabel.ImageTransparency = 0.910

	UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(188, 188, 188)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
	UIGradient_3.Rotation = -90
	UIGradient_3.Parent = ImageLabel

	UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(72, 72, 72)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
	UIGradient_2.Rotation = -90
	UIGradient_2.Parent = Holder

	UICorner.Parent = Holder

	SideBar.Name = "Side Bar"
	SideBar.Parent = Holder
	SideBar.BackgroundColor3 = Color3.fromRGB(31, 23, 34)
	SideBar.BackgroundTransparency = 0.8
	SideBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SideBar.BorderSizePixel = 0
	SideBar.Size = UDim2.new(0.129870132, 0, 1, 0)

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(72, 72, 72)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
	UIGradient.Rotation = -90
	UIGradient.Parent = SideBar

	UICorner_2.Parent = SideBar

	Logo.Name = "Logo"
	Logo.Parent = SideBar
	Logo.BackgroundColor3 = Color3.fromRGB(235, 159, 221)
	Logo.BackgroundTransparency = 1.000
	Logo.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Logo.BorderSizePixel = 0
	Logo.Position = UDim2.new(0.0700000003, 0, 0, 0)
	Logo.Size = UDim2.new(0.850000024, 0, 0.163461536, 0)
	Logo.Image = "rbxassetid://138872283376721"
	Logo.ImageColor3 = Color3.fromRGB(235, 159, 221)

	UIAspectRatioConstraint.Parent = Logo

	Line.Name = "Line"
	Line.Parent = SideBar
	Line.BackgroundColor3 = Color3.fromRGB(58, 32, 61)
	Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Line.BorderSizePixel = 0
	Line.Position = UDim2.new(0, 0, 0.165000007, 0)
	Line.Size = UDim2.new(1, 0, 0.002,0)

	Line_2.Name = "Line"
	Line_2.Parent = SideBar
	Line_2.BackgroundColor3 = Color3.fromRGB(58, 32, 61)
	Line_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Line_2.BorderSizePixel = 0
	Line_2.Position = UDim2.new(1, 0, 0, 0)
	Line_2.Size = UDim2.new(-0.00999999978, 0, 1, 0)

	TabContainer1.Name = "Tab Container1"
	TabContainer1.Parent = SideBar
	TabContainer1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabContainer1.BackgroundTransparency = 1.000
	TabContainer1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabContainer1.BorderSizePixel = 0
	TabContainer1.Position = UDim2.new(-0.00999999978, 0, 0.186538458, 0)
	TabContainer1.Size = UDim2.new(1, 0, 0.698076904, 0)

	UIListLayout.Parent = TabContainer1
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 15)

	if tablew.Blur and tablew.Blur == true then
		blur.Parent = Holder
		blur.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		blur.BackgroundTransparency = 1.000
		blur.BorderColor3 = Color3.fromRGB(0, 0, 0)
		blur.BorderSizePixel = 0
		blur.Size = UDim2.new(1, 0, 1, 0)
		blur.ZIndex = 0
		blur.Image = "http://www.roblox.com/asset/?id=8387197183"
		blur.ImageColor3 = Color3.fromRGB(74, 0, 0)

		local crnn = Instance.new("UICorner")
		crnn.Parent = blur
	end

	function tab:CreateTab(tablet)
		local holders = {}
		local element = {}
		local selected = nil

		local Tab = Instance.new("Frame")
		local UICorner_3 = Instance.new("UICorner")
		local TabIcon = Instance.new("ImageLabel")
		local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
		local UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
		local TextButton = Instance.new("TextButton")
		local UIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint")
		local UIAspectRatioConstraint_6 = Instance.new("UIAspectRatioConstraint")
		local CornerFrame = Instance.new("Frame")
		local UIAspectRatioConstraint_7 = Instance.new("UIAspectRatioConstraint")
		local TabContainer2 = Instance.new("Frame")
		local UIListLayout_2 = Instance.new("UIListLayout")
		local TabHolder = Instance.new("Frame")
		local UIListLayout_3 = Instance.new("UIListLayout")
		local str2 = Instance.new("UIStroke")

		local function fetchicon(name)
			for k, v in pairs(lucide) do
				if k:find(name) then
					return v 
				end
			end
		end

		Tab.Name = tablet.Name or "Tab"
		Tab.Parent = TabContainer1
		Tab.BackgroundColor3 = Color3.fromRGB(46, 38, 48)
		Tab.BackgroundTransparency = 0.700
		Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Tab.BorderSizePixel = 0
		Tab.Position = UDim2.new(0, 0, 0.140495867, 0)
		Tab.Size = UDim2.new(0.529999971, 0, 0.146005511, 0)

		str2.Parent = Tab
		str2.Name = "str2"
		str2.Color = Color3.fromRGB(91, 67, 100)
		str2.Transparency = 0
		str2.Thickness = 1.3

		Tab.MouseEnter:Connect(function()
			ts:Create(str2, TweenInfo.new(0.4), {Color = Color3.fromRGB(186, 139, 206)}):Play()
		end)

		Tab.MouseLeave:Connect(function()
			ts:Create(str2, TweenInfo.new(0.4), {Color = Color3.fromRGB(91, 67, 100)}):Play()
		end)

		UICorner_3.Parent = Tab

		TabIcon.Name = "Tab Icon"
		TabIcon.Parent = Tab
		TabIcon.AnchorPoint = Vector2.new(0.5,0.5)
		TabIcon.BackgroundColor3 = Color3.fromRGB(235, 159, 221)
		TabIcon.BackgroundTransparency = 1.000
		TabIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabIcon.BorderSizePixel = 0
		TabIcon.Position = UDim2.new(0.5, 0, 0.5,0)
		TabIcon.Size = UDim2.new(0.6, 0, 0.734716992, 0)
		TabIcon.Image = fetchicon(tablet.Icon) or lucide["lucide-pin"]
		TabIcon.ImageColor3 = Color3.fromRGB(235, 159, 221)

		UIAspectRatioConstraint_3.Parent = TabIcon
		UIAspectRatioConstraint_3.AspectRatio = 1.000

		UIAspectRatioConstraint_4.Parent = Tab
		UIAspectRatioConstraint_4.AspectRatio = 1.000

		TextButton.Parent = Tab
		TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextButton.BackgroundTransparency = 1.000
		TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextButton.BorderSizePixel = 0
		TextButton.Size = UDim2.new(1, 0, 1, 0)
		TextButton.FontFace = rubik
		TextButton.Text = " "
		TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		TextButton.TextSize = 14.000

		UIAspectRatioConstraint_5.Parent = TabContainer1
		UIAspectRatioConstraint_5.AspectRatio = 0.275

		UIAspectRatioConstraint_6.Parent = SideBar
		UIAspectRatioConstraint_6.AspectRatio = 0.192

		UIAspectRatioConstraint_7.Parent = CornerFrame
		UIAspectRatioConstraint_7.AspectRatio = 0.017

		TabContainer2.Name = tablet.Name or  "Tabcontainer"
		TabContainer2.Parent = Holder
		TabContainer2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabContainer2.BackgroundTransparency = 1.000
		TabContainer2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabContainer2.BorderSizePixel = 0
		TabContainer2.Visible = false
		TabContainer2.Position = UDim2.new(0.140000002, 0, 0.0710000023, 0)
		TabContainer2.Size = UDim2.new(0.758441567, 0, 0.909615397, 0)

		local UIListLayout = Instance.new("UIListLayout")
		UIListLayout.Parent = TabContainer2
		UIListLayout.Wraps = true
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 10)

		TabName2.Name = "Tab Name2"
		TabName2.Parent = Holder
		TabName2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabName2.BackgroundTransparency = 1.000
		TabName2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabName2.BorderSizePixel = 0
		TabName2.Position = UDim2.new(0.149079561, 0, 0.0134615386, 0)
		TabName2.Size = UDim2.new(0.709090889, 0, 0.0423076935, 0)
		TabName2.FontFace = rubik
		TabName2.Text = tablet.Name or "you forgot to set the name lel"
		TabName2.TextColor3 = Color3.fromRGB(235, 159, 221)
		TabName2.TextSize = 15.000
		TabName2.TextXAlignment = Enum.TextXAlignment.Left

		UIAspectRatioConstraint_30.Parent = TabName2
		UIAspectRatioConstraint_30.AspectRatio = 24.818

		UIAspectRatioConstraint_31.Parent = Holder
		UIAspectRatioConstraint_31.AspectRatio = 1.48

		if tablet.Holders then
			for h, d in pairs(tablet.Holders) do
				local holder = Instance.new("Frame")
				holder.Name = h
				holder.Parent = TabContainer2
				holder.ZIndex = 0
				holder.BackgroundColor3 = Color3.fromRGB(31, 23, 34)
				holder.BackgroundTransparency = 0.3

				local function updt()
					local fr = 0
					for _, v in pairs(holder:GetChildren()) do
						if v:IsA("Frame") then
							fr = fr + 1

							if fr > 3 then
								fr = fr - 0.2
							end
						end
					end
					holder.Size = UDim2.new(0.55, 0, fr / 13.05, 0)
				end

				holder.ChildAdded:Connect(updt)
				holder.ChildRemoved:Connect(updt)

				updt()

				local UIListLayout = Instance.new("UIListLayout")
				UIListLayout.Parent = holder
				UIListLayout.FillDirection = Enum.FillDirection.Vertical
				UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
				UIListLayout.Padding = UDim.new(0, 10)

				local UICorner_6 = Instance.new("UICorner")
				UICorner_6.Parent = holder

				local UIPadding = Instance.new("UIPadding")
				UIPadding.Parent = holder
				UIPadding.PaddingTop = UDim.new(0, 13)

				local str3 = Instance.new("UIStroke")
				str3.Parent = holder
				str3.Color = Color3.fromRGB(91, 67, 100)
				str3.Thickness = 1.3

				local function gettab(tabtype)
					if tabtype == "first" and #TabContainer1:GetChildren() > 0 then
						for _, v in pairs(TabContainer1:GetChildren()) do
							if v:IsA("Frame") then
								return v
							end
						end
					end
					return nil
				end

				local function getcontainer(name)
					for _, v in pairs(Holder:GetChildren()) do
						if v.Name == name then
							return v
						end
					end
					return nil
				end

				local function fade(container, way)
					local tweens = {}

					for _, holder in pairs(container:GetChildren()) do
						if holder:IsA("Frame") then
							local strn = holder:FindFirstChild("UIStroke")
							if not strn then
								lib:Notify({
									Title = "Ventures - Library Error",
									Content = "UIStroke not found for holder: " .. holder.Name .. ". Please check the structure."
								})
								return
							end

							if way then
								if way == "in" then
									for _, v in pairs(holder:GetDescendants()) do
										if v:IsA("GuiObject") and v.Name ~= "specialholder" then
											v.Visible = true
										end
									end
									local ht = ts:Create(holder, TweenInfo.new(0.7), {
										BackgroundTransparency = 0.45
									})
									table.insert(tweens, ht)

									local strt = ts:Create(strn, TweenInfo.new(0.7), {Transparency = 0})
									table.insert(tweens, strt)
								elseif way == "out" then
									local ht = ts:Create(holder, TweenInfo.new(0.7), {
										BackgroundTransparency = 1
									})
									table.insert(tweens, ht)

									local strt = ts:Create(strn, TweenInfo.new(0.7), {Transparency = 1})
									table.insert(tweens, strt)

									for _, v in pairs(holder:GetDescendants()) do
										if v:IsA("GuiObject") then v.Visible = false end
									end
								end
							end
						end
					end

					for _, tween in pairs(tweens) do
						tween:Play()
					end
				end

				if gettab("first") then
					selected = gettab("first")
					if selected then
						selected.BackgroundTransparency = 0

						local container = getcontainer(selected.Name)
						if container then
							container.Visible = true
						else
							fastnotify("library error")
						end
					end
				else
					fastnotify("library error")
				end

				local function settab(tab)
					local container = getcontainer(tab.Name)
					if container then
						container.Visible = true
						fade(container, "in")
					end
				end

				local function hide(tab)
					local container = getcontainer(tab.Name)
					if container then
						fade(container, "out")
						task.delay(0.4, function()
							container.Visible = false
						end)
					end
				end

				local canchange = true
				for _, v in pairs(TabContainer1:GetChildren()) do
					if v:IsA("Frame") and v:FindFirstChild("TextButton") then
						local bttn = v:FindFirstChild("TextButton")

						bttn.MouseButton1Click:Connect(function()
							if canchange and bttn.Parent ~= selected then
								canchange = false

								if selected then
									hide(selected)
									ts:Create(selected, TweenInfo.new(0.4), {BackgroundTransparency = 1.000}):Play()
								end

								selected = bttn.Parent
								settab(selected)
								ts:Create(selected, TweenInfo.new(0.4), {BackgroundTransparency = 0}):Play()

								task.delay(0.4, function()
									canchange = true
								end)
							end
						end)
					end
				end
				holders[h] = holder
			end
		end

		function element:CreateToggle(tablef)
			local parent = holders[tablef.Parented or "1"]

			if not parent then
				lib:Notify({
					Title = "Ventures - CallBack Error",
					Content = "Make sure you parented the toggle correctly: " .. tablef.Name
				})
				return
			end

			local toggle = Instance.new("Frame")
			local toggleame = Instance.new("TextLabel")
			local UIAspectRatioConstraint_8 = Instance.new("UIAspectRatioConstraint")
			local ToggleHolder = Instance.new("Frame")
			local UICorner_4 = Instance.new("UICorner")
			local Toggler = Instance.new("TextButton")
			local UICorner_5 = Instance.new("UICorner")
			local UIAspectRatioConstraint_9 = Instance.new("UIAspectRatioConstraint")
			local UIAspectRatioConstraint_10 = Instance.new("UIAspectRatioConstraint")
			local UIAspectRatioConstraint_11 = Instance.new("UIAspectRatioConstraint")
			local UIPadding = Instance.new("UIPadding")
			local UICorner_6 = Instance.new("UICorner")
			local togglea = Instance.new("Frame")
			local toggleame_2 = Instance.new("TextLabel")
			local UIAspectRatioConstraint_12 = Instance.new("UIAspectRatioConstraint")
			local ToggleHolder_2 = Instance.new("Frame")
			local UICorner_7 = Instance.new("UICorner")
			local Toggler_2 = Instance.new("TextButton")
			local UICorner_8 = Instance.new("UICorner")
			local UIAspectRatioConstraint_13 = Instance.new("UIAspectRatioConstraint")
			local UIAspectRatioConstraint_14 = Instance.new("UIAspectRatioConstraint")
			local UIAspectRatioConstraint_15 = Instance.new("UIAspectRatioConstraint")
			local str = Instance.new("UIStroke") --Gui2Lua dosent save strokes for some reason.

			toggle.Name = "togglea"
			toggle.Parent = parent
			toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			toggle.BackgroundTransparency = 1.000
			toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			toggle.BorderSizePixel = 0
			toggle.Position = UDim2.new(-0.0571428575, 0, 0.156097561, 0)
			toggle.Size = UDim2.new(0,280,0,19)

			toggle.ZIndex = 0

			local uia = Instance.new("UIAspectRatioConstraint")
			uia.Parent = toggle
			uia.AspectRatio = 14.453
			uia.DominantAxis = Enum.DominantAxis.Width

			toggleame.Name = "togglename"
			toggleame.Parent = toggle
			toggleame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			toggleame.BackgroundTransparency = 1.000
			toggleame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			toggleame.BorderSizePixel = 0
			toggleame.Size = UDim2.new(0.819151342, 0, 1, 0)
			toggleame.FontFace = rubik
			toggleame.Text = tablef.Name or "Toggle"
			toggleame.TextColor3 = Color3.fromRGB(83, 57, 88)
			toggleame.TextSize = 14.000
			toggleame.TextXAlignment = Enum.TextXAlignment.Left

			UIAspectRatioConstraint_8.Parent = toggleame
			UIAspectRatioConstraint_8.AspectRatio = 11.839

			ToggleHolder.Name = "ToggleHolder"
			ToggleHolder.Parent = toggle
			ToggleHolder.BackgroundColor3 = Color3.fromRGB(56, 41, 63) -- Color3.fromRGB(42, 45, 63)
			ToggleHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ToggleHolder.BackgroundTransparency = 0.45
			ToggleHolder.BorderSizePixel = 0
			ToggleHolder.Position = UDim2.new(0.818799496, 0, 0, 0)
			ToggleHolder.Size = UDim2.new(0.167224079, 0, 1, 0)

			local bttn = Instance.new("TextButton")
			bttn.Size = UDim2.new(1,0,1,0)
			bttn.Parent = ToggleHolder
			bttn.BackgroundTransparency = 1
			bttn.TextTransparency = 1

			UICorner_4.Parent = ToggleHolder

			Toggler.Name = "Toggler"
			Toggler.Parent = ToggleHolder
			Toggler.AutoButtonColor = false
			Toggler.BackgroundColor3 = Color3.fromRGB(94, 93, 104) --Color3.fromRGB(235, 159, 221)
			Toggler.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Toggler.BorderSizePixel = 0
			Toggler.Position = UDim2.new(0.159999996, 0, 0.5, -6)
			Toggler.Size = UDim2.new(0.239999995, 0, 0.545454562, 0)
			Toggler.FontFace = rubik
			Toggler.Text = ""
			Toggler.TextColor3 = Color3.fromRGB(0, 0, 0)
			Toggler.TextSize = 14.000

			str.Parent = ToggleHolder
			str.Color = Color3.fromRGB(235, 159, 221)
			str.Thickness = 1.6
			str.Transparency = 1

			UICorner_5.CornerRadius = UDim.new(1, 0)
			UICorner_5.Parent = Toggler

			local callback = tablef.Callback
			local bool = tablef.Default or false

			if tablef.Default ~= nil then
				callback(tablef.Default)
				if bool then
					ts:Create(Toggler, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(235, 159, 221)}):Play()
					ts:Create(Toggler, TweenInfo.new(0.3), {Position = UDim2.new(0.680000007, 0, 0.5, -6)}):Play()
					ts:Create(ToggleHolder, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(42, 45, 63)}):Play()
					ts:Create(toggleame, TweenInfo.new(0.3), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
					ts:Create(str, TweenInfo.new(0.3), {Transparency = 0}):Play()
				else
					ts:Create(Toggler, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(94, 93, 104)}):Play()
					ts:Create(Toggler, TweenInfo.new(0.3), {Position = UDim2.new(0.159999996, 0, 0.5, -6)}):Play()
					ts:Create(ToggleHolder, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(56, 41, 63)}):Play()
					ts:Create(toggleame, TweenInfo.new(0.3), {TextColor3 = Color3.fromRGB(83, 57, 88)}):Play()
					ts:Create(str, TweenInfo.new(0.3), {Transparency = 1}):Play()
				end
			end

			bttn.MouseButton1Click:Connect(function()
				bool = not bool
				callback(bool)
				if bool then
					ts:Create(Toggler, TweenInfo.new(0.4), {BackgroundColor3 = Color3.fromRGB(235, 159, 221)}):Play()
					ts:Create(Toggler, TweenInfo.new(0.4), {Position = UDim2.new(0.680000007, 0, 0.5, -6)}):Play()
					ts:Create(ToggleHolder, TweenInfo.new(0.4), {BackgroundColor3 = Color3.fromRGB(42, 45, 63)}):Play()
					ts:Create(toggleame, TweenInfo.new(0.4), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
					ts:Create(str, TweenInfo.new(0.4), {Transparency = 0}):Play()
				else
					ts:Create(Toggler, TweenInfo.new(0.4), {BackgroundColor3 = Color3.fromRGB(94, 93, 104)}):Play()
					ts:Create(Toggler, TweenInfo.new(0.4), {Position = UDim2.new(0.159999996, 0, 0.5, -6)}):Play()
					ts:Create(ToggleHolder, TweenInfo.new(0.4), {BackgroundColor3 = Color3.fromRGB(56, 41, 63)}):Play()
					ts:Create(toggleame, TweenInfo.new(0.4), {TextColor3 = Color3.fromRGB(83, 57, 88)}):Play()
					ts:Create(str, TweenInfo.new(0.4), {Transparency = 1}):Play()
				end
			end)

			return {
				SetValue = function(self, value)
					if type(value) == "boolean" then
						callback(value)
						if value == true then
							ts:Create(Toggler, TweenInfo.new(0.4), {BackgroundColor3 = Color3.fromRGB(235, 159, 221)}):Play()
							ts:Create(Toggler, TweenInfo.new(0.4), {Position = UDim2.new(0.680000007, 0, 0.5, -6)}):Play()
							ts:Create(ToggleHolder, TweenInfo.new(0.4), {BackgroundColor3 = Color3.fromRGB(42, 45, 63)}):Play()
							ts:Create(toggleame, TweenInfo.new(0.4), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
							ts:Create(str, TweenInfo.new(0.4), {Transparency = 0}):Play()
						else
							ts:Create(Toggler, TweenInfo.new(0.4), {BackgroundColor3 = Color3.fromRGB(94, 93, 104)}):Play()
							ts:Create(Toggler, TweenInfo.new(0.4), {Position = UDim2.new(0.159999996, 0, 0.5, -6)}):Play()
							ts:Create(ToggleHolder, TweenInfo.new(0.4), {BackgroundColor3 = Color3.fromRGB(56, 41, 63)}):Play()
							ts:Create(toggleame, TweenInfo.new(0.4), {TextColor3 = Color3.fromRGB(83, 57, 88)}):Play()
							ts:Create(str, TweenInfo.new(0.4), {Transparency = 1}):Play()
						end
					else
						lib:Notify({
							Title = "Ventures - action error",
							Content = "SetValue failed, make sure the value is a boolean.",
						})
					end
				end
			}
		end

		function element:CreateSlider(tables)
			local parent = holders[tables.Parented or "1"]

			if not parent then
				lib:Notify({
					Title = "Ventures - CallBack Error",
					Content = "make sure you parented the slider correctly: " .. tables.Name
				})
				return
			end

			local slider = Instance.new("Frame")
			local name = Instance.new("TextLabel")
			local UIAspectRatioConstraint_16 = Instance.new("UIAspectRatioConstraint")
			local ammount = Instance.new("Frame")
			local UICorner_9 = Instance.new("UICorner")
			local numericvalue = Instance.new("TextLabel")
			local UIAspectRatioConstraint_17 = Instance.new("UIAspectRatioConstraint")
			local UIAspectRatioConstraint_18 = Instance.new("UIAspectRatioConstraint")
			local sliderholder = Instance.new("Frame")
			local UICorner_10 = Instance.new("UICorner")
			local percent = Instance.new("Frame")
			local UIAspectRatioConstraint_19 = Instance.new("UIAspectRatioConstraint")
			local dragger = Instance.new("TextButton")
			local UICorner_11 = Instance.new("UICorner")
			local UIAspectRatioConstraint_20 = Instance.new("UIAspectRatioConstraint")
			local UIAspectRatioConstraint_21 = Instance.new("UIAspectRatioConstraint")
			local UIAspectRatioConstraint_22 = Instance.new("UIAspectRatioConstraint")

			local min, max, default, increment = tables.MinValue, tables.MaxValue, tables.DefaultValue, tables.Increment
			local callmyback = tables.Callback

			slider.Name = "slider"
			slider.Parent = parent
			slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			slider.BackgroundTransparency = 1.000
			slider.Position = UDim2.new(-0.0571428575, 0, 0.312195122, 0)
			slider.Size = UDim2.new(0,280,0,19)

			slider.ZIndex = 0

			name.Name = "name"
			name.Parent = slider
			name.BackgroundTransparency = 1.000
			name.Position = UDim2.new(-0.00246416684, 0, 0, 0)
			name.Size = UDim2.new(0.551417112, 0, 1, 0)
			name.FontFace = rubik
			name.Text = tables.Name or "Slider"
			name.TextColor3 = Color3.fromRGB(240, 255, 250)
			name.TextSize = 14.000
			name.TextXAlignment = Enum.TextXAlignment.Left

			UIAspectRatioConstraint_16.Parent = name
			UIAspectRatioConstraint_16.AspectRatio = 7.970

			ammount.Name = "ammount"
			ammount.Parent = slider
			ammount.BackgroundColor3 = Color3.fromRGB(56, 41, 63)
			ammount.Position = UDim2.new(0.862453878, 0, 0, 0)
			ammount.Size = UDim2.new(0.120401338, 0, 1, 0)

			UICorner_9.CornerRadius = UDim.new(0, 6)
			UICorner_9.Parent = ammount

			numericvalue.Name = "numeric value"
			numericvalue.Parent = ammount
			numericvalue.BackgroundTransparency = 1.000
			numericvalue.Size = UDim2.new(1, 0, 1, 0)
			numericvalue.FontFace = rubik
			numericvalue.Text = tostring(default)
			numericvalue.TextColor3 = Color3.fromRGB(255, 255, 255)
			numericvalue.TextSize = 20.000
			numericvalue.TextWrapped = true

			UIAspectRatioConstraint_17.Parent = numericvalue
			UIAspectRatioConstraint_17.AspectRatio = 1.740

			UIAspectRatioConstraint_18.Parent = ammount
			UIAspectRatioConstraint_18.AspectRatio = 1.740

			sliderholder.Name = "sliderholder"
			sliderholder.Parent = slider
			sliderholder.BackgroundColor3 = Color3.fromRGB(56, 41, 63)
			sliderholder.Position = UDim2.new(0.50836122, 0, 0.431818187, 0)
			sliderholder.Size = UDim2.new(0.29, 0, 0.0909090936, 0)

			UICorner_10.CornerRadius = UDim.new(0, 6)
			UICorner_10.Parent = sliderholder

			percent.Name = "percent"
			percent.Parent = sliderholder
			percent.BackgroundColor3 = Color3.fromRGB(235, 159, 221)  
			percent.Size = UDim2.new(0, 0, 1, 0)

			dragger.Name = "dragger"
			dragger.Parent = sliderholder
			dragger.BackgroundColor3 = Color3.fromRGB(235, 159, 221)
			dragger.Position = UDim2.new(0, 0, 0.5, -6)
			dragger.Size = UDim2.new(0.119999997, 0, 6, 0)
			dragger.FontFace = rubik
			dragger.Text = ""
			dragger.TextSize = 14.000

			UICorner_11.CornerRadius = UDim.new(1, 0)
			UICorner_11.Parent = dragger

			UIAspectRatioConstraint_20.Parent = dragger
			UIAspectRatioConstraint_20.AspectRatio = 1.063

			UIAspectRatioConstraint_21.Parent = sliderholder
			UIAspectRatioConstraint_21.AspectRatio = 53.171

			UIAspectRatioConstraint_22.Parent = slider
			UIAspectRatioConstraint_22.AspectRatio = 14.453

			local value = default or min
			local dragging = false

			if default ~= nil then
				local percentv = (default - min) / (max - min)
				percent.Size = UDim2.new(percentv, 0, 1, 0)
				dragger.Position = UDim2.new(percentv, 0, 0.5, -6)
				numericvalue.Text = tostring(default)

				if type(callmyback) == "function" then
					callmyback(default)
				end
			elseif min ~= nil then
				percent.Size = UDim2.new(0, 0, 1, 0)
				dragger.Position = UDim2.new(0, 0, 0.5, -6)
				numericvalue.Text = tostring(min)

				if type(callmyback) == "function" then
					callmyback(min)
				end
			end

			dragger.MouseButton1Down:Connect(function()
				dragging = true
			end)

			uis.InputEnded:Connect(function(inp)
				if inp.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = false
				end
			end)

			run.RenderStepped:Connect(function()
				if dragging then
					local pos = uis:GetMouseLocation().X
					local abss = sliderholder.AbsolutePosition.X
					local widthq = sliderholder.AbsoluteSize.X

					local percentv = math.clamp((pos - abss) / widthq, 0, 1)
					dragger.Position = UDim2.new(percentv, 0, 0.5, -6)
					percent.Size = UDim2.new(percentv, 0, 1, 0)

					value = math.floor(((min + ((max - min) * percentv)) / increment) + 0.5) * increment
					numericvalue.Text = string.format("%." .. tostring(math.log10(1 / increment)) .. "f", value)
					numericvalue.TextScaled = true
					
					if type(callmyback) == "function" then
						callmyback(value)
					end
				end
			end)
		end

		function element:CreateButton(tablebb)
			local parent = holders[tablebb.Parented or "1"]

			if not parent then
				lib:Notify({
					Title = "Ventures - CallBack Error",
					Content = "make sure you parented the button correctly: " .. tablebb.Name
				})
				return
			end

			local button = Instance.new("Frame")
			local name = Instance.new("TextLabel")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
			local bttn = Instance.new("TextButton")
			local UICorner = Instance.new("UICorner")
			local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")

			button.Name = "button"
			button.Parent = parent
			button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			button.BackgroundTransparency = 1.000
			button.BorderColor3 = Color3.fromRGB(0, 0, 0)
			button.BorderSizePixel = 0
			button.Position = UDim2.new(-0.0571428575, 0, 0.156097561, 0)
			button.Size = UDim2.new(0,280,0,19)

			button.ZIndex = 0

			name.Name = "Toggle Name"
			name.Parent = button
			name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			name.BackgroundTransparency = 1.000
			name.BorderColor3 = Color3.fromRGB(0, 0, 0)
			name.BorderSizePixel = 0
			name.Size = UDim2.new(0.819151342, 0, 1, 0)
			name.FontFace = rubik
			name.Text =  tablebb.Name or "Button"
			name.TextColor3 = Color3.fromRGB(240, 255, 250)
			name.TextSize = 14.000
			name.TextXAlignment = Enum.TextXAlignment.Left

			UIAspectRatioConstraint.Parent = name
			UIAspectRatioConstraint.AspectRatio = 11.839

			UIAspectRatioConstraint_2.Parent = button
			UIAspectRatioConstraint_2.AspectRatio = 14.453

			bttn.Name = "bttn"
			bttn.Parent = button
			bttn.AutoButtonColor = false
			bttn.BackgroundColor3 = Color3.fromRGB(56, 41, 63)
			bttn.AnchorPoint = Vector2.new(0, 0.5)
			bttn.BorderColor3 = Color3.fromRGB(0, 0, 0)
			bttn.BorderSizePixel = 0
			bttn.Position = UDim2.new(0.879000127, 0, 0.5, 0)
			bttn.Size = UDim2.new(0.086554125, 0, 1.37006772, 0)
			bttn.FontFace = rubik
			bttn.Text = ""
			bttn.TextColor3 = Color3.fromRGB(0, 0, 0)
			bttn.TextSize = 14.000

			UICorner.CornerRadius = UDim.new(0, 5)
			UICorner.Parent = bttn

			UIAspectRatioConstraint_3.Parent = bttn
			UIAspectRatioConstraint_3.AspectRatio = 1.063

			local str09 = Instance.new("UIStroke")
			str09.Parent = bttn
			str09.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			str09.Thickness = 1.5
			str09.Color = Color3.fromRGB(56, 41, 63)

			bttn.MouseEnter:Connect(function()
				ts:Create(bttn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(47, 35, 53)}):Play()
			end)

			bttn.MouseLeave:Connect(function()
				ts:Create(bttn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(56, 41, 63)}):Play()
			end)

			local callback = tablebb.Callback

			bttn.MouseButton1Click:Connect(function()
				if type(callback) ~= "function" then
					lib:Notify({
						Title = "Ventures - Callback error",
						Content = "use a function for the callback: ".. name.Text
					})
					return
				else
					coroutine.wrap(function()
						callback()
					end)()

					ts:Create(str09, TweenInfo.new(0.3), {Color = Color3.fromRGB(235, 159, 221)}):Play()
					task.wait(0.3)
					ts:Create(str09, TweenInfo.new(0.3), {Color = Color3.fromRGB(56, 41, 63)}):Play()
				end
			end)
		end

		function element:CreateDropdown(tabled)
			local parent = holders[tabled.Parented or "1"]

			local defaultIndex = tabled.Default or 1
			local values = tabled.Values or {}
			local callback = tabled.Callback or function() end

			if not parent then
				lib:Notify({
					Title = "Ventures - CallBack Error",
					Content = "make sure you parented the dropdown correctly: " .. tabled.Name
				})
				return
			end

			local dropdown = Instance.new("Frame")
			dropdown.Name = "dropdown"
			dropdown.Parent = parent
			dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			dropdown.BackgroundTransparency = 1.000
			dropdown.Size = UDim2.new(0,280,0,19)

			dropdown.ZIndex = 2

			local dropdownname = Instance.new("TextLabel")
			dropdownname.Parent = dropdown
			dropdownname.BackgroundTransparency = 1.000
			dropdownname.Position = UDim2.new(0.002, 0, 0, 0)
			dropdownname.Size = UDim2.new(0.55, 0, 1, 0)
			dropdownname.FontFace = rubik
			dropdownname.Text = tabled.Name or "Dropdown"
			dropdownname.TextColor3 = Color3.fromRGB(240, 255, 250)
			dropdownname.TextSize = 14.000
			dropdownname.TextXAlignment = Enum.TextXAlignment.Left

			local holder = Instance.new("Frame")
			holder.Parent = dropdown
			holder.Name = "drrholder"
			holder.BackgroundColor3 = Color3.fromRGB(55, 40, 62)
			holder.Size = UDim2.new(0.43, 0, 1, 0)
			holder.Position = UDim2.new(0.549,0,0,0)

			local UICorner = Instance.new("UICorner")
			UICorner.CornerRadius = UDim.new(0, 6)
			UICorner.Parent = holder

			local selectorname = Instance.new("TextLabel")
			selectorname.Parent = holder
			selectorname.BackgroundTransparency = 1.000
			selectorname.Size = UDim2.new(0.73, 0, 1, 0)
			selectorname.Position = UDim2.new(0.047,0,0,0)
			selectorname.FontFace = rubik
			selectorname.Text = values[defaultIndex] or "Select"
			selectorname.TextColor3 = Color3.fromRGB(255, 255, 255)
			selectorname.TextSize = 14.000
			selectorname.TextXAlignment = Enum.TextXAlignment.Left

			local ImageButton = Instance.new("ImageButton")
			ImageButton.Parent = holder
			ImageButton.BackgroundTransparency = 1.000
			ImageButton.Position = UDim2.new(0.83, 0, 0, 0)
			ImageButton.Size = UDim2.new(0.17, 0, 1, 0)
			ImageButton.Image = "http://www.roblox.com/asset/?id=11552476728"
			ImageButton.ImageColor3 = Color3.fromRGB(240, 255, 249)

			local valuesholder = Instance.new("Frame")
			valuesholder.Parent = holder
			valuesholder.Name = "specialholder"
			valuesholder.BackgroundColor3 = Color3.fromRGB(55, 40, 62)
			valuesholder.BackgroundTransparency = 0
			valuesholder.Size = UDim2.new(1, 0, 0, 0)
			valuesholder.Position = UDim2.new(0,0,1.456,0)
			valuesholder.Visible = false

			local str = Instance.new("UIStroke")
			str.Parent = valuesholder
			str.Color = Color3.fromRGB(83, 69, 93)
			str.Thickness = 1

			local str3 = Instance.new("UIStroke")
			str3.Parent = holder
			str3.Color = Color3.fromRGB(83, 69, 93)
			str3.Thickness = 1

			local grd = Instance.new("UIGradient")
			grd.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(203, 162, 199)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
			grd.Rotation = -90
			grd.Parent = valuesholder

			local UICorner2 = Instance.new("UICorner")
			UICorner2.Parent = valuesholder

			local UIListLayout = Instance.new("UIListLayout")
			UIListLayout.Parent = valuesholder
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
			UIListLayout.Padding = UDim.new(0, 5)

			local uia2 = Instance.new("UIAspectRatioConstraint")
			uia2.Parent = dropdown
			uia2.AspectRatio = 14.453

			local function updatev()
				for _, child in pairs(valuesholder:GetChildren()) do
					if child:IsA("TextButton") then
						child:Destroy()
					end
				end

				for _, v in ipairs(values) do
					local value = Instance.new("TextButton")
					value.Parent = valuesholder
					value.BackgroundColor3 = Color3.fromRGB(49, 36, 56)
					value.Size = UDim2.new(0, 118, 0, 21)
					value.FontFace = rubik
					value.Text = v
					value.TextScaled = #v > 17
					value.AutoButtonColor = false
					value.TextColor3 = Color3.fromRGB(255, 255, 255)
					value.TextSize = 14

					local str2 = Instance.new("UIStroke")
					str2.Color = Color3.fromRGB(68, 57, 77)
					str2.Parent = value
					str2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					str2.Thickness = 1

					value.MouseEnter:Connect(function()
						ts:Create(str2, TweenInfo.new(0.2), {Color = Color3.fromRGB(150, 125, 168)}):Play()
						ts:Create(value, TweenInfo.new(0.4), {BackgroundColor3 = Color3.fromRGB(42, 31, 48)}):Play()
					end)

					value.MouseLeave:Connect(function()
						ts:Create(str2, TweenInfo.new(0.4), {Color = Color3.fromRGB(68, 57, 77)}):Play()
						ts:Create(value, TweenInfo.new(0.4), {BackgroundColor3 = Color3.fromRGB(49, 36, 56)}):Play()
					end)

					local uia2 = Instance.new("UIAspectRatioConstraint")
					uia2.Parent = value
					uia2.AspectRatio = 5.619

					local grd2 = Instance.new("UIGradient")
					grd2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(203, 162, 199)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
					grd2.Rotation = -90
					grd2.Parent = value

					local UICorner3 = Instance.new("UICorner")
					UICorner3.CornerRadius = UDim.new(0, 5)
					UICorner3.Parent = value

					value.MouseButton1Click:Connect(function()
						selectorname.Text = v
						callback(v)
						valuesholder.Visible = false
						ts:Create(ImageButton, TweenInfo.new(0.2), {Rotation = 0}):Play()
					end)
				end

				valuesholder.Size = UDim2.new(1, 0, #values * 1.36,0)
			end
			
			local function setotherindex(num)
				for _, v in pairs(parent:GetChildren()) do
					if v.Name == "dropdown" and v:IsA("Frame") and v ~= dropdown then
						v.ZIndex = num
					end
				end
			end

			ImageButton.MouseButton1Click:Connect(function()
				local open = not valuesholder.Visible
				valuesholder.Visible = open

				if open then
					ts:Create(ImageButton, TweenInfo.new(0.2), {Rotation = 180}):Play()
					dropdown.ZIndex = 4
					dropdown.Parent.ZIndex = 4
					holder.ZIndex = 4
					valuesholder.ZIndex = 4
					setotherindex(1)
				else
					ts:Create(ImageButton, TweenInfo.new(0.2), {Rotation = 0}):Play()
					dropdown.ZIndex = 2
					holder.ZIndex = 2
					dropdown.Parent.ZIndex = 1
					valuesholder.ZIndex = 1
					setotherindex(2)
				end
			end)


			updatev()

			return {
				OnChanged = function(self, ncalllback)
					callback = ncalllback
				end,

				SetValue = function(self, value)
					if table.find(values, value) then
						selectorname.Text = value
						callback(value)
					else
						lib:Notify({
							Title = "Ventures - action error",
							Content = "SetValue failed, make sure the value exists.",
						})
					end
				end,

				AddValue = function(self, value)
					if type(value) == "string" then
						table.insert(values, value)
					elseif type(value) == "table" then
						for i, v in value do
							table.insert(values, v)
						end
					end
					updatev()
				end,
			}
		end

		function element:CreateInput(tablei)
			local parent = holders[tablei.Parented or "1"]

			if not parent then
				lib:Notify({
					Title = "Ventures - Callback Error",
					Content = "make sure you parented the input correctly: " .. (tablei.Title or "Input")
				})
				return
			end

			local Input = Instance.new("Frame")
			Input.Name = "Input"
			Input.Parent = parent
			Input.BackgroundColor3 = Color3.new(1, 1, 1)
			Input.BackgroundTransparency = 1
			Input.BorderSizePixel = 0
			Input.Position = UDim2.new(0, 0, 0, 0)
			Input.Size = UDim2.new(0,280,0,19)

			local Inputname = Instance.new("TextLabel")
			Inputname.Parent = Input
			Inputname.BackgroundTransparency = 1
			Inputname.Position = UDim2.new(0.002, 0, 0, 0)
			Inputname.Size = UDim2.new(0.55, 0, 1, 0)
			Inputname.Font = Enum.Font.SourceSansBold
			Inputname.FontFace = rubik
			Inputname.Text = tablei.Name or "Input"
			Inputname.TextColor3 = Color3.fromRGB(240, 255, 250)
			Inputname.TextSize = 14
			Inputname.TextXAlignment = Enum.TextXAlignment.Left

			local TextBox = Instance.new("TextBox")
			TextBox.Parent = Input
			TextBox.BackgroundColor3 = Color3.fromRGB(46, 34, 52)
			TextBox.BorderSizePixel = 0
			TextBox.Position = UDim2.new(0.55, 0, 0, 0)
			TextBox.Size = UDim2.new(0.4, 0, 1, 0)
			TextBox.FontFace = rubik
			TextBox.PlaceholderText = tablei.Placeholder or "Placeholder"
			TextBox.PlaceholderColor3 = Color3.fromRGB(111, 76, 118)
			TextBox.Text = tablei.Default or ""
			TextBox.TextColor3 = Color3.new(1, 1, 1)
			TextBox.TextSize = 12
			TextBox.TextXAlignment = Enum.TextXAlignment.Left
			TextBox.ClearTextOnFocus = not tablei.Numeric 

			local str3 = Instance.new("UIStroke")
			str3.Parent = TextBox
			str3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			str3.Color = Color3.fromRGB(83, 69, 93)
			str3.Thickness = 1

			local UICorner = Instance.new("UICorner")
			UICorner.CornerRadius = UDim.new(0, 6)
			UICorner.Parent = TextBox

			local UIPadding = Instance.new("UIPadding")
			UIPadding.PaddingLeft = UDim.new(0, 5)
			UIPadding.Parent = TextBox

			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			UIAspectRatioConstraint.Parent = Inputname
			UIAspectRatioConstraint.AspectRatio = 11.839

			local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
			UIAspectRatioConstraint_2.Parent = Input
			UIAspectRatioConstraint_2.AspectRatio = 14.453

			local function bound()
				local bounds = TextBox.TextBounds
				if bounds.X > TextBox.AbsoluteSize.X - 10 then 
					TextBox.TextScaled = true
				else
					TextBox.TextScaled = false
					TextBox.TextSize = 14
				end
			end

			TextBox:GetPropertyChangedSignal("Text"):Connect(bound)
			TextBox:GetPropertyChangedSignal("AbsoluteSize"):Connect(bound)
			bound()

			local callback = tablei.Callback or function() end

			TextBox.FocusLost:Connect(function(prsd)
				if tablei.IgnoreBlank and TextBox.Text == "" then
					return
				end
				if (not tablei.Finished or prsd) and tablei.Callback then
					if tablei.Numeric then
						local number = tonumber(TextBox.Text)
						if number then
							callback(number)
						else
							lib:Notify({
								Title = "ventures - input err",
								Content = "invalid input for: " .. (tablei.Title or "Input")
							})
						end
					else
						callback(TextBox.Text)
					end
				end
			end)

			return {
				OnChanged = function(self, ncallback)
					callback = ncallback
				end,
				SetValue = function(self, value)
					TextBox.Text = value
					if callback then
						callback(value)
					end
				end,
			}
		end
		
		function element:CreateKeyBindToggle(tablek)
			local parent = holders[tablek.Parented or "1"]

			local keybindkey = Instance.new("Frame")
			local Keybindname = Instance.new("TextLabel")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local Keybind = Instance.new("TextButton")
			local UIPadding = Instance.new("UIPadding")
			local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
			local UICorner = Instance.new("UICorner")
			local UIGradient = Instance.new("UIGradient")

			keybindkey.Name = "keybind key"
			keybindkey.Parent = parent
			keybindkey.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			keybindkey.BackgroundTransparency = 1.000
			keybindkey.BorderSizePixel = 0
			keybindkey.Position = UDim2.new(-0.057, 0, 0.156, 0)
			keybindkey.Size = UDim2.new(0, 280, 0, 19)
			keybindkey.ZIndex = 0

			Keybindname.Name = "Keybindname"
			Keybindname.Parent = keybindkey
			Keybindname.BackgroundTransparency = 1.000
			Keybindname.Size = UDim2.new(0.819, 0, 1, 0)
			Keybindname.Font = Enum.Font.SourceSansBold
			Keybindname.Text = tablek.Name or "Keybind"
			Keybindname.TextColor3 = Color3.fromRGB(240, 255, 250)
			Keybindname.TextSize = 17.000
			Keybindname.TextXAlignment = Enum.TextXAlignment.Left

			UIAspectRatioConstraint.Parent = Keybindname
			UIAspectRatioConstraint.AspectRatio = 11.839

			Keybind.Name = "Keybind"
			Keybind.Parent = keybindkey
			Keybind.BackgroundColor3 = Color3.fromRGB(46, 34, 52)
			Keybind.BorderSizePixel = 0
			Keybind.Position = UDim2.new(0.551, 0, 0, 0)
			Keybind.Size = UDim2.new(0.431, 0, 1, 0)
			Keybind.FontFace = rubik
			Keybind.Text = typeof(tablek.DefaultKeybind) == "EnumItem" and tablek.DefaultKeybind.Name or tablek.DefaultKeybind
			Keybind.TextColor3 = Color3.fromRGB(255, 255, 255)
			Keybind.TextSize = 15.000
			Keybind.TextXAlignment = Enum.TextXAlignment.Center

			UIPadding.Parent = Keybind
			UIPadding.PaddingLeft = UDim.new(0, 5)

			UIAspectRatioConstraint_2.Parent = Keybind
			UIAspectRatioConstraint_2.AspectRatio = 6.235

			UICorner.CornerRadius = UDim.new(0, 6)
			UICorner.Parent = Keybind
			UIGradient.Parent = keybindkey

			local current = tablek.DefaultKeybind
			local isselecting = false

			Keybind.MouseButton1Click:Connect(function()
				print("js")
				Keybind.Text = "Press any key..."
				isselecting = true
			end)

			uis.InputBegan:Connect(function(input, gameProcessed)
				if isselecting and not gameProcessed then
					if input.UserInputType == Enum.UserInputType.Keyboard then
						current = input.KeyCode
						Keybind.Text = input.KeyCode.Name
					elseif input.UserInputType == Enum.UserInputType.MouseButton1 or 
						input.UserInputType == Enum.UserInputType.MouseButton2 then
						current = input.UserInputType
						Keybind.Text = input.UserInputType.Name
					end
					isselecting = false
					Keybind:ReleaseFocus()
				elseif input.KeyCode == current and not isselecting then
					tablek.Callback()
				end
			end)

			return keybindkey
		end

		return element
	end
	return tab
end

return lib
