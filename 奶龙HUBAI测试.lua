local function notify(title, text)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = 6
        })
    end)
end

local function report(stage, err)
    warn("[奶龙_HUB诊断] " .. stage .. ": " .. tostring(err))
    notify("奶龙_HUB诊断", stage .. "失败：" .. tostring(err):sub(1, 120))
end

local ok, err = xpcall(function()
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    if not player then
        error("LocalPlayer不存在")
    end

    notify("奶龙_HUB诊断", "开始测试 WindUI...")

    -- 使用官方仓库当前示例使用的入口；这里不加入主题、背景图、
    -- OpenButton、自定义描边等额外配置，先把变量减到最少。
    local url = "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"

    local getOk, code = pcall(function()
        return game:HttpGet(url)
    end)
    if not getOk then
        error("HttpGet失败：" .. tostring(code))
    end
    if type(code) ~= "string" or #code < 100 then
        error("WindUI下载内容异常，长度=" .. tostring(type(code) == "string" and #code or -1))
    end

    notify("奶龙_HUB诊断", "WindUI源码下载成功，正在初始化...")

    local loadOk, loader = pcall(loadstring, code)
    if not loadOk or type(loader) ~= "function" then
        error("loadstring失败：" .. tostring(loader))
    end

    local initOk, WindUI = pcall(loader)
    if not initOk or type(WindUI) ~= "table" then
        error("WindUI初始化失败：" .. tostring(WindUI))
    end
    if type(WindUI.CreateWindow) ~= "function" then
        error("WindUI没有CreateWindow")
    end

    notify("奶龙_HUB诊断", "WindUI初始化成功，正在创建最小窗口...")

    local winOk, Window = pcall(function()
        return WindUI:CreateWindow({
            Title = "奶龙_HUB 诊断",
            Author = "UI加载测试",
            Icon = "moon",
            Folder = "NailongHub_Diagnostic",
        })
    end)

    if not winOk or not Window then
        error("CreateWindow失败：" .. tostring(Window))
    end

    local tabOk, Tab = pcall(function()
        return Window:Tab({
            Title = "测试",
            Icon = "check",
        })
    end)

    if not tabOk or not Tab then
        error("Tab创建失败：" .. tostring(Tab))
    end

    local elementOk, elementErr = pcall(function()
        Tab:Paragraph({
            Title = "UI加载成功",
            Desc = "WindUI、CreateWindow、Tab 均正常。",
        })
    end)

    if not elementOk then
        error("Paragraph创建失败：" .. tostring(elementErr))
    end

    notify("奶龙_HUB诊断", "UI加载成功！问题在原脚本的其他部分。")
end, debug.traceback)

if not ok then
    report("整体测试", err)
else
    print("[奶龙_HUB诊断] 最小 UI 测试完成")
end
