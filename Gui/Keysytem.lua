local fetch = {}

local ts = game:GetService("TweenService")

function spawnstr(instance)
	local str = Instance.new("UIStroke")
	str.Color = Color3.fromRGB(167, 123, 255)
	str.Thickness = 1
	str.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	str.Parent = instance

	return str
end

local function connecthover(selfinstance, bool, adv, fal)
	if bool then
		ts:Create(selfinstance, TweenInfo.new(0.3), {Size = adv}):Play()
	else
		ts:Create(selfinstance, TweenInfo.new(0.3), {Size = fal}):Play()
	end
end

function fetch:spawnui(key, tittle, discordinvite, load)
	if not type(key) == "string" then
		warn("[ventures, keysytem, fetch]: key must be a string value")
		return
	end

	local Keysystem = Instance.new("ScreenGui")
	local keysystem = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local title = Instance.new("TextLabel")
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	local UIGradient = Instance.new("UIGradient")
	local keyinput = Instance.new("TextBox")
	local UICorner_2 = Instance.new("UICorner")
	local UIPadding = Instance.new("UIPadding")
	local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
	local closebttn = Instance.new("TextButton")
	local UICorner_3 = Instance.new("UICorner")
	local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
	local checkbttn = Instance.new("ImageButton")
	local UICorner_4 = Instance.new("UICorner")
	local UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
	local discordbttn = Instance.new("ImageButton")
	local UICorner_5 = Instance.new("UICorner")
	local UIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint")
	local info = Instance.new("TextLabel")
	local UIAspectRatioConstraint_6 = Instance.new("UIAspectRatioConstraint")
	local UIAspectRatioConstraint_7 = Instance.new("UIAspectRatioConstraint")

	Keysystem.Name = "Keysystem"
	Keysystem.Parent = game:GetService("CoreGui") or game:GetService("Players.LocalPlayer:WaitForChild("PlayerGui")
	Keysystem.Enabled = true
	Keysystem.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	keysystem.Name = "keysystem"
	keysystem.Parent = Keysystem
	keysystem.AnchorPoint = Vector2.new(0.5,0.5)
	keysystem.BackgroundColor3 = Color3.fromRGB(53, 25, 136)
	keysystem.BackgroundTransparency = 0.40
	keysystem.BorderColor3 = Color3.fromRGB(0, 0, 0)
	keysystem.BorderSizePixel = 0
	keysystem.Position = UDim2.new(0.5,0,1.2,0)
	keysystem.Size = UDim2.new(0.234482765, 0, 0.179706603, 0)
	keysystem.Visible = true

	spawnstr(keysystem)

	UICorner.Parent = keysystem

	title.Name = "title"
	title.Parent = keysystem
	title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title.BackgroundTransparency = 1.000
	title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	title.BorderSizePixel = 0
	title.Position = UDim2.new(0.0303951371, 0, 0.0299144927, 0)
	title.Size = UDim2.new(0.607843161, 0, 0.142857149, 0)
	title.Font = Enum.Font.SourceSansBold
	title.Text = "Ventures KeySystem"
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.TextSize = 17.000
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.TextYAlignment = Enum.TextYAlignment.Top

	UIAspectRatioConstraint.Parent = title
	UIAspectRatioConstraint.AspectRatio = 8.857

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(156, 156, 156))}
	UIGradient.Rotation = 90
	UIGradient.Parent = keysystem

	keyinput.Name = "keyinput"
	keyinput.Parent = keysystem
	keyinput.BackgroundColor3 = Color3.fromRGB(53, 25, 136)
	keyinput.BackgroundTransparency = 0.550
	keyinput.BorderColor3 = Color3.fromRGB(0, 0, 0)
	keyinput.BorderSizePixel = 0
	keyinput.Position = UDim2.new(0.0425531901, 0, 0.466858536, 0)
	keyinput.Size = UDim2.new(0.790849686, 0, 0.20408164, 0)
	keyinput.Font = Enum.Font.SourceSansBold
	keyinput.PlaceholderColor3 = Color3.fromRGB(169, 158, 195)
	keyinput.PlaceholderText = "Paste your key here..."
	keyinput.Text = ""
	keyinput.TextColor3 = Color3.fromRGB(255, 255, 255)
	keyinput.TextSize = 17.000
	keyinput.TextXAlignment = Enum.TextXAlignment.Left

	spawnstr(keyinput)

	UICorner_2.Parent = keyinput

	UIPadding.Parent = keyinput
	UIPadding.PaddingLeft = UDim.new(0, 15)

	UIAspectRatioConstraint_2.Parent = keyinput
	UIAspectRatioConstraint_2.AspectRatio = 8.067

	closebttn.Name = "closebttn"
	closebttn.Parent = keysystem
	closebttn.BackgroundColor3 = Color3.fromRGB(53, 25, 136)
	closebttn.BackgroundTransparency = 0.550
	closebttn.BorderColor3 = Color3.fromRGB(0, 0, 0)
	closebttn.BorderSizePixel = 0
	closebttn.Position = UDim2.new(0.890577495, 0, 0.02991453, 0)
	closebttn.Size = UDim2.new(0.0980392173, 0, 0.20408164, 0)
	closebttn.AutoButtonColor = false
	closebttn.Font = Enum.Font.FredokaOne
	closebttn.Text = "X"
	closebttn.TextColor3 = Color3.fromRGB(255, 255, 255)
	closebttn.TextSize = 20.000
	closebttn.TextWrapped = true

	spawnstr(closebttn)

	UICorner_3.Parent = closebttn

	UIAspectRatioConstraint_3.Parent = closebttn
	UIAspectRatioConstraint_3.AspectRatio = 1.000

	checkbttn.Name = "checkbttn"
	checkbttn.Parent = keysystem
	checkbttn.BackgroundColor3 = Color3.fromRGB(53, 25, 136)
	checkbttn.BackgroundTransparency = 0.550
	checkbttn.BorderColor3 = Color3.fromRGB(0, 0, 0)
	checkbttn.BorderSizePixel = 0
	checkbttn.Position = UDim2.new(0.855886042, 0, 0.460141122, 0)
	checkbttn.Size = UDim2.new(0.0980392173, 0, 0.20408164, 0)
	checkbttn.AutoButtonColor = false
	checkbttn.Image = "http://www.roblox.com/asset/?id=16081386298"

	spawnstr(checkbttn)

	UICorner_4.Parent = checkbttn

	UIAspectRatioConstraint_4.Parent = checkbttn
	UIAspectRatioConstraint_4.AspectRatio = 1.000

	discordbttn.Name = "discordbttn"
	discordbttn.Parent = keysystem
	discordbttn.BackgroundColor3 = Color3.fromRGB(53, 25, 136)
	discordbttn.BackgroundTransparency = 0.550
	discordbttn.BorderColor3 = Color3.fromRGB(0, 0, 0)
	discordbttn.BorderSizePixel = 0
	discordbttn.Position = UDim2.new(0.780881584, 0, 0.0257264487, 0)
	discordbttn.Size = UDim2.new(0.0980392173, 0, 0.20408164, 0)
	discordbttn.AutoButtonColor = false
	discordbttn.Image = "http://www.roblox.com/asset/?id=84828491431270"

	spawnstr(discordbttn)

	UICorner_5.Parent = discordbttn

	UIAspectRatioConstraint_5.Parent = discordbttn
	UIAspectRatioConstraint_5.AspectRatio = 1.000

	info.Name = "info"
	info.Parent = keysystem
	info.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	info.BackgroundTransparency = 1.000
	info.BorderColor3 = Color3.fromRGB(0, 0, 0)
	info.BorderSizePixel = 0
	info.Position = UDim2.new(-0.00303939125, 0, 0.724489808, 0)
	info.Size = UDim2.new(1, 0, 0.224489793, 0)
	info.Font = Enum.Font.SourceSansBold
	info.Text = "  To get the key, you have to join our discord by clicking the icon top right, or by joining discord.gg/v3n  "
	info.TextColor3 = Color3.fromRGB(106, 96, 144)
	info.TextScaled = true
	info.TextSize = 17.000
	info.TextWrapped = true

	UIAspectRatioConstraint_6.Parent = info
	UIAspectRatioConstraint_6.AspectRatio = 9.273

	UIAspectRatioConstraint_7.Parent = keysystem
	UIAspectRatioConstraint_7.AspectRatio = 2.082

	--main logic

	ts:Create(keysystem, TweenInfo.new(0.4), {Position = UDim2.new(0.5,0,0.45,0)}):Play()
	task.wait(0.36)
	ts:Create(keysystem, TweenInfo.new(0.4), {Position = UDim2.new(0.5,0,0.5,0)}):Play()

	discordbttn.MouseButton1Click:Connect(function()
		if type(discordinvite) ~= "string" then
			warn("[ventures, fetchkeysystem]: discord invite must be a string")
			return
		else
			setclipboard(discordinvite or "Discord.gg/v3n")
		end
	end)

	closebttn.MouseButton1Click:Connect(function()
		ts:Create(keysystem, TweenInfo.new(0.4), {Position = UDim2.new(0.5,0,0.4,0)}):Play()
		task.wait(0.3)
		ts:Create(keysystem, TweenInfo.new(0.5), {Position = UDim2.new(0.5,0,1.2,0)}):Play()
	end)

	--checkbttn.MouseEnter:Connect(connecthover(checkbttn, true, UDim2.new(0.1,0,0.21,0)))
	--checkbttn.MouseLeave:Connect(connecthover(checkbttn, false, UDim2.new(0.098,0,0.204,0)))

	checkbttn.MouseButton1Click:Connect(function()
		if keyinput.Text == key then
			ts:Create(keysystem, TweenInfo.new(0.4), {Position = UDim2.new(0.5,0,0.4,0)}):Play()
			task.wait(0.3)
			ts:Create(keysystem, TweenInfo.new(0.5), {Position = UDim2.new(0.5,0,1.2,0)}):Play()
			task.wait(0.9)
			keysystem:Destroy()

				if type(load) == "function" then
					load()
				else
					warn("[ventures, fetchkeysystem]: use a function to load the script (eg function() (scriptcode) end)")
				end
		else
			ts:Create(checkbttn, TweenInfo.new(0.4), {BackgroundColor3 = Color3.fromRGB(255, 65, 68)}):Play()
			ts:Create(checkbttn, TweenInfo.new(0.4), {Transparency = 0}):Play()

			task.wait(1)

			ts:Create(checkbttn, TweenInfo.new(0.4), {BackgroundColor3 = Color3.fromRGB(53, 25, 136)}):Play()
			ts:Create(checkbttn, TweenInfo.new(0.4), {Transparency = 0.55}):Play()
			return
		end
	end)
	return keysystem
end

return fetch
