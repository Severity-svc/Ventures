print("loaded keysystm")
local keysystem = {}

local ts = game:GetService("TweenService")
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer

local function keysystem:CreateKeySystem(SecretKey, Loadstring, Tittle)
	local existingGui = game:GetService("CoreGui"):FindFirstChild("KeySystem Holder") or localPlayer:WaitForChild("PlayerGui"):FindFirstChild("KeySystem Holder")
	if existingGui then
		existingGui:Destroy()
	end

	local ScreenGui = Instance.new("ScreenGui")
	local holder = Instance.new("Frame")
	local tittle = Instance.new("TextLabel")
	local keychan = Instance.new("TextBox")
	local UICorner = Instance.new("UICorner")
	local UIPadding = Instance.new("UIPadding")
	local UIStroke = Instance.new("UIStroke")
	local check = Instance.new("ImageButton")
	local checkCorner = Instance.new("UICorner")
	local checkStroke = Instance.new("UIStroke")
	local Info = Instance.new("TextLabel")
	local InfoCorner = Instance.new("UICorner")
	local InfoStroke = Instance.new("UIStroke")
	local close = Instance.new("TextButton")
	local closeCorner = Instance.new("UICorner")
	local closeStroke = Instance.new("UIStroke")
	local discord = Instance.new("ImageButton")
	local discordCorner = Instance.new("UICorner")
	local discordStroke = Instance.new("UIStroke")

	ScreenGui.Parent = game:GetService("CoreGui") or localPlayer:WaitForChild("PlayerGui")
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	holder.Name = "KeySystem Holder"
	holder.Parent = ScreenGui
	holder.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	holder.Position = UDim2.new(0.305946797, 0, 0.36308068, 0)
	holder.Size = UDim2.new(0.414, 0, 0.227, 0)
	holder.BorderSizePixel = 0

	local HolderCorner = Instance.new("UICorner")
	HolderCorner.CornerRadius = UDim.new(0, 5)
	HolderCorner.Parent = holder

	local HolderStroke = Instance.new("UIStroke")
	HolderStroke.Thickness = 1.3
	HolderStroke.Color = Color3.fromRGB(60, 60, 60)
	HolderStroke.Parent = holder

	local dragging = false
	local dragInput, dragStart, startPos

	local function updateDrag(input)
		local delta = input.Position - dragStart
		holder.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	holder.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = holder.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	holder.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			updateDrag(input)
		end
	end)

	tittle.Name = "Tittle"
	tittle.Parent = holder
	tittle.BackgroundTransparency = 1
	tittle.Position = UDim2.new(0.013, 0, 0, 0)
	tittle.Size = UDim2.new(0.371, 0, 0.118, 0)
	tittle.Font = Enum.Font.FredokaOne
	tittle.Text = Tittle or "Ventures KeySystem"
	tittle.TextColor3 = Color3.fromRGB(255, 255, 255)
	tittle.TextSize = 17
	tittle.TextXAlignment = Enum.TextXAlignment.Left
	tittle.TextYAlignment = Enum.TextYAlignment.Bottom

	keychan.Name = "keychan"
	keychan.Parent = holder
	keychan.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	keychan.Position = UDim2.new(0.024, 0, 0.612, 0)
	keychan.Size = UDim2.new(0.877, 0, 0.204, 0)
	keychan.Font = Enum.Font.FredokaOne
	keychan.PlaceholderText = "Input Your Key Here..."
	keychan.Text = ""
	keychan.TextColor3 = Color3.fromRGB(255, 255, 255)
	keychan.TextSize = 20
	keychan.TextXAlignment = Enum.TextXAlignment.Left

	UICorner.Parent = keychan
	UICorner.CornerRadius = UDim.new(0, 5)

	UIPadding.Parent = keychan
	UIPadding.PaddingLeft = UDim.new(0, 15)

	UIStroke.Parent = keychan
	UIStroke.Thickness = 1.3
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke.Color = Color3.fromRGB(70, 70, 70)

	check.Name = "Check Button"
	check.Parent = holder
	check.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	check.Position = UDim2.new(0.913, 0, 0.612, 0)
	check.Size = UDim2.new(0.076, 0, 0.204, 0)
	check.Image = "http://www.roblox.com/asset/?id=16081386298"
	check.ImageColor3 = Color3.fromRGB(163, 163, 163)

	checkCorner.Parent = check
	checkCorner.CornerRadius = UDim.new(0, 5)

	checkStroke.Parent = check
	checkStroke.Thickness = 1.3
	checkStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	checkStroke.Color = Color3.fromRGB(70, 70, 70)

	check.MouseButton1Click:Connect(function()
		if keychan.Text == SecretKey then
			ts:Create(check, TweenInfo.new(0.4), {BackgroundColor3 = Color3.fromRGB(80, 253, 0), ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
			task.wait(0.4)
			ts:Create(check, TweenInfo.new(0.4), {BackgroundColor3 = Color3.fromRGB(40, 40, 40), ImageColor3 = Color3.fromRGB(163, 163, 163)}):Play()
			ts:Create(holder, TweenInfo.new(0.8), {Position = UDim2.new(0.306, 0, 1.5, 0)}):Play()
			task.wait(0.6)
			holder:Destroy()

			loadstring(game:HttpGet(tostring(Loadstring))()
		else
			ts:Create(check, TweenInfo.new(0.4), {BackgroundColor3 = Color3.fromRGB(253, 75, 75), ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
			task.wait(0.4)
			ts:Create(check, TweenInfo.new(0.4), {BackgroundColor3 = Color3.fromRGB(40, 40, 40), ImageColor3 = Color3.fromRGB(163, 163, 163)}):Play()
			keychan.Text = ""
		end
	end)

	Info.Name = "Info"
	Info.Parent = holder
	Info.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Info.BackgroundTransparency = 1
	Info.Position = UDim2.new(0.024, 0, 0.849, 0)
	Info.Size = UDim2.new(0.951, 0, 0.118, 0)
	Info.Font = Enum.Font.FredokaOne
	Info.Text = "To get the key click on the Discord icon top left, or join using discord.gg/v3n"
	Info.TextColor3 = Color3.fromRGB(80, 80, 80)
	Info.TextSize = 14
	Info.TextYAlignment = Enum.TextYAlignment.Bottom

	close.Name = "Close button"
	close.Parent = holder
	close.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	close.Position = UDim2.new(0.928, 0, 0.032, 0)
	close.Size = UDim2.new(0.06, 0, 0.172, 0)
	close.Font = Enum.Font.FredokaOne
	close.Text = "X"
	close.TextColor3 = Color3.fromRGB(255, 255, 255)
	close.TextSize = 17

	closeCorner.Parent = close
	closeCorner.CornerRadius = UDim.new(0, 5)

	closeStroke.Parent = close
	closeStroke.Thickness = 1.3
	closeStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	closeStroke.Color = Color3.fromRGB(70, 70, 70)

	close.MouseButton1Click:Connect(function()
		ts:Create(holder, TweenInfo.new(0.8), {Position = UDim2.new(0.306, 0, 1.5, 0)}):Play()
		task.wait(0.6)
		holder:Destroy()
	end)

	discord.Name = "Discord Sender"
	discord.Parent = holder
	discord.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	discord.Position = UDim2.new(0.86, 0, 0.032, 0)
	discord.Size = UDim2.new(0.06, 0, 0.172, 0)
	discord.Image = "http://www.roblox.com/asset/?id=84828491431270"
	discord.ImageColor3 = Color3.fromRGB(163, 163, 163)

	discordCorner.Parent = discord
	discordCorner.CornerRadius = UDim.new(0, 5)

	discordStroke.Parent = discord
	discordStroke.Thickness = 1.3
	discordStroke.Color = Color3.fromRGB(70, 70, 70)

	discord.MouseButton1Click:Connect(function()
		ts:Create(discord, TweenInfo.new(0.4), {BackgroundColor3 = Color3.fromRGB(108, 97, 255)}):Play()
		ts:Create(discord, TweenInfo.new(0.4), {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
		task.wait(0.4)
		ts:Create(discord, TweenInfo.new(0.4), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
		ts:Create(discord, TweenInfo.new(0.4), {ImageColor3 = Color3.fromRGB(163, 163, 163)}):Play()
		setclipboard("discord.gg/v3n")
	end)
end
