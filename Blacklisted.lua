local blacklisted = {
    "1",
    -- add more
} -- Make serversided, for now client-sided

function fetchlist(id)
    for i,v in pairs(blacklisted) do
        if v == id then
            return true
        end
    end
    return false
end
