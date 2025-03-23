	local ChangeLogs = Tabs:CreateTab({
				Name = "Changelogs",
				Icon = "pen",
			})

			local Paragraph = ChangeLogs:CreateParagraph({
				Name = "Changelogs",

				FixHeader = {
					Title = "Discord",
					Content = "Join Our Discord Server For More Updates And Key Changes!",

					TitleAccentColor = Color3.fromRGB(255, 255, 255),
					ContentAccentColor = Color3.fromRGB(255, 255, 255),

					AccentColor = Color3.fromRGB(165, 165, 255),
					AccentTransparency = 0.8,
					StrokeAccentColor = Color3.fromRGB(165, 165, 255),

					UseShadowGrandient = {
						Enabled = true
					},

					CustomImage = {
						Icon = "http://www.roblox.com/asset/?id=84828491431270",
						BackgroundTransparency = 0.8,
						BackgroundColor = Color3.fromRGB(255, 255, 255),

						Callback = function()
							print("alalabua")
						end,

						Stroke = {
							Enabled = true,
							Color = Color3.fromRGB(182, 166, 204),
							Thickness = 1,
							Transparency = 0
						}
					}
				},
			})

return ChangeLogs
