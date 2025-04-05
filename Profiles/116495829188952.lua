--//Library
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Severity-svc/Ventures/refs/heads/main/Gui/NewGuiLibrary/GuiLibrary.lua'))()

Library:CreateNotification({
	Title = "Ventures - Lobby Detected",
	Content = "Join a game for the main gui to work!",
	Duration = 4,
})

if getgenv and getgenv().queue_on_teleport then
	getgenv().queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/Severity-svc/Ventures/refs/heads/main/Profiles/70876832253163.lua"))()')
end
