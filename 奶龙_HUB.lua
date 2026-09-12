local scriptUrl = "https://raw.githubusercontent.com/zczczczc766/NailongHUB/refs/heads/main/%E5%A5%B6%E9%BE%99HUB.lua"
local success, response = pcall(function()
    local scriptContent = game:HttpGet(scriptUrl, true)
    return loadstring(scriptContent)()
end)
if not success then
    game:GetService("TeleportService"):Teleport(game.PlaceId)
end