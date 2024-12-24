local Sigma = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Sidepanel = Instance.new("Frame")
local UserInfo = Instance.new("Frame")
local Info = Instance.new("Frame")
local Name = Instance.new("TextLabel")
local Name2 = Instance.new("TextLabel")
local Image = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local UICorner_2 = Instance.new("UICorner")
local Tabs = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Section1 = Instance.new("Frame")
local SectionTitle = Instance.new("TextLabel")
local Tab1 = Instance.new("Frame")
local Tab = Instance.new("TextButton")
local TabPic = Instance.new("ImageLabel")
local UICorner_3 = Instance.new("UICorner")
local Tab1Active = Instance.new("Frame")
local Tab_2 = Instance.new("TextButton")
local TabPic_2 = Instance.new("ImageLabel")
local UICorner_4 = Instance.new("UICorner")
local UICorner_5 = Instance.new("UICorner")
local Left = Instance.new("Frame")
local Section = Instance.new("Frame")
local Content = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")
local CheckBox = Instance.new("Frame")
local checkname = Instance.new("TextLabel")
local checkbox = Instance.new("TextButton")
local UICorner_7 = Instance.new("UICorner")
local Title_2 = Instance.new("TextLabel")
local Right = Instance.new("Frame")

--Properties:

Sigma.Name = "Sigma"
Sigma.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Sigma.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = Sigma
Main.BackgroundColor3 = Color3.fromRGB(12, 11, 14)
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.251082242, 0, 0.175040513, 0)
Main.Size = UDim2.new(0, 575, 0, 400)

Sidepanel.Name = "Side-panel"
Sidepanel.Parent = Main
Sidepanel.BackgroundColor3 = Color3.fromRGB(4, 4, 4)
Sidepanel.BorderColor3 = Color3.fromRGB(0, 0, 0)
Sidepanel.BorderSizePixel = 0
Sidepanel.Size = UDim2.new(0, 175, 0, 400)

UserInfo.Name = "UserInfo"
UserInfo.Parent = Sidepanel
UserInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UserInfo.BackgroundTransparency = 100.000
UserInfo.BorderColor3 = Color3.fromRGB(0, 0, 0)
UserInfo.BorderSizePixel = 0
UserInfo.Position = UDim2.new(0, 0, 0.875, 0)
UserInfo.Size = UDim2.new(0, 175, 0, 50)

Info.Name = "Info"
Info.Parent = UserInfo
Info.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Info.BackgroundTransparency = 1.000
Info.BorderColor3 = Color3.fromRGB(0, 0, 0)
Info.BorderSizePixel = 0
Info.Position = UDim2.new(0, 50, 0, 0)
Info.Size = UDim2.new(0, 125, 0, 50)

Name.Name = "Name"
Name.Parent = Info
Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name.BackgroundTransparency = 1.000
Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
Name.BorderSizePixel = 0
Name.Size = UDim2.new(0, 125, 0, 25)
Name.Font = Enum.Font.Ubuntu
Name.Text = "Testing1234567"
Name.TextColor3 = Color3.fromRGB(255, 255, 255)
Name.TextSize = 14.000

Name2.Name = "Name2"
Name2.Parent = Info
Name2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name2.BackgroundTransparency = 1.000
Name2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Name2.BorderSizePixel = 0
Name2.Position = UDim2.new(0, 0, 0, 20)
Name2.Size = UDim2.new(0, 125, 0, 25)
Name2.Font = Enum.Font.Ubuntu
Name2.Text = "Testing1234567"
Name2.TextColor3 = Color3.fromRGB(255, 255, 255)
Name2.TextSize = 14.000
Name2.TextTransparency = 0.500

Image.Name = "Image"
Image.Parent = UserInfo
Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Image.BackgroundTransparency = 1.000
Image.BorderColor3 = Color3.fromRGB(0, 0, 0)
Image.BorderSizePixel = 0
Image.Position = UDim2.new(0, 3, 0, 0)
Image.Size = UDim2.new(0, 50, 0, 50)

ImageLabel.Parent = Image
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.0512857474, 0, 0.0700000003, 0)
ImageLabel.Size = UDim2.new(0, 40, 0, 40)
ImageLabel.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

UICorner.CornerRadius = UDim.new(6, 6)
UICorner.Parent = ImageLabel

UICorner_2.Parent = Sidepanel

Tabs.Name = "Tabs"
Tabs.Parent = Sidepanel
Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Tabs.BackgroundTransparency = 1.000
Tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
Tabs.BorderSizePixel = 0
Tabs.Size = UDim2.new(0, 175, 0, 350)

Title.Name = "Title"
Title.Parent = Tabs
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(0, 175, 0, 50)
Title.Font = Enum.Font.Gotham
Title.Text = "Venture"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 26.000

Section1.Name = "Section1"
Section1.Parent = Tabs
Section1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Section1.BackgroundTransparency = 100.000
Section1.BorderColor3 = Color3.fromRGB(0, 0, 0)
Section1.BorderSizePixel = 0
Section1.Position = UDim2.new(0, 0, 0.142857149, 0)
Section1.Size = UDim2.new(0, 175, 0, 105)

SectionTitle.Name = "Section Title"
SectionTitle.Parent = Section1
SectionTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SectionTitle.BackgroundTransparency = 1.000
SectionTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
SectionTitle.BorderSizePixel = 0
SectionTitle.Size = UDim2.new(0, 80, 0, 12)
SectionTitle.Font = Enum.Font.Gotham
SectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
SectionTitle.TextSize = 12.000
SectionTitle.TextTransparency = 0.500

Tab1.Name = "Tab1"
Tab1.Parent = Section1
Tab1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Tab1.BackgroundTransparency = 1.000
Tab1.BorderColor3 = Color3.fromRGB(0, 0, 0)
Tab1.BorderSizePixel = 0
Tab1.Position = UDim2.new(0, 10, 0, 20)
Tab1.Size = UDim2.new(0, 155, 0, 30)

Tab.Name = "Tab"
Tab.Parent = Tab1
Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Tab.BackgroundTransparency = 1.000
Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
Tab.BorderSizePixel = 0
Tab.Size = UDim2.new(0, 155, 0, 30)
Tab.Font = Enum.Font.Gotham
Tab.Text = "Tab"
Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
Tab.TextSize = 14.000

TabPic.Name = "Tab-Pic"
TabPic.Parent = Tab
TabPic.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabPic.BackgroundTransparency = 1.000
TabPic.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabPic.BorderSizePixel = 0
TabPic.Position = UDim2.new(0.0322580636, 0, 0.166666672, 0)
TabPic.Size = UDim2.new(0, 20, 0, 20)
TabPic.Image = "rbxassetid://108143720252181"

UICorner_3.CornerRadius = UDim.new(0, 4)
UICorner_3.Parent = Tab1

Tab1Active.Name = "Tab1-Active"
Tab1Active.Parent = Section1
Tab1Active.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
Tab1Active.BackgroundTransparency = 0.500
Tab1Active.BorderColor3 = Color3.fromRGB(0, 0, 0)
Tab1Active.BorderSizePixel = 0
Tab1Active.Position = UDim2.new(0, 10, 0, 55)
Tab1Active.Size = UDim2.new(0, 155, 0, 30)

Tab_2.Name = "Tab"
Tab_2.Parent = Tab1Active
Tab_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Tab_2.BackgroundTransparency = 1.000
Tab_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Tab_2.BorderSizePixel = 0
Tab_2.Size = UDim2.new(0, 155, 0, 30)
Tab_2.Font = Enum.Font.Gotham
Tab_2.Text = "Tab Active"
Tab_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Tab_2.TextSize = 14.000

TabPic_2.Name = "Tab-Pic"
TabPic_2.Parent = Tab_2
TabPic_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabPic_2.BackgroundTransparency = 1.000
TabPic_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabPic_2.BorderSizePixel = 0
TabPic_2.Position = UDim2.new(0.0322580636, 0, 0.166666672, 0)
TabPic_2.Size = UDim2.new(0, 20, 0, 20)
TabPic_2.Image = "rbxassetid://108143720252181"

UICorner_4.CornerRadius = UDim.new(0, 4)
UICorner_4.Parent = Tab1Active

UICorner_5.Parent = Main

Left.Name = "Left"
Left.Parent = Main
Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Left.BackgroundTransparency = 1.000
Left.BorderColor3 = Color3.fromRGB(0, 0, 0)
Left.BorderSizePixel = 0
Left.Position = UDim2.new(0.304347813, 0, 0, 0)
Left.Size = UDim2.new(0, 200, 0, 400)

Section.Name = "Section"
Section.Parent = Left
Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Section.BackgroundTransparency = 1.000
Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
Section.BorderSizePixel = 0
Section.Position = UDim2.new(0, 0, 0.0775000006, 0)
Section.Size = UDim2.new(0, 200, 0, 177)

Content.Name = "Content"
Content.Parent = Section
Content.BackgroundColor3 = Color3.fromRGB(10, 10, 18)
Content.BackgroundTransparency = 0.500
Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
Content.BorderSizePixel = 0
Content.Position = UDim2.new(0, 0, 0.150000006, 0)
Content.Size = UDim2.new(0, 200, 0, 150)

UICorner_6.Parent = Content

CheckBox.Name = "CheckBox"
CheckBox.Parent = Content
CheckBox.BackgroundColor3 = Color3.fromRGB(251, 251, 251)
CheckBox.BackgroundTransparency = 1.000
CheckBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
CheckBox.BorderSizePixel = 0
CheckBox.Position = UDim2.new(0.0949999988, 0, 0.0299999993, 0)
CheckBox.Size = UDim2.new(0, 160, 0, 20)

checkname.Name = "checkname"
checkname.Parent = CheckBox
checkname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
checkname.BackgroundTransparency = 1.000
checkname.BorderColor3 = Color3.fromRGB(0, 0, 0)
checkname.BorderSizePixel = 0
checkname.Position = UDim2.new(-0.0125000002, 0, 0, 0)
checkname.Size = UDim2.new(0, 50, 0, 20)
checkname.Font = Enum.Font.Gotham
checkname.Text = "Enabled"
checkname.TextColor3 = Color3.fromRGB(255, 255, 255)
checkname.TextSize = 14.000

checkbox.Name = "checkbox"
checkbox.Parent = CheckBox
checkbox.BackgroundColor3 = Color3.fromRGB(16, 24, 49)
checkbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
checkbox.BorderSizePixel = 0
checkbox.Position = UDim2.new(0.862500012, 0, 0.100000001, 0)
checkbox.Size = UDim2.new(0, 15, 0, 15)
checkbox.AutoButtonColor = false
checkbox.Font = Enum.Font.SourceSans
checkbox.TextColor3 = Color3.fromRGB(0, 0, 0)
checkbox.TextSize = 14.000
checkbox.TextTransparency = 1.000

UICorner_7.CornerRadius = UDim.new(8, 8)
UICorner_7.Parent = checkbox

Title_2.Name = "Title"
Title_2.Parent = Section
Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_2.BackgroundTransparency = 1.000
Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title_2.BorderSizePixel = 0
Title_2.Position = UDim2.new(0, 0, -0.0677966103, 0)
Title_2.Size = UDim2.new(0, 200, 0, 50)
Title_2.Font = Enum.Font.SourceSans
Title_2.Text = "MAIN"
Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_2.TextSize = 16.000
Title_2.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
Title_2.TextTransparency = 0.750

Right.Name = "Right"
Right.Parent = Main
Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Right.BackgroundTransparency = 1.000
Right.BorderColor3 = Color3.fromRGB(0, 0, 0)
Right.BorderSizePixel = 0
Right.Position = UDim2.new(0.652173936, 0, 0, 0)
Right.Size = UDim2.new(0, 200, 0, 400)

-- Scripts:

local function EQLQDRZ_fake_script() -- Name.LocalScript 
	local script = Instance.new('LocalScript', Name)

	local loclaplayer = game.Players.LocalPlayer
	script.Parent.Text = loclaplayer.DisplayName
end
coroutine.wrap(EQLQDRZ_fake_script)()
local function BWHREV_fake_script() -- Name2.LocalScript 
	local script = Instance.new('LocalScript', Name2)

	local loclaplayer = game.Players.LocalPlayer
	script.Parent.Text = "@".. loclaplayer.Name
end
coroutine.wrap(BWHREV_fake_script)()
local function VTWAO_fake_script() -- ImageLabel.LocalScript 
	local script = Instance.new('LocalScript', ImageLabel)

	
	-- some of it coded me and some sum shitty studio assistant ;)
	
	local pic = script.Parent
	local localplayer = game.Players.LocalPlayer
	local userid = localplayer.UserId
	local thumbtype = Enum.ThumbnailType.HeadShot
	local thumbsize = Enum.ThumbnailSize.Size420x420
	local content, isReady = game.Players:GetUserThumbnailAsync(userid, thumbtype, thumbsize)
	
	pic.Image = content
end
coroutine.wrap(VTWAO_fake_script)()
local function TPIDJ_fake_script() -- checkbox.LocalScript 
	local script = Instance.new('LocalScript', checkbox)

	local enabled = true
	script.Parent.MouseButton1Up:Connect(function()
		enabled = not enabled
		if enabled then
			script.Parent.BackgroundColor3 = Color3.fromRGB(82, 123, 251)
		else
			script.Parent.BackgroundColor3 = Color3.fromRGB(16, 24, 49)
		end
	end)
end
coroutine.wrap(TPIDJ_fake_script)()
