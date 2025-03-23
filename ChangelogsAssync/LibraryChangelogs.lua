local ChangeLogs = Tabs:CreateTab({
				Name = "Changelogs",
				Icon = "pen",
			})

			local Section = ChangeLogs:CreateSection({
				Title = "GuiAppearence"
			})

			local Paragraph = ChangeLogs:CreateParagraph({
				Name = "Library | Changelogs | 23.03.2025",

				FixHeader = {
					Title = "Fixes:",
					Content = [[
[+] Fixed Notification Animation Going Inside Other Notifications
[+] Fixed Keysystem Minimize Icon
[+] Fixed Keybind Bugging Out
[+] Fixed ScrollingFrame Sizing
[+] Fixed Notification Animation Going Inside Other Notifications
[+] Fixed Keysystem Minimize Icon
[+] Fixed Keybind Bugging Out
[+] Fixed ScrollingFrame Sizing
					]],

					TitleAccentColor = Color3.fromRGB(241, 241, 241),
					ContentAccentColor = Color3.fromRGB(206, 206, 206),

					AccentColor = Color3.fromRGB(24, 52, 66),
					AccentTransparency = 0,
					StrokeAccentColor = Color3.fromRGB(62, 134, 170),

					UseShadowGrandient = {
						Enabled = true
					},
				},

				AddedHeader = {
					Title = "Added:",
					Content = [[
[+] Added Paragraaphs
[+] Added Mobile Device Detection
[+] Added Headers And HeaderIcons
[+] Added KeySystem TextBox Enter Animation
					]],

					TitleAccentColor = Color3.fromRGB(241, 241, 241),
					ContentAccentColor = Color3.fromRGB(206, 206, 206),

					AccentColor = Color3.fromRGB(37, 23, 66),
					AccentTransparency = 0,
					StrokeAccentColor = Color3.fromRGB(98, 61, 176),

					UseShadowGrandient = {
						Enabled = true
					},
				},


				ChangedHeader = {
					Title = "Changed:",
					Content = [[
[+] Changed MainGui Drag Speed
[+] Changed Slider Accent Color
[+] Changed Notification Size And Font
[+] Changed Notiifcation Accent Color
[+] Changed New Notification Enter Animation
[+] Changed Corner Radius To 10 (For Most Frames)
[+] Changed Design Style (Inpired By RayField :3)
[+] Changed Keysystem Exit Animation
					]],

					TitleAccentColor = Color3.fromRGB(241, 241, 241),
					ContentAccentColor = Color3.fromRGB(206, 206, 206),

					AccentColor = Color3.fromRGB(66, 54, 24),
					AccentTransparency = 0,
					StrokeAccentColor = Color3.fromRGB(141, 114, 51),

					UseShadowGrandient = {
						Enabled = true
					},

				},
			})
		end
	end
