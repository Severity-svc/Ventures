-- Gui to Lua
-- Version: 3.2

-- Instances:
-- Font Id ( Rubik ): 12187365977
local Rectum2 = Instance.new("ScreenGui")
local Hub = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TabHolder = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local Section = Instance.new("TextLabel")
local TabNotselected = Instance.new("Frame")
local TabIcon = Instance.new("ImageLabel")
local TabName = Instance.new("TextLabel")
local UIPadding = Instance.new("UIPadding")
local UIListLayout_2 = Instance.new("UIListLayout")
local TabSelected = Instance.new("Frame")
local TabIcon_2 = Instance.new("ImageLabel")
local TabName_2 = Instance.new("TextLabel")
local UIPadding_2 = Instance.new("UIPadding")
local UIListLayout_3 = Instance.new("UIListLayout")
local UICorner_2 = Instance.new("UICorner")
local Section_2 = Instance.new("TextLabel")
local TabContent = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local CornerBar = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local TopBar = Instance.new("Frame")
local SaveIcon = Instance.new("ImageLabel")
local SaveText = Instance.new("TextLabel")
local SelectedTab = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local TabName_3 = Instance.new("TextLabel")
local UIPadding_3 = Instance.new("UIPadding")
local TabCloser = Instance.new("TextButton")
local TabHandler = Instance.new("Frame")
local UIListLayout_4 = Instance.new("UIListLayout")
local Tab = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")
local TabName_4 = Instance.new("TextLabel")
local UIPadding_4 = Instance.new("UIPadding")
local UIListLayout_5 = Instance.new("UIListLayout")
local Toggleenabled = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local UIPadding_5 = Instance.new("UIPadding")
local Frame = Instance.new("Frame")
local UICorner_7 = Instance.new("UICorner")
local TextButton = Instance.new("TextButton")
local ImageButton = Instance.new("ImageButton")
local Toggledisabled = Instance.new("Frame")
local TextLabel_2 = Instance.new("TextLabel")
local UIPadding_6 = Instance.new("UIPadding")
local Frame_2 = Instance.new("Frame")
local UICorner_8 = Instance.new("UICorner")
local TextButton_2 = Instance.new("TextButton")
local Slider = Instance.new("Frame")
local Frame_3 = Instance.new("Frame")
local UICorner_9 = Instance.new("UICorner")
local TextButton_3 = Instance.new("TextButton")
local UICorner_10 = Instance.new("UICorner")
local TextLabel_3 = Instance.new("TextLabel")
local TextLabel_4 = Instance.new("TextLabel")
local UIPadding_7 = Instance.new("UIPadding")
local UIGradient = Instance.new("UIGradient")
local userProfile = Instance.new("ImageLabel")
local UICorner_11 = Instance.new("UICorner")
local Display = Instance.new("TextLabel")
local version = Instance.new("TextLabel")
local HubTittle = Instance.new("TextLabel")
local UserName = Instance.new("TextLabel")

--Properties:

Rectum2.Name = "Rectum2"
Rectum2.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Rectum2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Hub.Name = "Hub"
Hub.Parent = Rectum2
Hub.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
Hub.BorderColor3 = Color3.fromRGB(0, 0, 0)
Hub.BorderSizePixel = 0
Hub.Position = UDim2.new(0.5, -356, 0.5, -263)
Hub.Size = UDim2.new(0.44306162, 0, 0.643031776, 0)

UICorner.Parent = Hub

TabHolder.Name = "TabHolder"
TabHolder.Parent = Hub
TabHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabHolder.BackgroundTransparency = 1.000
TabHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabHolder.BorderSizePixel = 0
TabHolder.Position = UDim2.new(0.0154494382, 0, 0.136882097, 0)
TabHolder.Size = UDim2.new(0.258426964, 0, 0.809885919, 0)

UIListLayout.Parent = TabHolder
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)

Section.Name = "Section"
Section.Parent = TabHolder
Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Section.BackgroundTransparency = 1.000
Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
Section.BorderSizePixel = 0
Section.Position = UDim2.new(0, 0, 0.272300482, 0)
Section.Size = UDim2.new(0.902173936, 0, 0.0727699548, 0)
Section.Font = Enum.Font.Unknown
Section.Text = "Section"
Section.TextColor3 = Color3.fromRGB(117, 117, 117)
Section.TextSize = 14.000
Section.TextXAlignment = Enum.TextXAlignment.Left
Section.TextYAlignment = Enum.TextYAlignment.Bottom

TabNotselected.Name = "Tab:Notselected"
TabNotselected.Parent = TabHolder
TabNotselected.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabNotselected.BackgroundTransparency = 1.000
TabNotselected.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabNotselected.BorderSizePixel = 0
TabNotselected.Position = UDim2.new(0, 0, 0.0563380271, 0)
TabNotselected.Size = UDim2.new(0.809782624, 0, 0.0821596235, 0)

TabIcon.Name = "TabIcon"
TabIcon.Parent = TabNotselected
TabIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabIcon.BackgroundTransparency = 1.000
TabIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabIcon.BorderSizePixel = 0
TabIcon.Size = UDim2.new(0.201342285, 0, 0.857142866, 0)
TabIcon.Image = "http://www.roblox.com/asset/?id=100500296638402"
TabIcon.ImageColor3 = Color3.fromRGB(76, 88, 255)

TabName.Name = "TabName"
TabName.Parent = TabNotselected
TabName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabName.BackgroundTransparency = 1.000
TabName.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabName.BorderSizePixel = 0
TabName.Size = UDim2.new(1.34228194, 0, 1.42857146, 0)
TabName.Font = Enum.Font.Unknown
TabName.Text = "Combat "
TabName.TextColor3 = Color3.fromRGB(255, 255, 255)
TabName.TextSize = 14.000
TabName.TextWrapped = true
TabName.TextXAlignment = Enum.TextXAlignment.Left

UIPadding.Parent = TabName
UIPadding.PaddingLeft = UDim.new(0, 10)

UIListLayout_2.Parent = TabNotselected
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center

TabSelected.Name = "Tab:Selected"
TabSelected.Parent = TabHolder
TabSelected.BackgroundColor3 = Color3.fromRGB(76, 76, 255)
TabSelected.BackgroundTransparency = 0.950
TabSelected.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabSelected.BorderSizePixel = 0
TabSelected.Position = UDim2.new(0, 0, 0.0563380271, 0)
TabSelected.Size = UDim2.new(0.809782624, 0, 0.0821596235, 0)

TabIcon_2.Name = "TabIcon"
TabIcon_2.Parent = TabSelected
TabIcon_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabIcon_2.BackgroundTransparency = 1.000
TabIcon_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabIcon_2.BorderSizePixel = 0
TabIcon_2.Size = UDim2.new(0, 30, 0, 30)
TabIcon_2.Image = "http://www.roblox.com/asset/?id=100500296638402"
TabIcon_2.ImageColor3 = Color3.fromRGB(76, 88, 255)

TabName_2.Name = "TabName"
TabName_2.Parent = TabSelected
TabName_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabName_2.BackgroundTransparency = 1.000
TabName_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabName_2.BorderSizePixel = 0
TabName_2.Size = UDim2.new(0, 200, 0, 50)
TabName_2.Font = Enum.Font.Unknown
TabName_2.Text = "Combat "
TabName_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TabName_2.TextSize = 14.000
TabName_2.TextWrapped = true
TabName_2.TextXAlignment = Enum.TextXAlignment.Left

UIPadding_2.Parent = TabName_2
UIPadding_2.PaddingLeft = UDim.new(0, 10)

UIListLayout_3.Parent = TabSelected
UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_3.VerticalAlignment = Enum.VerticalAlignment.Center

UICorner_2.Parent = TabSelected

Section_2.Name = "Section"
Section_2.Parent = TabHolder
Section_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Section_2.BackgroundTransparency = 1.000
Section_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Section_2.BorderSizePixel = 0
Section_2.Position = UDim2.new(0, 0, 0.272300482, 0)
Section_2.Size = UDim2.new(0.902173936, 0, 0.0727699548, 0)
Section_2.Font = Enum.Font.Unknown
Section_2.Text = "Section"
Section_2.TextColor3 = Color3.fromRGB(117, 117, 117)
Section_2.TextSize = 14.000
Section_2.TextXAlignment = Enum.TextXAlignment.Left
Section_2.TextYAlignment = Enum.TextYAlignment.Bottom

TabContent.Name = "TabContent"
TabContent.Parent = Hub
TabContent.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
TabContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabContent.BorderSizePixel = 0
TabContent.Position = UDim2.new(0.248595506, 0, 0, 0)
TabContent.Size = UDim2.new(0.751404524, 0, 1, 0)

UICorner_3.Parent = TabContent

CornerBar.Name = "CornerBar"
CornerBar.Parent = TabContent
CornerBar.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
CornerBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
CornerBar.BorderSizePixel = 0
CornerBar.Position = UDim2.new(-2.62394133e-06, 0, 0, 0)
CornerBar.Size = UDim2.new(0.0168224294, 0, 1, 0)

UICorner_4.Parent = CornerBar

TopBar.Name = "TopBar"
TopBar.Parent = TabContent
TopBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TopBar.BackgroundTransparency = 1.000
TopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
TopBar.BorderSizePixel = 0
TopBar.Position = UDim2.new(0.0168196913, 0, 0, 0)
TopBar.Size = UDim2.new(0.983177543, 0, 0.0760456249, 0)

SaveIcon.Name = "Save Icon"
SaveIcon.Parent = TopBar
SaveIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SaveIcon.BackgroundTransparency = 1.000
SaveIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
SaveIcon.BorderSizePixel = 0
SaveIcon.Position = UDim2.new(0.0186539833, 0, 0.222222224, 0)
SaveIcon.Size = UDim2.new(0.0570342205, 0, 0.75, 0)
SaveIcon.Image = "http://www.roblox.com/asset/?id=12403099678"

SaveText.Name = "SaveText"
SaveText.Parent = SaveIcon
SaveText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SaveText.BackgroundTransparency = 1.000
SaveText.BorderColor3 = Color3.fromRGB(0, 0, 0)
SaveText.BorderSizePixel = 0
SaveText.Position = UDim2.new(0.990368664, 0, -0.0166666675, 0)
SaveText.Size = UDim2.new(2.63333344, 0, 1, 0)
SaveText.Font = Enum.Font.Unknown
SaveText.Text = "Save"
SaveText.TextColor3 = Color3.fromRGB(255, 255, 255)
SaveText.TextSize = 17.000
SaveText.TextXAlignment = Enum.TextXAlignment.Left

SelectedTab.Name = "Selected Tab"
SelectedTab.Parent = TopBar
SelectedTab.BackgroundColor3 = Color3.fromRGB(22, 21, 35)
SelectedTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
SelectedTab.BorderSizePixel = 0
SelectedTab.Position = UDim2.new(0.178707227, 0, 0.222222134, 0)
SelectedTab.Size = UDim2.new(0.14828898, 0, 0.725000024, 0)

UICorner_5.Parent = SelectedTab

TabName_3.Name = "TabName"
TabName_3.Parent = SelectedTab
TabName_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabName_3.BackgroundTransparency = 1.000
TabName_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabName_3.BorderSizePixel = 0
TabName_3.Size = UDim2.new(1, 0, 1, 0)
TabName_3.Font = Enum.Font.Unknown
TabName_3.Text = "Combat"
TabName_3.TextColor3 = Color3.fromRGB(255, 255, 255)
TabName_3.TextSize = 14.000
TabName_3.TextXAlignment = Enum.TextXAlignment.Left

UIPadding_3.Parent = TabName_3
UIPadding_3.PaddingLeft = UDim.new(0, 5)

TabCloser.Name = "TabCloser"
TabCloser.Parent = SelectedTab
TabCloser.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabCloser.BackgroundTransparency = 1.000
TabCloser.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabCloser.BorderSizePixel = 0
TabCloser.Position = UDim2.new(1, -27, 0.5, -13)
TabCloser.Size = UDim2.new(0.346153855, 0, 0.931034505, 0)
TabCloser.Font = Enum.Font.Unknown
TabCloser.Text = "X"
TabCloser.TextColor3 = Color3.fromRGB(149, 67, 67)
TabCloser.TextSize = 14.000

TabHandler.Name = "TabHandler"
TabHandler.Parent = TabContent
TabHandler.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabHandler.BackgroundTransparency = 1.000
TabHandler.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabHandler.BorderSizePixel = 0
TabHandler.Position = UDim2.new(0.0149532715, 0, 0.123574175, 0)
TabHandler.Size = UDim2.new(0.970093429, 0, 0.851711035, 0)

UIListLayout_4.Parent = TabHandler
UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_4.Padding = UDim.new(0, 5)

Tab.Name = "Tab"
Tab.Parent = TabHandler
Tab.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
Tab.BorderSizePixel = 0
Tab.Position = UDim2.new(0.0192678235, 0, 0.015625, 0)
Tab.Size = UDim2.new(0.473988444, 0, 0.4375, 0)

UICorner_6.Parent = Tab

TabName_4.Name = "TabName"
TabName_4.Parent = Tab
TabName_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabName_4.BackgroundTransparency = 1.000
TabName_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabName_4.BorderSizePixel = 0
TabName_4.Position = UDim2.new(0, 0, 0.0306122452, 0)
TabName_4.Size = UDim2.new(1, 0, 0.0867346972, 0)
TabName_4.Font = Enum.Font.Unknown
TabName_4.Text = "Main"
TabName_4.TextColor3 = Color3.fromRGB(131, 131, 131)
TabName_4.TextSize = 14.000

UIPadding_4.Parent = TabName_4
UIPadding_4.PaddingTop = UDim.new(0, 11)

UIListLayout_5.Parent = Tab
UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_5.Padding = UDim.new(0, 10)

Toggleenabled.Name = "Toggle: enabled"
Toggleenabled.Parent = Tab
Toggleenabled.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Toggleenabled.BackgroundTransparency = 1.000
Toggleenabled.BorderColor3 = Color3.fromRGB(0, 0, 0)
Toggleenabled.BorderSizePixel = 0
Toggleenabled.Position = UDim2.new(1, -246, 0.5, -10)
Toggleenabled.Size = UDim2.new(1, 0, 0.107142858, 0)

TextLabel.Parent = Toggleenabled
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(0.422764242, 0, 1, 0)
TextLabel.Font = Enum.Font.Unknown
TextLabel.Text = "Enabled"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 11.000
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

UIPadding_5.Parent = TextLabel
UIPadding_5.PaddingLeft = UDim.new(0, 10)

Frame.Parent = Toggleenabled
Frame.BackgroundColor3 = Color3.fromRGB(76, 88, 255)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.971544743, -15, 0.452380955, -7)
Frame.Size = UDim2.new(0.0609756112, 0, 0.714285731, 0)

UICorner_7.CornerRadius = UDim.new(1, 0)
UICorner_7.Parent = Frame

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 1.000
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Size = UDim2.new(1, 0, 1, 0)
TextButton.AutoButtonColor = false
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = ""
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 14.000

ImageButton.Parent = Toggleenabled
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.BackgroundTransparency = 1.000
ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.870000005, -15, 0.356999993, -7)
ImageButton.Size = UDim2.new(0.08130081, 0, 0.952380955, 0)
ImageButton.Image = "http://www.roblox.com/asset/?id=15351501819"

Toggledisabled.Name = "Toggle: disabled"
Toggledisabled.Parent = Tab
Toggledisabled.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Toggledisabled.BackgroundTransparency = 1.000
Toggledisabled.BorderColor3 = Color3.fromRGB(0, 0, 0)
Toggledisabled.BorderSizePixel = 0
Toggledisabled.Position = UDim2.new(1, -246, 0.5, -10)
Toggledisabled.Size = UDim2.new(1, 0, 0.107142858, 0)

TextLabel_2.Parent = Toggledisabled
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Size = UDim2.new(0.422764242, 0, 1, 0)
TextLabel_2.Font = Enum.Font.Unknown
TextLabel_2.Text = "Stationary"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextSize = 11.000
TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

UIPadding_6.Parent = TextLabel_2
UIPadding_6.PaddingLeft = UDim.new(0, 10)

Frame_2.Parent = Toggledisabled
Frame_2.BackgroundColor3 = Color3.fromRGB(76, 88, 255)
Frame_2.BackgroundTransparency = 1.000
Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(0.971544743, -15, 0.452380955, -7)
Frame_2.Size = UDim2.new(0.0609756112, 0, 0.714285731, 0)

UICorner_8.CornerRadius = UDim.new(1, 0)
UICorner_8.Parent = Frame_2

TextButton_2.Parent = Frame_2
TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton_2.BackgroundTransparency = 1.000
TextButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.BorderSizePixel = 0
TextButton_2.Size = UDim2.new(1, 0, 1, 0)
TextButton_2.AutoButtonColor = false
TextButton_2.Font = Enum.Font.SourceSans
TextButton_2.Text = ""
TextButton_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.TextSize = 14.000

Slider.Name = "Slider"
Slider.Parent = Tab
Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Slider.BackgroundTransparency = 1.000
Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
Slider.BorderSizePixel = 0
Slider.Position = UDim2.new(1, -246, 0.5, -10)
Slider.Size = UDim2.new(1, 0, 0.107142858, 0)

Frame_3.Parent = Slider
Frame_3.BackgroundColor3 = Color3.fromRGB(76, 88, 255)
Frame_3.BackgroundTransparency = 0.550
Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_3.BorderSizePixel = 0
Frame_3.Position = UDim2.new(0.447148532, -15, 0.880952358, -7)
Frame_3.Size = UDim2.new(0.581300795, 0, 0.285714298, 0)

UICorner_9.CornerRadius = UDim.new(1, 0)
UICorner_9.Parent = Frame_3

TextButton_3.Parent = Frame_3
TextButton_3.BackgroundColor3 = Color3.fromRGB(76, 88, 255)
TextButton_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_3.BorderSizePixel = 0
TextButton_3.Size = UDim2.new(0.600000024, 0, 1, 0)
TextButton_3.AutoButtonColor = false
TextButton_3.Font = Enum.Font.SourceSans
TextButton_3.Text = ""
TextButton_3.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_3.TextSize = 14.000

UICorner_10.CornerRadius = UDim.new(1, 0)
UICorner_10.Parent = TextButton_3

TextLabel_3.Parent = Frame_3
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(0, 0, -5.83333349, 0)
TextLabel_3.Size = UDim2.new(1, 0, 5.5, 0)
TextLabel_3.Font = Enum.Font.Unknown
TextLabel_3.Text = "100"
TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.TextXAlignment = Enum.TextXAlignment.Right
TextLabel_3.TextYAlignment = Enum.TextYAlignment.Bottom

TextLabel_4.Parent = Slider
TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.BackgroundTransparency = 1.000
TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_4.BorderSizePixel = 0
TextLabel_4.Size = UDim2.new(0.422764242, 0, 1, 0)
TextLabel_4.Font = Enum.Font.Unknown
TextLabel_4.Text = "Stationary"
TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.TextSize = 11.000
TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left

UIPadding_7.Parent = TextLabel_4
UIPadding_7.PaddingLeft = UDim.new(0, 10)

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(125, 125, 125)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
UIGradient.Rotation = -90
UIGradient.Parent = Hub

userProfile.Name = "userProfile"
userProfile.Parent = Hub
userProfile.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
userProfile.BorderColor3 = Color3.fromRGB(0, 0, 0)
userProfile.BorderSizePixel = 0
userProfile.Position = UDim2.new(0.0154494382, 0, 0.880228162, 0)
userProfile.Size = UDim2.new(0.0716292113, 0, 0.0969581753, 0)
userProfile.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

UICorner_11.CornerRadius = UDim.new(1, 0)
UICorner_11.Parent = userProfile

Display.Name = "Display"
Display.Parent = Hub
Display.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Display.BackgroundTransparency = 1.000
Display.BorderColor3 = Color3.fromRGB(0, 0, 0)
Display.BorderSizePixel = 0
Display.Position = UDim2.new(0.0997190997, 0, 0.880228162, 0)
Display.Size = UDim2.new(0.125, 0, 0.0532319397, 0)
Display.Font = Enum.Font.Unknown
Display.Text = "Tsiuudy"
Display.TextColor3 = Color3.fromRGB(255, 255, 255)
Display.TextSize = 14.000
Display.TextXAlignment = Enum.TextXAlignment.Left

version.Name = "version"
version.Parent = Hub
version.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
version.BackgroundTransparency = 1.000
version.BorderColor3 = Color3.fromRGB(0, 0, 0)
version.BorderSizePixel = 0
version.Position = UDim2.new(0.188202247, 0, 0.960076034, 0)
version.Size = UDim2.new(0.0603912883, 0, 0.0399239548, 0)
version.Font = Enum.Font.Unknown
version.Text = "V1.01"
version.TextColor3 = Color3.fromRGB(255, 223, 94)
version.TextSize = 14.000
version.TextXAlignment = Enum.TextXAlignment.Left

HubTittle.Name = "Hub Tittle"
HubTittle.Parent = Hub
HubTittle.Active = true
HubTittle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HubTittle.BackgroundTransparency = 1.000
HubTittle.BorderColor3 = Color3.fromRGB(0, 0, 0)
HubTittle.BorderSizePixel = 0
HubTittle.Position = UDim2.new(-0.0323033705, 0, 0.0285171103, 0)
HubTittle.Size = UDim2.new(0.280898869, 0, 0.095057033, 0)
HubTittle.Font = Enum.Font.Unknown
HubTittle.Text = "Venture"
HubTittle.TextColor3 = Color3.fromRGB(255, 255, 255)
HubTittle.TextSize = 26.000

UserName.Name = "UserName"
UserName.Parent = Hub
UserName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UserName.BackgroundTransparency = 1.000
UserName.BorderColor3 = Color3.fromRGB(0, 0, 0)
UserName.BorderSizePixel = 0
UserName.Position = UDim2.new(0.0997190997, 0, 0.89733839, 0)
UserName.Size = UDim2.new(0.11095506, 0, 0.0684410632, 0)
UserName.Font = Enum.Font.Unknown
UserName.Text = "@Tsiuudy"
UserName.TextColor3 = Color3.fromRGB(138, 138, 138)
UserName.TextSize = 11.000
UserName.TextXAlignment = Enum.TextXAlignment.Left
