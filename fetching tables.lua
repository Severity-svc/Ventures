local function gs(name:String)
    return game:GetService(name)
end

local fetch = {
  run = gs("RunService"),
  uis = gs("UserInputService"),
  http = gs("HttpService"),  
  tween = gs("TweenService"),
  workspace = gs("Workspace"),
  players = gs("Players")
}
