local cp = {}
local rbxans = game:GetService("RbxAnalyticsService")
local players = game:GetService("Players")

local whitelisted = {
    ["Severity"] = "E234A003-18E6-4546-996E-CC216EEDAC75",
}

function cp:getsanitizedowner(cid)
    for key, value in pairs(whitelisted) do
        if value == cid then
            return "whitelisted", key
        end
    end
    return "member"
end

return cp
