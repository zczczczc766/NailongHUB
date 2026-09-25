local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "XION"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = player:WaitForChild("PlayerGui")
local warning = Instance.new("TextLabel")
warning.AnchorPoint = Vector2.new(0.5, 0.5)
warning.Position = UDim2.fromScale(0.5, 0.5)
warning.Size = UDim2.fromOffset(1000, 120)
warning.BackgroundTransparency = 1
warning.Font = Enum.Font.GothamMedium
warning.TextColor3 = Color3.fromRGB(255, 255, 255)
warning.TextSize = 26
warning.TextTransparency = 1
warning.Text = "警告：本内容包含闪光效果\n光敏性癫痫患者请在继续前遮盖屏幕"
warning.Parent = gui
TweenService:Create(warning, TweenInfo.new(0.8), {TextTransparency = 0}):Play()
task.wait(2.6)
TweenService:Create(warning, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
task.wait(0.6)
local bg = Instance.new("Frame")
bg.Size = UDim2.fromScale(1, 1)
bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bg.BorderSizePixel = 0
bg.Parent = gui
bg.BackgroundColor3 = Color3.fromRGB(120, 255, 160)
task.wait(0.15)  
bg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
task.wait(0.25)  
bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
local xion = Instance.new("TextLabel")
xion.AnchorPoint = Vector2.new(0.5, 0.5)
xion.Position = UDim2.fromScale(0.5, 0.5)
xion.Size = UDim2.fromOffset(920, 200)
xion.BackgroundTransparency = 1
xion.Font = Enum.Font.BuilderSansBold
xion.Text = "XION"
xion.TextColor3 = Color3.fromRGB(120, 255, 160)
xion.TextSize = 160
xion.TextTransparency = 1
xion.Parent = bg
TweenService:Create(xion, TweenInfo.new(1.4), {TextTransparency = 0}):Play()
task.wait(1.8)
TweenService:Create(bg, TweenInfo.new(0.8), {
	BackgroundColor3 = Color3.fromRGB(120, 255, 160)
}):Play()
task.wait(0.85)
xion:Destroy()
TweenService:Create(bg, TweenInfo.new(1.6, Enum.EasingStyle.Quart), {
	BackgroundTransparency = 1
}):Play()
task.wait(1.7)
gui:Destroy()

local cloneref = (cloneref or clonereference or function(instance) return instance end)
local RunService = cloneref(game:GetService("RunService"))
local TweenService = cloneref(game:GetService("TweenService"))
local Players = cloneref(game:GetService("Players"))

local WindUI
do
    local ok, result = pcall(function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua", true))()
    end)
    if ok and result then
        WindUI = result
    else
        warn("WindUI 加载失败: " .. tostring(result))
        return
    end
end

local GreenCapsule = {
    DarkBlack     = Color3.fromHex("#0A0A0A"),
    Black         = Color3.fromHex("#0F0F0F"),
    DarkGray      = Color3.fromHex("#1A1A1A"),
    Gray          = Color3.fromHex("#2A2A2A"),
    DeepGreen     = Color3.fromHex("#002B00"),
    MidGreen      = Color3.fromHex("#0A5C0A"),
    Green         = Color3.fromHex("#1B9B1B"),
    LightGreen    = Color3.fromHex("#4ADE80"),
    BrightGreen   = Color3.fromHex("#90EE90"),
    SoftGreen     = Color3.fromHex("#BBF7D0"),
    GlowGreen     = Color3.fromHex("#22C55E"),
    DarkBg        = Color3.fromHex("#050A05"),
    White         = Color3.fromHex("#FFFFFF"),
}

local function gradient(text, startColor, endColor)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r = startColor.R + (endColor.R - startColor.R) * t
        local g = startColor.G + (endColor.G - startColor.G) * t
        local b = startColor.B + (endColor.B - startColor.B) * t
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local function greenGradientText(text)
    return gradient3(text, GreenCapsule.BrightGreen, GreenCapsule.DarkBlack, GreenCapsule.BrightGreen)
end

local Window = WindUI:CreateWindow({
    Title = "XION脚本",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    Author = "司空制作",
    Folder = "XION",
    Size = UDim2.fromOffset(580, 400),
    Transparent = true,
    ThemeColor = GreenCapsule.BrightGreen,
    User = {
        Enabled = true,
        Callback = function()
            print("clicked")
        end,
        Anonymous = false
    },
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(1, 0),
    StrokeThickness = 3,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,    GreenCapsule.Green),
        ColorSequenceKeypoint.new(0.5,  GreenCapsule.BrightGreen),
        ColorSequenceKeypoint.new(1,    GreenCapsule.DeepGreen),
    }),
    Glow = true,
    GlowColor = GreenCapsule.Green,
    GlowTransparency = 0.4,
    Draggable = true
})

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0,    GreenCapsule.DeepGreen),
            ColorSequenceKeypoint.new(0.2,  GreenCapsule.Green),
            ColorSequenceKeypoint.new(0.4,  GreenCapsule.BrightGreen),
            ColorSequenceKeypoint.new(0.6,  GreenCapsule.LightGreen),
            ColorSequenceKeypoint.new(0.8,  GreenCapsule.Green),
            ColorSequenceKeypoint.new(1,    GreenCapsule.DeepGreen),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.Position = UDim2.new(0, 0, 0, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageColor3 = GreenCapsule.Green
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(GreenCapsule.Green)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = GreenCapsule.Green
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = GreenCapsule.Green
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = GreenCapsule.Green
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Transparency = 0.3

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,    GreenCapsule.DeepGreen),
            ColorSequenceKeypoint.new(0.2,  GreenCapsule.Green),
            ColorSequenceKeypoint.new(0.4,  GreenCapsule.BrightGreen),
            ColorSequenceKeypoint.new(0.6,  GreenCapsule.LightGreen),
            ColorSequenceKeypoint.new(0.8,  GreenCapsule.BrightGreen),
            ColorSequenceKeypoint.new(1,    GreenCapsule.DeepGreen),
        })
        gradientElement.Enabled = true
        gradientElement.Offset = Vector2.new(0, 0)

        stroke.Parent = mainContainer
        gradientElement.Parent = stroke

        task.spawn(function()
            local rotationSpeed = 30
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + rotationSpeed * 0.05) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat
        task.wait(0.1)
    until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then
        stroke = Instance.new("UIStroke")
        stroke.Thickness = 2
        stroke.Parent = button
    end
    local grad
    repeat
        task.wait(0.05)
        grad = stroke:FindFirstChildWhichIsA("UIGradient")
    until grad
    if not grad then
        grad = Instance.new("UIGradient")
        grad.Parent = stroke
    end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,    GreenCapsule.DeepGreen),
        ColorSequenceKeypoint.new(0.2,  GreenCapsule.Green),
        ColorSequenceKeypoint.new(0.4,  GreenCapsule.BrightGreen),
        ColorSequenceKeypoint.new(0.6,  GreenCapsule.LightGreen),
        ColorSequenceKeypoint.new(0.8,  GreenCapsule.Green),
        ColorSequenceKeypoint.new(1,    GreenCapsule.DeepGreen),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if not grad or not grad.Parent then return end
        local t = tick() * 50
        grad.Rotation = t % 360
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.Position = UDim2.new(0, 0, 0, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, GreenCapsule.DeepGreen),
        ColorSequenceKeypoint.new(0.4, GreenCapsule.Green),
        ColorSequenceKeypoint.new(0.7, GreenCapsule.BrightGreen),
        ColorSequenceKeypoint.new(1, GreenCapsule.DarkBlack),
    })
    topGrad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.7),
        NumberSequenceKeypoint.new(0.5, 0.85),
        NumberSequenceKeypoint.new(1, 1),
    })
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, GreenCapsule.DarkBlack),
        ColorSequenceKeypoint.new(0.4, GreenCapsule.BrightGreen),
        ColorSequenceKeypoint.new(0.7, GreenCapsule.Green),
        ColorSequenceKeypoint.new(1, GreenCapsule.DeepGreen),
    })
    bottomGrad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.5, 0.85),
        NumberSequenceKeypoint.new(1, 0.9),
    })
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    mainFrame.BackgroundColor3 = GreenCapsule.Black
    mainFrame.BackgroundTransparency = 0.05

    for _, child in ipairs(mainFrame:GetChildren()) do
        if child:IsA("Frame") and child.Name ~= "TopGlow" and child.Name ~= "BottomGlow" then
            child.BackgroundColor3 = GreenCapsule.DarkBlack
            child.BackgroundTransparency = 0.1
        end
    end
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end
    task.wait(0.2)

    local titleLabel = nil
    for _, v in ipairs(mainFrame:GetDescendants()) do
        if v:IsA("TextLabel") and (v.Text == "XION脚本" or v.Text:find("XION")) then
            titleLabel = v
            break
        end
    end
    if not titleLabel then return end

    local grad = Instance.new("UIGradient")
    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,    GreenCapsule.BrightGreen),
        ColorSequenceKeypoint.new(0.5,  GreenCapsule.LightGreen),
        ColorSequenceKeypoint.new(1,    GreenCapsule.Green),
    })
    grad.Rotation = 90
    grad.Parent = titleLabel

    RunService.Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Offset = Vector2.new((math.sin(tick() * 0.5) + 1) / 2, 0)
        end
    end)
end)

local function RainbowColor(t)
    local r = math.sin(t * 1.5) * 0.5 + 0.5
    local g = math.sin(t * 1.5 + 2) * 0.5 + 0.5
    local b = math.sin(t * 1.5 + 4) * 0.5 + 0.5
    return Color3.new(r, g, b)
end

function Tab(a, icon)
    return Window:Tab({Title = a, Icon = icon})
end

function Button(a, b, c)
    return a:Button({Title = b, Callback = c})
end

function Toggle(a, b, c, d)
    return a:Toggle({Title = b, Value = c, Callback = d})
end

function Slider(a, b, c, d, e, f)
    return a:Slider({Title = b, Step = 1, Value = {Min = c, Max = d, Default = e}, Callback = f})
end

function Dropdown(a, b, c, d, e)
    return a:Dropdown({Title = b, Values = c, Value = d, Callback = e})
end

function Input(a, b, c, d, e, f)
    return a:Input({
        Title = b,
        Desc = c or "",
        Value = d or "",
        Placeholder = e or "",
        Callback = f
    })
end

function SectionLabel(a, b)
    a:Paragraph({
        Title = b,
        Desc = [[ 👇👇👇]],
        Image = "eye",
        ImageSize = 24,
        Color = GreenCapsule.DarkBlack,
        BackgroundTransparency = 1,
        OutlineColor = GreenCapsule.White,
        OutlineThickness = 1,
        Padding = UDim.new(0, 1)
    })
end

local Taba  = Tab("首页", "home")
local Tab1  = Tab("通用", "settings")
local Tabjz  = Tab("加载服务器功能","zap")
local TabFE = Tab("FE", "zap")
local Tabyl = Tab("娱乐", "gamepad-2")
local Tab2  = Tab("ESP", "scan-eye")
local Tab3  = Tab("自瞄", "crosshair")
local Tab4  = Tab("子追", "user-round-search")
local Tabc  = Tab("范围", "move-horizontal")
local Tabjb = Tab("各大脚本", "terminal")
local Tabb  = Tab("设置", "wrench")

local player = Players.LocalPlayer

Taba:Paragraph({
    Title = "系统信息",
    Desc = string.format("用户名: %s\n显示名: %s\n用户ID: %d\n账号年龄: %d天",
        player.Name, player.DisplayName, player.UserId, player.AccountAge),
    Image = "info",
    ImageSize = 20,
    Color = GreenCapsule.BrightGreen
})

Taba:Paragraph({
    Title = "因为源码是之前的我就懒得改这个ui了",
    Desc = [[加载完的脚本是改好的ui]],
    Image = "eye",
    ImageSize = 24,
    Color = GreenCapsule.White,
    BackgroundTransparency = 1,
    OutlineColor = GreenCapsule.White,
    OutlineThickness = 1,
    Padding = UDim.new(0, 1)
})

Taba:Paragraph({
    Title = "最大贡献者：",
    Desc = [[Cappo]],
    Image = "eye",
    ImageSize = 24,
    Color = GreenCapsule.White,
    BackgroundTransparency = 1,
    OutlineColor = GreenCapsule.White,
    OutlineThickness = 1,
    Padding = UDim.new(0, 1)
})
SectionLabel(Tab1, "以下是常用的")

Button(Tab1, "adonis反作弊绕过", function()
    local BypassManager = {
    Hooks = {},
    FlagFunction = nil,
    TerminateFunction = nil,
    IsVerbose = true,
}

local StatusTracker = {
    DetectionDisabled = false,
    KillBlocked = false,
    DebugInfoIntercepted = false,
}

local function wrapFunction(target, handler)
    local success, result = pcall(function()
        return hookfunction(target, newcclosure(handler))
    end)
    return success and result
end

local function activateBypass()
    local currentThread = 2
    setthreadidentity(currentThread)

    local collected = getgc(true)
    for _, item in ipairs(collected) do
        if typeof(item) == 'table' then
            local detectionMethod = rawget(item, 'Detected')
            local killMethod = rawget(item, 'Kill')

            if
                typeof(detectionMethod) == 'function'
                and not BypassManager.FlagFunction
            then
                BypassManager.FlagFunction = detectionMethod
                wrapFunction(
                    detectionMethod,
                    function(trigger, details, preventCrash)
                        if trigger ~= '_' and BypassManager.IsVerbose then
                            
                        end
                        if string.find(details, "Tamper") then
                            return task.wait(9e9)
                        else
                            return true
                        end
                    end
                )
                table.insert(BypassManager.Hooks, detectionMethod)
                StatusTracker.DetectionDisabled = true
            end

            if
                typeof(killMethod) == 'function'
                and rawget(item, 'Variables')
                and rawget(item, 'Process')
                and not BypassManager.TerminateFunction
            then
                BypassManager.TerminateFunction = killMethod
                wrapFunction(killMethod, function(cause)
                    if BypassManager.IsVerbose then
                    end
                    return nil
                end)
                table.insert(BypassManager.Hooks, killMethod)
                StatusTracker.KillBlocked = true
            end
        end
    end
    local Returned
    Returned = hookfunction(
        getrenv().debug.info,
        newcclosure(function(...)
            local LevelOrFunc, Info = ...
            if
                BypassManager.FlagFunction
                and LevelOrFunc == BypassManager.FlagFunction
            then
                if BypassManager.IsVerbose then
                end
                return coroutine.yield(coroutine.running())
            end
            return Returned(...)
        end)
    )

    StatusTracker.DebugInfoIntercepted = true

    local resetThread = 7
    setthreadidentity(resetThread)
end

activateBypass()


end)

Slider(Tab1, "移动速度", 1, 600, player.Character and player.Character.Humanoid.WalkSpeed or 16, function(a)
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = a
    end
end)

Slider(Tab1, "跳跃高度", 1, 600, player.Character and player.Character.Humanoid.JumpPower or 50, function(a)
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.JumpPower = a
    end
end)

Slider(Tab1, "重力设置", 1, 500, workspace.Gravity, function(a)
    workspace.Gravity = a
end)

Button(Tab1, "锁视角", function()
    local ShiftlockStarterGui = Instance.new("ScreenGui")
    local ImageButton = Instance.new("ImageButton")
    ShiftlockStarterGui.Name = "Shiftlock (StarterGui)"
    ShiftlockStarterGui.Parent = game.CoreGui
    ShiftlockStarterGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ShiftlockStarterGui.ResetOnSpawn = false

    ImageButton.Parent = ShiftlockStarterGui
    ImageButton.Active = true
    ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageButton.BackgroundTransparency = 1.000
    ImageButton.Position = UDim2.new(0.921914339, 0, 0.552375436, 0)
    ImageButton.Size = UDim2.new(0.0636147112, 0, 0.0661305636, 0)
    ImageButton.SizeConstraint = Enum.SizeConstraint.RelativeXX
    ImageButton.Image = "http://www.roblox.com/asset/?id=182223762"

    local function TLQOYN_fake_script()
        local script = Instance.new("LocalScript", ImageButton)
        local MobileCameraFramework = {}
        local Players = game.Players
        local runservice = game:GetService("RunService")
        local CAS = game:GetService("ContextActionService")
        local Player = Players.LocalPlayer
        local character = Player.Character or Player.CharacterAdded:Wait()
        local root = character:WaitForChild("HumanoidRootPart")
        local humanoid = character.Humanoid
        local camera = workspace.CurrentCamera
        local button = script.Parent
        uis = game:GetService("UserInputService")
        ismobile = uis.TouchEnabled
        button.Visible = ismobile

        local states = {
            OFF = "rbxasset://textures/ui/mouseLock_off@2x.png",
            ON = "rbxasset://textures/ui/mouseLock_on@2x.png"
        }
        local MAX_LENGTH = 900000
        local active = false
        local ENABLED_OFFSET = CFrame.new(1.7, 0, 0)
        local DISABLED_OFFSET = CFrame.new(-1.7, 0, 0)
        local rootPos = Vector3.new(0,0,0)

        local function UpdatePos()
            if Player.Character and Player.Character:FindFirstChildOfClass"Humanoid" and Player.Character:FindFirstChildOfClass"Humanoid".RootPart then
                rootPos = Player.Character:FindFirstChildOfClass"Humanoid".RootPart.Position
            end
        end
        local function UpdateImage(STATE)
            button.Image = states[STATE]
        end
        local function UpdateAutoRotate(BOOL)
            if Player.Character and Player.Character:FindFirstChildOfClass"Humanoid" then
                Player.Character:FindFirstChildOfClass"Humanoid".AutoRotate = BOOL
            end
        end
        local function GetUpdatedCameraCFrame()
            if game:GetService"Workspace".CurrentCamera then
                return CFrame.new(rootPos, Vector3.new(game:GetService"Workspace".CurrentCamera.CFrame.LookVector.X * MAX_LENGTH, rootPos.Y, game:GetService"Workspace".CurrentCamera.CFrame.LookVector.Z * MAX_LENGTH))
            end
        end
        local function EnableShiftlock()
            UpdatePos()
            UpdateAutoRotate(false)
            UpdateImage("ON")
            if Player.Character and Player.Character:FindFirstChildOfClass"Humanoid" and Player.Character:FindFirstChildOfClass"Humanoid".RootPart then
                Player.Character:FindFirstChildOfClass"Humanoid".RootPart.CFrame = GetUpdatedCameraCFrame()
            end
            if game:GetService"Workspace".CurrentCamera then
                game:GetService"Workspace".CurrentCamera.CFrame = camera.CFrame * ENABLED_OFFSET
            end
        end
        local function DisableShiftlock()
            UpdatePos()
            UpdateAutoRotate(true)
            UpdateImage("OFF")
            if Player.Character and Player.Character:FindFirstChildOfClass"Humanoid" and Player.Character:FindFirstChildOfClass"Humanoid".RootPart then
                Player.Character:FindFirstChildOfClass"Humanoid".RootPart.CFrame = GetUpdatedCameraCFrame()
            end
            if game:GetService"Workspace".CurrentCamera then
                game:GetService"Workspace".CurrentCamera.CFrame = camera.CFrame * DISABLED_OFFSET
            end
        end
        local function toggle()
            active = not active
            if active then EnableShiftlock() else DisableShiftlock() end
        end
        button.MouseButton1Click:Connect(toggle)
        CAS:BindAction("ShiftlockToggle", function(_,_,_) toggle() end, false, Enum.KeyCode.LeftShift)
    end
    TLQOYN_fake_script()
end)

local flyConn = nil
local flySpeed = 2
Button(Tab1, "飞行 [开启/关闭]", function()
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    if flyConn then
        flyConn:Disconnect()
        flyConn = nil
        hrp.Anchored = false
        return
    end

    hrp.Anchored = true
    flyConn = RunService.Heartbeat:Connect(function()
        local cam = workspace.CurrentCamera
        local move = Vector3.new()
        local uis = game:GetService("UserInputService")
        if uis:IsKeyDown(Enum.KeyCode.W) then move = move + cam.CFrame.LookVector end
        if uis:IsKeyDown(Enum.KeyCode.S) then move = move - cam.CFrame.LookVector end
        if uis:IsKeyDown(Enum.KeyCode.A) then move = move - cam.CFrame.RightVector end
        if uis:IsKeyDown(Enum.KeyCode.D) then move = move + cam.CFrame.RightVector end
        if uis:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0,1,0) end
        if uis:IsKeyDown(Enum.KeyCode.LeftControl) then move = move - Vector3.new(0,1,0) end
        if move.Magnitude > 0 then
            hrp.CFrame = hrp.CFrame + move.Unit * flySpeed
        end
    end)
end)

Slider(Tab1, "飞行速度", 1, 20, 2, function(v) flySpeed = v end)

local infJumpConn = nil
Button(Tab1, "无限跳 [开启/关闭]", function()
    if infJumpConn then
        infJumpConn:Disconnect()
        infJumpConn = nil
        return
    end
    infJumpConn = game:GetService("UserInputService").JumpRequest:Connect(function()
        local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end
    end)
end)

Button(Tab1, "爬墙 [开启/关闭]", function()
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    if hrp:FindFirstChild("WallClimb") then
        hrp.WallClimb:Destroy()
        return
    end
    local bv = Instance.new("BodyVelocity", hrp)
    bv.Name = "WallClimb"
    bv.MaxForce = Vector3.new(0, 5000, 0)
    bv.Velocity = Vector3.new(0, 0, 0)
    RunService.Heartbeat:Connect(function()
        if not bv.Parent then return end
        local uis = game:GetService("UserInputService")
        if uis:IsKeyDown(Enum.KeyCode.Space) then
            bv.Velocity = Vector3.new(0, 25, 0)
        else
            bv.Velocity = Vector3.new(0, 0, 0)
        end
    end)
end)

Button(Tab1, "FPS提升", function()
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    if game:GetService("Workspace").Terrain then
        game:GetService("Workspace").Terrain.GraphicsQuality = 1
    end
end)

Button(Tab1, "夜视 [开启/关闭]", function()
    local lighting = game:GetService("Lighting")
    if lighting:FindFirstChild("XION_NightVision") then
        lighting.XION_NightVision:Destroy()
        return
    end
    local nv = Instance.new("ColorCorrectionEffect", lighting)
    nv.Name = "XION_NightVision"
    nv.Brightness = 0.5
    nv.Contrast = 0.3
    nv.TintColor = Color3.fromRGB(100, 255, 100)
end)

Slider(Tab1, "视野大小", 70, 120, 70, function(v)
    if workspace.CurrentCamera then
        workspace.CurrentCamera.FieldOfView = v
    end
end)

Button(Tab1, "删除阴影", function()
    local lighting = game:GetService("Lighting")
    for _, v in ipairs(lighting:GetDescendants()) do
        if v:IsA("ShadowMap") or v:IsA("VoxelLighting") then
            v:Destroy()
        end
    end
    lighting.GlobalShadows = false
end)

Button(Tab1, "关闭动态模糊", function()
    local lighting = game:GetService("Lighting")
    for _, v in ipairs(lighting:GetChildren()) do
        if v:IsA("BlurEffect") then v:Destroy() end
    end
end)

local noclipConn = nil
Button(Tab1, "穿墙 [开启/关闭]", function()
    if noclipConn then
        noclipConn:Disconnect()
        noclipConn = nil
        return
    end
    noclipConn = RunService.Stepped:Connect(function()
        local char = player.Character
        if not char then return end
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end)
end)

Button(Tab1, "点击传送 [开启/关闭]", function()
    local tool = Instance.new("Tool")
    tool.Name = "点击传送"
    tool.RequiresHandle = false
    tool.Parent = player.Backpack
    tool.Activated:Connect(function()
        local mouse = player:GetMouse()
        if mouse.Hit then
            local char = player.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.p + Vector3.new(0, 3, 0))
            end
        end
    end)
end)

SectionLabel(Tab1, "跑酷")

Button(Tab1, "自动跳跃跑酷", function()
    local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
    if not humanoid then return end
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
    RunService.Heartbeat:Connect(function()
        if humanoid.FloorMaterial ~= Enum.Material.Air then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
end)

SectionLabel(Tab1, "黑洞技能")

local blackHoleActive = false
Button(Tab1, "黑洞 [开启/关闭]", function()
    blackHoleActive = not blackHoleActive
    if not blackHoleActive then return end
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local bh = Instance.new("Part", workspace)
    bh.Name = "XION_BlackHole"
    bh.Size = Vector3.new(2, 2, 2)
    bh.Anchored = true
    bh.CanCollide = false
    bh.Transparency = 0.5
    bh.BrickColor = BrickColor.new("Bright green")
    bh.CFrame = hrp.CFrame + Vector3.new(0, 5, -10)

    spawn(function()
        while blackHoleActive and bh.Parent do
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and obj.Parent ~= char and obj.Parent ~= bh then
                    local dist = (obj.Position - bh.Position).Magnitude
                    if dist < 30 and dist > 2 then
                        obj.Velocity = (bh.Position - obj.Position).Unit * 20
                    end
                end
            end
            wait(0.1)
        end
        bh:Destroy()
    end)
end)

SectionLabel(Tab1, "甩飞")

Button(Tab1, "甩飞附近玩家", function()
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    for _, other in ipairs(Players:GetPlayers()) do
        if other ~= player and other.Character and other.Character:FindFirstChild("HumanoidRootPart") then
            local ohrp = other.Character.HumanoidRootPart
            local dist = (ohrp.Position - hrp.Position).Magnitude
            if dist < 50 then
                ohrp.Velocity = (ohrp.Position - hrp.Position).Unit * 200 + Vector3.new(0, 100, 0)
            end
        end
    end
end)

Button(Tab1, "防坠落 [开启/关闭]", function()
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    if hrp:FindFirstChild("AntiFall") then
        hrp.AntiFall:Destroy()
        return
    end
    local bv = Instance.new("BodyVelocity", hrp)
    bv.Name = "AntiFall"
    bv.MaxForce = Vector3.new(0, math.huge, 0)
    bv.Velocity = Vector3.new(0, 0, 0)
    RunService.Heartbeat:Connect(function()
        if not bv.Parent then return end
        if hrp.Position.Y < -50 then
            hrp.CFrame = CFrame.new(hrp.Position.X, 100, hrp.Position.Z)
        end
    end)
end)

SectionLabel(Tab1, "旋转")

local spinConn = nil
Button(Tab1, "旋转 [开启/关闭]", function()
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    if spinConn then
        spinConn:Disconnect()
        spinConn = nil
        return
    end
    spinConn = RunService.Heartbeat:Connect(function()
        hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(5), 0)
    end)
end)

SectionLabel(Tab1, "美化")

Button(Tab1, "无头美化", function()
    local char = player.Character
    if not char then return end
    local head = char:FindFirstChild("Head")
    if head then
        head.Transparency = 1
        for _, child in ipairs(head:GetChildren()) do
            if child:IsA("Decal") or child:IsA("SpecialMesh") then
                child:Destroy()
            end
        end
    end
end)

Button(Tab1, "控制附近NPC", function()
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    for _, model in ipairs(workspace:GetDescendants()) do
        if model:IsA("Model") and model:FindFirstChild("Humanoid") and model ~= char then
            local npcHRP = model:FindFirstChild("HumanoidRootPart")
            if npcHRP and (npcHRP.Position - hrp.Position).Magnitude < 30 then
                model.Humanoid:MoveTo(hrp.Position + Vector3.new(5, 0, 5))
            end
        end
    end
end)

Button(TabFE, "索尼克", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FengYu-3/FengYu/refs/heads/Feng/QQ1926190957"))()
end)

Button(TabFE, "地精", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FengYu-3/FengYu/refs/heads/Feng/gnome.lua"))()
end)

Button(TabFE, "尾巴", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FengYu-3/FengYu/refs/heads/Feng/tail.lua"))()
end)

Button(TabFE, "超光速", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FengYu-3/FengYu/refs/heads/Feng/speed.lua"))()
end)

Button(TabFE, "096", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FengYu-3/FengYu/refs/heads/Feng/096.lua"))()
end)

SectionLabel(TabFE, "动作")

Button(TabFE, "跳舞动作", function()
    local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
    if humanoid then humanoid:PlayEmote("Dance1") end
end)

Button(TabFE, "挥手动作", function()
    local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
    if humanoid then humanoid:PlayEmote("Wave") end
end)

Button(TabFE, "坐下动作", function()
    local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
    if humanoid then humanoid.Sit = true end
end)

Button(TabFE, "导管子1", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FengYu-3/FengYu/refs/heads/Feng/pipe1.lua"))()
end)

Button(TabFE, "导管子2", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FengYu-3/FengYu/refs/heads/Feng/pipe2.lua"))()
end)

Button(TabFE, "导管子3", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FengYu-3/FengYu/refs/heads/Feng/pipe3.lua"))()
end)

Button(TabFE, "僵尸", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FengYu-3/FengYu/refs/heads/Feng/zombie.lua"))()
end)

Button(TabFE, "英雄", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FengYu-3/FengYu/refs/heads/Feng/hero.lua"))()
end)

Button(TabFE, "隐身", function()
    local char = player.Character
    if not char then return end
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Transparency = 1
        elseif part:IsA("Decal") then
            part.Transparency = 1
        end
    end
end)

Button(TabFE, "女生力量", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FengYu-3/FengYu/refs/heads/Feng/girlpower.lua"))()
end)

Button(TabFE, "1x1动作", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FengYu-3/FengYu/refs/heads/Feng/1x1.lua"))()
end)

Button(TabFE, "北朝", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FengYu-3/FengYu/refs/heads/Feng/north.lua"))()
end)

Button(TabFE, "方块", function()
    local char = player.Character
    if not char then return end
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Shape = Enum.PartType.Block
        end
    end
end)

Button(TabFE, "自动跳墙", function()
    local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
    if not humanoid then return end
    RunService.Heartbeat:Connect(function()
        if humanoid:GetState() == Enum.HumanoidStateType.Jumping then
            humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
        end
    end)
end)

Button(TabFE, "自动闪回", function()
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local lastPos = hrp.Position
    spawn(function()
        while true do
            wait(1)
            if (hrp.Position - lastPos).Magnitude > 100 then
                hrp.CFrame = CFrame.new(lastPos)
            end
            lastPos = hrp.Position
        end
    end)
end)

SectionLabel(Tabyl, "娱乐脚本")

Button(Tabyl, "CoolGUI [电脑]", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AngelAzrael/Cool-GUI/main/Loader.lua"))()
end)

Button(Tabyl, "CoolGUI [手机]", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AngelAzrael/Cool-GUI/main/Mobile.lua"))()
end)

SectionLabel(Tab2, "ESP 设置")

local espEnabled = false
local espName = false
local espDistance = false
local espHealth = false
local espBox = false
local espBillboards = {}

local function clearESP()
    for _, b in ipairs(espBillboards) do
        if b and b.Parent then b:Destroy() end
    end
    espBillboards = {}
end

local function createESPForPlayer(target)
    if target == player then return end
    local char = target.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Head")
    if not hrp then return end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "XION_ESP_" .. target.Name
    billboard.Parent = hrp
    billboard.Adornee = hrp
    billboard.Size = UDim2.new(0, 200, 0, 80)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true

    local frame = Instance.new("Frame", billboard)
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 0.8
    frame.BorderSizePixel = 1
    frame.BorderColor3 = GreenCapsule.Green
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

    local text = Instance.new("TextLabel", frame)
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.TextColor3 = GreenCapsule.Green
    text.TextStrokeTransparency = 0.5
    text.TextStrokeColor3 = GreenCapsule.DarkBlack
    text.Font = Enum.Font.Code
    text.TextSize = 14
    text.TextWrapped = true

    local function update()
        if not billboard.Parent then return end
        local char2 = target.Character
        if not char2 then return end
        local hrp2 = char2:FindFirstChild("HumanoidRootPart") or char2:FindFirstChild("Head")
        local humanoid = char2:FindFirstChild("Humanoid")
        if not hrp2 then return end

        local dist = math.floor((hrp2.Position - player.Character.HumanoidRootPart.Position).Magnitude)
        local lines = {}
        if espName then table.insert(lines, target.Name) end
        if espDistance then table.insert(lines, dist .. "m") end
        if espHealth and humanoid then table.insert(lines, math.floor(humanoid.Health) .. "/" .. math.floor(humanoid.MaxHealth)) end
        text.Text = table.concat(lines, "\n")

        if espBox then
            frame.Visible = true
        else
            frame.Visible = false
        end
    end

    spawn(function()
        while billboard.Parent do
            pcall(update)
            wait(0.3)
        end
    end)

    table.insert(espBillboards, billboard)
end

Toggle(Tab2, "ESP 总开关", false, function(state)
    espEnabled = state
    if not state then clearESP() end
end)

Toggle(Tab2, "显示名称", false, function(state) espName = state end)
Toggle(Tab2, "显示距离", false, function(state) espDistance = state end)
Toggle(Tab2, "显示血量", false, function(state) espHealth = state end)
Toggle(Tab2, "显示方框", false, function(state) espBox = state end)

spawn(function()
    while true do
        if espEnabled then
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= player and p.Character then
                    local existing = nil
                    for _, b in ipairs(espBillboards) do
                        if b and b.Parent and b.Name == "XION_ESP_" .. p.Name then
                            existing = b
                            break
                        end
                    end
                    if not existing then
                        createESPForPlayer(p)
                    end
                end
            end
        end
        wait(2)
    end
end)

SectionLabel(Tab3, "自瞄设置")

local aimEnabled = false
local aimFov = 150

Button(Tab3, "陌自瞄", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FengYu-3/FengYu/refs/heads/Feng/aim_mo.lua"))()
end)

Button(Tab3, "宙斯自瞄", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FengYu-3/FengYu/refs/heads/Feng/aim_zeus.lua"))()
end)

Button(Tab3, "英文自瞄", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FengYu-3/FengYu/refs/heads/Feng/aim_en.lua"))()
end)

Button(Tab3, "神青自瞄", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FengYu-3/FengYu/refs/heads/Feng/aim_shenqing.lua"))()
end)

SectionLabel(Tab3, "FOV 档位")

Button(Tab3, "FOV 50", function() aimFov = 50 end)
Button(Tab3, "FOV 100", function() aimFov = 100 end)
Button(Tab3, "FOV 150", function() aimFov = 150 end)
Button(Tab3, "FOV 300", function() aimFov = 300 end)
Button(Tab3, "FOV 450", function() aimFov = 450 end)
Button(Tab3, "FOV 600", function() aimFov = 600 end)
Button(Tab3, "全屏自瞄", function() aimFov = 9999 end)

SectionLabel(Tab3, "自定义GUI自瞄")

Toggle(Tab3, "启用自定义自瞄", false, function(state)
    aimEnabled = state
end)

Slider(Tab3, "FOV大小", 10, 600, 150, function(v) aimFov = v end)

spawn(function()
    while true do
        if aimEnabled then
            local cam = workspace.CurrentCamera
            local mouse = player:GetMouse()
            local target = nil
            local closest = aimFov
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= player and p.Character and p.Character:FindFirstChild("Head") then
                    local head = p.Character.Head
                    local screenPos = cam:WorldToScreenPoint(head.Position)
                    local dist = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(mouse.X, mouse.Y)).Magnitude
                    if dist < closest and screenPos.Z > 0 then
                        closest = dist
                        target = head
                    end
                end
            end
            if target then
                cam.CFrame = CFrame.new(cam.CFrame.Position, target.Position)
            end
        end
        wait(0.016)
    end
end)

SectionLabel(Tab4, "子追脚本")

Button(Tab4, "HB 子追", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HB-ksdb/-4/main/%E5%AD%90%E8%BF%BD%E8%84%9A%E6%9C%AC%E7%A9%BF%E5%A2%99.lua"))()
end)

Button(Tab4, "俄州子追", function()
    loadstring(game:HttpGet("https://gist.githubusercontent.com/ClasiniZukov/e7547e7b48fa90d10eb7f85bd3569147/raw/f95cd3561a3bb3ac6172a14eb74233625b52e757/gistfile1.txt"))()
end)

SectionLabel(Tabc, "自定义HitBox")

local hitboxSize = 5
local hitboxEnabled = false

Input(Tabc, "HitBox大小", "输入数字 (默认5)", tostring(hitboxSize), "输入大小", function(text)
    local num = tonumber(text)
    if num then hitboxSize = num end
end)

Toggle(Tabc, "启用范围扩大", false, function(state)
    hitboxEnabled = state
end)

spawn(function()
    while true do
        if hitboxEnabled then
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= player and p.Character then
                    for _, part in ipairs(p.Character:GetChildren()) do
                        if part:IsA("BasePart") and part.Name:find("Leg") or part.Name:find("Arm") or part.Name == "Head" or part.Name == "Torso" or part.Name == "HumanoidRootPart" then
                            part.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
                            part.Transparency = 0.5
                            part.BrickColor = BrickColor.new("Bright red")
                        end
                    end
                end
            end
        end
        wait(0.5)
    end
end)

SectionLabel(Tabjb, "各大脚本合集")

Button(Tabjb, "殺脚本", function()
    FengYu_HUB = "殺脚本"
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FengYu-3/FengYu/refs/heads/Feng/QQ1926190957"))()
end)

Button(Tabjb, "德与中山[免费版]", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dream77239/Deyu-Zhongshan/refs/heads/main/%E5%BE%B7%E4%B8%8E%E4%B8%AD%E5%B1%B1.txt"))()
end)

Button(Tabjb, "点我复制免费版q群获取卡密", function()
    setclipboard("1040970564")
end)

Button(Tabjb, "皮脚本", function()
    getgenv().XiaoPi = "皮脚本QQ群1002100032"
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/QQ1002100032-Roblox-Pi-script.lua"))()
end)

Button(Tabjb, "xa", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XingFork/Scripts/refs/heads/main/Loader"))()
end)

Button(Tabjb, "xk", function()
    loadstring(game:HttpGet(('https://github.com/devslopo/DVES/raw/main/XK%20Hub')))()
end)

Button(Tabjb, "混脚本", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/smalldesikon/wocaonima/main/sikon.txt"))()
end)

Button(Tabjb, "皮空", function()
    Pikon_script = "司空，皮炎制作"
    loadstring(game:HttpGet("https://raw.githubusercontent.com/smalldesikon/eyidfki/840d4b80d4f312c70b7b1067e056a2c4f828ef32/%E6%89%A7%E8%A1%8C%E8%84%9A%E6%9C%AC(%E6%B7%B7%E6%B7%86%E5%90%8E).txt"))()
end)

Button(Tabjb, "冷脚本", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/odhdshhe/leng5/refs/heads/main/leng5.lua"))()
end)

Button(Tabjb, "蛊脚本 卡密：坚持", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/sdxs221/-/main/爱别离"))()
end)

Button(Tabjb, "kg脚本", function()
    KG_SCRIPT = "张硕制作"
    loadstring(game:HttpGet("https://github.com/ZS-NB/KG/raw/main/Zhang-Shuo.lua"))()
end)

Button(Tabjb, "DOLL", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/lool8/-/refs/heads/main/DOLL.lua"))()
end)

Button(Tabjb, "WTB", function()
    getgenv().ADittoKey = "WTB_FREEKEY"
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Potato5466794/GC-WTB/refs/heads/main/Loader/Loader.luau", true))()
    end)
end)

Button(Tabjb, "SX hub", function()
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/87a8a4f4c2d2ef535ccd1bdb949218fe.lua"))()
end)

Button(Tabjb, "云脚本", function()
    loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\103\105\116\104\117\98\46\99\111\109\47\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\73\108\47\77\105\97\110\47\114\97\119\47\109\97\105\110\47\228\186\145\232\132\154\230\156\172\46\108\117\97\117\34\44\32\116\114\117\101\41\41\40\41\10")()
end)

Button(Tabjb, "天脚本", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XTScripthub/Ohio/main/tianscript"))()
end)

Button(Tabjb, "大司马脚本", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/whenheer/-v4/refs/heads/main/Protected_5320244476072095.lua"))()
end)

Button(Tabjb, "小凌脚本", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/flyspeed7/Xiao-Ling-1.3-Script/main/%E5%B0%8F%E5%87%8C%E8%84%9A%E6%9C%AC%E5%B0%8F%E5%87%8C%E8%84%9A%E6%9C%AC.Lua"))()
end)

Button(Tabjb, "WX脚本[免费]", function()
    loadstring(game:HttpGet("https://pastefy.app/vA6Y2jrc/raw"))()
end)

Button(Tabjb, "复制WX卡密", function()
    setclipboard("WX_1q64jf")
end)

Button(Tabjb, "旧冬脚本", function()
    getgenv().XiaoXu = "旧冬Q群467989227"
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoXuCynic/XiaoXu-s-Script/refs/heads/main/%E6%97%A7%E5%86%ACV1%E6%B7%B7%E6%B7%86.lua.txt"))()
end)

SectionLabel(Tabb, "系统设置")

Button(Tabb, "折叠UI", function()
    Window:Close()
end)

Button(Tabb, "重置人物", function()
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.Health = 0
    end
end)

Button(Tabb, "重进服务器", function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(
        game.PlaceId,
        game.JobId,
        player
    )
end)

Button(Tabb, "离开服务器", function()
    game:Shutdown()
end)

Button(Tabjz, "后街生存", function()
    local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"
))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient(text, startColor, endColor)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r = startColor.R + (endColor.R - startColor.R) * t
        local g = startColor.G + (endColor.G - startColor.G) * t
        local b = startColor.B + (endColor.B - startColor.B) * t
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 400),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5,  XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button

    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end

    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5,  XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    local serverId = GetServerId()
    local region = GetServerRegion()
    return string.format("服务器: %s | 区域: %s", serverId, region)
end

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    FuncTab = Window:Tab({ Title = "功能" }),
    TpTab = Window:Tab({ Title = "传送" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then
                nameLabel:SetDesc(GetPlayerName())
            end
            if injectorLabel then
                injectorLabel:SetDesc(GetInjectorInfo())
            end
            if serverLabel then
                serverLabel:SetDesc(GetServerInfo())
            end
        end)
    end
end)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

local ToolEvent = ReplicatedStorage:WaitForChild("Events"):WaitForChild("ToolEvent")
local toolLoopEnabled = false
local toolLoopConnection = nil

local function startToolLoop()
    if toolLoopConnection then return end
    toolLoopConnection = game:GetService("RunService").Heartbeat:Connect(function()
        if not toolLoopEnabled then return end
        ToolEvent:FireServer("Activated", false)
        task.wait(0.01)
        if not toolLoopEnabled then return end
        ToolEvent:FireServer("Activated", true)
        task.wait(0.01)
    end)
end

local function stopToolLoop()
    toolLoopEnabled = false
    if toolLoopConnection then 
        toolLoopConnection:Disconnect() 
        toolLoopConnection = nil 
    end
end

Tabs.FuncTab:Section({ Title = "自动化功能" })
Tabs.FuncTab:Toggle({
    Title = "自动挖掘",
    Value = false,
    Callback = function(state)
        toolLoopEnabled = state
        if state then 
            startToolLoop() 
        else 
            stopToolLoop()
        end
    end
})

local stickPickupEnabled = false
local stickPickupConnection = nil

local function startStickPickup()
    if stickPickupConnection then return end
    stickPickupConnection = game:GetService("RunService").Heartbeat:Connect(function()
        if not stickPickupEnabled then return end
        local player = Players.LocalPlayer
        local backpack = player:FindFirstChild("Backpack")
        if not backpack then return end
        for _, item in pairs(backpack:GetChildren()) do
            if item:IsA("Tool") and item.Name:sub(1, 5):lower() == "stick" then
                player.Character = player.Character or workspace:FindFirstChild(player.Name)
                if player.Character then 
                    item.Parent = player.Character 
                end
                break
            end
        end
    end)
end

local function stopStickPickup()
    stickPickupEnabled = false
    if stickPickupConnection then 
        stickPickupConnection:Disconnect() 
        stickPickupConnection = nil 
    end
end

Tabs.FuncTab:Toggle({
    Title = "自动拿起木棍",
    Value = false,
    Callback = function(state)
        stickPickupEnabled = state
        if state then 
            startStickPickup()
        else 
            stopStickPickup()
        end
    end
})

local lastPosition = nil

local function teleportTo(pos)
    local char = Players.LocalPlayer.Character
    if not char then 
        return 
    end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then 
        return 
    end
    lastPosition = hrp.Position
    hrp.CFrame = CFrame.new(pos)
end

Tabs.TpTab:Section({ Title = "常用传送" })
Tabs.TpTab:Button({
    Title = "垃圾大师",
    Callback = function()
        teleportTo(Vector3.new(-173.27, 3.50, 47.06))
    end
})
Tabs.TpTab:Button({
    Title = "返回原位置",
    Callback = function()
        if not lastPosition then 
            return 
        end
        local char = Players.LocalPlayer.Character
        if not char then 
            return 
        end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then 
            return 
        end
        hrp.CFrame = CFrame.new(lastPosition)
    end
})

Tabs.TpTab:Section({ Title = "地点传送" })
Tabs.TpTab:Button({
    Title = "豆子工厂",
    Callback = function()
        teleportTo(Vector3.new(-269.05, 3.50, 155.16))
    end
})
Tabs.TpTab:Button({
    Title = "后街",
    Callback = function()
        teleportTo(Vector3.new(-196.88, 3.50, 63.44))
    end
})
Tabs.TpTab:Button({
    Title = "后街对面",
    Callback = function()
        teleportTo(Vector3.new(-184.26, 4.00, -189.72))
    end
})
Tabs.TpTab:Button({
    Title = "下水道",
    Callback = function()
        teleportTo(Vector3.new(-245.42, -22.96, -1349.19))
    end
})
end)

Button(Tabjz, "狗对警察", function()
    local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"
))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 400),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5,  XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button

    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end

    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5,  XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    DogTab = Window:Tab({ Title = "狗功能" }),
    PoliceTab = Window:Tab({ Title = "警察功能" }),
    BoneTab = Window:Tab({ Title = "骨头" }),
    OtherTab = Window:Tab({ Title = "其他" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

local biteRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("DogBiteEvent")
local currentTarget = nil
local lastBite = 0
local BITE_INTERVAL = 0.01
local OFFSET = Vector3.new(0, 0, 0.5)

local DOGS_TEAM_NAME = "Dogs"
local ESCAPED_TEAM_NAME = "Escaped"

local dogBiteEnabled = false
local dogBiteConnection = nil

local function isAllowedTeam()
    local team = LocalPlayer.Team
    if not team then return false end
    return team.Name == DOGS_TEAM_NAME or team.Name == ESCAPED_TEAM_NAME
end

local function isTargetValid(p)
    if p == LocalPlayer then return false end
    if not p.Team then return true end
    if p.Team == LocalPlayer.Team then return false end
    if p.Team.Name == DOGS_TEAM_NAME then return false end
    if p.Team.Name == ESCAPED_TEAM_NAME then return false end
    return true
end

local function pickNextTarget()
    for _, p in ipairs(Players:GetPlayers()) do
        if isTargetValid(p) then
            local char = p.Character
            if char then
                local h = char:FindFirstChildOfClass("Humanoid")
                local root = char:FindFirstChild("HumanoidRootPart")
                if h and root and h.Health > 0 then
                    return p
                end
            end
        end
    end
    return nil
end

local function startDogBite()
    if dogBiteConnection then return end
    dogBiteEnabled = true
    
    if not isAllowedTeam() then
        dogBiteEnabled = false
        return
    end
    
    currentTarget = pickNextTarget()
    
    dogBiteConnection = RunService.Heartbeat:Connect(function()
        if not dogBiteEnabled then return end
        if not isAllowedTeam() then
            dogBiteEnabled = false
            currentTarget = nil
            return
        end
        if not LocalPlayer.Character then return end
        if not currentTarget or not currentTarget.Character then
            currentTarget = pickNextTarget()
            return
        end
        if currentTarget and currentTarget.Character then
            local tRoot = currentTarget.Character:FindFirstChild("HumanoidRootPart")
            local hum = currentTarget.Character:FindFirstChildOfClass("Humanoid")
            if tRoot and hum then
                if hum.Health <= 0 then
                    currentTarget = pickNextTarget()
                    return
                end
                LocalPlayer.Character:PivotTo(tRoot.CFrame * CFrame.new(OFFSET))
                local now = tick()
                if now - lastBite >= BITE_INTERVAL then
                    pcall(function()
                        biteRemote:FireServer()
                    end)
                    lastBite = now
                end
            end
        end
    end)
end

local function stopDogBite()
    dogBiteEnabled = false
    if dogBiteConnection then
        dogBiteConnection:Disconnect()
        dogBiteConnection = nil
    end
    currentTarget = nil
end

Tabs.DogTab:Section({ Title = "狗功能" })

Tabs.DogTab:Toggle({
    Title = "疯狂撕咬警察",
    Value = false,
    Callback = function(state)
        if state then
            startDogBite()
        else
            stopDogBite()
        end
    end
})

local FireEvent = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("FireEvent")

local aimbotEnabled = false
local aimbotConnection = nil
local lastFire = 0
local fireRate = 0.1
local multiFireCount = 3
local soundId = "rbxassetid://6534948092"

local allowedWeapons = {
    ["Shotgun"] = true,
    ["AR"] = true,
    ["Heavy Sniper"] = true,
    ["Pistol"] = true,
}

local function playSound()
    local sound = Instance.new("Sound")
    sound.SoundId = soundId
    sound.Volume = 1
    sound.Parent = workspace
    sound:Play()
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
end

local function getWeapons()
    local char = LocalPlayer.Character
    if not char then return {} end
    local weapons = {}
    for _, v in ipairs(char:GetChildren()) do
        if v:IsA("Tool") and allowedWeapons[v.Name] then
            table.insert(weapons, v)
        end
    end
    return weapons
end

local function getEnemies()
    local enemies = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Team ~= LocalPlayer.Team then
            local root = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
            local hum = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
            if root and hum and hum.Health > 0 then
                table.insert(enemies, root)
            end
        end
    end
    return enemies
end

local function startAimbot()
    if aimbotConnection then return end
    aimbotEnabled = true
    aimbotConnection = RunService.Heartbeat:Connect(function()
        if not aimbotEnabled then return end
        if tick() - lastFire < fireRate then return end
        lastFire = tick()
        
        local weapons = getWeapons()
        local enemies = getEnemies()
        if #weapons == 0 or #enemies == 0 then return end
        
        for _, root in ipairs(enemies) do
            local targetPos = root.Position
            for _, weapon in ipairs(weapons) do
                for i = 1, multiFireCount do
                    local args = {
                        "Fire",
                        weapon,
                        Vector3.new(targetPos.X, targetPos.Y, targetPos.Z)
                    }
                    pcall(function()
                        FireEvent:FireServer(unpack(args))
                        playSound()
                    end)
                end
            end
        end
    end)
end

local function stopAimbot()
    aimbotEnabled = false
    if aimbotConnection then
        aimbotConnection:Disconnect()
        aimbotConnection = nil
    end
end

local autoMedkitEnabled = false
local autoMedkitConnection = nil
local purchaseRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("PurchaseItemRequest")

local function hasMedkit()
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if not backpack then return false end
    for _, item in pairs(backpack:GetChildren()) do
        if item.Name == "Medkit" then
            return true
        end
    end
    return false
end

local function startAutoMedkit()
    if autoMedkitConnection then return end
    autoMedkitEnabled = true
    autoMedkitConnection = RunService.Heartbeat:Connect(function()
        if not autoMedkitEnabled then return end
        if not hasMedkit() then
            pcall(function()
                purchaseRemote:FireServer("Medkit")
                task.wait(0.01)
                purchaseRemote:FireServer("Medkit")
            end)
        end
    end)
end

local function stopAutoMedkit()
    autoMedkitEnabled = false
    if autoMedkitConnection then
        autoMedkitConnection:Disconnect()
        autoMedkitConnection = nil
    end
end

local leashEnabled = false
local leashConnection = nil
local leashIndex = 1
local TARGETS_PER_EXECUTION = 2

local function startLeash()
    if leashConnection then return end
    leashEnabled = true
    leashConnection = RunService.Stepped:Connect(function()
        if not leashEnabled then return end
        local char = LocalPlayer.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local tool = char:FindFirstChildOfClass("Tool")
        if not (tool and tool.Name:find("Leash")) then return end
        
        local playerList = {}
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and (not player.Team or player.Team ~= LocalPlayer.Team) then
                table.insert(playerList, player)
            end
        end
        if #playerList == 0 then return end
        if leashIndex > #playerList then leashIndex = 1 end
        
        local targetsToHit = math.min(TARGETS_PER_EXECUTION, #playerList)
        for i = 1, targetsToHit do
            local target = playerList[leashIndex]
            if target and target.Character then
                pcall(function()
                    ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("LeachEvent"):FireServer(target.Character)
                end)
            end
            leashIndex = leashIndex + 1
            if leashIndex > #playerList then leashIndex = 1 end
        end
        task.wait(0.01)
    end)
end

local function stopLeash()
    leashEnabled = false
    if leashConnection then
        leashConnection:Disconnect()
        leashConnection = nil
    end
    leashIndex = 1
end

local farmLeashEnabled = false
local farmLeashConnection = nil
local farmIndex = 1
local LockedPosition = nil

local function startFarmLeash()
    if farmLeashConnection then return end
    farmLeashEnabled = true
    farmLeashConnection = RunService.Stepped:Connect(function()
        if not farmLeashEnabled then return end
        local char = LocalPlayer.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local tool = char:FindFirstChildOfClass("Tool")
        if not (tool and tool.Name:find("Leash")) then
            LockedPosition = nil
            return
        end
        
        if not LockedPosition then
            LockedPosition = hrp.Position
        end
        hrp.CFrame = CFrame.new(LockedPosition)
        
        local playerList = {}
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and (not player.Team or player.Team ~= LocalPlayer.Team) then
                table.insert(playerList, player)
            end
        end
        if #playerList == 0 then return end
        if farmIndex > #playerList then farmIndex = 1 end
        
        local target = playerList[farmIndex]
        if target and target.Character then
            pcall(function()
                ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("LeachEvent"):FireServer(target.Character)
            end)
        end
        farmIndex = farmIndex + 1
        if farmIndex > #playerList then farmIndex = 1 end
        task.wait(0.1)
    end)
end

local function stopFarmLeash()
    farmLeashEnabled = false
    if farmLeashConnection then
        farmLeashConnection:Disconnect()
        farmLeashConnection = nil
    end
    farmIndex = 1
    LockedPosition = nil
end

local muzzleEnabled = false
local muzzleConnection = nil
local muzzleRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("MuzzleEvent")

local function startMuzzle()
    if muzzleConnection then return end
    muzzleEnabled = true
    muzzleConnection = RunService.Heartbeat:Connect(function()
        if not muzzleEnabled then return end
        local localTeam = LocalPlayer.Team
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Team ~= localTeam then
                local char = player.Character or player:WaitForChild("Character", 3)
                if char then
                    pcall(function()
                        muzzleRemote:FireServer(char)
                    end)
                end
            end
        end
    end)
end

local function stopMuzzle()
    muzzleEnabled = false
    if muzzleConnection then
        muzzleConnection:Disconnect()
        muzzleConnection = nil
    end
end

local autoCageEnabled = false
local autoCageConnection = nil

local function startAutoCage()
    if autoCageConnection then return end
    autoCageEnabled = true
    
    local Leach = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("LeachEvent")
    local Dog = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("DogCageOrRelease")
    local cage = workspace:WaitForChild("DogCages"):WaitForChild("Cage1")
    
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        if self == Leach and method == "FireServer" then
            task.defer(function()
                pcall(function()
                    Dog:FireServer(cage, true)
                end)
            end)
        end
        return oldNamecall(self, ...)
    end)
    
    autoCageConnection = {
        Disconnect = function()
            if oldNamecall then
                hookmetamethod(game, "__namecall", oldNamecall)
                oldNamecall = nil
            end
        end
    }
end

local function stopAutoCage()
    autoCageEnabled = false
    if autoCageConnection then
        autoCageConnection:Disconnect()
        autoCageConnection = nil
    end
end

Tabs.PoliceTab:Section({ Title = "武器功能" })

Tabs.PoliceTab:Toggle({
    Title = "愤怒机器人",
    Value = false,
    Callback = function(state)
        if state then
            startAimbot()
        else
            stopAimbot()
        end
    end
})

Tabs.PoliceTab:Section({ Title = "套狗功能" })

Tabs.PoliceTab:Toggle({
    Title = "安全套狗",
    Value = false,
    Callback = function(state)
        if state then
            startLeash()
        else
            stopLeash()
        end
    end
})

Tabs.PoliceTab:Toggle({
    Title = "疯狂套狗刷钱",
    Value = false,
    Callback = function(state)
        if state then
            startFarmLeash()
        else
            stopFarmLeash()
        end
    end
})

Tabs.PoliceTab:Section({ Title = "辅助功能" })

Tabs.PoliceTab:Toggle({
    Title = "拿起锁狗嘴自动锁",
    Value = false,
    Callback = function(state)
        if state then
            startMuzzle()
        else
            stopMuzzle()
        end
    end
})

Tabs.PoliceTab:Toggle({
    Title = "自动购买医疗箱",
    Value = false,
    Callback = function(state)
        if state then
            startAutoMedkit()
        else
            stopAutoMedkit()
        end
    end
})

Tabs.PoliceTab:Toggle({
    Title = "自动关狗",
    Value = false,
    Callback = function(state)
        if state then
            startAutoCage()
        else
            stopAutoCage()
        end
    end
})

Tabs.BoneTab:Section({ Title = "金骨头传送" })

local BonesFolder = workspace:WaitForChild("GoldenBones"):WaitForChild("Bones")
local BoneNames = {"bones1","bones2","bones3","bones4","bones5","bones6"}
local boneIdx = 1

Tabs.BoneTab:Button({
    Title = "传送到下一个金骨头",
    Callback = function()
        local char = LocalPlayer.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        
        local boneName = BoneNames[boneIdx]
        local m = BonesFolder:FindFirstChild(boneName)
        if m then
            hrp.CFrame = m:GetPivot() + Vector3.new(0, 3, 0)
        end
        boneIdx = (boneIdx % 6) + 1
    end
})

local autoBoneEnabled = false
local autoBoneConnection = nil
local autoBoneDelay = 1

local function startAutoBone()
    if autoBoneConnection then return end
    autoBoneEnabled = true
    autoBoneConnection = RunService.Heartbeat:Connect(function()
        if not autoBoneEnabled then return end
        
        local char = LocalPlayer.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        
        local boneName = BoneNames[boneIdx]
        local m = BonesFolder:FindFirstChild(boneName)
        if m then
            hrp.CFrame = m:GetPivot() + Vector3.new(0, 3, 0)
        end
        boneIdx = (boneIdx % 6) + 1
        task.wait(autoBoneDelay)
    end)
end

local function stopAutoBone()
    autoBoneEnabled = false
    if autoBoneConnection then
        autoBoneConnection:Disconnect()
        autoBoneConnection = nil
    end
    boneIdx = 1
end

Tabs.BoneTab:Toggle({
    Title = "自动传送金骨头",
    Value = false,
    Callback = function(state)
        if state then
            startAutoBone()
        else
            stopAutoBone()
        end
    end
})

local delayLabel = Tabs.BoneTab:Paragraph({
    Title = "金骨头当前延迟:",
    Desc = "1秒"
})

Tabs.BoneTab:Slider({
    Title = "金骨头传送延迟 (秒)",
    Value = { Min = 0.1, Max = 5, Default = 1 },
    Callback = function(value)
        autoBoneDelay = value
        if delayLabel then
            delayLabel:SetDesc(tostring(value) .. "秒")
        end
    end
})

Tabs.BoneTab:Section({ Title = "单独传送金骨头" })

for i, name in ipairs(BoneNames) do
    Tabs.BoneTab:Button({
        Title = "传送至 " .. name,
        Callback = function()
            local char = LocalPlayer.Character
            if not char then return end
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            
            local m = BonesFolder:FindFirstChild(name)
            if m then
                hrp.CFrame = m:GetPivot() + Vector3.new(0, 3, 0)
            end
        end
    })
end

Tabs.BoneTab:Section({ Title = "金骨头透视" })

local espEnabled = false
local espHighlights = {}

local function toggleESP(state)
    if state then
        for _, name in ipairs(BoneNames) do
            local m = BonesFolder:FindFirstChild(name)
            if m and not m:FindFirstChild("BoneHL") then
                local hl = Instance.new("Highlight")
                hl.Name = "BoneHL"
                hl.Adornee = m
                hl.FillColor = Color3.fromRGB(255, 0, 0)
                hl.OutlineColor = Color3.new(1, 1, 1)
                hl.FillTransparency = 0.3
                hl.OutlineTransparency = 0
                hl.Parent = m
                table.insert(espHighlights, hl)
            end
        end
    else
        for _, name in ipairs(BoneNames) do
            local m = BonesFolder:FindFirstChild(name)
            if m then
                local hl = m:FindFirstChild("BoneHL")
                if hl then 
                    hl:Destroy() 
                end
            end
        end
        espHighlights = {}
    end
end

Tabs.BoneTab:Toggle({
    Title = "金骨头透视",
    Value = false,
    Callback = function(state)
        espEnabled = state
        toggleESP(state)
    end
})

Tabs.BoneTab:Section({ Title = "白骨传送" })

local WhiteBonesFolder = workspace:WaitForChild("DogBoneQuest"):WaitForChild("Bones")
local WhiteBoneNames = {"bones1","bones2","bones3","bones4","bones5"}
local whiteBoneIdx = 1

Tabs.BoneTab:Button({
    Title = "传送到下一个白骨",
    Callback = function()
        local char = LocalPlayer.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        
        local boneName = WhiteBoneNames[whiteBoneIdx]
        local m = WhiteBonesFolder:FindFirstChild(boneName)
        if m then
            hrp.CFrame = m:GetPivot() + Vector3.new(0, 3, 0)
        end
        whiteBoneIdx = (whiteBoneIdx % 5) + 1
    end
})

local autoWhiteBoneEnabled = false
local autoWhiteBoneConnection = nil
local autoWhiteBoneDelay = 1

local function startAutoWhiteBone()
    if autoWhiteBoneConnection then return end
    autoWhiteBoneEnabled = true
    autoWhiteBoneConnection = RunService.Heartbeat:Connect(function()
        if not autoWhiteBoneEnabled then return end
        
        local char = LocalPlayer.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        
        local boneName = WhiteBoneNames[whiteBoneIdx]
        local m = WhiteBonesFolder:FindFirstChild(boneName)
        if m then
            hrp.CFrame = m:GetPivot() + Vector3.new(0, 3, 0)
        end
        whiteBoneIdx = (whiteBoneIdx % 5) + 1
        task.wait(autoWhiteBoneDelay)
    end)
end

local function stopAutoWhiteBone()
    autoWhiteBoneEnabled = false
    if autoWhiteBoneConnection then
        autoWhiteBoneConnection:Disconnect()
        autoWhiteBoneConnection = nil
    end
    whiteBoneIdx = 1
end

Tabs.BoneTab:Toggle({
    Title = "自动传送白骨",
    Value = false,
    Callback = function(state)
        if state then
            startAutoWhiteBone()
        else
            stopAutoWhiteBone()
        end
    end
})

local whiteDelayLabel = Tabs.BoneTab:Paragraph({
    Title = "白骨当前延迟:",
    Desc = "1秒"
})

Tabs.BoneTab:Slider({
    Title = "白骨传送延迟 (秒)",
    Value = { Min = 0.1, Max = 5, Default = 1 },
    Callback = function(value)
        autoWhiteBoneDelay = value
        if whiteDelayLabel then
            whiteDelayLabel:SetDesc(tostring(value) .. "秒")
        end
    end
})

Tabs.BoneTab:Section({ Title = "单独传送白骨" })

for i, name in ipairs(WhiteBoneNames) do
    Tabs.BoneTab:Button({
        Title = "传送至 " .. name,
        Callback = function()
            local char = LocalPlayer.Character
            if not char then return end
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            
            local m = WhiteBonesFolder:FindFirstChild(name)
            if m then
                hrp.CFrame = m:GetPivot() + Vector3.new(0, 3, 0)
            end
        end
    })
end

Tabs.BoneTab:Section({ Title = "白骨透视" })

local whiteEspEnabled = false
local whiteEspHighlights = {}

local function toggleWhiteESP(state)
    if state then
        for _, name in ipairs(WhiteBoneNames) do
            local m = WhiteBonesFolder:FindFirstChild(name)
            if m and not m:FindFirstChild("WhiteBoneHL") then
                local hl = Instance.new("Highlight")
                hl.Name = "WhiteBoneHL"
                hl.Adornee = m
                hl.FillColor = Color3.fromRGB(255, 255, 255)
                hl.OutlineColor = Color3.new(1, 1, 1)
                hl.FillTransparency = 0.3
                hl.OutlineTransparency = 0
                hl.Parent = m
                table.insert(whiteEspHighlights, hl)
            end
        end
    else
        for _, name in ipairs(WhiteBoneNames) do
            local m = WhiteBonesFolder:FindFirstChild(name)
            if m then
                local hl = m:FindFirstChild("WhiteBoneHL")
                if hl then 
                    hl:Destroy() 
                end
            end
        end
        whiteEspHighlights = {}
    end
end

Tabs.BoneTab:Toggle({
    Title = "白骨透视",
    Value = false,
    Callback = function(state)
        whiteEspEnabled = state
        toggleWhiteESP(state)
    end
})

Tabs.OtherTab:Section({ Title = "火箭筒功能" })

local safeModeEnabled = false
local safeModeConnection = nil
local safeModeFireRate = 0.6
local safeModeLastFire = 0

local function getNearestEnemy()
    local char = LocalPlayer.Character
    if not char then return nil end
    local myRoot = char:FindFirstChild("HumanoidRootPart")
    if not myRoot then return nil end
    local nearest = nil
    local minDist = math.huge
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Team ~= LocalPlayer.Team then
            local root = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local dist = (myRoot.Position - root.Position).Magnitude
                if dist < minDist then
                    minDist = dist
                    nearest = root
                end
            end
        end
    end
    return nearest
end

local function startSafeMode()
    if safeModeConnection then return end
    safeModeEnabled = true
    safeModeConnection = RunService.Heartbeat:Connect(function()
        if not safeModeEnabled then return end
        local now = tick()
        if now - safeModeLastFire < safeModeFireRate then return end
        safeModeLastFire = now
        local char = LocalPlayer.Character
        if not char then return end
        local Bazooka = char:FindFirstChild("Bazooka")
        if not Bazooka then return end
        local target = getNearestEnemy()
        if target then
            pcall(function()
                FireEvent:FireServer("Fire", Bazooka, target.Position)
            end)
        end
    end)
end

local function stopSafeMode()
    safeModeEnabled = false
    if safeModeConnection then
        safeModeConnection:Disconnect()
        safeModeConnection = nil
    end
end

local allModeEnabled = false
local allModeConnection = nil
local allModeFireRate = 0.03
local allModeLastFire = 0

local function getNearestPlayer()
    local character = LocalPlayer.Character
    if not character then return nil end
    local myRoot = character:FindFirstChild("HumanoidRootPart")
    if not myRoot then return nil end
    local nearestRoot = nil
    local minDistance = math.huge
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local theirCharacter = player.Character
            local theirRoot = theirCharacter and theirCharacter:FindFirstChild("HumanoidRootPart")
            if theirRoot then
                local distance = (myRoot.Position - theirRoot.Position).Magnitude
                if distance < minDistance then
                    minDistance = distance
                    nearestRoot = theirRoot
                end
            end
        end
    end
    return nearestRoot
end

local function startAllMode()
    if allModeConnection then return end
    allModeEnabled = true
    allModeConnection = RunService.Heartbeat:Connect(function()
        if not allModeEnabled then return end
        local now = tick()
        if now - allModeLastFire < allModeFireRate then return end
        allModeLastFire = now
        local character = LocalPlayer.Character
        if not character then return end
        local bazooka = character:FindFirstChild("Bazooka")
        if not bazooka then return end
        local target = getNearestPlayer()
        if target then
            pcall(function()
                FireEvent:FireServer("Fire", bazooka, target.Position)
            end)
        end
    end)
end

local function stopAllMode()
    allModeEnabled = false
    if allModeConnection then
        allModeConnection:Disconnect()
        allModeConnection = nil
    end
end

local selfDestructEnabled = false
local selfDestructConnection = nil
local selfDestructFireRate = 0.6
local selfDestructLastFire = 0

local function startSelfDestruct()
    if selfDestructConnection then return end
    selfDestructEnabled = true
    selfDestructConnection = RunService.Heartbeat:Connect(function()
        if not selfDestructEnabled then return end
        local now = tick()
        if now - selfDestructLastFire < selfDestructFireRate then return end
        selfDestructLastFire = now
        local char = LocalPlayer.Character
        if not char then return end
        local Bazooka = char:FindFirstChild("Bazooka")
        if not Bazooka then return end
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Team ~= LocalPlayer.Team then
                local root = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                if root then
                    pcall(function()
                        FireEvent:FireServer("Fire", Bazooka, root.Position)
                    end)
                end
            end
        end
    end)
end

local function stopSelfDestruct()
    selfDestructEnabled = false
    if selfDestructConnection then
        selfDestructConnection:Disconnect()
        selfDestructConnection = nil
    end
end

Tabs.OtherTab:Toggle({
    Title = "火箭筒安全模式",
    Value = false,
    Callback = function(state)
        if state then
            startSafeMode()
        else
            stopSafeMode()
        end
    end
})

Tabs.OtherTab:Toggle({
    Title = "火箭筒攻击所有人",
    Value = false,
    Callback = function(state)
        if state then
            startAllMode()
        else
            stopAllMode()
        end
    end
})

Tabs.OtherTab:Toggle({
    Title = "火箭筒自爆模式",
    Value = false,
    Callback = function(state)
        if state then
            startSelfDestruct()
        else
            stopSelfDestruct()
        end
    end
})

Tabs.OtherTab:Section({ Title = "杂项功能" })

Tabs.OtherTab:Button({
    Title = "关狗笼无碰撞体积",
    Callback = function()
        local DogCages = workspace.DogCages
        if not DogCages then return end
        for i = 1, 8 do
            local model = DogCages:GetChildren()[i]
            if model then
                for _, part in ipairs(model:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                        part.CanTouch = false
                    end
                end
            end
        end
    end
})
end)

Button(Tabjz, "滴管增量", function()
    local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"
))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient(text, startColor, endColor)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r = startColor.R + (endColor.R - startColor.R) * t
        local g = startColor.G + (endColor.G - startColor.G) * t
        local b = startColor.B + (endColor.B - startColor.B) * t
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 400),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5,  XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button

    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end

    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5,  XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    CodeTab = Window:Tab({ Title = "兑换码" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

Tabs.MainTab:Paragraph({
    Title = "",
    Desc = ""
})
Tabs.MainTab:Paragraph({
    Title = gradient3("司空制作", XION.Accent, XION.Bright, XION.Light),
    Desc = ""
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

Tabs.CodeTab:Section({ Title = "兑换码功能" })

local codes = {
    "shedwaaisalive","update1","250likes","challenging","5kccu",
    "thanksfor10k","bronze","delayoops","sorryagain","weareback",
    "updatefinally","tinyupdate","20klikes"
}

Tabs.CodeTab:Button({
    Title = "自动兑换所有兑换码",
    Callback = function()
        for _, code in ipairs(codes) do
            pcall(function()
                game.ReplicatedStorage.Remotes.RedeemCode:FireServer(code)
                print("已兑换: " .. code)
            end)
            task.wait(1)
        end
        print("所有兑换码已兑换完成！")
    end
})

Tabs.CodeTab:Paragraph({
    Title = "兑换码列表:",
    Desc = table.concat(codes, ", ")
})
end)

Button(Tabjz, "清洁键帽", function()
    local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"
))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 400),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5,  XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button

    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end

    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5,  XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    FarmTab = Window:Tab({ Title = "功能" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

local RS = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LP = Players.LocalPlayer

local scrubEnabled = false
local scrubThread = nil
local remote = RS:WaitForChild("ffrostflame_bridgenet2@1.0.0"):WaitForChild("dataRemoteEvent")
local args = {{{Action = "Scrub"}, "\a"}}
local multiplier = 99

local function startScrub()
    if scrubThread then return end
    scrubEnabled = true
    scrubThread = task.spawn(function()
        while scrubEnabled do
            for i = 1, multiplier do
                pcall(function()
                    remote:FireServer(unpack(args))
                end)
            end
            task.wait()
        end
    end)
end

local function stopScrub()
    scrubEnabled = false
    if scrubThread then
        task.cancel(scrubThread)
        scrubThread = nil
    end
end

local spongeEnabled = false
local spongeThread = nil

local function startSponge()
    if spongeThread then return end
    spongeEnabled = true
    spongeThread = task.spawn(function()
        while spongeEnabled do
            pcall(function()
                local char = LP.Character or LP.CharacterAdded:Wait()
                local hum = char:WaitForChild("Humanoid")
                local sponge = LP.Backpack:FindFirstChild("Sponge") or char:FindFirstChild("Sponge")
                if sponge then hum:EquipTool(sponge) end
            end)
            task.wait()
        end
    end)
end

local function stopSponge()
    spongeEnabled = false
    if spongeThread then
        task.cancel(spongeThread)
        spongeThread = nil
    end
end

Tabs.FarmTab:Section({ Title = "功能" })

Tabs.FarmTab:Toggle({
    Title = "快速擦键帽",
    Value = false,
    Callback = function(state)
        if state then
            startScrub()
        else
            stopScrub()
        end
    end
})

Tabs.FarmTab:Toggle({
    Title = "重复拿起海绵",
    Value = false,
    Callback = function(state)
        if state then
            startSponge()
        else
            stopSponge()
        end
    end
})
end)

Button(Tabjz, "刀片旋转", function()
    local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"
))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 400),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5,  XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button

    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end

    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5,  XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    FarmTab = Window:Tab({ Title = "功能" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

local rs = game:GetService("ReplicatedStorage")
local addCoinsEvent = rs:WaitForChild("ReplicatedStorageHolders"):WaitForChild("Events"):WaitForChild("AddCoins")
local addXPEvent = rs:WaitForChild("ReplicatedStorageHolders"):WaitForChild("Events"):WaitForChild("AddXP")

local coinEnabled = false
local coinThread = nil

local function startCoin()
    if coinThread then return end
    coinEnabled = true
    coinThread = task.spawn(function()
        while coinEnabled do
            pcall(function()
                addCoinsEvent:FireServer(999999)
            end)
            task.wait(0.01)
        end
    end)
end

local function stopCoin()
    coinEnabled = false
    if coinThread then
        task.cancel(coinThread)
        coinThread = nil
    end
end

local xpEnabled = false
local xpThread = nil

local function startXP()
    if xpThread then return end
    xpEnabled = true
    xpThread = task.spawn(function()
        while xpEnabled do
            pcall(function()
                addXPEvent:FireServer(99999)
            end)
            task.wait(0.01)
        end
    end)
end

local function stopXP()
    xpEnabled = false
    if xpThread then
        task.cancel(xpThread)
        xpThread = nil
    end
end

Tabs.FarmTab:Section({ Title = "功能" })

Tabs.FarmTab:Toggle({
    Title = "疯狂加金币",
    Value = false,
    Callback = function(state)
        if state then
            startCoin()
        else
            stopCoin()
        end
    end
})

Tabs.FarmTab:Toggle({
    Title = "疯狂加经验",
    Value = false,
    Callback = function(state)
        if state then
            startXP()
        else
            stopXP()
        end
    end
})
end)

Button(Tabjz, "方块战争", function()
    local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"
))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 400),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5,  XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button

    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end

    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5,  XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    FarmTab = Window:Tab({ Title = "功能" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

local RS = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Run = game:GetService("RunService")
local LP = Players.LocalPlayer

local mineEnabled = false
local mineThread = nil

local function startMine()
    if mineThread then return end
    mineEnabled = true
    mineThread = task.spawn(function()
        while mineEnabled do
            pcall(function()
                local MineDefs = require(RS.Modules.Configs.MineDefs)
                if MineDefs and MineDefs.MineSeconds then
                    hookfunction(MineDefs.MineSeconds, function() return 0 end)
                end
            end)
            pcall(function()
                local BBC = require(RS.Modules.Configs.BlockBreakConfig)
                if BBC.BreakSeconds then
                    hookfunction(BBC.BreakSeconds, function() return 0 end)
                end
                if BBC.BreakSecondsForHP then
                    hookfunction(BBC.BreakSecondsForHP, function() return 0 end)
                end
            end)
            pcall(function()
                local GUC = require(RS.Modules.Configs.GeneratorUpgradeConfig)
                if GUC and GUC.BrickHPForBought then
                    hookfunction(GUC.BrickHPForBought, function() return 0 end)
                end
            end)
            task.wait(1)
        end
    end)
end

local function stopMine()
    mineEnabled = false
    if mineThread then
        task.cancel(mineThread)
        mineThread = nil
    end
end

local weaponEnabled = false
local weaponConnection = nil
local CombatRemotes = RS:WaitForChild("GameEvents"):WaitForChild("CombatRemotes")
local AtkRemote = CombatRemotes:WaitForChild("Combat_RequestAttack")
local lastAtk = 0

local function startWeapon()
    if weaponConnection then return end
    weaponEnabled = true
    
    pcall(function()
        local Reg = require(RS.Data.Registries.WeaponRegistry)
        if Reg and Reg.Entries then
            for _, v in pairs(Reg.Entries) do
                v.HitDelay = 0
                v.HitDuration = 0.05
                v.Cooldown = 0
                v.ComboTimeout = 0
            end
        end
    end)
    
    LP:SetAttribute("AttackSpeedMul", 999999)
    LP:GetAttributeChangedSignal("AttackSpeedMul"):Connect(function()
        if LP:GetAttribute("AttackSpeedMul") ~= 999999 then
            LP:SetAttribute("AttackSpeedMul", 999999)
        end
    end)
    
    LP:SetAttribute("StunEndsAt", 0)
    LP:GetAttributeChangedSignal("StunEndsAt"):Connect(function()
        if (LP:GetAttribute("StunEndsAt") or 0) > workspace:GetServerTimeNow() then
            LP:SetAttribute("StunEndsAt", 0)
        end
    end)
    
    weaponConnection = Run.Heartbeat:Connect(function()
        if not weaponEnabled then return end
        LP:SetAttribute("StunEndsAt", 0)
        pcall(function()
            for _, m in ipairs(getloadedmodules and getloadedmodules() or {}) do
                if m and m.SwingState then
                    m.SwingState.cooldownEndsAt = -1
                    m.SwingState.duration = 0
                end
            end
        end)
        if tick() - lastAtk < 0.05 then return end
        local char = LP.Character
        local tool = char and char:FindFirstChildWhichIsA("Tool")
        if tool then
            local ok, wtype = pcall(function()
                return require(RS.Data.Registries.WeaponRegistry).GetTypeFromTool(tool)
            end)
            if ok and wtype then
                lastAtk = tick()
                pcall(function()
                    AtkRemote:FireServer(wtype)
                end)
            end
        end
    end)
end

local function stopWeapon()
    weaponEnabled = false
    if weaponConnection then
        weaponConnection:Disconnect()
        weaponConnection = nil
    end
end

Tabs.FarmTab:Section({ Title = "功能" })

Tabs.FarmTab:Toggle({
    Title = "稿子秒挖",
    Value = false,
    Callback = function(state)
        if state then
            startMine()
        else
            stopMine()
        end
    end
})

Tabs.FarmTab:Toggle({
    Title = "近战武器无CD",
    Value = false,
    Callback = function(state)
        if state then
            startWeapon()
        else
            stopWeapon()
        end
    end
})
end)

Button(Tabjz, "击打动作", function()
    local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"
))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 400),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5,  XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button

    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end

    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5,  XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    FarmTab = Window:Tab({ Title = "功能" }),
}

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ValidEvents = {}
local IsScanning = false
local Config = { Enabled = false }

local function IsHashName(name)
    if name:match("^[%x]+$") and #name == 32 then
        return true
    end
    return false
end

local function GetAllHashEvents()
    local events = {}
    for _, obj in ipairs(ReplicatedStorage:GetChildren()) do
        if obj:IsA("RemoteEvent") and IsHashName(obj.Name) then
            table.insert(events, obj)
        end
    end
    return events
end

local function TestEvent(event, target)
    if not event or not target then return false, nil end
    
    local testCases = {
        {target, Vector3.new(0, 50, 0), true},
        {target, Vector3.new(0, 50, 0)},
        {target, Vector3.new(0, 50, 0), 100},
        {target, 100},
        {target},
        {target, Vector3.new(0, 50, 0), true, 100},
        {target, "knockback", 100},
        {target, CFrame.new(0, 50, 0)},
        {target, {velocity = Vector3.new(0, 50, 0)}},
    }
    
    for _, args in ipairs(testCases) do
        local success = pcall(function()
            event:FireServer(unpack(args))
        end)
        if success then
            task.wait(0.03)
            if target and target.Character then
                local hrp = target.Character:FindFirstChild("HumanoidRootPart")
                if hrp and hrp.Velocity.Magnitude > 5 then
                    return true, args
                end
            end
            return true, args
        end
    end
    return false, nil
end

local function ScanAllHashEvents()
    if IsScanning then return end
    IsScanning = true
    
    local allEvents = GetAllHashEvents()
    
    if #allEvents == 0 then
        IsScanning = false
        return false
    end
    
    local target = nil
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer and player.Character then
            target = player
            break
        end
    end
    if not target then
        target = Players.LocalPlayer
    end
    
    ValidEvents = {}
    for _, event in ipairs(allEvents) do
        local success, args = TestEvent(event, target)
        if success then
            table.insert(ValidEvents, {
                Event = event,
                Args = args,
                Name = event.Name
            })
        end
        task.wait(0.03)
    end
    
    IsScanning = false
    return #ValidEvents > 0
end

local function ExecuteAllEventsOnPlayer(target, power)
    if #ValidEvents == 0 then return 0 end
    
    power = power or 150
    local direction = Vector3.new(
        math.random(-1, 1),
        math.random(0, 1),
        math.random(-1, 1)
    ).Unit * power
    
    local executed = 0
    
    for _, eventData in ipairs(ValidEvents) do
        local event = eventData.Event
        local args = eventData.Args or {}
        local newArgs = {}
        
        for i, arg in ipairs(args) do
            if type(arg) == "userdata" and arg:IsA("Player") then
                newArgs[i] = target
            elseif type(arg) == "Vector3" then
                newArgs[i] = direction
            elseif type(arg) == "number" and arg == 100 then
                newArgs[i] = power
            else
                newArgs[i] = arg
            end
        end
        
        local hasPlayer = false
        for _, arg in ipairs(newArgs) do
            if type(arg) == "userdata" and arg:IsA("Player") then
                hasPlayer = true
                break
            end
        end
        if not hasPlayer then
            table.insert(newArgs, 1, target)
        end
        
        local success = pcall(function()
            event:FireServer(unpack(newArgs))
        end)
        
        if success then
            executed = executed + 1
        end
    end
    
    return executed
end

local function ExecuteAllOnAllPlayers()
    if #ValidEvents == 0 then
        local found = ScanAllHashEvents()
        if not found then
            return
        end
    end
    
    local players = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer then
            table.insert(players, player)
        end
    end
    
    if #players == 0 then
        return
    end
    
    for _, player in ipairs(players) do
        ExecuteAllEventsOnPlayer(player, 150)
        task.wait(0.05)
    end
end

local function AutoLoop()
    while Config.Enabled do
        ExecuteAllOnAllPlayers()
        task.wait(0.1)
    end
end

local function GetInjectorInfo()
    if getexecutorname then
        return getexecutorname()
    elseif identifyexecutor then
        return identifyexecutor()
    end
    return "未知"
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerInfo()
    local jobId = game.JobId or "未知"
    return "服务器: " .. string.sub(jobId, 1, 8) .. "..."
end

Tabs.MainTab:Section({ Title = "玩家信息" })

Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

Tabs.FarmTab:Section({ Title = "控制" })

Tabs.FarmTab:Toggle({
    Title = "击飞所有人",
    Value = false,
    Callback = function(state)
        Config.Enabled = state
        if state then
            if #ValidEvents == 0 then
                ScanAllHashEvents()
            end
            if #ValidEvents > 0 then
                task.spawn(AutoLoop)
            else
                Config.Enabled = false
            end
        end
    end
})

task.spawn(function()
    task.wait(0.1)
    ScanAllHashEvents()
end)
end)

Button(Tabjz, "+1速度猴子逃脱", function()
    local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"
))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 400),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5,  XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button

    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end

    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5,  XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    FarmTab = Window:Tab({ Title = "功能" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

local CONFIG = {
    DISTANCE_THRESHOLD = 20,
    CHECK_INTERVAL = 1,
    OFFSET_Y = 5,
}

local function getCenterPosition()
    local map = workspace:FindFirstChild("Map")
    if not map then return nil end
    local spawns = map:FindFirstChild("QuantumTreadmillSpawns")
    if not spawns then return nil end
    local treadmill = spawns:FindFirstChild("TreadmillQuantum")
    if not treadmill then return nil end
    local parts = {}
    for _, v in ipairs(treadmill:GetDescendants()) do
        if v:IsA("BasePart") then table.insert(parts, v) end
    end
    if #parts == 0 then return nil end
    local minX, minY, minZ = math.huge, math.huge, math.huge
    local maxX, maxY, maxZ = -math.huge, -math.huge, -math.huge
    for _, v in ipairs(parts) do
        local cf = v.CFrame
        minX = math.min(minX, cf.X); maxX = math.max(maxX, cf.X)
        minY = math.min(minY, cf.Y); maxY = math.max(maxY, cf.Y)
        minZ = math.min(minZ, cf.Z); maxZ = math.max(maxZ, cf.Z)
    end
    return Vector3.new((minX + maxX) / 2, (minY + maxY) / 2, (minZ + maxZ) / 2)
end

local function getHRP()
    local char = player.Character
    if not char then return nil end
    return char:FindFirstChild("HumanoidRootPart")
end

local treadmillEnabled = false
local treadmillThread = nil
local rebirthThread = nil

local function startTreadmill()
    if treadmillThread then return end
    treadmillEnabled = true
    
    treadmillThread = task.spawn(function()
        while treadmillEnabled do
            pcall(function()
                local hrp = getHRP()
                if hrp then
                    local center = getCenterPosition()
                    if center then
                        if (hrp.Position - center).Magnitude > CONFIG.DISTANCE_THRESHOLD then
                            hrp.CFrame = CFrame.new(center.X, center.Y + CONFIG.OFFSET_Y, center.Z)
                        end
                    end
                end
            end)
            task.wait(CONFIG.CHECK_INTERVAL)
        end
    end)
    
    rebirthThread = task.spawn(function()
        while treadmillEnabled do
            pcall(function()
                ReplicatedStorage.Remotes.Rebirth:FireServer()
            end)
            task.wait(2)
        end
    end)
end

local function stopTreadmill()
    treadmillEnabled = false
    if treadmillThread then
        task.cancel(treadmillThread)
        treadmillThread = nil
    end
    if rebirthThread then
        task.cancel(rebirthThread)
        rebirthThread = nil
    end
end

Tabs.FarmTab:Section({ Title = "功能" })

Tabs.FarmTab:Toggle({
    Title = "自动寻找限时10倍速度跑步机并传送",
    Value = false,
    Callback = function(state)
        if state then
            startTreadmill()
        else
            stopTreadmill()
        end
    end
})
end)

Button(Tabjz, "开采一座山峰", function()
    local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"
))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 400),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5,  XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button

    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end

    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5,  XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    FarmTab = Window:Tab({ Title = "功能" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local UpgradeBuy = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("UpgradeBuy")
local DigRequest = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("DigRequest")
local SellRequest = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("SellRequest")

Tabs.FarmTab:Section({ Title = "升级" })

Tabs.FarmTab:Button({
    Title = "购买1温暖",
    Callback = function()
        pcall(function()
            UpgradeBuy:FireServer("Air", 1)
        end)
    end
})

Tabs.FarmTab:Button({
    Title = "购买1背包重量",
    Callback = function()
        pcall(function()
            UpgradeBuy:FireServer("Weight", 1)
        end)
    end
})

Tabs.FarmTab:Section({ Title = "功能" })

local autoDigEnabled = false
local autoDigThread = nil

local function startAutoDig()
    if autoDigThread then return end
    autoDigEnabled = true
    autoDigThread = task.spawn(function()
        while autoDigEnabled do
            pcall(function()
                local char = LocalPlayer.Character
                if not char then return end

                local camCF = Camera.CFrame
                local digPos = (camCF * CFrame.new(0, 0, -1)).Position

                DigRequest:FireServer("Weathered Wood", vector.create(digPos.X, digPos.Y, digPos.Z))
                DigRequest:FireServer("Chipped Stone", vector.create(digPos.X, digPos.Y, digPos.Z))
                DigRequest:FireServer("Rusty Scrapper", vector.create(digPos.X, digPos.Y, digPos.Z))
                DigRequest:FireServer("Hardened Iron", vector.create(digPos.X, digPos.Y, digPos.Z))
            end)
            task.wait(0.5)
        end
    end)
end

local function stopAutoDig()
    autoDigEnabled = false
    if autoDigThread then
        task.cancel(autoDigThread)
        autoDigThread = nil
    end
end

Tabs.FarmTab:Toggle({
    Title = "自动挖掘",
    Value = false,
    Callback = function(state)
        if state then
            startAutoDig()
        else
            stopAutoDig()
        end
    end
})

Tabs.FarmTab:Button({
    Title = "售卖",
    Callback = function()
        pcall(function()
            local char = LocalPlayer.Character
            if not char then return end

            local originalCFrame = char:GetPivot()

            local SellWorker = workspace:WaitForChild("Things"):WaitForChild("SellWorker")
            char:PivotTo(SellWorker:GetPivot())

            task.wait(0.5)
            SellRequest:FireServer("all")

            char:PivotTo(originalCFrame)
        end)
    end
})
end)

Button(Tabjz, "在超级商店中生存", function()
    local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"
))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 400),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5,  XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button

    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end

    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5,  XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    FuncTab = Window:Tab({ Title = "功能" }),
    ItemTab = Window:Tab({ Title = "物品ESP" }),
    EnemyTab = Window:Tab({ Title = "员工ESP" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

local TeleportLocations = {
    ["超市外"] = CFrame.new(306.80, 36.46, -525.27),
    ["电力室"] = CFrame.new(545.36, 37.37, 45.07),
    ["经理"] = nil
}
local savedPos = nil
local currentLoc = "超市外"

local function getManagerCFrame()
    local enemies = workspace:FindFirstChild("Enemies")
    if not enemies then return nil end
    for _, v in ipairs(enemies:GetDescendants()) do
        if v:IsA("Model") and v.Name == "Manager" then
            local pp = v.PrimaryPart or v:FindFirstChildWhichIsA("BasePart")
            if pp then return pp.CFrame end
        end
    end
    return nil
end

Tabs.FuncTab:Section({ Title = "传送" })

Tabs.FuncTab:Dropdown({
    Title = "选择传送地点",
    Values = {"超市外", "电力室", "经理"},
    Default = "超市外",
    Callback = function(v)
        currentLoc = v
    end
})

Tabs.FuncTab:Button({
    Title = "传送到选定地点",
    Callback = function()
        local lp = game.Players.LocalPlayer
        local c = lp.Character
        if not c then return end
        local hrp = c:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        
        local target = TeleportLocations[currentLoc]
        if currentLoc == "经理" then
            target = getManagerCFrame()
            if not target then return end
        end
        if not target then return end
        savedPos = hrp.CFrame
        hrp.CFrame = target
    end
})

Tabs.FuncTab:Button({
    Title = "返回原位置",
    Callback = function()
        local lp = game.Players.LocalPlayer
        local c = lp.Character
        if not c then return end
        local hrp = c:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        if savedPos then
            hrp.CFrame = savedPos
            savedPos = nil
        end
    end
})

local ItemConfig = {
    ["Pistol"] = {chs = "手枪", color = Color3.fromRGB(255, 60, 60)},
    ["Katana"] = {chs = "武士刀", color = Color3.fromRGB(255, 60, 60)},
    ["BasicFlashlight_Standard"] = {chs = "手电筒", color = Color3.fromRGB(255, 60, 60)},
    ["Hotdog"] = {chs = "热狗", color = Color3.fromRGB(60, 255, 120)},
    ["Ham"] = {chs = "火腿", color = Color3.fromRGB(60, 255, 120)},
    ["Cola"] = {chs = "可乐", color = Color3.fromRGB(60, 255, 120)},
    ["Cake"] = {chs = "蛋糕", color = Color3.fromRGB(60, 255, 120)},
    ["Burger"] = {chs = "汉堡", color = Color3.fromRGB(60, 255, 120)},
    ["RedCube"] = {chs = "红方块", color = Color3.fromRGB(70, 160, 255)},
    ["GreenCube"] = {chs = "绿方块", color = Color3.fromRGB(70, 160, 255)},
    ["BlueCube"] = {chs = "蓝方块", color = Color3.fromRGB(70, 160, 255)},
    ["Plank"] = {chs = "木板", color = Color3.fromRGB(70, 160, 255)},
    ["Metal"] = {chs = "金属块", color = Color3.fromRGB(70, 160, 255)},
    ["Cloth"] = {chs = "布料", color = Color3.fromRGB(70, 160, 255)},
    ["AmmoShotgunBasic"] = {chs = "霰弹枪弹药", color = Color3.fromRGB(255, 230, 60)},
    ["AmmoPistolBasic"] = {chs = "手枪弹药", color = Color3.fromRGB(255, 230, 60)},
    ["AmmoARBasic"] = {chs = "步枪弹药", color = Color3.fromRGB(255, 230, 60)},
    ["Bandage"] = {chs = "绷带", color = Color3.fromRGB(255, 255, 255)}
}

local SelectedItems = {}
local ESPEnabled = false

local function CreateItemESP(obj)
    if not (obj:IsA("BasePart") or obj:IsA("Model")) then return end
    local root = obj:IsA("BasePart") and obj.Parent and obj.Parent:IsA("Model") and obj.Parent or obj
    local cfg = ItemConfig[root.Name]
    if not cfg or not SelectedItems[root.Name] then return end
    if root:FindFirstChild("ESP_HL") then return end
    
    local adornee = root.PrimaryPart or root:FindFirstChildWhichIsA("BasePart")
    if not adornee then return end
    
    local hl = Instance.new("Highlight", root)
    hl.Name = "ESP_HL"
    hl.Adornee = root
    hl.FillColor = cfg.color
    hl.OutlineColor = Color3.new(1, 1, 1)
    hl.FillTransparency = 0.7
    hl.OutlineTransparency = 0.15
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    
    local bb = Instance.new("BillboardGui", root)
    bb.Name = "ESP_TAG"
    bb.Adornee = adornee
    bb.Size = UDim2.new(0, 110, 0, 18)
    bb.StudsOffset = Vector3.new(0, 3, 0)
    bb.AlwaysOnTop = true
    bb.MaxDistance = 600
    
    local lbl = Instance.new("TextLabel", bb)
    lbl.Size = UDim2.new(1, 0, 1, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = cfg.chs
    lbl.TextColor3 = cfg.color
    lbl.TextStrokeTransparency = 0.3
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 10
end

local function ClearItemESP()
    for _, v in ipairs(workspace:GetDescendants()) do
        if v.Name == "ESP_HL" or v.Name == "ESP_TAG" then
            v:Destroy()
        end
    end
end

local function ScanItemESP()
    for _, v in ipairs(workspace:GetDescendants()) do
        pcall(CreateItemESP, v)
    end
    workspace.DescendantAdded:Connect(function(v)
        if ESPEnabled then
            task.wait(0.05)
            pcall(CreateItemESP, v)
        end
    end)
end

Tabs.ItemTab:Section({ Title = "物品ESP" })

Tabs.ItemTab:Toggle({
    Title = "开启物品ESP",
    Value = false,
    Callback = function(v)
        ESPEnabled = v
        if v then
            ClearItemESP()
            ScanItemESP()
        else
            ClearItemESP()
        end
    end
})

local Categories = {
    {title = "武器", keys = {"Pistol", "Katana", "BasicFlashlight_Standard"}},
    {title = "食物", keys = {"Hotdog", "Ham", "Cola", "Cake", "Burger"}},
    {title = "材料", keys = {"RedCube", "GreenCube", "BlueCube", "Plank", "Metal", "Cloth"}},
    {title = "弹药", keys = {"AmmoShotgunBasic", "AmmoPistolBasic", "AmmoARBasic"}},
    {title = "医疗", keys = {"Bandage"}}
}

for _, cat in ipairs(Categories) do
    Tabs.ItemTab:Section({ Title = cat.title })
    for _, k in ipairs(cat.keys) do
        Tabs.ItemTab:Toggle({
            Title = ItemConfig[k].chs,
            Value = false,
            Callback = function(s)
                SelectedItems[k] = s or nil
                if ESPEnabled then
                    ClearItemESP()
                    ScanItemESP()
                end
            end
        })
    end
end

Tabs.ItemTab:Button({
    Title = "传送到最近勾选物品",
    Callback = function()
        local lp = game.Players.LocalPlayer
        local c = lp.Character
        if not c or not c:FindFirstChild("HumanoidRootPart") then return end
        local myPos = c.HumanoidRootPart.Position
        local nearest = nil
        local minDist = math.huge
        
        for _, v in ipairs(workspace:GetDescendants()) do
            local cfg = ItemConfig[v.Name]
            if cfg and SelectedItems[v.Name] then
                local p = (v:IsA("Model") and (v.PrimaryPart or v:FindFirstChildWhichIsA("BasePart"))) or (v:IsA("BasePart") and v)
                if p then
                    local d = (p.Position - myPos).Magnitude
                    if d < minDist then
                        minDist = d
                        nearest = p
                    end
                end
            end
        end
        
        if nearest then
            c.HumanoidRootPart.CFrame = nearest.CFrame + Vector3.new(0, 3, 0)
        end
    end
})

local EnemyESP_Enabled = false
local EnemyNameMap = {
    ["BuffEmployee"] = "强化员工",
    ["Employee"] = "普通员工",
    ["Roach"] = "蟑螂",
    ["Manager"] = "经理"
}

local function CreateEnemyESP(obj)
    if not obj:IsA("Model") then return end
    local chs = EnemyNameMap[obj.Name]
    if not chs then return end
    if obj:FindFirstChild("ESP_HL") then return end
    
    local adornee = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
    if not adornee then return end
    
    local fillColor = Color3.fromRGB(255, 50, 50)
    if obj.Name == "Roach" then
        fillColor = Color3.fromRGB(160, 100, 200)
    elseif obj.Name == "Manager" then
        fillColor = Color3.fromRGB(255, 165, 0)
    elseif obj.Name == "BuffEmployee" then
        fillColor = Color3.fromRGB(255, 50, 50)
    elseif obj.Name == "Employee" then
        fillColor = Color3.fromRGB(255, 120, 120)
    end
    
    local hl = Instance.new("Highlight", obj)
    hl.Name = "ESP_HL"
    hl.Adornee = obj
    hl.FillColor = fillColor
    hl.OutlineColor = Color3.new(1, 1, 1)
    hl.FillTransparency = 0.65
    hl.OutlineTransparency = 0.1
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    
    local bb = Instance.new("BillboardGui", obj)
    bb.Name = "ESP_TAG"
    bb.Adornee = adornee
    bb.Size = UDim2.new(0, 120, 0, 18)
    bb.StudsOffset = Vector3.new(0, 3, 0)
    bb.AlwaysOnTop = true
    bb.MaxDistance = 600
    
    local lbl = Instance.new("TextLabel", bb)
    lbl.Size = UDim2.new(1, 0, 1, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = chs
    lbl.TextColor3 = fillColor
    lbl.TextStrokeTransparency = 0.3
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 10
end

local function ClearEnemyESP()
    for _, v in ipairs(workspace:GetDescendants()) do
        if v.Name == "ESP_HL" or v.Name == "ESP_TAG" then
            local p = v.Parent
            if p and EnemyNameMap[p.Name] then
                v:Destroy()
            end
        end
    end
end

local function ScanEnemyESP()
    local enemies = workspace:FindFirstChild("Enemies")
    if not enemies then return end
    for _, v in ipairs(enemies:GetDescendants()) do
        pcall(CreateEnemyESP, v)
    end
    enemies.DescendantAdded:Connect(function(v)
        if EnemyESP_Enabled then
            task.wait(0.05)
            pcall(CreateEnemyESP, v)
        end
    end)
end

Tabs.EnemyTab:Section({ Title = "员工ESP" })

Tabs.EnemyTab:Toggle({
    Title = "开启员工ESP",
    Value = false,
    Callback = function(v)
        EnemyESP_Enabled = v
        if v then
            ClearEnemyESP()
            ScanEnemyESP()
        else
            ClearEnemyESP()
        end
    end
})
end)

Button(Tabjz, "僵尸之塔", function()
    local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"
))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 400),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5,  XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button

    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end

    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5,  XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    CombatTab = Window:Tab({ Title = "战斗" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Debris = game:GetService("Debris")

local LocalPlayer = Players.LocalPlayer
local Event = ReplicatedStorage:WaitForChild("Events"):WaitForChild("Actions"):WaitForChild("Fire")
local ActiveZombies = Workspace:WaitForChild("ActiveZombies")
local AwaitingBosses = Workspace:WaitForChild("AwaitingBosses")

local autoKillEnabled = false
local autoKillThread = nil

local TRACER_COLOR = Color3.fromRGB(255, 255, 255)
local TRACER_THICKNESS = 0.05
local TRACER_DURATION = 0.1

local function CreateTracer(startPos, endPos)
    local distance = math.clamp((endPos - startPos).Magnitude, 0, 2000)
    local tracer = Instance.new("Part")
    tracer.Material = Enum.Material.Neon
    tracer.Color = TRACER_COLOR
    tracer.Transparency = 0.2
    tracer.Anchored = true
    tracer.CanCollide = false
    tracer.CanQuery = false
    tracer.Size = Vector3.new(TRACER_THICKNESS, TRACER_THICKNESS, distance)
    tracer.CFrame = CFrame.new(startPos, endPos) * CFrame.new(0, 0, -distance / 2)
    tracer.Parent = Workspace.CurrentCamera
    Debris:AddItem(tracer, TRACER_DURATION)
end

local function GetTarget()
    local bossFolder = AwaitingBosses:FindFirstChild("Boss")
    if bossFolder then
        local bossModel = bossFolder:FindFirstChildWhichIsA("Model") or bossFolder:FindFirstChildWhichIsA("BasePart")
        if bossModel then
            local hitbox = bossModel:FindFirstChild("Head") or bossModel:FindFirstChild("HumanoidRootPart") or (bossModel:IsA("BasePart") and bossModel)
            if hitbox then return hitbox end
        end
    end
    for _, zombie in ipairs(ActiveZombies:GetChildren()) do
        local hitbox = zombie:FindFirstChild("Head") or zombie:FindFirstChild("HumanoidRootPart")
        if hitbox then return hitbox end
    end
    return nil
end

local function startAutoKill()
    if autoKillThread then return end
    autoKillEnabled = true
    autoKillThread = task.spawn(function()
        while autoKillEnabled do
            pcall(function()
                local Character = LocalPlayer.Character
                if Character then
                    local currentTool = Character:FindFirstChildWhichIsA("Tool")
                    if currentTool and currentTool:FindFirstChild("Exit") then
                        local weaponName = currentTool.Name
                        local muzzle = currentTool.Exit
                        local targetPart = GetTarget()
                        if targetPart then
                            local originPos = muzzle.Position
                            local targetPos = targetPart.Position
                            local direction = (targetPos - originPos).Unit
                            CreateTracer(originPos, targetPos)
                            Event:FireServer(
                                weaponName,
                                {{targetPart, targetPos, direction}},
                                {{weaponName, originPos, targetPos, targetPos, true, targetPart, false, false, "Default", muzzle}}
                            )
                        end
                    end
                end
            end)
            task.wait(0.1)
        end
    end)
end

local function stopAutoKill()
    autoKillEnabled = false
    if autoKillThread then
        task.cancel(autoKillThread)
        autoKillThread = nil
    end
end

Tabs.CombatTab:Section({ Title = "战斗功能" })

Tabs.CombatTab:Toggle({
    Title = "自动秒杀",
    Value = false,
    Callback = function(state)
        if state then
            startAutoKill()
        else
            stopAutoKill()
        end
    end
})
end)

Button(Tabjz, "通过滚动来生存", function()
    local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"
))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 400),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5,  XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button

    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end

    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5,  XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    FuncTab = Window:Tab({ Title = "功能" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RollWeapon = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("RollWeapon")

local rolling = false
local rollThread = nil
local rollMultiplier = 1
local rollInterval = 1

Tabs.FuncTab:Section({ Title = "RollWeapon" })

Tabs.FuncTab:Input({
    Title = "倍率（1~3）",
    Value = "1",
    Placeholder = "输入 1 / 2 / 3",
    Callback = function(text)
        local num = tonumber(text)
        if num then
            rollMultiplier = math.clamp(math.floor(num), 1, 3)
        end
    end
})

Tabs.FuncTab:Input({
    Title = "执行间隔（秒）",
    Value = "1",
    Placeholder = "输入秒数，如 0.5",
    Callback = function(text)
        local num = tonumber(text)
        if num and num > 0 then
            rollInterval = num
        end
    end
})

Tabs.FuncTab:Toggle({
    Title = "循环执行 RollWeapon",
    Value = false,
    Callback = function(state)
        rolling = state

        if rolling then
            rollThread = task.spawn(function()
                while rolling do
                    for i = 1, rollMultiplier do
                        pcall(function()
                            RollWeapon:FireServer(i)
                        end)
                    end
                    task.wait(rollInterval)
                end
            end)
        else
            if rollThread then
                task.cancel(rollThread)
                rollThread = nil
            end
        end
    end
})
end)

Button(Tabjz, "+1魔法进化", function()
local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"
))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 400),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5,  XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button

    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end

    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5,  XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    FuncTab = Window:Tab({ Title = "功能" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local autoMagicPowerEnabled = false
local autoMagicPowerRunning = false
local autoMagicPowerSpeed = 0.01
local GainMagicPower = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("GainMagicPower")

local walkSpeedEnabled = false
local walkSpeedRunning = false
local walkSpeedValue = 50
local walkSpeedInterval = 0.5

Tabs.FuncTab:Section({ Title = "自动魔法值" })

Tabs.FuncTab:Toggle({
    Title = "启用自动魔法值",
    Value = false,
    Callback = function(state)
        autoMagicPowerEnabled = state

        if autoMagicPowerEnabled then
            if not autoMagicPowerRunning then
                autoMagicPowerRunning = true
                task.spawn(function()
                    while autoMagicPowerEnabled do
                        pcall(function()
                            GainMagicPower:FireServer()
                        end)
                        task.wait(autoMagicPowerSpeed)
                    end
                    autoMagicPowerRunning = false
                end)
            end
        end
    end
})

Tabs.FuncTab:Input({
    Title = "触发间隔（秒）",
    Value = "0.01",
    Placeholder = "0.01",
    Callback = function(value)
        local num = tonumber(value)
        if num and num > 0 then
            autoMagicPowerSpeed = num
        end
    end
})

Tabs.FuncTab:Section({ Title = "人物移动速度" })

Tabs.FuncTab:Toggle({
    Title = "启用移动速度修改",
    Value = false,
    Callback = function(state)
        walkSpeedEnabled = state

        if walkSpeedEnabled then
            if not walkSpeedRunning then
                walkSpeedRunning = true
                task.spawn(function()
                    while walkSpeedEnabled do
                        pcall(function()
                            local character = LocalPlayer.Character
                            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
                            if humanoid then
                                humanoid.WalkSpeed = walkSpeedValue
                            end
                        end)
                        task.wait(walkSpeedInterval)
                    end
                    pcall(function()
                        local character = LocalPlayer.Character
                        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
                        if humanoid then
                            humanoid.WalkSpeed = 16
                        end
                    end)
                    walkSpeedRunning = false
                end)
            end
        end
    end
})

Tabs.FuncTab:Input({
    Title = "移动速度",
    Value = "50",
    Placeholder = "50",
    Callback = function(value)
        local num = tonumber(value)
        if num and num > 0 then
            walkSpeedValue = num
        end
    end
})

Tabs.FuncTab:Input({
    Title = "刷新间隔（秒）",
    Value = "0.5",
    Placeholder = "0.5",
    Callback = function(value)
        local num = tonumber(value)
        if num and num > 0 then
            walkSpeedInterval = num
        end
    end
})
end)

Button(Tabjz, "MM2", function()
local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"
))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 400),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5,  XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button

    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end

    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5,  XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    FarmTab = Window:Tab({ Title = "Coin农场" }),
    EspTab = Window:Tab({ Title = "ESP" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LP = Players.LocalPlayer

local farming = false
local coinsCache = {}
local lastTP = {}

local function scanCoins()
    local list = {}
    for _, v in ipairs(Workspace:GetDescendants()) do
        if v:IsA("Model") and v.Name:lower():find("coin") then
            local part = v.PrimaryPart or v:FindFirstChildWhichIsA("BasePart", true)
            if part then
                table.insert(list, {
                    Model = v,
                    Part = part
                })
            end
        end
    end
    coinsCache = list
end

scanCoins()

Tabs.FarmTab:Section({ Title = "Coin Farm" })

Tabs.FarmTab:Toggle({
    Title = "Scan + TP Ultra",
    Value = false,
    Callback = function(state)
        farming = state

        if farming then
            task.spawn(function()
                while farming do
                    scanCoins()
                    task.wait(0.3)
                end
            end)

            task.spawn(function()
                while farming do
                    local now = tick()
                    local char = LP.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")

                    if hrp then
                        for _, data in ipairs(coinsCache) do
                            if not farming then break end

                            local model = data.Model
                            local part = data.Part

                            if not lastTP[model] or (now - lastTP[model] >= 0.1) then
                                hrp.CFrame = part.CFrame + Vector3.new(0, 3, 0)
                                lastTP[model] = now
                            end
                        end
                    end

                    task.wait(0.05)
                end
            end)
        end
    end
})

local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local ESP_ENABLED = false
local Chams = {}
local MAX_DISTANCE = 150

local KNIFE_HOLDERS = {}
local GUN_HOLDERS = {}
local DEAD_PLAYERS = {}
local LAST_POSITIONS = {}
local TELEPORT_THRESHOLD = 80

local function clearEspCache()
    table.clear(KNIFE_HOLDERS)
    table.clear(GUN_HOLDERS)
    table.clear(DEAD_PLAYERS)
    table.clear(LAST_POSITIONS)
end

local function getCurrentTool(player)
    local c = player.Character
    if not c then return nil end
    for _, v in ipairs(c:GetChildren()) do
        if v:IsA("Tool") then
            return v.Name
        end
    end
    return nil
end

local function hasToolInBackpack(player, name)
    local c = player.Character
    if not c then return false end
    for _, v in ipairs(c:GetChildren()) do
        if v:IsA("Tool") and v.Name == name then
            return true
        end
    end
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        for _, v in ipairs(backpack:GetChildren()) do
            if v:IsA("Tool") and v.Name == name then
                return true
            end
        end
    end
    return false
end

local function isPlayerDead(player)
    local char = player.Character
    if not char then return true end
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if not humanoid then return true end
    return humanoid.Health <= 0
end

local function isTeleporting(player)
    local char = player.Character
    if not char then return false end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return false end

    local currentPos = root.Position
    local lastPos = LAST_POSITIONS[player]
    LAST_POSITIONS[player] = currentPos

    if not lastPos then return false end

    local delta = (currentPos - lastPos).Magnitude
    return delta > TELEPORT_THRESHOLD
end

local function getPlayerRole(player)
    local dead = isPlayerDead(player)
    local teleporting = isTeleporting(player)

    if dead or teleporting then
        if not DEAD_PLAYERS[player] then
            DEAD_PLAYERS[player] = true
            KNIFE_HOLDERS[player] = nil
            GUN_HOLDERS[player] = nil
        end
        return "Innocent"
    else
        DEAD_PLAYERS[player] = nil
    end

    local currentTool = getCurrentTool(player)
    if currentTool == "Gun" then
        GUN_HOLDERS[player] = true
        return "Sheriff"
    elseif currentTool == "Knife" then
        KNIFE_HOLDERS[player] = true
        return "Murderer"
    end

    if hasToolInBackpack(player, "Gun") then
        GUN_HOLDERS[player] = true
        return "Sheriff"
    elseif hasToolInBackpack(player, "Knife") then
        KNIFE_HOLDERS[player] = true
        return "Murderer"
    end

    if GUN_HOLDERS[player] then
        return "Sheriff"
    elseif KNIFE_HOLDERS[player] then
        return "Murderer"
    end

    return "Innocent"
end

local function getDistanceToPlayer(player)
    local myChar = LocalPlayer.Character
    local theirChar = player.Character
    if not myChar or not theirChar then return math.huge end

    local myRoot = myChar:FindFirstChild("HumanoidRootPart")
    local theirRoot = theirChar:FindFirstChild("HumanoidRootPart")
    if not myRoot or not theirRoot then return math.huge end

    return (myRoot.Position - theirRoot.Position).Magnitude
end

local function setupToolTracking(player)
    local function trackCharacter(char)
        char.ChildAdded:Connect(function(child)
            if child:IsA("Tool") then
                if child.Name == "Gun" then
                    GUN_HOLDERS[player] = true
                elseif child.Name == "Knife" then
                    KNIFE_HOLDERS[player] = true
                end
            end
        end)

        for _, v in ipairs(char:GetChildren()) do
            if v:IsA("Tool") then
                if v.Name == "Gun" then
                    GUN_HOLDERS[player] = true
                elseif v.Name == "Knife" then
                    KNIFE_HOLDERS[player] = true
                end
            end
        end

        local humanoid = char:WaitForChild("Humanoid", 3)
        if humanoid then
            humanoid.Died:Connect(function()
                DEAD_PLAYERS[player] = true
                KNIFE_HOLDERS[player] = nil
                GUN_HOLDERS[player] = nil
            end)
        end
    end

    if player.Character then
        trackCharacter(player.Character)
    end

    player.CharacterAdded:Connect(function(newChar)
        DEAD_PLAYERS[player] = nil
        LAST_POSITIONS[player] = nil
        trackCharacter(newChar)
    end)

    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        backpack.ChildAdded:Connect(function(child)
            if child:IsA("Tool") then
                if child.Name == "Gun" then
                    GUN_HOLDERS[player] = true
                elseif child.Name == "Knife" then
                    KNIFE_HOLDERS[player] = true
                end
            end
        end)
    end
end

for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        setupToolTracking(player)
    end
end

Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        setupToolTracking(player)
    end
end)

local function createChams(player)
    if Chams[player] then return end

    local highlight = Instance.new("Highlight")
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.FillTransparency = 0.35
    highlight.OutlineTransparency = 0
    highlight.Parent = game.CoreGui

    local billboard = Instance.new("BillboardGui")
    billboard.Size = UDim2.new(0, 120, 0, 20)
    billboard.Adornee = player.Character and player.Character:FindFirstChild("Head")
    billboard.StudsOffset = Vector3.new(0, 2.5, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = game.CoreGui

    local label = Instance.new("TextLabel", billboard)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextStrokeTransparency = 0
    label.TextScaled = true

    Chams[player] = {
        Highlight = highlight,
        Label = label,
        Billboard = billboard
    }
end

RunService.RenderStepped:Connect(function()
    if not ESP_ENABLED then
        for _, v in pairs(Chams) do
            v.Highlight.Enabled = false
            v.Billboard.Enabled = false
        end
        return
    end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local distance = getDistanceToPlayer(player)
            if distance > MAX_DISTANCE then
                if Chams[player] then
                    Chams[player].Highlight.Enabled = false
                    Chams[player].Billboard.Enabled = false
                end
                continue
            end

            createChams(player)

            local c = Chams[player]
            local char = player.Character
            c.Highlight.Adornee = char
            c.Billboard.Adornee = char:FindFirstChild("Head")

            local role = getPlayerRole(player)

            if role == "Sheriff" then
                c.Highlight.FillColor = Color3.fromRGB(0, 150, 255)
                c.Highlight.OutlineColor = Color3.fromRGB(0, 100, 255)
                c.Label.TextColor3 = Color3.fromRGB(0, 150, 255)
                c.Label.Text = "[警长] "..player.Name
            elseif role == "Murderer" then
                c.Highlight.FillColor = Color3.fromRGB(255, 60, 60)
                c.Highlight.OutlineColor = Color3.fromRGB(200, 0, 0)
                c.Label.TextColor3 = Color3.fromRGB(255, 60, 60)
                c.Label.Text = "[杀手] "..player.Name
            else
                c.Highlight.FillColor = Color3.fromRGB(60, 255, 60)
                c.Highlight.OutlineColor = Color3.fromRGB(30, 180, 30)
                c.Label.TextColor3 = Color3.fromRGB(60, 255, 60)
                c.Label.Text = "[平民] "..player.Name
            end

            c.Highlight.Enabled = true
            c.Billboard.Enabled = true
        end
    end
end)

Tabs.EspTab:Section({ Title = "ESP" })

Tabs.EspTab:Toggle({
    Title = "启用全身 ESP",
    Value = false,
    Callback = function(v)
        ESP_ENABLED = v
    end
})

Tabs.EspTab:Button({
    Title = "清除 ESP 缓存，每次游戏结束清除一次",
    Callback = function()
        clearEspCache()
    end
})

Players.PlayerRemoving:Connect(function(p)
    if Chams[p] then
        Chams[p].Highlight:Destroy()
        Chams[p].Billboard:Destroy()
        Chams[p] = nil
    end
    KNIFE_HOLDERS[p] = nil
    GUN_HOLDERS[p] = nil
    DEAD_PLAYERS[p] = nil
    LAST_POSITIONS[p] = nil
end)
end)

Button(Tabjz, "谋杀决斗", function()
    local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"
))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 400),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5,  XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button

    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end

    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5,  XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    RageTab = Window:Tab({ Title = "射击功能" }),
    SpeedTab = Window:Tab({ Title = "移动功能" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

local ShootRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ShootReplicate")

local FIRE_RATE = 0.1
local bulletId = 1
local ragebotEnabled = false
local ragebotThread = nil
local wallbangEnabled = false

local function isTargetVisible(fromPos, targetHead, targetChar)
    local direction = (targetHead.Position - fromPos).Unit
    local distance = (targetHead.Position - fromPos).Magnitude
    local rayParams = RaycastParams.new()
    rayParams.FilterType = Enum.RaycastFilterType.Exclude
    local filter = {LocalPlayer.Character, targetChar}
    rayParams.FilterDescendantsInstances = filter
    rayParams.IgnoreWater = true
    local result = Workspace:Raycast(fromPos, direction * distance, rayParams)
    return result == nil
end

local function startRagebot()
    if ragebotThread then return end
    ragebotThread = task.spawn(function()
        while ragebotEnabled do
            task.wait(FIRE_RATE)
            pcall(function()
                local character = LocalPlayer.Character
                if not character then return end
                local weapon = character:FindFirstChildOfClass("Tool")
                if not weapon then return end
                local myHead = character:FindFirstChild("Head")
                local myRoot = character:FindFirstChild("HumanoidRootPart")
                if not myHead or not myRoot then return end
                local myTeam = LocalPlayer.Team
                local target = nil
                local closest = math.huge
                for _, player in ipairs(Players:GetPlayers()) do
                    if player == LocalPlayer then continue end
                    if myTeam and player.Team == myTeam then continue end
                    local targetChar = player.Character
                    if not targetChar then continue end
                    if targetChar:FindFirstChildOfClass("ForceField") then continue end
                    local head = targetChar:FindFirstChild("Head")
                    local humanoid = targetChar:FindFirstChild("Humanoid")
                    if head and humanoid and humanoid.Health > 0 then
                        local dist = (myRoot.Position - head.Position).Magnitude
                        if dist < closest then
                            if not wallbangEnabled then
                                if not isTargetVisible(myHead.Position, head, targetChar) then
                                    continue
                                end
                            end
                            closest = dist
                            target = targetChar
                        end
                    end
                end
                if target then
                    local head = target.Head
                    local origin = myHead.Position
                    local hitPos = head.Position
                    local hitNormal = (origin - hitPos).Unit
                    ShootRemote:FireServer({
                        hitPos = hitPos,
                        to = hitPos,
                        origin = origin,
                        id = bulletId,
                        hitNormal = hitNormal,
                        effects = {
                            Frost = 0,
                            Ricochet = 0,
                            Barrage = 0
                        },
                        hitInstance = head,
                        kind = "bullet",
                        isCharacterHit = true,
                        mode = "single",
                        ownerUserId = LocalPlayer.UserId,
                        isADS = false
                    })
                    bulletId = bulletId + 1
                    if bulletId > 999999 then bulletId = 1 end
                end
            end)
        end
    end)
end

local function stopRagebot()
    ragebotEnabled = false
    if ragebotThread then
        task.cancel(ragebotThread)
        ragebotThread = nil
    end
end

Tabs.RageTab:Section({ Title = "射击功能" })

Tabs.RageTab:Toggle({
    Title = "RageBot",
    Value = false,
    Callback = function(state)
        if state then
            ragebotEnabled = true
            startRagebot()
        else
            stopRagebot()
        end
    end
})

Tabs.RageTab:Toggle({
    Title = "自动穿墙",
    Value = false,
    Callback = function(state)
        wallbangEnabled = state
    end
})

Tabs.RageTab:Slider({
    Title = "射击速度",
    Value = { Min = 0.05, Max = 1, Default = 0.1 },
    Callback = function(val)
        FIRE_RATE = val
    end
})

local speedEnabled = false
local speedThread = nil
local customSpeedValue = 50
local originalWalkSpeed = 16

local function getLocalHumanoid()
    local char = LocalPlayer.Character
    if not char then return nil end
    return char:FindFirstChild("Humanoid")
end

task.spawn(function()
    repeat task.wait() until LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
    local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
    if hum then
        originalWalkSpeed = hum.WalkSpeed
    end
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    local hum = char:FindFirstChild("Humanoid")
    if hum then
        originalWalkSpeed = hum.WalkSpeed
        if speedEnabled then
            hum.WalkSpeed = customSpeedValue
        end
    end
end)

local function startSpeedModifier()
    if speedThread then return end
    speedThread = task.spawn(function()
        while speedEnabled do
            pcall(function()
                local humanoid = getLocalHumanoid()
                if humanoid then
                    humanoid.WalkSpeed = customSpeedValue
                end
            end)
            task.wait(0.01)
        end
        pcall(function()
            local humanoid = getLocalHumanoid()
            if humanoid then
                humanoid.WalkSpeed = originalWalkSpeed
            end
        end)
    end)
end

local function stopSpeedModifier()
    speedEnabled = false
    if speedThread then
        task.cancel(speedThread)
        speedThread = nil
    end
    pcall(function()
        local humanoid = getLocalHumanoid()
        if humanoid then
            humanoid.WalkSpeed = originalWalkSpeed
        end
    end)
end

Tabs.SpeedTab:Section({ Title = "移动" })

Tabs.SpeedTab:Toggle({
    Title = "提前移动",
    Value = false,
    Callback = function(state)
        if state then
            speedEnabled = true
            startSpeedModifier()
        else
            stopSpeedModifier()
        end
    end
})
end)

Button(Tabjz, "感染性的微笑", function()
    local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 400),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5, XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1, XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button
    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end
    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0, XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1, XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5, XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1, XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1, XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    HumanTab = Window:Tab({ Title = "人类" }),
    SmilerTab = Window:Tab({ Title = "感染者" }),
    ExploitTab = Window:Tab({ Title = "功能" }),
    PlayerTab = Window:Tab({ Title = "玩家" }),
    VisualTab = Window:Tab({ Title = "视觉" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

pcall(function()
    if Workspace.Map:FindFirstChild("AntiHack") then
        Workspace.Map.AntiHack:Destroy()
    end
end)

local function getAllTools()
    local tools = {}
    if LocalPlayer.Character then
        for _, item in LocalPlayer.Character:GetChildren() do
            if item:IsA("Tool") then table.insert(tools, item) end
        end
    end
    for _, item in LocalPlayer.Backpack:GetChildren() do
        if item:IsA("Tool") then table.insert(tools, item) end
    end
    return tools
end

local savedHitboxSize = 15
local hitboxToggle = false
local swingAuraToggle = false
local killPlayerToggle = false
local killAllToggle = false
local infectRangeToggle = false
local antiInfectToggle = false
local antiKillToggle = false
local antiSpearerToggle = false
local antiGateToggle = false
local autoNoCooldownToggle = false
local infectAuraToggle = false
local autoKeysToggle = false
local autoCoinsToggle = false
local antiBlackHoleToggle = false
local infJumpToggle = false
local noclipToggle = false
local espToggle = false

Tabs.HumanTab:Section({ Title = "人类功能" })

Tabs.HumanTab:Dropdown({
    Title = "零冷却 - 选择武器",
    Values = { "Bat", "Bottle", "Katana", "Branch", "Spare", "Chain" },
    Value = "Bat",
    Callback = function(value)
        for _, tool in getAllTools() do
            if tool.Name == value and tool:FindFirstChild("Cooldown") then
                tool.Cooldown.Value = 0
            end
        end
    end
})

Tabs.HumanTab:Toggle({
    Title = "自动扩大攻击范围",
    Value = false,
    Callback = function(v)
        hitboxToggle = v
        task.spawn(function()
            while hitboxToggle do
                task.wait(0.1)
                if LocalPlayer.Character then
                    local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
                    if tool then
                        for _, part in tool:GetDescendants() do
                            if part:IsA("BasePart") and part:FindFirstChild("TouchInterest") then
                                part.Size = Vector3.new(savedHitboxSize, savedHitboxSize, savedHitboxSize)
                                part.Transparency = 0.7
                                part.Massless = true
                                if not part:FindFirstChildOfClass("SelectionBox") then
                                    local box = Instance.new("SelectionBox", part)
                                    box.Adornee = part
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
})

Tabs.HumanTab:Slider({
    Title = "攻击范围大小",
    Value = { Min = 0, Max = 60, Default = 15 },
    Callback = function(v)
        savedHitboxSize = v
    end
})

local function getMainWeaponName()
    local ok, wName = pcall(function()
        local val = LocalPlayer.Marketplace["Main Weapon"].Equipped.Value
        return val ~= "Default" and val or "Bat"
    end)
    return ok and wName or "Bat"
end

Tabs.HumanTab:Button({
    Title = "装备主武器",
    Callback = function()
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        local wName = getMainWeaponName()
        local backpack = LocalPlayer.Backpack
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

        if backpack:FindFirstChild(wName) then
            if humanoid then
                humanoid:EquipTool(backpack[wName])
            end
            return
        end

        if LocalPlayer.Character:FindFirstChild(wName) then
            return
        end

        local vendorHitbox = Workspace.Map.HumanBase.Vendor.BatCollection.HitBox
        local detector = Workspace.Map.HumanBase.Vendor.BatCollection.ClickDetector

        local oldPos = hrp.CFrame
        local startTime = tick()

        repeat
            task.wait()
            if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                return
            end
            hrp = LocalPlayer.Character.HumanoidRootPart
            hrp.CFrame = vendorHitbox.CFrame + Vector3.new(0, 3, 0)
            detector.MaxActivationDistance = 9e9
            fireclickdetector(detector)
        until backpack:FindFirstChild(wName) or tick() - startTime > 5

        if backpack:FindFirstChild(wName) then
            humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:EquipTool(backpack[wName])
            end
        end

        task.wait(0.4)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            repeat
                task.wait()
                LocalPlayer.Character.HumanoidRootPart.CFrame = oldPos
            until (LocalPlayer.Character.HumanoidRootPart.Position - oldPos.Position).Magnitude < 3
        end
    end
})

Tabs.HumanTab:Toggle({
    Title = "自动挥砍光环",
    Value = false,
    Callback = function(v)
        swingAuraToggle = v
        task.spawn(function()
            while swingAuraToggle do
                task.wait(0.05)
                pcall(function()
                    local char = LocalPlayer.Character
                    if not char then return end
                    local tool = char:FindFirstChildOfClass("Tool")
                    if not tool then return end
                    local swingEvent = tool:FindFirstChild("SwingEvent")
                    if swingEvent then
                        swingEvent:FireServer()
                    end
                end)
            end
        end)
    end
})

Tabs.HumanTab:Section({ Title = "击杀玩家" })

local function getPlayerList()
    local list = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            table.insert(list, p.Name)
        end
    end
    return list
end

local function getPlayerByName(name)
    for _, p in ipairs(Players:GetPlayers()) do
        if p.Name == name then return p end
    end
    return nil
end

local function sameTeam(p1, p2)
    local ok, result = pcall(function()
        return p1.Team == p2.Team
    end)
    return ok and result
end

local function grabWeapon()
    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end

    local wName = getMainWeaponName()
    local backpack = LocalPlayer.Backpack

    if backpack:FindFirstChild(wName) then
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:EquipTool(backpack[wName])
        end
        return true
    end

    local vendorHitbox = Workspace.Map.HumanBase.Vendor.BatCollection.HitBox
    local detector = Workspace.Map.HumanBase.Vendor.BatCollection.ClickDetector

    local startTime = tick()

    repeat
        task.wait()
        if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return false end
        hrp = LocalPlayer.Character.HumanoidRootPart
        hrp.CFrame = vendorHitbox.CFrame + Vector3.new(0, 3, 0)
        detector.MaxActivationDistance = 9e9
        fireclickdetector(detector)
    until backpack:FindFirstChild(wName) or tick() - startTime > 5

    if backpack:FindFirstChild(wName) then
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:EquipTool(backpack[wName])
        end
        return true
    end
    return false
end

local killPlayerDropdown = Tabs.HumanTab:Dropdown({
    Title = "选择目标玩家",
    Values = getPlayerList(),
    Value = "",
    Callback = function() end
})

Tabs.HumanTab:Button({
    Title = "刷新玩家列表",
    Callback = function()
        killPlayerDropdown:SetValues(getPlayerList())
    end
})

Tabs.HumanTab:Toggle({
    Title = "持续击杀目标",
    Value = false,
    Callback = function(v)
        killPlayerToggle = v
        if not v then return end

        task.spawn(function()
            while killPlayerToggle do
                local targetName = killPlayerDropdown.Value
                if not targetName or targetName == "" then
                    task.wait(0.5)
                    continue
                end

                local target = getPlayerByName(targetName)
                if not target then
                    break
                end

                if sameTeam(LocalPlayer, target) then
                    break
                end

                if target.Character then
                    local targetHumanoid = target.Character:FindFirstChildOfClass("Humanoid")
                    if targetHumanoid and targetHumanoid.Health <= 0 then
                        local char = LocalPlayer.Character
                        if char then
                            local hum = char:FindFirstChildOfClass("Humanoid")
                            if hum then
                                hum.Health = 0
                            end
                        end
                        break
                    end
                end

                local myChar = LocalPlayer.Character
                if not myChar then
                    task.wait(1)
                    continue
                end
                local myHumanoid = myChar:FindFirstChildOfClass("Humanoid")
                if not myHumanoid or myHumanoid.Health <= 0 then
                    task.wait(3)
                    continue
                end

                local currentTool = myChar:FindFirstChildOfClass("Tool")
                if not currentTool then
                    local success = grabWeapon()
                    if not success then
                        task.wait(0.5)
                        continue
                    end
                    task.wait(0.3)
                    currentTool = myChar:FindFirstChildOfClass("Tool")
                end

                if not currentTool then
                    if myHumanoid then
                        myHumanoid.Health = 0
                    end
                    task.wait(3)
                    continue
                end

                for _, part in currentTool:GetDescendants() do
                    if part:IsA("BasePart") and part:FindFirstChild("TouchInterest") then
                        part.Size = Vector3.new(savedHitboxSize, savedHitboxSize, savedHitboxSize)
                        part.Transparency = 0.7
                        part.Massless = true
                    end
                end

                if target.Character then
                    local targetHRP = target.Character:FindFirstChild("HumanoidRootPart")
                    local myHRP = myChar:FindFirstChild("HumanoidRootPart")
                    if targetHRP and myHRP then
                        local offset = targetHRP.CFrame.LookVector * -3
                        myHRP.CFrame = CFrame.new(targetHRP.Position + offset, targetHRP.Position)
                    end
                end

                pcall(function()
                    local swingEvent = currentTool:FindFirstChild("SwingEvent")
                    if swingEvent then
                        swingEvent:FireServer()
                    end
                end)

                task.wait(0.05)
            end
        end)
    end
})

Tabs.HumanTab:Toggle({
    Title = "击杀所有敌人",
    Value = false,
    Callback = function(v)
        killAllToggle = v
        task.spawn(function()
            while killAllToggle do
                local enemies = {}
                for _, p in ipairs(Players:GetPlayers()) do
                    if p ~= LocalPlayer and p.Character then
                        local targetHumanoid = p.Character:FindFirstChildOfClass("Humanoid")
                        if targetHumanoid and targetHumanoid.Health > 0 then
                            local isEnemy = true
                            pcall(function()
                                if LocalPlayer.Team and p.Team and LocalPlayer.Team == p.Team then
                                    isEnemy = false
                                end
                            end)
                            if isEnemy then
                                table.insert(enemies, p)
                            end
                        end
                    end
                end

                if #enemies == 0 then
                    task.wait(2)
                    continue
                end

                local target = enemies[1]

                while killAllToggle do
                    if not target or not target.Parent then
                        break
                    end

                    if target.Character then
                        local targetHumanoid = target.Character:FindFirstChildOfClass("Humanoid")
                        if not targetHumanoid or targetHumanoid.Health <= 0 then
                            break
                        end
                    end

                    local myChar = LocalPlayer.Character
                    if not myChar then
                        task.wait(1)
                        continue
                    end
                    local myHumanoid = myChar:FindFirstChildOfClass("Humanoid")
                    if not myHumanoid or myHumanoid.Health <= 0 then
                        task.wait(3)
                        continue
                    end

                    local currentTool = myChar:FindFirstChildOfClass("Tool")
                    if not currentTool then
                        local success = grabWeapon()
                        if not success then
                            task.wait(0.5)
                            continue
                        end
                        task.wait(0.3)
                        currentTool = myChar:FindFirstChildOfClass("Tool")
                    end

                    if not currentTool then
                        if myHumanoid then
                            myHumanoid.Health = 0
                        end
                        task.wait(3)
                        continue
                    end

                    for _, part in currentTool:GetDescendants() do
                        if part:IsA("BasePart") and part:FindFirstChild("TouchInterest") then
                            part.Size = Vector3.new(savedHitboxSize, savedHitboxSize, savedHitboxSize)
                            part.Transparency = 0.7
                            part.Massless = true
                        end
                    end

                    if target.Character then
                        local targetHRP = target.Character:FindFirstChild("HumanoidRootPart")
                        local myHRP = myChar:FindFirstChild("HumanoidRootPart")
                        if targetHRP and myHRP then
                            local offset = targetHRP.CFrame.LookVector * -3
                            myHRP.CFrame = CFrame.new(targetHRP.Position + offset, targetHRP.Position)
                        end
                    end

                    pcall(function()
                        local swingEvent = currentTool:FindFirstChild("SwingEvent")
                        if swingEvent then
                            swingEvent:FireServer()
                        end
                    end)

                    task.wait(0.05)
                end

                task.wait(0.5)
            end
        end)
    end
})

Tabs.SmilerTab:Section({ Title = "感染者功能" })

Tabs.SmilerTab:Button({
    Title = "成为感染者",
    Callback = function()
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp and Workspace.Map.Infectors.Infector and Workspace.Map.Infectors.Infector:FindFirstChild("Part") then
            firetouchinterest(hrp, Workspace.Map.Infectors.Infector.Part, 0)
            task.delay(0.1, function() firetouchinterest(hrp, Workspace.Map.Infectors.Infector.Part, 1) end)
        end
    end
})

Tabs.SmilerTab:Slider({
    Title = "感染范围大小",
    Value = { Min = 0, Max = 50, Default = 0 },
    Callback = function(n)
        if n == 0 then return end
        local torso = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Torso")
        if torso and torso:FindFirstChild("Part") then
            local p = torso.Part
            p.Size = Vector3.new(7, 2, n)
            p.Massless = true
            p.Transparency = 0.6
            if not p:FindFirstChild("SelectionBox") then
                Instance.new("SelectionBox", p).Adornee = p
            end
        end
    end
})

Tabs.SmilerTab:Toggle({
    Title = "自动扩大感染范围",
    Value = false,
    Callback = function(v)
        infectRangeToggle = v
        task.spawn(function()
            while infectRangeToggle do
                task.wait(0.1)
                local char = LocalPlayer.Character
                if char then
                    local torso = char:FindFirstChild("Torso")
                    if torso then
                        local p = torso:FindFirstChild("Part")
                        if p then
                            p.Size = Vector3.new(7, 2, 50)
                            p.Massless = true
                            p.Transparency = 0.6
                            if not p:FindFirstChild("SelectionBox") then
                                Instance.new("SelectionBox", p).Adornee = p
                            end
                        end
                    end
                end
            end
        end)
    end
})

Tabs.HumanTab:Toggle({
    Title = "反感染方块",
    Value = false,
    Callback = function(v)
        antiInfectToggle = v
        task.spawn(function()
            while antiInfectToggle do
                task.wait(0.3)
                for _, p in Workspace:GetDescendants() do
                    if p:IsA("BasePart") and p.BrickColor.Name == "Institutional white" then
                        p.CanTouch = false
                        p.CanQuery = false
                    end
                end
            end
        end)
    end
})

Tabs.SmilerTab:Toggle({
    Title = "反击杀方块",
    Value = false,
    Callback = function(v)
        antiKillToggle = v
        task.spawn(function()
            while antiKillToggle do
                task.wait(0.3)
                for _, part in Workspace.Map:GetDescendants() do
                    if part:IsA("BasePart") and part.Name:lower():find("kill") then
                        part.CanTouch = false
                        part.CanQuery = false
                    end
                end
            end
        end)
    end
})

Tabs.SmilerTab:Toggle({
    Title = "反Spearer",
    Value = false,
    Callback = function(v)
        antiSpearerToggle = v
        task.spawn(function()
            while antiSpearerToggle do
                task.wait(0.3)
                pcall(function()
                    local s = Workspace.Map.Misc:FindFirstChild("Spearer")
                    if s then s:Destroy() end
                end)
            end
        end)
    end
})

Tabs.HumanTab:Toggle({
    Title = "反城堡大门",
    Value = false,
    Callback = function(v)
        antiGateToggle = v
        task.spawn(function()
            while antiGateToggle do
                task.wait(0.3)
                pcall(function()
                    local gate = Workspace.Map.ConstantTerrain.KillGateSwitcher:FindFirstChild("Gate")
                    if gate then gate:Destroy() end
                end)
            end
        end)
    end
})

Tabs.SmilerTab:Button({
    Title = "无冷却 (立即)",
    Callback = function()
        local inf = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Infected")
        if inf and inf:FindFirstChild("Infect") and inf.Infect:FindFirstChild("Cooldown") then
            inf.Infect.Cooldown.Value = 0
        end
    end
})

Tabs.SmilerTab:Toggle({
    Title = "自动无冷却",
    Value = false,
    Callback = function(v)
        autoNoCooldownToggle = v
        task.spawn(function()
            while autoNoCooldownToggle do
                task.wait(0.05)
                pcall(function()
                    local inf = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Infected")
                    if inf and inf:FindFirstChild("Infect") and inf.Infect:FindFirstChild("Cooldown") then
                        inf.Infect.Cooldown.Value = 0
                    end
                end)
            end
        end)
    end
})

Tabs.SmilerTab:Toggle({
    Title = "感染光环",
    Value = false,
    Callback = function(v)
        infectAuraToggle = v
        task.spawn(function()
            while infectAuraToggle do
                task.wait(0.1)
                pcall(function()
                    local infected = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Infected")
                    local event = infected and infected:FindFirstChild("InfectEvent")
                    if not event then return end
                    local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if not hrp then return end
                    for _, p in Players:GetPlayers() do
                        if p ~= LocalPlayer and p.Character then
                            local otherHrp = p.Character:FindFirstChild("HumanoidRootPart")
                            if otherHrp and (hrp.Position - otherHrp.Position).Magnitude <= 20 then
                                event:FireServer("orient_upd", -131.01300048828125)
                            end
                        end
                    end
                end)
            end
        end)
    end
})

Tabs.ExploitTab:Section({ Title = "自动拾取" })

Tabs.ExploitTab:Toggle({
    Title = "自动拾取钥匙",
    Value = false,
    Callback = function(v)
        autoKeysToggle = v
        task.spawn(function()
            while autoKeysToggle do
                task.wait(0.5)
                pcall(function()
                    for _, k in Workspace.Particles:GetChildren() do
                        if k:IsA("BasePart") and k.Name:lower():find("key") then
                            local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if hrp then
                                firetouchinterest(hrp, k, 0)
                                task.delay(0.1, function() firetouchinterest(hrp, k, 1) end)
                            end
                        end
                    end
                end)
            end
        end)
    end
})

Tabs.ExploitTab:Toggle({
    Title = "自动拾取微笑币",
    Value = false,
    Callback = function(v)
        autoCoinsToggle = v
        task.spawn(function()
            while autoCoinsToggle do
                task.wait(0.4)
                pcall(function()
                    for _, c in Workspace.Map.System:GetDescendants() do
                        if c.Name == "SmileCoin" and c:FindFirstChild("TouchInterest") then
                            local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if hrp then
                                firetouchinterest(hrp, c, 0)
                                task.delay(0.1, function() firetouchinterest(hrp, c, 1) end)
                            end
                        end
                    end
                end)
            end
        end)
    end
})

Tabs.ExploitTab:Section({ Title = "其他" })

Tabs.ExploitTab:Toggle({
    Title = "反黑洞",
    Value = false,
    Callback = function(v)
        antiBlackHoleToggle = v
        task.spawn(function()
            while antiBlackHoleToggle do
                task.wait(0.3)
                if LocalPlayer.Character then
                    for _, b in LocalPlayer.Character:GetDescendants() do
                        if b:IsA("BodyMover") then b:Destroy() end
                    end
                end
            end
        end)
    end
})

Tabs.PlayerTab:Section({ Title = "移动" })

local speedVal = 16
local speedOn = false

task.spawn(function()
    while true do
        task.wait(0.1)
        if speedOn and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = speedVal
        end
    end
end)

Tabs.PlayerTab:Slider({
    Title = "移动速度",
    Value = { Min = 0, Max = 100, Default = 16 },
    Callback = function(v)
        speedVal = v
        speedOn = (v ~= 16)
    end
})

Tabs.PlayerTab:Toggle({
    Title = "无限跳跃",
    Value = false,
    Callback = function(v)
        infJumpToggle = v
    end
})

game:GetService("UserInputService").JumpRequest:Connect(function()
    if infJumpToggle and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character.Humanoid:ChangeState("Jumping")
    end
end)

Tabs.PlayerTab:Toggle({
    Title = "穿墙模式",
    Value = false,
    Callback = function(v)
        noclipToggle = v
    end
})

task.spawn(function()
    while true do
        task.wait(0.1)
        if noclipToggle and LocalPlayer.Character then
            for _, p in LocalPlayer.Character:GetDescendants() do
                if p:IsA("BasePart") then p.CanCollide = false end
            end
        end
    end
end)

Tabs.VisualTab:Section({ Title = "玩家ESP" })

local espObjects = {}

local function getTeamColor(p)
    local ok, color = pcall(function()
        return p.Team and p.Team.TeamColor.Color or Color3.fromRGB(255,255,255)
    end)
    return ok and color or Color3.fromRGB(255,255,255)
end

local function removeESP(p)
    if espObjects[p] then
        pcall(function()
            if espObjects[p].box then espObjects[p].box:Destroy() end
            if espObjects[p].billboard then espObjects[p].billboard:Destroy() end
        end)
        espObjects[p] = nil
    end
end

local function applyESP(p)
    if p == LocalPlayer then return end
    removeESP(p)

    local char = p.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local color = getTeamColor(p)

    local hl = Instance.new("Highlight")
    hl.Adornee = char
    hl.FillColor = color
    hl.OutlineColor = color
    hl.FillTransparency = 0.6
    hl.OutlineTransparency = 0
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    hl.Parent = game.CoreGui

    local billboard = Instance.new("BillboardGui")
    billboard.Adornee = hrp
    billboard.Size = UDim2.new(0, 140, 0, 36)
    billboard.StudsOffset = Vector3.new(0, 3.2, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = game.CoreGui

    local lbl = Instance.new("TextLabel", billboard)
    lbl.Size = UDim2.new(1, 0, 1, 0)
    lbl.BackgroundTransparency = 1
    lbl.TextColor3 = color
    lbl.TextStrokeTransparency = 0
    lbl.TextStrokeColor3 = Color3.new(0,0,0)
    lbl.TextScaled = true
    lbl.Font = Enum.Font.GothamBold
    lbl.Text = p.Name

    espObjects[p] = { box = hl, billboard = billboard }

    task.spawn(function()
        while espObjects[p] and espToggle do
            task.wait(0.15)
            pcall(function()
                local c = getTeamColor(p)
                local teamName = p.Team and p.Team.Name or "无队伍"
                local myHrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                local dist = myHrp and math.floor((myHrp.Position - hrp.Position).Magnitude) or 0

                lbl.Text = p.Name .. "\n" .. teamName .. " [" .. dist .. "m]"
                lbl.TextColor3 = c
                hl.FillColor = c
                hl.OutlineColor = c
            end)
        end
    end)
end

Tabs.VisualTab:Toggle({
    Title = "开启玩家ESP",
    Value = false,
    Callback = function(v)
        espToggle = v
        if v then
            for _, p in Players:GetPlayers() do
                if p ~= LocalPlayer then
                    applyESP(p)
                end
            end
            for _, p in Players:GetPlayers() do
                p.CharacterAdded:Connect(function()
                    task.wait(0.5)
                    if espToggle then
                        applyESP(p)
                    end
                end)
            end
        else
            for p in pairs(espObjects) do
                removeESP(p)
            end
        end
    end
})

Tabs.VisualTab:Section({ Title = "视觉设置" })

Tabs.VisualTab:Slider({
    Title = "视野大小",
    Value = { Min = 70, Max = 120, Default = 70 },
    Callback = function(v)
        Workspace.CurrentCamera.FieldOfView = v
    end
})

Tabs.VisualTab:Button({
    Title = "去除雾气",
    Callback = function()
        local l = game.Lighting
        l.FogStart = math.huge
        l.FogEnd = math.huge
    end
})
end)

Button(Tabjz, "FPE:S", function()
    local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

if game.PlaceId ~= 17164617414 then
    WindUI:Notify({Title = "错误", Content = "请进入FPE:S游戏", Duration = 3})
    return
end

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 420),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5, XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1, XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button
    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end
    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0, XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1, XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5, XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1, XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1, XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    CombatTab = Window:Tab({ Title = "战斗" }),
    MoveTab = Window:Tab({ Title = "移动" }),
    VisTab = Window:Tab({ Title = "视觉" }),
    WorldTab = Window:Tab({ Title = "世界" }),
    RenderTab = Window:Tab({ Title = "渲染" }),
    PerfTab = Window:Tab({ Title = "性能" }),
    BypassTab = Window:Tab({ Title = "绕过" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local Config = {
    Visuals = {
        Master = false,
        Boxes = false,
        Tracers = false,
        Names = true,
        Distance = true,
        HealthTool = true,
        HealthBar = true,
        FillTransparency = 0.5,
        OutlineTransparency = 0,
        Colors = {
            Students = Color3.fromRGB(0, 255, 120),
            Teachers = Color3.fromRGB(255, 50, 50),
            Alice = Color3.fromRGB(255, 0, 255)
        }
    },
    Combat = {
        Aura = { Enabled = false, Range = 25, ReachExtra = 8 },
        AutoBlock = { Enabled = false, Range = 30, Cooldown = 1.0 },
        Hitbox = { Enabled = false, Size = 15, Transparency = 0.7, Part = "HumanoidRootPart" }
    },
    Move = {
        Speed = { Enabled = false, Value = 16, Smoothness = 1 },
        Fly = { Enabled = false, Value = 50 },
        InfJump = false,
        Noclip = false,
        SpinBot = { Enabled = false, Speed = 20 },
        AntiJumpDelay = false
    },
    World = {
        FullBright = false,
        NoFog = false,
        FogDensity = 0.25,
        FOV = 70
    },
    Bypass = {
        AntiRagdoll = false,
        NoSlowdown = false,
        AntiTP = false,
        AntiFallDamage = false,
        NoClipWalls = false
    },
    Performance = {
        FpsBoost = false,
        RemoveParticles = false,
        LowQualityTextures = false
    },
    Rendering = {
        HighGraphics = false,
        LowGraphics = false,
        BloomIntensity = 0,
        DepthOfField = false,
        DepthOfFieldIntensity = 0,
        ColorCorrection = false,
        TintColor = Color3.fromRGB(255, 245, 230),
        Saturation = 0.35,
        Contrast = 0.22,
        BrightnessCC = 0.08,
        GlobalBrightness = 1.2,
        ExposureComp = 0.4
    }
}

local Backup = {
    Ambient = Lighting.Ambient,
    FogEnd = Lighting.FogEnd,
    FogStart = Lighting.FogStart or 0,
    FogColor = Lighting.FogColor or Color3.fromRGB(192, 192, 192),
    Brightness = Lighting.Brightness,
    GlobalShadows = Lighting.GlobalShadows,
    EnvironmentDiffuseScale = Lighting.EnvironmentDiffuseScale,
    EnvironmentSpecularScale = Lighting.EnvironmentSpecularScale,
    ClockTime = Lighting.ClockTime,
    Technology = Lighting.Technology,
    ExposureCompensation = Lighting.ExposureCompensation or 0
}

local function EnsureEffect(name, class)
    local effect = Lighting:FindFirstChild(name)
    if not effect then
        effect = Instance.new(class)
        effect.Name = name
        effect.Parent = Lighting
    end
    return effect
end

local Bloom = EnsureEffect("Bloom", "BloomEffect")
local DepthOfField = EnsureEffect("DepthOfField", "DepthOfFieldEffect")
local ColorCorrection = EnsureEffect("ColorCorrection", "ColorCorrectionEffect")

Tabs.CombatTab:Section({ Title = "战斗功能" })

Tabs.CombatTab:Toggle({
    Title = "屠杀光环",
    Value = false,
    Callback = function(v) Config.Combat.Aura.Enabled = v end
})

Tabs.CombatTab:Slider({
    Title = "光环范围",
    Value = { Min = 5, Max = 50, Default = 25 },
    Callback = function(v) Config.Combat.Aura.Range = v end
})

Tabs.CombatTab:Slider({
    Title = "光环范围额外",
    Value = { Min = 0, Max = 20, Default = 8 },
    Callback = function(v) Config.Combat.Aura.ReachExtra = v end
})

Tabs.CombatTab:Toggle({
    Title = "自动格挡 (按J开关)",
    Value = false,
    Callback = function(v) Config.Combat.AutoBlock.Enabled = v end
})

Tabs.CombatTab:Section({ Title = "碰撞箱拓展器" })

Tabs.CombatTab:Toggle({
    Title = "扩展碰撞箱",
    Value = false,
    Callback = function(v) Config.Combat.Hitbox.Enabled = v end
})

Tabs.CombatTab:Slider({
    Title = "碰撞箱范围",
    Value = { Min = 2, Max = 60, Default = 15 },
    Callback = function(v) Config.Combat.Hitbox.Size = v end
})

Tabs.MoveTab:Section({ Title = "速度和运动" })

Tabs.MoveTab:Toggle({
    Title = "速度 (合法)",
    Value = false,
    Callback = function(v) Config.Move.Speed.Enabled = v end
})

Tabs.MoveTab:Slider({
    Title = "速度值",
    Value = { Min = 16, Max = 250, Default = 16 },
    Callback = function(v) Config.Move.Speed.Value = v end
})

Tabs.MoveTab:Slider({
    Title = "平滑度",
    Value = { Min = 1, Max = 100, Default = 1 },
    Callback = function(v) Config.Move.Speed.Smoothness = v end
})

Tabs.MoveTab:Toggle({
    Title = "飞行",
    Value = false,
    Callback = function(v) Config.Move.Fly.Enabled = v end
})

Tabs.MoveTab:Toggle({
    Title = "穿墙",
    Value = false,
    Callback = function(v)
        Config.Move.Noclip = v
        if not v then Config.Move.NoclipWasEnabled = true else Config.Move.NoclipWasEnabled = false end
    end
})

Tabs.MoveTab:Section({ Title = "额外" })

Tabs.MoveTab:Toggle({
    Title = "无限跳",
    Value = false,
    Callback = function(v) Config.Move.InfJump = v end
})

Tabs.MoveTab:Toggle({
    Title = "旋转机器人",
    Value = false,
    Callback = function(v) Config.Move.SpinBot.Enabled = v end
})

Tabs.MoveTab:Slider({
    Title = "旋转速度",
    Value = { Min = 10, Max = 100, Default = 20 },
    Callback = function(v) Config.Move.SpinBot.Speed = v end
})

Tabs.VisTab:Section({ Title = "透视控制" })

Tabs.VisTab:Toggle({
    Title = "主开关",
    Value = false,
    Callback = function(v) Config.Visuals.Master = v end
})

Tabs.VisTab:Toggle({
    Title = "画框",
    Value = false,
    Callback = function(v) Config.Visuals.Boxes = v end
})

Tabs.VisTab:Toggle({
    Title = "跟踪者",
    Value = false,
    Callback = function(v) Config.Visuals.Tracers = v end
})

Tabs.VisTab:Section({ Title = "透视信息" })

Tabs.VisTab:Toggle({
    Title = "查看血量 & 工具",
    Value = true,
    Callback = function(v) Config.Visuals.HealthTool = v end
})

Tabs.VisTab:Toggle({
    Title = "查看血量条",
    Value = true,
    Callback = function(v) Config.Visuals.HealthBar = v end
})

Tabs.VisTab:Section({ Title = "透明度设置" })

Tabs.VisTab:Slider({
    Title = "填充透明度 %",
    Value = { Min = 0, Max = 100, Default = 50 },
    Callback = function(v) Config.Visuals.FillTransparency = v / 100 end
})

Tabs.VisTab:Slider({
    Title = "轮廓透明度 %",
    Value = { Min = 0, Max = 100, Default = 0 },
    Callback = function(v) Config.Visuals.OutlineTransparency = v / 100 end
})

Tabs.WorldTab:Section({ Title = "视觉修改" })

Tabs.WorldTab:Toggle({
    Title = "高亮",
    Value = false,
    Callback = function(v)
        Config.World.FullBright = v
        if not v then
            Lighting.Ambient = Backup.Ambient
            Lighting.Brightness = Backup.Brightness
        end
    end
})

Tabs.WorldTab:Toggle({
    Title = "无雾",
    Value = false,
    Callback = function(v)
        Config.World.NoFog = v
        if v then
            Lighting.FogEnd = 999999
            Lighting.FogStart = 0
            Lighting.FogColor = Color3.fromRGB(255, 255, 255)
        else
            Lighting.FogEnd = Backup.FogEnd
            Lighting.FogStart = Backup.FogStart
            Lighting.FogColor = Backup.FogColor
        end
    end
})

Tabs.RenderTab:Section({ Title = "图形质量" })

Tabs.RenderTab:Toggle({
    Title = "高画质模式",
    Value = false,
    Callback = function(v)
        Config.Rendering.HighGraphics = v
        if v then
            Lighting.Technology = Enum.Technology.Future
            Lighting.GlobalShadows = true
            Lighting.ShadowSoftness = 0.55
            Lighting.EnvironmentDiffuseScale = 0.95
            Lighting.EnvironmentSpecularScale = 1.1
            Lighting.Brightness = 1.4
            Lighting.ExposureCompensation = 0.5
        else
            Lighting.Technology = Backup.Technology
            Lighting.GlobalShadows = Backup.GlobalShadows
            Lighting.ShadowSoftness = 0
            Lighting.EnvironmentDiffuseScale = Backup.EnvironmentDiffuseScale
            Lighting.EnvironmentSpecularScale = Backup.EnvironmentSpecularScale
            Lighting.Brightness = Backup.Brightness
            Lighting.ExposureCompensation = Backup.ExposureCompensation
        end
    end
})

Tabs.RenderTab:Toggle({
    Title = "低画质模式",
    Value = false,
    Callback = function(v)
        Config.Rendering.LowGraphics = v
        if v then
            Lighting.GlobalShadows = false
            Lighting.EnvironmentDiffuseScale = 0.1
            Lighting.EnvironmentSpecularScale = 0.1
            Lighting.ShadowSoftness = 0
            Lighting.Brightness = 1
            Lighting.ExposureCompensation = 0
        else
            Lighting.GlobalShadows = Backup.GlobalShadows
            Lighting.EnvironmentDiffuseScale = Backup.EnvironmentDiffuseScale
            Lighting.EnvironmentSpecularScale = Backup.EnvironmentSpecularScale
            Lighting.Brightness = Backup.Brightness
            Lighting.ExposureCompensation = Backup.ExposureCompensation
        end
    end
})

Tabs.RenderTab:Section({ Title = "灯光效果" })

Tabs.RenderTab:Slider({
    Title = "Bloom强度",
    Value = { Min = 0, Max = 50, Default = 0 },
    Callback = function(v)
        Bloom.Enabled = v > 1
        Bloom.Intensity = v * 0.085
        Bloom.Size = math.clamp(v * 1.9, 8, 70)
        Bloom.Threshold = math.clamp(0.92 - (v / 130), 0.35, 0.95)
    end
})

Tabs.RenderTab:Toggle({
    Title = "景深",
    Value = false,
    Callback = function(v) DepthOfField.Enabled = v end
})

Tabs.RenderTab:Slider({
    Title = "景深强度",
    Value = { Min = 0, Max = 100, Default = 0 },
    Callback = function(v)
        if v > 0 then
            DepthOfField.FocusDistance = 4 + (v / 10)
            DepthOfField.InFocusRadius = 8 + (v * 0.85)
            DepthOfField.FarIntensity = v / 3.8
            DepthOfField.NearIntensity = v / 15
        else
            DepthOfField.FarIntensity = 0
            DepthOfField.NearIntensity = 0
        end
    end
})

Tabs.RenderTab:Section({ Title = "色彩校正" })

Tabs.RenderTab:Toggle({
    Title = "色彩校正",
    Value = false,
    Callback = function(v)
        Config.Rendering.ColorCorrection = v
        ColorCorrection.Enabled = v
        if v then
            ColorCorrection.TintColor = Config.Rendering.TintColor
            ColorCorrection.Saturation = Config.Rendering.Saturation
            ColorCorrection.Contrast = Config.Rendering.Contrast
            ColorCorrection.Brightness = Config.Rendering.BrightnessCC
            Lighting.ExposureCompensation = Config.Rendering.ExposureComp
        else
            ColorCorrection.TintColor = Color3.fromRGB(255, 255, 255)
            ColorCorrection.Saturation = 0
            ColorCorrection.Contrast = 0
            ColorCorrection.Brightness = 0
            Lighting.ExposureCompensation = 0
        end
    end
})

Tabs.RenderTab:Colorpicker({
    Title = "色调颜色",
    Callback = function(v)
        Config.Rendering.TintColor = v
        if ColorCorrection.Enabled then ColorCorrection.TintColor = v end
    end
})

Tabs.RenderTab:Slider({
    Title = "饱和度",
    Value = { Min = -1, Max = 2, Default = 0.35 },
    Callback = function(v)
        Config.Rendering.Saturation = v
        if ColorCorrection.Enabled then ColorCorrection.Saturation = v end
    end
})

Tabs.RenderTab:Slider({
    Title = "对比度",
    Value = { Min = -0.8, Max = 1.5, Default = 0.22 },
    Callback = function(v)
        Config.Rendering.Contrast = v
        if ColorCorrection.Enabled then ColorCorrection.Contrast = v end
    end
})

Tabs.RenderTab:Slider({
    Title = "亮度 (CC)",
    Value = { Min = -0.5, Max = 1, Default = 0.08 },
    Callback = function(v)
        Config.Rendering.BrightnessCC = v
        if ColorCorrection.Enabled then ColorCorrection.Brightness = v end
    end
})

Tabs.RenderTab:Slider({
    Title = "曝光补偿",
    Value = { Min = -2, Max = 3, Default = 0.4 },
    Callback = function(v)
        Config.Rendering.ExposureComp = v
        Lighting.ExposureCompensation = v
    end
})

Tabs.RenderTab:Slider({
    Title = "全局亮度",
    Value = { Min = 0.3, Max = 3.5, Default = 1.2 },
    Callback = function(v)
        Config.Rendering.GlobalBrightness = v
        Lighting.Brightness = v
    end
})

Tabs.PerfTab:Section({ Title = "性能" })

Tabs.PerfTab:Toggle({
    Title = "FPS提升 (激进)",
    Value = false,
    Callback = function(v) Config.Performance.FpsBoost = v end
})

Tabs.PerfTab:Toggle({
    Title = "移除粒子效果",
    Value = false,
    Callback = function(v) Config.Performance.RemoveParticles = v end
})

Tabs.PerfTab:Toggle({
    Title = "低画质图形",
    Value = false,
    Callback = function(v) Config.Performance.LowQualityTextures = v end
})

Tabs.BypassTab:Section({ Title = "绕过功能" })

Tabs.BypassTab:Toggle({
    Title = "反布娃娃",
    Value = false,
    Callback = function(v) Config.Bypass.AntiRagdoll = v end
})

Tabs.BypassTab:Toggle({
    Title = "无缓冲",
    Value = false,
    Callback = function(v) Config.Bypass.NoSlowdown = v end
})

Tabs.BypassTab:Toggle({
    Title = "反传送 / 击退",
    Value = false,
    Callback = function(v) Config.Bypass.AntiTP = v end
})

Tabs.BypassTab:Toggle({
    Title = "无摔落伤害",
    Value = false,
    Callback = function(v) Config.Bypass.AntiFallDamage = v end
})

Tabs.BypassTab:Toggle({
    Title = "穿墙 (有风险)",
    Value = false,
    Callback = function(v) Config.Bypass.NoClipWalls = v end
})

local ESPConnections = {}
local TracerLines = {}

local function SetupESP(player)
    if ESPConnections[player] then ESPConnections[player]:Disconnect() end

    local box = Drawing.new("Square")
    local boxOutline = Drawing.new("Square")
    local tracer = Drawing.new("Line")
    tracer.Thickness = 1.5
    tracer.Transparency = 1

    local connection = RunService.RenderStepped:Connect(function()
        if not player or not player.Parent then
            box:Remove()
            boxOutline:Remove()
            tracer:Remove()
            if ESPConnections[player] then ESPConnections[player]:Disconnect() end
            return
        end

        local char = player.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") or not Config.Visuals.Master or player == LocalPlayer then
            box.Visible = false
            boxOutline.Visible = false
            tracer.Visible = false
            if char then
                local hl = char:FindFirstChild("UltHL")
                local bb = char:FindFirstChild("UltBB")
                if hl then hl.Enabled = false end
                if bb then bb.Enabled = false end
            end
            return
        end

        local root = char:FindFirstChild("HumanoidRootPart")
        local pos, onScreen = Camera:WorldToViewportPoint(root.Position + Vector3.new(0, 3.5, 0))

        local color = Config.Visuals.Colors.Students
        if player.Team then
            if player.Team.Name == "Alice" then
                color = Config.Visuals.Colors.Alice
            elseif string.find(string.lower(player.Team.Name), "teach") then
                color = Config.Visuals.Colors.Teachers
            end
        end

        local hl = char:FindFirstChild("UltHL") or Instance.new("Highlight", char)
        hl.Name = "UltHL"
        hl.Enabled = true
        hl.FillColor = color
        hl.FillTransparency = Config.Visuals.FillTransparency
        hl.OutlineTransparency = Config.Visuals.OutlineTransparency

        local bb = char:FindFirstChild("UltBB") or Instance.new("BillboardGui", char)
        bb.Name = "UltBB"
        bb.AlwaysOnTop = true
        bb.Enabled = onScreen and Config.Visuals.Master
        bb.Size = UDim2.new(0, 120, 0, 50)
        bb.StudsOffset = Vector3.new(0, 4.5, 0)

        local lbl = bb:FindFirstChild("L") or Instance.new("TextLabel", bb)
        lbl.Name = "L"
        lbl.BackgroundTransparency = 1
        lbl.Size = UDim2.new(1, 0, 0.55, 0)
        lbl.Position = UDim2.new(0, 0, 0, 0)
        lbl.TextColor3 = color        lbl.TextSize = 11
        lbl.Font = Enum.Font.GothamBold
        lbl.TextXAlignment = Enum.TextXAlignment.Center

        local distance = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and (LocalPlayer.Character.HumanoidRootPart.Position - root.Position).Magnitude or 0
        local text = player.Name .. " [" .. math.floor(distance) .. "m]"
        if Config.Visuals.HealthTool and char:FindFirstChild("Humanoid") then
            local h = char:FindFirstChild("Humanoid")
            text = text .. "\nHP: " .. math.floor(h.Health) .. "/" .. h.MaxHealth
            if char:FindFirstChildOfClass("Tool") then
                text = text .. "\n" .. char:FindFirstChildOfClass("Tool").Name
            end
        end
        lbl.Text = text

        if Config.Visuals.HealthBar and char:FindFirstChild("Humanoid") and onScreen then
            local h = char:FindFirstChild("Humanoid")
            local healthPct = math.clamp(h.Health / h.MaxHealth, 0, 1)
            local bar = bb:FindFirstChild("HealthBar") or Instance.new("Frame", bb)
            bar.Name = "HealthBar"
            bar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            bar.Size = UDim2.new(0.7, 0, 0.07, 0)
            bar.Position = UDim2.new(0.15, 0, 0.6, 0)
            bar.BorderSizePixel = 0
            bar.Visible = true

            local fill = bar:FindFirstChild("Fill") or Instance.new("Frame", bar)
            fill.Name = "Fill"
            fill.BackgroundColor3 = Color3.fromHSV(healthPct * 0.3, 0.9, 1)
            fill.Size = UDim2.new(healthPct, 0, 1, 0)
            fill.BorderSizePixel = 0
        elseif bb:FindFirstChild("HealthBar") then
            bb.HealthBar.Visible = false
        end

        if onScreen and Config.Visuals.Boxes then
            local sx, sy = 2000 / pos.Z, 2500 / pos.Z
            boxOutline.Visible = true
            boxOutline.Color = Color3.fromRGB(0, 0, 0)
            boxOutline.Thickness = 3
            boxOutline.Transparency = 1 - Config.Visuals.OutlineTransparency
            boxOutline.Size = Vector2.new(sx, sy)
            boxOutline.Position = Vector2.new(pos.X - sx / 2, pos.Y - sy / 2)

            box.Visible = true
            box.Color = color
            box.Size = boxOutline.Size
            box.Position = boxOutline.Position
        else
            box.Visible = false
            boxOutline.Visible = false
        end

        if Config.Visuals.Tracers and onScreen then
            tracer.Visible = true
            tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
            tracer.To = Vector2.new(pos.X, pos.Y)
            tracer.Color = color
        else
            tracer.Visible = false
        end
    end)

    ESPConnections[player] = connection
    TracerLines[player] = tracer
end

local charConnection

local function OnCharacterAdded(char)
    if charConnection then charConnection:Disconnect() end

    local hum = char:WaitForChild("Humanoid", 5)
    local root = char:WaitForChild("HumanoidRootPart", 5)
    if not hum or not root then return end

    charConnection = hum.Jumping:Connect(function()
        if Config.Move.InfJump then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)

    if Config.Move.AntiJumpDelay then
        hum.JumpPower = 50
    end
end

LocalPlayer.CharacterAdded:Connect(OnCharacterAdded)
if LocalPlayer.Character then OnCharacterAdded(LocalPlayer.Character) end

local LastBlockTimestamp = 0
local TeachersFolder = workspace:FindFirstChild("Teachers")

local LastSafeCFrame = nil
local LastSafeTime = tick()

local function checkSoundPlaying(sound)
    if not sound or not sound:IsA("Sound") then return false end
    if sound.IsLoaded then
        return (sound.Playing or (sound.TimePosition > 0 and sound.TimePosition < sound.TimeLength)) and sound.PlaybackSpeed > 0
    end
    return sound.Playing
end

RunService.Heartbeat:Connect(function(dt)
    pcall(function()
        local char = LocalPlayer.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end

        local hum = char:FindFirstChild("Humanoid")
        local root = char:FindFirstChild("HumanoidRootPart")
        if not hum or not root then return end

        local myTool = char:FindFirstChildOfClass("Tool")

        if Config.Move.Speed.Enabled and hum.MoveDirection.Magnitude > 0 then
            local addedSpeed = (Config.Move.Speed.Value - 16) * ((Config.Move.Speed.Smoothness - 1) / 100)
            root.CFrame = root.CFrame + (hum.MoveDirection * addedSpeed * dt * 8)
        end

        if Config.Move.Fly.Enabled then
            local flyDir = hum.MoveDirection.Magnitude > 0 and hum.MoveDirection or Vector3.new(0, 0, 0)
            root.CFrame = root.CFrame + (flyDir * Config.Move.Fly.Value * 0.5 * dt)
        end

        if Config.Move.SpinBot.Enabled then
            root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(Config.Move.SpinBot.Speed), 0)
        end

        if Config.Move.Noclip then
            for _, v in pairs(char:GetDescendants()) do
                if v:IsA("BasePart") and v.Parent then
                    pcall(function() v.CanCollide = false end)
                end
            end
        end

        if Config.World.FullBright then
            Lighting.Ambient = Color3.fromRGB(255, 255, 255)
            Lighting.Brightness = 2
        end

        if Config.World.NoFog then
            Lighting.FogEnd = 1e5
            Lighting.FogStart = 0
            Lighting.FogColor = Color3.fromRGB(255, 255, 255)
        end

        if Config.Bypass.NoSlowdown and hum.WalkSpeed < 16 then hum.WalkSpeed = 16 end
        if Config.Bypass.AntiRagdoll then
            if hum:FindFirstChild("Ragdolled") then hum.Ragdolled:Destroy() end
            hum.PlatformStand = false
        end

        if Config.Bypass.AntiTP then
            if tick() - LastSafeTime > 2 then
                LastSafeCFrame = root.CFrame
                LastSafeTime = tick()
            end
            if (root.Position - LastSafeCFrame.Position).Magnitude > 50 then
                root.CFrame = LastSafeCFrame
            end
        end

        for _, o in pairs(Players:GetPlayers()) do
            if o ~= LocalPlayer and o.Character and o.Character:FindFirstChild("HumanoidRootPart") then
                local eRoot = o.Character:FindFirstChild("HumanoidRootPart")
                if not eRoot then continue end
                local eHum = o.Character:FindFirstChild("Humanoid")
                local dist = (root.Position - eRoot.Position).Magnitude

                local isEnemy = true

                if Config.Combat.Hitbox.Enabled and isEnemy then
                    if eRoot.Size.X ~= Config.Combat.Hitbox.Size then
                        eRoot.Size = Vector3.new(Config.Combat.Hitbox.Size, Config.Combat.Hitbox.Size, Config.Combat.Hitbox.Size)
                        eRoot.Transparency = Config.Combat.Hitbox.Transparency
                        eRoot.CanCollide = false
                    end
                else
                    if eRoot.Size.X > 2 then
                        eRoot.Size = Vector3.new(2, 2, 1)
                        eRoot.Transparency = 1
                        eRoot.CanCollide = true
                    end
                end

                if Config.Combat.Aura.Enabled and isEnemy and dist <= (Config.Combat.Aura.Range + Config.Combat.Aura.ReachExtra) and myTool and myTool:FindFirstChild("Handle") then
                    local handle = myTool.Handle
                    local predictPos = eRoot.Position + (eHum and eHum.MoveDirection or Vector3.new(0, 0, 0)) * dist * 0.12

                    firetouchinterest(eRoot, handle, 0)
                    firetouchinterest(eRoot, handle, 1)
                    myTool:Activate()
                    myTool:Activate()

                    local originalCFrame = handle.CFrame
                    handle.CFrame = CFrame.new((root.Position + predictPos) / 2) * originalCFrame.Rotation
                    task.spawn(function()
                        task.wait(0.01)
                        if handle and handle.Parent then handle.CFrame = originalCFrame end
                    end)
                end
            end
        end

        if Config.Combat.AutoBlock.Enabled and TeachersFolder and tick() - LastBlockTimestamp >= Config.Combat.AutoBlock.Cooldown then
            local myPos = root.Position
            for _, teacher in pairs(TeachersFolder:GetChildren()) do
                if teacher:IsA("Model") and teacher:FindFirstChild("HumanoidRootPart") then
                    local tRoot = teacher:FindFirstChild("HumanoidRootPart")
                    local dist = (tRoot.Position - myPos).Magnitude
                    if dist <= Config.Combat.AutoBlock.Range then
                        for _, snd in pairs(teacher:GetDescendants()) do
                            if snd:IsA("Sound") and (snd.Name == "SwingSFX" or string.find(snd.Name:lower(), "swing") or string.find(snd.Name:lower(), "attack") or string.find(snd.Name:lower(), "slash")) and checkSoundPlaying(snd) then
                                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Q, false, game)
                                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
                                LastBlockTimestamp = tick()
                                break
                            end
                        end
                    end
                end
            end
        end
    end)
end)

UIS.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.J then
        Config.Combat.AutoBlock.Enabled = not Config.Combat.AutoBlock.Enabled
    end
end)

for _, p in pairs(Players:GetPlayers()) do SetupESP(p) end

Players.PlayerAdded:Connect(SetupESP)
Players.PlayerRemoving:Connect(function(p)
    if ESPConnections[p] then ESPConnections[p]:Disconnect() end
    if TracerLines[p] then TracerLines[p]:Remove() end
end)
end)

Button(Tabjz, "EVADE", function()
    local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 420),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5, XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1, XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button
    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end
    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0, XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1, XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5, XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1, XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1, XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    MoveTab = Window:Tab({ Title = "移动" }),
    VisualTab = Window:Tab({ Title = "视觉" }),
    OptTab = Window:Tab({ Title = "优化" }),
    AboutTab = Window:Tab({ Title = "关于" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")
local UIS = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local lp = Players.LocalPlayer

local vu = game:GetService("VirtualUser")
lp.Idled:Connect(function()
    pcall(function()
        vu:CaptureController()
        vu:ClickButton2(Vector2.new())
    end)
end)

local Speed = false
local Power = 50
local JumpEnabled = false
local JumpPower = 50
local OriginalJumpPower = 50
local ESP = false
local Safe = false
local AutoRevive = false
local AutoFollow = true
local LastPos = nil
local Plate = nil
local safeZoneToggle = nil
local flyToggle = nil
local autoReviveToggle = nil
local autoFollowToggle = nil
local ignoreTeleport = false
local ignoreTeleportTimer = nil
local IsRevivingNow = false
local IsFollowing = false
local followBodyPos = nil
local followBodyGyro = nil
local followConnection = nil
local followNoclipConn = nil
local SkyEnabled = false
local REVIVE_HEIGHT = -4.2
local HOLD_DURATION = 3.35
local REVIVE_INTERVAL = 0.08
local RAGDOLL_DELAY = 1.9

local ReviveBlacklist = {}
local ReviveBlacklistTime = {}

local speedCurrent = 0
local speedAcceleration = 7
local speedBrakeForce = 8

local Original = {
    Brightness = Lighting.Brightness,
    FogStart = Lighting.FogStart,
    FogEnd = Lighting.FogEnd,
    GlobalShadows = Lighting.GlobalShadows,
    Quality = settings().Rendering.QualityLevel
}
local EffectsBackup = {}

local function SaveGraphics()
    Original.Brightness = Lighting.Brightness
    Original.FogStart = Lighting.FogStart
    Original.FogEnd = Lighting.FogEnd
    Original.GlobalShadows = Lighting.GlobalShadows
    Original.Quality = settings().Rendering.QualityLevel
    table.clear(EffectsBackup)
    for _, v in ipairs(Lighting:GetDescendants()) do
        if v:IsA("PostEffect") then
            EffectsBackup[v] = v.Enabled
        end
    end
end

local function FPSBooster(state)
    if state then
        SaveGraphics()
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 999999
        Lighting.Brightness = 2
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        end)
        for effect, _ in pairs(EffectsBackup) do
            if effect and effect.Parent then
                effect.Enabled = false
            end
        end
    else
        Lighting.GlobalShadows = Original.GlobalShadows
        Lighting.FogEnd = Original.FogEnd
        Lighting.Brightness = Original.Brightness
        pcall(function()
            settings().Rendering.QualityLevel = Original.Quality
        end)
        for effect, value in pairs(EffectsBackup) do
            if effect and effect.Parent then
                effect.Enabled = value
            end
        end
    end
end

local function DisableFog(state)
    if state then
        Lighting.FogStart = 999999
        Lighting.FogEnd = 999999
    else
        Lighting.FogStart = Original.FogStart
        Lighting.FogEnd = Original.FogEnd
    end
end

local function ResetCamera()
    local camera = Workspace.CurrentCamera
    local char = lp.Character
    if camera and char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            camera.CameraType = Enum.CameraType.Custom
            camera.CameraSubject = hum
        end
    end
end

lp.CharacterAdded:Connect(function(character)
    task.wait(0.2)
    local hum = character:WaitForChild("Humanoid", 5)
    local camera = Workspace.CurrentCamera
    if camera and hum then
        camera.CameraType = Enum.CameraType.Custom
        camera.CameraSubject = hum
    end
    IsRevivingNow = false
    IsFollowing = false
    table.clear(ReviveBlacklist)
    table.clear(ReviveBlacklistTime)
end)

local flying = false
local flySpeed = 150
local flyMaxSpeed = 150
local flyCurrentSpeed = 0
local flyAcceleration = 7
local flyBrakeForce = 8
local bodyVelocity, bodyGyro
local flyConnection, noclipConnection
local moveVector = Vector3.zero
local W, A, S, D = false, false, false, false
local UP, DOWN, LEFT, RIGHT = false, false, false, false
local isMobile = UIS.TouchEnabled and not UIS.KeyboardEnabled
local joystickFrame, thumb
local dragging, dragInput = false, nil

local flyGui = Instance.new("ScreenGui")
flyGui.Name = "ARKS_FLY"
flyGui.ResetOnSpawn = false
flyGui.Parent = lp:WaitForChild("PlayerGui")

joystickFrame = Instance.new("Frame")
joystickFrame.Size = UDim2.new(0, 170, 0, 170)
joystickFrame.Position = UDim2.new(0.08, 0, 0.42, 0)
joystickFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
joystickFrame.BackgroundTransparency = 0.90
joystickFrame.Visible = false
joystickFrame.Parent = flyGui
Instance.new("UICorner", joystickFrame).CornerRadius = UDim.new(1, 0)

thumb = Instance.new("Frame")
thumb.Size = UDim2.new(0, 55, 0, 55)
thumb.Position = UDim2.new(0.5, -27, 0.5, -27)
thumb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
thumb.BackgroundTransparency = 0.60
thumb.Parent = joystickFrame
Instance.new("UICorner", thumb).CornerRadius = UDim.new(1, 0)

UIS.InputBegan:Connect(function(input, gp)
    if gp then return end
    local key = input.KeyCode
    if key == Enum.KeyCode.W or key == Enum.KeyCode.Z then W = true
    elseif key == Enum.KeyCode.S then S = true
    elseif key == Enum.KeyCode.A or key == Enum.KeyCode.Q then A = true
    elseif key == Enum.KeyCode.D then D = true
    elseif key == Enum.KeyCode.Up then UP = true
    elseif key == Enum.KeyCode.Down then DOWN = true
    elseif key == Enum.KeyCode.Left then LEFT = true
    elseif key == Enum.KeyCode.Right then RIGHT = true
    end
end)

UIS.InputEnded:Connect(function(input)
    local key = input.KeyCode
    if key == Enum.KeyCode.W or key == Enum.KeyCode.Z then W = false
    elseif key == Enum.KeyCode.S then S = false
    elseif key == Enum.KeyCode.A or key == Enum.KeyCode.Q then A = false
    elseif key == Enum.KeyCode.D then D = false
    elseif key == Enum.KeyCode.Up then UP = false
    elseif key == Enum.KeyCode.Down then DOWN = false
    elseif key == Enum.KeyCode.Left then LEFT = false
    elseif key == Enum.KeyCode.Right then RIGHT = false
    end
end)

joystickFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        local center = joystickFrame.AbsolutePosition + joystickFrame.AbsoluteSize / 2
        local delta = Vector2.new(input.Position.X - center.X, input.Position.Y - center.Y)
        local radius = joystickFrame.AbsoluteSize.X / 2
        local distance = math.min(delta.Magnitude, radius)
        local direction = delta.Magnitude > 0 and delta.Unit or Vector2.zero
        thumb.Position = UDim2.new(0.5, direction.X * distance - 27, 0.5, direction.Y * distance - 27)
        moveVector = Vector3.new(direction.X, 0, -direction.Y)
    end
end)

UIS.InputEnded:Connect(function(input)
    if input == dragInput then
        dragging = false
        dragInput = nil
        thumb.Position = UDim2.new(0.5, -27, 0.5, -27)
        moveVector = Vector3.zero
    end
end)

local function startFly()
    local char = lp.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not root or not hum then return end

    if isMobile then joystickFrame.Visible = true end

    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bodyVelocity.P = 50000
    bodyVelocity.Velocity = Vector3.zero
    bodyVelocity.Parent = root

    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    bodyGyro.P = 50000
    bodyGyro.D = 1000
    bodyGyro.CFrame = root.CFrame
    bodyGyro.Parent = root

    hum.PlatformStand = true

    noclipConnection = RunService.Stepped:Connect(function()
        if not flying then return end
        local charNow = lp.Character
        if not charNow then return end
        for _, v in pairs(charNow:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end)

    flyCurrentSpeed = 0
    flyMaxSpeed = flySpeed

    flyConnection = RunService.RenderStepped:Connect(function()
        if not flying or not bodyVelocity then return end
        local camCF = Workspace.CurrentCamera.CFrame
        local forward = camCF.LookVector
        local right = camCF.RightVector
        local finalMove = Vector3.zero

        if isMobile and moveVector.Magnitude > 0 then
            finalMove = (right * moveVector.X) + (forward * moveVector.Z)
        else
            if W or UP then finalMove = finalMove + forward end
            if S or DOWN then finalMove = finalMove - forward end
            if A or LEFT then finalMove = finalMove - right end
            if D or RIGHT then finalMove = finalMove + right end
        end

        if finalMove.Magnitude > 0 then
            finalMove = finalMove.Unit
            flyCurrentSpeed = math.min(flyCurrentSpeed + flyAcceleration, flyMaxSpeed)
            bodyVelocity.Velocity = finalMove * flyCurrentSpeed
            bodyGyro.CFrame = CFrame.lookAt(bodyVelocity.Parent.Position, bodyVelocity.Parent.Position + finalMove)
        else
            flyCurrentSpeed = math.max(0, flyCurrentSpeed - flyBrakeForce)
            if flyCurrentSpeed > 0 then
                bodyVelocity.Velocity = bodyGyro.CFrame.LookVector * flyCurrentSpeed
            else
                bodyVelocity.Velocity = Vector3.zero
            end
        end
    end)
end

local function stopFly()
    if noclipConnection then
        noclipConnection:Disconnect()
        noclipConnection = nil
    end
    if flyConnection then
        flyConnection:Disconnect()
        flyConnection = nil
    end
    if isMobile and joystickFrame then
        joystickFrame.Visible = false
    end
    flyCurrentSpeed = 0
    if bodyVelocity then
        bodyVelocity:Destroy()
        bodyVelocity = nil
    end
    if bodyGyro then
        bodyGyro:Destroy()
        bodyGyro = nil
    end

    local char = lp.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.PlatformStand = false
        end
        for _, v in pairs(char:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = true
            end
        end
    end
end

local function DisableSafeZone()
    if Plate then
        Plate:Destroy()
        Plate = nil
    end
    local char = lp.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if LastPos and root then
        root.CFrame = LastPos
        LastPos = nil
    end
end

local function EnableSafeZone()
    if IsRevivingNow or IsFollowing then return end
    local char = lp.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    if not LastPos and root.Position.Y > -500 then
        LastPos = root.CFrame
    end
    if not Plate or not Plate.Parent then
        Plate = Instance.new("Part")
        Plate.Name = "ARKS_PLATE"
        Plate.Size = Vector3.new(500, 1, 500)
        Plate.Anchored = true
        Plate.Transparency = 0.3
        Plate.BrickColor = BrickColor.new("Bright blue")
        Plate.CanCollide = true
        Plate.Parent = Workspace
    end
    Plate.Position = Vector3.new(root.Position.X, -800, root.Position.Z)
    root.CFrame = Plate.CFrame + Vector3.new(0, 3, 0)
end

local function GoToSafeZone()
    if Plate and Plate.Parent then
        local char = lp.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if root then
            root.CFrame = Plate.CFrame + Vector3.new(0, 3, 0)
        end
    end
end

local function ignoreTeleportFor(milliseconds)
    ignoreTeleport = true
    if ignoreTeleportTimer then
        task.cancel(ignoreTeleportTimer)
    end
    ignoreTeleportTimer = task.delay(milliseconds / 1000, function()
        ignoreTeleport = false
        ignoreTeleportTimer = nil
    end)
end

local function IsNextbotNear(position, radius)
    radius = radius or 40
    for _, v in ipairs(Workspace:GetChildren()) do
        if v:IsA("Model") and v ~= lp.Character then
            local isNextbot = v:GetAttribute("Type") == "Nextbot" or (v:FindFirstChild("Humanoid") and (v:FindFirstChild("Root") or v:FindFirstChild("HumanoidRootPart")) and not Players:GetPlayerFromCharacter(v))
            if isNextbot then
                local part = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Root") or v.PrimaryPart
                if part and (part.Position - position).Magnitude <= radius then
                    return true
                end
            end
        end
    end
    return false
end

local function IsPlayerBeingCarried(player)
    if not player or not player.Character then return false end
    local char = player.Character
    if char:GetAttribute("Carried") or char:FindFirstChild("Carried") then return true end
    return false
end

local function IsPlayerDowned(player)
    if not player or not player.Parent then return false end
    if player == lp then return false end
    
    local char = player.Character
    if not char or not char.Parent then return false end
    
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root or root.Position.Y < -500 then return false end
    
    if IsPlayerBeingCarried(player) then return false end
    
    if char:GetAttribute("Downed") or char:FindFirstChild("Downed") then return true end
    
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum and hum.MaxHealth > 0 then
        if hum.Health <= 0 or (hum.Health / hum.MaxHealth) <= 0.05 then return true end
    end
    
    for _, child in ipairs(char:GetDescendants()) do
        if child:IsA("ProximityPrompt") then
            local text = child.ActionText:lower()
            if text:find("revive") or text:find("réanimer") or text:find("reanimer") then
                return true
            end
        end
    end
    
    return false
end

local function GetClosestAliveTeammate()
    local myChar = lp.Character
    if not myChar then return nil end

    local myRoot = myChar:FindFirstChild("HumanoidRootPart")
    if not myRoot then return nil end

    local closest = nil
    local closestDist = math.huge

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= lp and plr.Parent then
            local char = plr.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            local root = char and char:FindFirstChild("HumanoidRootPart")

            if hum and root and hum.Health > 0 and not char:GetAttribute("Downed") and root.Parent then
                local dist = (root.Position - myRoot.Position).Magnitude
                if dist < closestDist then
                    closestDist = dist
                    closest = root
                end
            end
        end
    end

    return closest
end

local DownedCache = {}
local DownedCacheTime = {}

task.spawn(function()
    while true do
        task.wait(0.08)
        pcall(function()
            if not AutoRevive then
                table.clear(DownedCache)
                table.clear(DownedCacheTime)
                return
            end
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= lp then
                    if not plr or not plr.Parent or not plr.Character or not plr.Character.Parent then
                        DownedCache[plr] = nil
                        DownedCacheTime[plr] = nil
                        continue
                    end
                    
                    local downed = IsPlayerDowned(plr)
                    if downed then
                        if not DownedCacheTime[plr] then
                            DownedCacheTime[plr] = tick()
                        end
                        
                        if (tick() - DownedCacheTime[plr]) >= RAGDOLL_DELAY then
                            DownedCache[plr] = true
                        else
                            DownedCache[plr] = nil
                        end
                    else
                        DownedCache[plr] = nil
                        DownedCacheTime[plr] = nil
                    end
                end
            end
        end)
    end
end)

local function GetDownedPlayer()
    local best = nil
    local bestDist = math.huge
    local myChar = lp.Character
    if not myChar then return nil end
    local myRoot = myChar:FindFirstChild("HumanoidRootPart")
    if not myRoot then return nil end
    
    for plr, _ in pairs(DownedCache) do
        if ReviveBlacklist[plr] then continue end
        
        if not plr or not plr.Parent or not plr.Character or not plr.Character.Parent then
            DownedCache[plr] = nil
            DownedCacheTime[plr] = nil
            continue
        end
        
        if not IsPlayerDowned(plr) then
            DownedCache[plr] = nil
            DownedCacheTime[plr] = nil
            continue
        end
        
        local root = plr.Character:FindFirstChild("HumanoidRootPart")
        if root and root.Parent and not IsNextbotNear(root.Position, 35) then
            local dist = (root.Position - myRoot.Position).Magnitude
            if dist < bestDist then
                bestDist = dist
                best = plr
            end
        end
    end
    return best
end

local function StartFollowing()
    if IsFollowing then return end

    local char = lp.Character
    if not char then return end

    local root = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")

    if not root or not hum then return end

    IsFollowing = true
    DisableSafeZone()

    hum.PlatformStand = true
    hum:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
    hum:SetStateEnabled(Enum.HumanoidStateType.Running, false)
    hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)

    for _, v in pairs(char:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CanCollide = false
        end
    end

    followBodyPos = Instance.new("BodyPosition")
    followBodyPos.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    followBodyPos.P = 30000
    followBodyPos.D = 800
    followBodyPos.Parent = root

    followBodyGyro = Instance.new("BodyGyro")
    followBodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    followBodyGyro.P = 30000
    followBodyGyro.Parent = root

    followNoclipConn = RunService.PreSimulation:Connect(function()
        if not IsFollowing then
            if followNoclipConn then
                followNoclipConn:Disconnect()
                followNoclipConn = nil
            end
            return
        end
        local c = lp.Character
        if c then
            for _, v in pairs(c:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end
    end)

    followConnection = RunService.PreSimulation:Connect(function()
        if not IsFollowing or not AutoFollow then
            StopFollowing()
            return
        end

        local target = GetClosestAliveTeammate()

        if not target or not target.Parent then
            StopFollowing()
            return
        end

        followBodyPos.Position = target.Position + Vector3.new(2, 0, 2)
        followBodyGyro.CFrame = target.CFrame

        local charNow = lp.Character
        if charNow then
            for _, v in pairs(charNow:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end
    end)
end

local function StopFollowing()
    IsFollowing = false
    if followConnection then
        followConnection:Disconnect()
        followConnection = nil
    end
    if followNoclipConn then
        followNoclipConn:Disconnect()
        followNoclipConn = nil
    end
    if followBodyPos then
        followBodyPos:Destroy()
        followBodyPos = nil
    end
    if followBodyGyro then
        followBodyGyro:Destroy()
        followBodyGyro = nil
    end

    local char = lp.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.PlatformStand = false
            hum:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
            hum:SetStateEnabled(Enum.HumanoidStateType.Running, true)
            hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
        end
        for _, v in pairs(char:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = true
            end
        end
    end
    EnableSafeZone()
    GoToSafeZone()
end

local function PerformRevive(targetPlayer)
    if not targetPlayer or not targetPlayer.Parent or not targetPlayer.Character then return end
    if IsRevivingNow then return end
    
    IsRevivingNow = true
    DisableSafeZone()
    
    local myChar = lp.Character
    if not myChar then
        IsRevivingNow = false
        return
    end
    local myRoot = myChar:FindFirstChild("HumanoidRootPart")
    local myHum = myChar:FindFirstChildOfClass("Humanoid")
    local targetRoot = targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")
    
    if not myRoot or not myHum or not targetRoot then
        IsRevivingNow = false
        return
    end

    pcall(function()
        myHum:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
        myHum:SetStateEnabled(Enum.HumanoidStateType.Running, false)
        myHum:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
        myHum.PlatformStand = true
    end)

    for _, v in ipairs(myChar:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CanCollide = false
            v.AssemblyLinearVelocity = Vector3.zero
            v.AssemblyAngularVelocity = Vector3.zero
        end
    end

    local targetCF = targetRoot.CFrame
    local offsetY = REVIVE_HEIGHT
    myRoot.CFrame = targetCF * CFrame.new(0, offsetY, 0)
    myRoot.AssemblyLinearVelocity = Vector3.zero
    myRoot.AssemblyAngularVelocity = Vector3.zero

    local bp = Instance.new("BodyPosition")
    bp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bp.P = 250000
    bp.D = 5000
    bp.Position = targetRoot.Position + Vector3.new(0, offsetY, 0)
    bp.Parent = myRoot

    local bg = Instance.new("BodyGyro")
    bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    bg.P = 250000
    bg.CFrame = targetCF
    bg.Parent = myRoot

    local lockConn
    lockConn = RunService.PreSimulation:Connect(function()
        if not IsRevivingNow or not targetPlayer.Parent or not targetPlayer.Character or not targetPlayer.Character.Parent then
            if lockConn then
                lockConn:Disconnect()
                lockConn = nil
            end
            return
        end
        local curTargetRoot = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        if curTargetRoot and bp and bg then
            bp.Position = curTargetRoot.Position + Vector3.new(0, offsetY, 0)
            bg.CFrame = curTargetRoot.CFrame
            
            if (myRoot.Position - bp.Position).Magnitude > 0.2 then
                myRoot.CFrame = curTargetRoot.CFrame * CFrame.new(0, offsetY, 0)
            end
            
            myRoot.AssemblyLinearVelocity = Vector3.zero
            myRoot.AssemblyAngularVelocity = Vector3.zero
        end
        
        for _, v in ipairs(myChar:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
                v.AssemblyLinearVelocity = Vector3.zero
            end
        end
    end)

    local reviveStart = tick()
    local stuckCheckStart = tick()
    local lastCheckPos = myRoot.Position

    while tick() - reviveStart < HOLD_DURATION and AutoRevive and IsPlayerDowned(targetPlayer) and IsRevivingNow do
        if not targetPlayer.Parent or not targetPlayer.Character or not targetPlayer.Character.Parent then break end
        if not IsPlayerDowned(targetPlayer) then break end

        if tick() - stuckCheckStart >= 9.5 then
            if (myRoot.Position - lastCheckPos).Magnitude < 2.0 then
                ReviveBlacklist[targetPlayer] = true
                ReviveBlacklistTime[targetPlayer] = tick()
                break
            else
                stuckCheckStart = tick()
                lastCheckPos = myRoot.Position
            end
        end
        
        for _, obj in ipairs(targetPlayer.Character:GetDescendants()) do
            if obj:IsA("ProximityPrompt") then
                pcall(function()
                    obj:InputHoldBegin()
                    task.wait(0.04)
                    obj:InputHoldEnd()
                end)
                pcall(function()
                    fireproximityprompt(obj)
                end)
            end
        end
        
        pcall(function()
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
            task.wait(0.04)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
        end)
        
        pcall(function()
            if ReplicatedStorage:FindFirstChild("Events") and ReplicatedStorage.Events:FindFirstChild("Revive") then
                ReplicatedStorage.Events.Revive:FireServer(targetPlayer.Name)
            end
            if ReplicatedStorage:FindFirstChild("Revive") then
                ReplicatedStorage.Revive:FireServer(targetPlayer)
            end
        end)
        
        task.wait(REVIVE_INTERVAL)
    end

    if lockConn then
        lockConn:Disconnect()
        lockConn = nil
    end
    if bp then
        bp:Destroy()
        bp = nil
    end
    if bg then
        bg:Destroy()
        bg = nil
    end

    pcall(function()
        myHum:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
        myHum:SetStateEnabled(Enum.HumanoidStateType.Running, true)
        myHum:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
        myHum.PlatformStand = false
    end)

    IsRevivingNow = false
    
    EnableSafeZone()
    GoToSafeZone()
end

task.spawn(function()
    while true do
        task.wait(0.15)
        pcall(function()
            local char = lp.Character
            if not char then return end
            local hum = char:FindFirstChildOfClass("Humanoid")
            if not hum then return end
            local isDowned = char:GetAttribute("Downed") or hum.Health <= 0
            
            if AutoFollow and isDowned then
                if not IsFollowing then
                    StartFollowing()
                end
                return
            end
            
            if AutoRevive and not isDowned then
                if IsFollowing then
                    StopFollowing()
                end
                
                local target = GetDownedPlayer()
                if target then
                    PerformRevive(target)
                else
                    if not IsRevivingNow and not IsFollowing then
                        EnableSafeZone()
                        GoToSafeZone()
                    end
                end
            end
        end)
    end
end)

Tabs.MoveTab:Section({ Title = "移动" })

Tabs.MoveTab:Toggle({
    Title = "速度修改",
    Value = false,
    Callback = function(value)
        Speed = value
        if not value then speedCurrent = 0 end
    end
})

Tabs.MoveTab:Slider({
    Title = "速度值",
    Value = { Min = 16, Max = 105, Default = 50 },
    Callback = function(value)
        Power = value
    end
})

Tabs.MoveTab:Toggle({
    Title = "无限跳跃",
    Value = false,
    Callback = function(value)
        JumpEnabled = value
        local Hum = lp.Character and lp.Character:FindFirstChild("Humanoid")
        if Hum then
            if value then
                OriginalJumpPower = Hum.JumpPower
                Hum.JumpPower = JumpPower
            else
                Hum.JumpPower = OriginalJumpPower
            end
        end
    end
})

Tabs.MoveTab:Slider({
    Title = "跳跃力度",
    Value = { Min = 50, Max = 200, Default = 50 },
    Callback = function(value)
        JumpPower = value
        if JumpEnabled then
            local Hum = lp.Character and lp.Character:FindFirstChild("Humanoid")
            if Hum then
                Hum.JumpPower = value
            end
        end
    end
})

Tabs.MoveTab:Section({ Title = "飞行" })

local flyToggleObj = Tabs.MoveTab:Toggle({
    Title = "飞行模式",
    Value = false,
    Callback = function(value)
        flying = value
        if value then
            startFly()
        else
            stopFly()
        end
    end
})

Tabs.MoveTab:Slider({
    Title = "飞行速度",
    Value = { Min = 50, Max = 175, Default = 150 },
    Callback = function(value)
        flySpeed = value
        flyMaxSpeed = value
    end
})

Tabs.MoveTab:Section({ Title = "安全与自动" })

safeZoneToggle = Tabs.MoveTab:Toggle({
    Title = "安全区域",
    Value = false,
    Callback = function(value)
        Safe = value
        if value then
            if flying then
                flying = false
                if flyToggleObj then flyToggleObj:Set(false) end
                stopFly()
            end
            ignoreTeleportFor(500)
            EnableSafeZone()
        else
            DisableSafeZone()
        end
    end
})

autoFollowToggle = Tabs.MoveTab:Toggle({
    Title = "自动跟随",
    Value = true,
    Callback = function(value)
        AutoFollow = value
        if not value and IsFollowing then
            StopFollowing()
        end
    end
})

autoReviveToggle = Tabs.MoveTab:Toggle({
    Title = "自动救人",
    Value = false,
    Callback = function(value)
        AutoRevive = value
        if not value then
            IsRevivingNow = false
            table.clear(DownedCache)
            table.clear(DownedCacheTime)
            table.clear(ReviveBlacklist)
            table.clear(ReviveBlacklistTime)
            
            pcall(function()
                local char = lp.Character
                if char then
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hum then
                        hum.PlatformStand = false
                        hum:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
                        hum:SetStateEnabled(Enum.HumanoidStateType.Running, true)
                        hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
                    end
                    for _, v in pairs(char:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = true
                        end
                    end
                end
            end)
            
            DisableSafeZone()
        end
    end
})

RunService.RenderStepped:Connect(function()
    local char = lp.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    if not hum or not root then return end

    if Speed then
        local moveDirection = hum.MoveDirection
        if moveDirection.Magnitude > 0 then
            speedCurrent = math.min(speedCurrent + speedAcceleration, Power)
            local moveVector = moveDirection * (speedCurrent / 45)
            if moveVector.Magnitude < 50 then
                root.CFrame = root.CFrame + moveVector
            else
                speedCurrent = speedCurrent / 2
            end
        else
            speedCurrent = math.max(0, speedCurrent - speedBrakeForce)
            if speedCurrent > 0 then
                local moveVector = hum.MoveDirection * (speedCurrent / 45)
                if moveVector.Magnitude < 50 then
                    root.CFrame = root.CFrame + moveVector
                else
                    speedCurrent = speedCurrent / 2
                end
            end
        end
    else
        speedCurrent = 0
    end

    if JumpEnabled then
        hum.JumpPower = JumpPower
        hum.UseJumpPower = true
    end
end)

UIS.JumpRequest:Connect(function()
    if JumpEnabled and lp.Character then
        local hum = lp.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            hum:ChangeState("Jumping")
        end
    end
end)

Tabs.VisualTab:Section({ Title = "环境" })

Tabs.VisualTab:Toggle({
    Title = "天空模式 + 全亮",
    Value = false,
    Callback = function(value)
        SkyEnabled = value
        if value then
            task.spawn(function()
                for _, obj in pairs(Lighting:GetChildren()) do
                    if obj.Name == "ARKS_WARM_SKY" or obj:IsA("Atmosphere") or obj:IsA("BloomEffect") or obj:IsA("ColorCorrectionEffect") or obj:IsA("SunRaysEffect") then
                        if obj.Name ~= "ARKS_WARM_SKY" or obj:IsA("Sky") then
                            obj:Destroy()
                        end
                    end
                end
                Lighting.Brightness = 5
                Lighting.ClockTime = 14
                Lighting.GlobalShadows = false
                Lighting.FogEnd = 999999
                local Sky = Instance.new("Sky")
                Sky.Name = "ARKS_WARM_SKY"
                Sky.SkyboxBk = "rbxassetid://7018684000"
                Sky.SkyboxDn = "rbxassetid://7018689553"
                Sky.SkyboxFt = "rbxassetid://7018684206"
                Sky.SkyboxLf = "rbxassetid://7018685653"
                Sky.SkyboxRt = "rbxassetid://7018684934"
                Sky.SkyboxUp = "rbxassetid://7018686777"
                Sky.Parent = Lighting
                Instance.new("Atmosphere", Lighting).Color = Color3.fromRGB(199, 172, 120)
                Instance.new("BloomEffect", Lighting).Intensity = 0.15
                Instance.new("SunRaysEffect", Lighting).Intensity = 0.08
                Instance.new("ColorCorrectionEffect", Lighting).TintColor = Color3.fromRGB(255, 220, 180)
                Lighting.ClockTime = 17.8
            end)
        else
            for _, obj in pairs(Lighting:GetChildren()) do
                if obj.Name == "ARKS_WARM_SKY" or obj:IsA("Atmosphere") or obj:IsA("BloomEffect") or obj:IsA("SunRaysEffect") or obj:IsA("ColorCorrectionEffect") then
                    obj:Destroy()
                end
            end
            Lighting.ClockTime = 12
            Lighting.Brightness = 2
            Lighting.FogEnd = 100000
            Lighting.GlobalShadows = true
        end
    end
})

task.spawn(function()
    while true do
        task.wait(5)
        if SkyEnabled then
            pcall(function()
                local skyExists = false
                local atmosphereExists = false
                for _, obj in pairs(Lighting:GetChildren()) do
                    if obj:IsA("Sky") and obj.Name == "ARKS_WARM_SKY" then skyExists = true end
                    if obj:IsA("Atmosphere") then atmosphereExists = true end
                end
                if not skyExists or not atmosphereExists or Lighting.Brightness ~= 5 then
                    Tabs.VisualTab:Toggle({ Title = "天空模式 + 全亮", Value = true })
                end
            end)
        end
    end
end)

Tabs.VisualTab:Section({ Title = "ESP" })

Tabs.VisualTab:Toggle({
    Title = "玩家ESP",
    Value = false,
    Callback = function(value)
        ESP = value
        if not value then
            for _, x in pairs(Players:GetPlayers()) do
                if x.Character then
                    for _, child in pairs(x.Character:GetChildren()) do
                        if child:IsA("BasePart") and child:FindFirstChild("ESP_Cham") then
                            child.ESP_Cham:Destroy()
                        end
                    end
                end
            end
        end
    end
})

task.spawn(function()
    while true do
        task.wait(0.2)
        if not ESP then
            for _, v in pairs(Players:GetPlayers()) do
                if v ~= lp and v.Character then
                    for _, child in pairs(v.Character:GetChildren()) do
                        if child:IsA("BasePart") and child:FindFirstChild("ESP_Cham") then
                            child.ESP_Cham:Destroy()
                        end
                    end
                end
            end
            continue
        end
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= lp and v.Character then
                local humTarget = v.Character:FindFirstChildOfClass("Humanoid")
                if humTarget and humTarget.Health > 0 then
                    local healthPercent = humTarget.Health / humTarget.MaxHealth
                    local color = healthPercent < 0.3 and Color3.fromRGB(255, 165, 0) or Color3.fromRGB(0, 255, 0)
                    for _, part in pairs(v.Character:GetChildren()) do
                        if part:IsA("BasePart") then
                            local cham = part:FindFirstChild("ESP_Cham")
                            if not cham then
                                cham = Instance.new("BoxHandleAdornment")
                                cham.Name = "ESP_Cham"
                                cham.Size = part.Size + Vector3.new(0.2, 0.2, 0.2)
                                cham.AlwaysOnTop = true
                                cham.ZIndex = 10
                                cham.Transparency = 0.3
                                cham.Adornee = part
                                cham.Parent = part
                            end
                            cham.Color3 = color
                            cham.Size = part.Size + Vector3.new(0.2, 0.2, 0.2)
                        end
                    end
                else
                    for _, child in pairs(v.Character:GetChildren()) do
                        if child:IsA("BasePart") and child:FindFirstChild("ESP_Cham") then
                            child.ESP_Cham:Destroy()
                        end
                    end
                end
            end
        end
    end
end)

Tabs.OptTab:Section({ Title = "司空。牛逼。。嘿嘿。这是彩蛋。知道吧。" })

Tabs.OptTab:Toggle({
    Title = "FPS增强",
    Value = false,
    Callback = function(value)
        FPSBooster(value)
    end
})

Tabs.OptTab:Toggle({
    Title = "禁用雾与云",
    Value = false,
    Callback = function(value)
        DisableFog(value)
    end
})

Tabs.OptTab:Button({
    Title = "反暂停",
    Callback = function()
        task.spawn(function()
            repeat task.wait() until lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
        end)
    end
})

Tabs.AboutTab:Button({
    Title = "防反作弊检测",
    Callback = function()
        Players.PlayerAdded:Connect(function(player)
            if player.UserId == game.CreatorId then
                lp:Kick("Moderator Joined")
            end
        end)
    end
})

Tabs.AboutTab:Label({
    Title = "防挂机已在后台运行"
})

UIS.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.R then
        Window:Close()
    end
end)
end)


Button(Tabjz, "在披萨店工作", function()
    local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 420),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5, XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1, XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button
    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end
    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0, XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1, XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5, XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1, XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1, XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    PlayerTab = Window:Tab({ Title = "玩家" }),
    TeleportTab = Window:Tab({ Title = "传送" }),
    TrollTab = Window:Tab({ Title = "捣乱" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local function teleportTo(pos)
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.CFrame = CFrame.new(pos)
    end
end

Tabs.PlayerTab:Section({ Title = "角色" })

Tabs.PlayerTab:Slider({
    Title = "移动速度",
    Value = { Min = 16, Max = 200, Default = 16 },
    Callback = function(v)
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum.WalkSpeed = v end
        end
    end
})

Tabs.PlayerTab:Slider({
    Title = "跳跃力度",
    Value = { Min = 50, Max = 200, Default = 50 },
    Callback = function(v)
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum.JumpPower = v end
        end
    end
})

Tabs.PlayerTab:Button({
    Title = "绕过老鼠藏身处",
    Callback = function()
        LocalPlayer.Character:SetAttribute("CharacterType", "Rat")
    end
})

Tabs.PlayerTab:Button({
    Title = "VIP传送按钮",
    Callback = function()
        LocalPlayer.PlayerGui.MainGui.Menu.Menu.Teleport.Visible = true
    end
})

Tabs.TeleportTab:Section({ Title = "地点传送" })

local places = {
    {"出生点", Vector3.new(47.51, 3.38, 168.77)},
    {"沙漠岛", Vector3.new(1522.84, 7.20, 1339.75)},
    {"宝藏岛", Vector3.new(-1762.85, 99.78, -1332.95)},
    {"海盗岛", Vector3.new(-1040.04, 40.96, 702.04)},
    {"餐厅秘密", Vector3.new(75.91, 9.75, 66.12)},
    {"死亡秘密", Vector3.new(-251.80, -23.20, -951.75)},
    {"大烟鬼", Vector3.new(9.44, 66.89, -995.44)},
}

for _, place in ipairs(places) do
    Tabs.TeleportTab:Button({
        Title = "传送至 " .. place[1],
        Callback = function()
            teleportTo(place[2] + Vector3.new(0, 2.5, 0))
        end
    })
end

Tabs.TeleportTab:Section({ Title = "工作岗位传送" })

local jobs = {"Cashier", "Cook", "Pizza Boxer", "Delivery", "Supplier", "Manager"}
for _, job in ipairs(jobs) do
    Tabs.TeleportTab:Button({
        Title = "传送至 " .. job,
        Callback = function()
            local spawn = Workspace:FindFirstChild(job .. "Spawn") or Workspace:FindFirstChild(job)
            if spawn then
                local pos = spawn:IsA("Model") and spawn:GetPivot() or spawn.CFrame
                teleportTo(pos.Position + Vector3.new(0, 2.5, 0))
            end
        end
    })
end

Tabs.TeleportTab:Section({ Title = "房屋传送" })

Tabs.TeleportTab:Button({
    Title = "传送到我的家",
    Callback = function()
        for _, house in Workspace.Houses:GetChildren() do
            if house:FindFirstChild("Owner") and house.Owner.Value == LocalPlayer.Name then
                local touch = house:FindFirstChild("GivePizza", true)
                if touch then teleportTo(touch.Position + Vector3.new(0, 2.5, 0)) end
                break
            end
        end
    end
})

local houseAddresses = {}
for _, house in Workspace.Houses:GetChildren() do
    if house:FindFirstChild("Address") then
        table.insert(houseAddresses, house.Address.Value)
    end
end

for i, addr in ipairs(houseAddresses) do
    Tabs.TeleportTab:Button({
        Title = "传送至 " .. addr,
        Callback = function()
            for _, house in Workspace.Houses:GetChildren() do
                if house.Address and house.Address.Value == addr then
                    local touch = house:FindFirstChild("GivePizza", true)
                    if touch then teleportTo(touch.Position + Vector3.new(0, 2.5, 0)) end
                    break
                end
            end
        end
    })
end

Tabs.TrollTab:Section({ Title = "捣乱功能" })

Tabs.TrollTab:Toggle({
    Title = "雪球连射",
    Value = false,
    Callback = function(v)
        while v do
            ReplicatedStorage.PlayerChannel:FireServer("GiveItem", 19328185)
            task.wait(0.05)
            for _, obj in LocalPlayer.Character:GetChildren() do
                if obj.Name == "Snowball" then
                    obj.Clicked:FireServer(LocalPlayer:GetMouse().Hit.Position)
                end
            end
            task.wait(0.05)
            if not v then break end
        end
    end
})

Tabs.TrollTab:Toggle({
    Title = "刷屏聊天",
    Value = false,
    Callback = function(v)
        while v do
            Workspace.Main.Chatted:FireServer("你好", false)
            task.wait(0.01)
            if not v then break end
        end
    end
})

Tabs.TrollTab:Toggle({
    Title = "刷屏工作按钮",
    Value = false,
    Callback = function(v)
        while v do
            for _, btn in Workspace.JobButtons:GetChildren() do
                if btn:IsA("BasePart") and btn:FindFirstChild("TouchInterest") then
                    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        firetouchinterest(hrp, btn, 1)
                        firetouchinterest(hrp, btn, 0)
                    end
                end
            end
            task.wait()
            if not v then break end
        end
    end
})
end)

Button(Tabjz, "寻宝模拟器", function()
    local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"
))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 400),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5,  XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button

    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end

    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5,  XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    DeleteTab = Window:Tab({ Title = "删除类" }),
    TeleportTab = Window:Tab({ Title = "传送类" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

local deletedHistory = {}

local function getParentPath(parent)
    local path = {}
    local current = parent
    while current and current ~= workspace do
        table.insert(path, 1, current.Name)
        current = current.Parent
    end
    return #path > 0 and path or nil
end

local function restoreAllSandBlocks()
    local restoredCount = 0
    for i, blockData in ipairs(deletedHistory) do
        local newBlock = Instance.new("Part")
        newBlock.Name = blockData.Name or "RestoredSand"
        newBlock.Color = blockData.Color
        newBlock.Material = blockData.Material or Enum.Material.Sand
        newBlock.Size = blockData.Size
        newBlock.Position = blockData.Position
        newBlock.Anchored = blockData.Anchored or true
        newBlock.CanCollide = blockData.CanCollide or true
        
        if blockData.ParentPath then
            local parent = workspace
            for _, childName in ipairs(blockData.ParentPath) do
                parent = parent:FindFirstChild(childName) or parent
            end
            newBlock.Parent = parent
        else
            newBlock.Parent = workspace
        end
        restoredCount = restoredCount + 1
    end
    deletedHistory = {}
end

local function deleteByColor(targetColor, colorName)
    local blocks = workspace:GetDescendants()
    local deletedCount = 0
    for _, block in ipairs(blocks) do
        if block:IsA("BasePart") then
            local colorDiff = math.abs(block.Color.R - targetColor.R) + 
                             math.abs(block.Color.G - targetColor.G) + 
                             math.abs(block.Color.B - targetColor.B)
            if colorDiff < 0.01 then
                table.insert(deletedHistory, {
                    Name = block.Name,
                    Color = block.Color,
                    Material = block.Material,
                    Size = block.Size,
                    Position = block.Position,
                    Anchored = block.Anchored,
                    CanCollide = block.CanCollide,
                    ParentPath = getParentPath(block.Parent)
                })
                block:Destroy()
                deletedCount = deletedCount + 1
            end
        end
    end
end

Tabs.DeleteTab:Section({ Title = "删除沙子" })

Tabs.DeleteTab:Button({
    Title = "删除第一层沙子",
    Callback = function()
        deleteByColor(Color3.fromRGB(186, 176, 131), "RGB(186, 176, 131)")
    end
})

Tabs.DeleteTab:Button({
    Title = "删除第二层沙子",
    Callback = function()
        deleteByColor(Color3.fromRGB(163, 162, 165), "RGB(163, 162, 165)")
    end
})

Tabs.DeleteTab:Button({
    Title = "删除第三层沙子",
    Callback = function()
        deleteByColor(Color3.fromRGB(108, 88, 75), "RGB(108, 88, 75)")
    end
})

Tabs.DeleteTab:Button({
    Title = "删除第四层沙子",
    Callback = function()
        deleteByColor(Color3.fromRGB(57, 58, 66), "RGB(57, 58, 66)")
    end
})

Tabs.DeleteTab:Button({
    Title = "删除第五层沙子",
    Callback = function()
        deleteByColor(Color3.fromRGB(98, 0, 0), "RGB(98, 0, 0)")
    end
})

Tabs.DeleteTab:Button({
    Title = "撤回删除沙子",
    Callback = function()
        restoreAllSandBlocks()
    end
})

local function teleportTo(pos)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart")
    hrp.CFrame = CFrame.new(pos)
end

local teleportPoints = {
    { Title = "传送监狱", Pos = Vector3.new(1249.86, 8.67, -921.09) },
    { Title = "传送多米努斯土地", Pos = Vector3.new(1351.41, 8.52, -267.20) },
    { Title = "传送火山", Pos = Vector3.new(2152.46, 8.50, -268.99) },
    { Title = "传送火星着陆基地", Pos = Vector3.new(-1423.07, 8.82, -844.78) },
    { Title = "传送发射基地", Pos = Vector3.new(-233.07, 9.07, -250.22) },
}

Tabs.TeleportTab:Section({ Title = "传送地点" })

for _, point in ipairs(teleportPoints) do
    Tabs.TeleportTab:Button({
        Title = point.Title,
        Callback = function()
            teleportTo(point.Pos)
        end
    })
end

Tabs.TeleportTab:Section({ Title = "其他" })

Tabs.TeleportTab:Button({
    Title = "快速返回出生点",
    Callback = function()
        teleportTo(Vector3.new(-14.65, 8.82, -251.05))
    end
})
end)

Button(Tabjz, "自然灾害", function()
    local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 420),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5, XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1, XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button
    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end
    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0, XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1, XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5, XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1, XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1, XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    PlayerTab = Window:Tab({ Title = "玩家" }),
    MiscTab = Window:Tab({ Title = "其他" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

Tabs.PlayerTab:Section({ Title = "玩家设置" })

Tabs.PlayerTab:Slider({
    Title = "移动速度",
    Value = { Min = 16, Max = 1000, Default = 16 },
    Callback = function(v)
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum.WalkSpeed = v end
        end
    end
})

Tabs.PlayerTab:Slider({
    Title = "跳跃力度",
    Value = { Min = 50, Max = 1000, Default = 50 },
    Callback = function(v)
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum.JumpPower = v end
        end
    end
})

Tabs.PlayerTab:Button({
    Title = "开启零重力",
    Callback = function()
        Workspace.Gravity = 1
    end
})

local infiniteJump = false
Tabs.PlayerTab:Toggle({
    Title = "无限跳跃",
    Value = false,
    Callback = function(v)
        infiniteJump = v
    end
})

game:GetService("UserInputService").JumpRequest:Connect(function()
    if infiniteJump then
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum:ChangeState("Jumping") end
        end
    end
end)

Tabs.PlayerTab:Section({ Title = "传送" })

Tabs.PlayerTab:Button({
    Title = "传送至出生点",
    Callback = function()
        local char = LocalPlayer.Character
        if char then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = CFrame.new(-251.645035, 190.999954, 312.64502)
            end
        end
    end
})

Tabs.PlayerTab:Button({
    Title = "传送至岛屿",
    Callback = function()
        local char = LocalPlayer.Character
        if char then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = CFrame.new(-111.5, 44.2000008, 29)
            end
        end
    end
})

Tabs.PlayerTab:Section({ Title = "FE Noob" })

local noobEnabled = false
Tabs.PlayerTab:Toggle({
    Title = "所有人变成Noob (FE)",
    Value = false,
    Callback = function(v)
        noobEnabled = v
        if v then
            task.spawn(function()
                while noobEnabled do
                    pcall(function()
                        if game:GetService("CoreGui"):FindFirstChild("PurchasePromptApp") then
                            game:GetService("CoreGui").PurchasePromptApp:Destroy()
                        end
                        game:GetService("Players").LocalPlayer.PlayerGui.MainGui.HoverSound.Volume = 0
                        for i = 1, 200 do
                            fireclickdetector(Workspace.BillboardBalloon.Board.ClickDetector)
                            fireclickdetector(Workspace.BillboardApple.Board.ClickDetector)
                            if i % 30 == 1 then
                                task.wait()
                            end
                            if not noobEnabled then break end
                        end
                    end)
                    if not noobEnabled then break end
                end
            end)
        end
    end
})

Tabs.PlayerTab:Paragraph({
    Title = "警告:",
    Desc = "开启后其他玩家可能只会看到你在原地不动"
})

Tabs.MiscTab:Section({ Title = "无坠落伤害" })

local noFallEnabled = false
local noFallConnection = nil

Tabs.MiscTab:Toggle({
    Title = "无坠落伤害",
    Value = false,
    Callback = function(v)
        noFallEnabled = v
        if v then
            local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local root = char:WaitForChild("HumanoidRootPart")
            local lastVel = Vector3.zero
            noFallConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if not noFallEnabled then return end
                if not root.Parent then
                    noFallConnection:Disconnect()
                    return
                end
                local vel = root.AssemblyLinearVelocity
                root.AssemblyLinearVelocity = Vector3.zero
                game:GetService("RunService").RenderStepped:Wait()
                root.AssemblyLinearVelocity = vel
            end)
        else
            if noFallConnection then
                noFallConnection:Disconnect()
                noFallConnection = nil
            end
        end
    end
})

Tabs.MiscTab:Section({ Title = "暂停游戏" })

local paused = false
local pauseConnection = nil

Tabs.MiscTab:Toggle({
    Title = "暂停游戏 (需要指南针通行证)",
    Value = false,
    Callback = function(v)
        paused = v
        if v then
            local hasPass = false
            local playerId = LocalPlayer.UserId
            for _, pass in pairs(game:GetService("MarketplaceService"):GetUserOwnedPassesAsync(playerId)) do
                if pass.PassId == 5911600 then
                    hasPass = true
                    break
                end
            end
            
            if not hasPass then
                WindUI:Notify({
                    Title = "警告",
                    Content = "你需要指南针通行证才能暂停游戏",
                    Duration = 4
                })
                Tabs.MiscTab:Toggle({ Title = "暂停游戏 (需要指南针通行证)", Value = false })
                return
            end
            
            game:GetService("RunService"):Pause()
            pauseConnection = game:GetService("RunService").RenderStepped:Connect(function()
                if not paused then
                    game:GetService("RunService"):Unpause()
                    pauseConnection:Disconnect()
                end
            end)
        else
            if pauseConnection then
                pauseConnection:Disconnect()
                pauseConnection = nil
            end
            game:GetService("RunService"):Unpause()
        end
    end
})

Tabs.MiscTab:Paragraph({
    Title = "需要指南针通行证",
    Desc = "此功能需要拥有指南针通行证才能使用"
})
end)

Button(Tabjz, "极限躲猫猫", function()
    local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 420),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5, XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1, XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button
    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end
    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0, XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1, XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5, XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1, XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1, XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    SoundTab = Window:Tab({ Title = "音效" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local PlaySoundOthers = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("PlaySoundOthers")

local soundId = ""
local soundVolume = 0.25
local soundPitch = 1
local soundLoop = false
local currentSound = nil

Tabs.SoundTab:Section({ Title = "音效播放器" })

Tabs.SoundTab:Input({
    Title = "音效ID",
    Value = "",
    Placeholder = "输入音效ID (数字)",
    Callback = function(v)
        soundId = v
    end
})

Tabs.SoundTab:Input({
    Title = "音量 (输入inf为炸麦)",
    Value = "0.25",
    Placeholder = "数字 或 inf",
    Callback = function(v)
        if v:lower() == "inf" then
            soundVolume = 99999999999999999999999999999999999999999999
        else
            local num = tonumber(v)
            if num then
                soundVolume = num
            end
        end
    end
})

Tabs.SoundTab:Input({
    Title = "音调 (输入inf为最大)",
    Value = "1",
    Placeholder = "数字 或 inf",
    Callback = function(v)
        if v:lower() == "inf" then
            soundPitch = 99999999999999999999999999999
        else
            local num = tonumber(v)
            if num then
                soundPitch = num
            end
        end
    end
})

Tabs.SoundTab:Toggle({
    Title = "循环播放",
    Value = false,
    Callback = function(v)
        soundLoop = v
        if currentSound then
            currentSound.Looped = v
        end
    end
})

Tabs.SoundTab:Button({
    Title = "播放音效[服务器有音效检测所以只可以听三秒给别人]",
    Callback = function()
        local id = tonumber(soundId)
        if not id then
            WindUI:Notify({ Title = "错误", Content = "请输入有效的音效ID", Duration = 3 })
            return
        end
        
        local char = LocalPlayer.Character
        if not char then
            WindUI:Notify({ Title = "错误", Content = "找不到角色", Duration = 3 })
            return
        end
        
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then
            WindUI:Notify({ Title = "错误", Content = "找不到HumanoidRootPart", Duration = 3 })
            return
        end
        
        PlaySoundOthers:FireServer(id, {
            Pitch = soundPitch,
            Volume = soundVolume,
            Parent = root,
        })
        
        if currentSound then
            currentSound:Stop()
            currentSound:Destroy()
            currentSound = nil
        end
        
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. id
        sound.Pitch = soundPitch
        sound.Volume = 50
        sound.Looped = soundLoop
        sound.Parent = root
        sound:Play()
        currentSound = sound
        
        sound.Ended:Connect(function()
            if not soundLoop then
                sound:Destroy()
                currentSound = nil
            end
        end)
        
        WindUI:Notify({ Title = "音效", Content = "正在播放音效 ID: " .. id, Duration = 2 })
    end
})

Tabs.SoundTab:Button({
    Title = "停止音效",
    Callback = function()
        if currentSound then
            currentSound:Stop()
            currentSound:Destroy()
            currentSound = nil
            WindUI:Notify({ Title = "音效", Content = "已停止播放", Duration = 2 })
        else
            WindUI:Notify({ Title = "音效", Content = "没有正在播放的音效", Duration = 2 })
        end
    end
})
end)

Button(Tabjz, "监狱人生", function()
    local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 420),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5, XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1, XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button
    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end
    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0, XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1, XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5, XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1, XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1, XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    PlayerTab = Window:Tab({ Title = "玩家" }),
    TeleportTab = Window:Tab({ Title = "传送" }),
    VisualTab = Window:Tab({ Title = "视觉" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

local function teleportTo(pos)
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.CFrame = CFrame.new(pos)
    end
end

Tabs.PlayerTab:Section({ Title = "玩家功能" })

local infJump = false
Tabs.PlayerTab:Toggle({
    Title = "无限跳跃",
    Value = false,
    Callback = function(v)
        infJump = v
    end
})

game:GetService("UserInputService").JumpRequest:Connect(function()
    if infJump then
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum:ChangeState("Jumping") end
        end
    end
end)

local speedLevel = 1
Tabs.PlayerTab:Button({
    Title = "速度 x2",
    Callback = function()
        speedLevel = 2
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum.WalkSpeed = 32 end
        end
    end
})

Tabs.PlayerTab:Button({
    Title = "速度 x3",
    Callback = function()
        speedLevel = 3
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum.WalkSpeed = 48 end
        end
    end
})

Tabs.PlayerTab:Button({
    Title = "重置速度",
    Callback = function()
        speedLevel = 1
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum.WalkSpeed = 16 end
        end
    end
})

Tabs.PlayerTab:Button({
    Title = "移除门",
    Callback = function()
        local doors = Workspace:FindFirstChild("Doors")
        if doors then
            doors:Destroy()
        end
    end
})

Tabs.TeleportTab:Section({ Title = "传送" })

local locations = {
    {"监狱院子", Vector3.new(0, 0, 0)},
    {"罪犯基地", Vector3.new(0, 0, 0)},
    {"警察局", Vector3.new(0, 0, 0)},
    {"牢房", Vector3.new(0, 0, 0)},
}

for _, loc in ipairs(locations) do
    Tabs.TeleportTab:Button({
        Title = "传送到 " .. loc[1],
        Callback = function()
            teleportTo(loc[2])
        end
    })
end

Tabs.VisualTab:Section({ Title = "透视" })

local highlightESP = false
local fillTransparency = 0.5

Tabs.VisualTab:Toggle({
    Title = "高亮透视",
    Value = false,
    Callback = function(v)
        highlightESP = v
    end
})

Tabs.VisualTab:Slider({
    Title = "高亮透明度",
    Value = { Min = 0, Max = 100, Default = 50 },
    Callback = function(v)
        fillTransparency = v / 100
    end
})

task.spawn(function()
    while true do
        if highlightESP then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local hl = player.Character:FindFirstChild("ESP_Highlight")
                    if not hl then
                        hl = Instance.new("Highlight")
                        hl.Name = "ESP_Highlight"
                        hl.FillColor = Color3.fromRGB(255, 0, 0)
                        hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                        hl.FillTransparency = fillTransparency
                        hl.Parent = player.Character
                    end
                end
            end
        else
            for _, player in ipairs(Players:GetPlayers()) do
                if player.Character then
                    local hl = player.Character:FindFirstChild("ESP_Highlight")
                    if hl then hl:Destroy() end
                end
            end
        end
        task.wait(0.5)
    end
end)
end)

Button(Tabjz, "河北唐县", function()
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 420),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5, XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1, XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button
    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end
    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0, XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1, XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5, XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1, XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1, XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    FarmTab = Window:Tab({ Title = "刷钱" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

local function teleportTo(cframe)
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.CFrame = cframe
    end
end

local autoFarm = false

Tabs.FarmTab:Section({ Title = "自动刷钱" })

Tabs.FarmTab:Toggle({
    Title = "自动刷钱",
    Value = false,
    Callback = function(v)
        autoFarm = v
        if v then
            task.spawn(function()
                while autoFarm do
                    pcall(function()
                        fireclickdetector(Workspace.DeliverySys.Misc["Package Pile"].ClickDetector)
                        task.wait(2.2)
                        for _, point in pairs(Workspace.DeliverySys.DeliveryPoints:GetChildren()) do
                            if point.Locate.Locate.Enabled then
                                teleportTo(point.CFrame)
                            end
                        end
                        task.wait(0)
                    end)
                    if not autoFarm then break end
                end
            end)
        end
    end
})

Window:Open()
end)

Button(Tabjz, "帮派在人上模拟器", function()
    local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 420),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5, XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1, XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button
    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end
    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0, XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1, XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5, XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1, XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1, XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    SpamTab = Window:Tab({ Title = "连击" }),
    FarmTab = Window:Tab({ Title = "刷钱" }),
    SlapTab = Window:Tab({ Title = "巴掌农场" }),
    HitboxTab = Window:Tab({ Title = "Hitbox" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

Tabs.SpamTab:Section({ Title = "连击功能" })

local spamming = { Slap = false, Kick = false, Stomp = false }

local function slapSpamLoop()
    while spamming.Slap do
        pcall(function()
            local args = {"Slap"}
            LocalPlayer:WaitForChild("Backpack"):WaitForChild("Fight"):WaitForChild("FightEvent"):FireServer(unpack(args))
        end)
        task.wait()
    end
end

local function kickSpamLoop()
    while spamming.Kick do
        pcall(function()
            local args = {"Kick"}
            LocalPlayer:WaitForChild("Backpack"):WaitForChild("Fight"):WaitForChild("FightEvent"):FireServer(unpack(args))
        end)
        task.wait()
    end
end

local function stompSpamLoop()
    while spamming.Stomp do
        pcall(function()
            local args = {"Stomp"}
            LocalPlayer:WaitForChild("Backpack"):WaitForChild("Fight"):WaitForChild("FightEvent"):FireServer(unpack(args))
        end)
        task.wait()
    end
end

Tabs.SpamTab:Toggle({
    Title = "巴掌连击",
    Value = false,
    Callback = function(v)
        spamming.Slap = v
        if v then task.spawn(slapSpamLoop) end
    end
})

Tabs.SpamTab:Toggle({
    Title = "踢击连击",
    Value = false,
    Callback = function(v)
        spamming.Kick = v
        if v then task.spawn(kickSpamLoop) end
    end
})

Tabs.SpamTab:Toggle({
    Title = "踩踏连击",
    Value = false,
    Callback = function(v)
        spamming.Stomp = v
        if v then task.spawn(stompSpamLoop) end
    end
})

Tabs.SpamTab:Button({
    Title = "停止所有连击",
    Callback = function()
        spamming.Slap = false
        spamming.Kick = false
        spamming.Stomp = false
    end
})

Tabs.FarmTab:Section({ Title = "自动刷钱" })

local farmActive = false
local farmLoop = nil
local autoJumpActive = false
local hideActive = false
local hideLoop = nil
local lastTeleportTime = 0
local TELEPORT_COOLDOWN = 0.3

local function findNearestCash()
    local char = LocalPlayer.Character
    if not char then return nil end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    
    local charPos = hrp.Position
    local nearestCash = nil
    local shortestDistance = math.huge
    
    for _, obj in Workspace:GetDescendants() do
        if obj.Name == "Cash" and obj:IsA("BasePart") and obj.Parent then
            local distance = (obj.Position - charPos).Magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                nearestCash = obj
            end
        end
    end
    return nearestCash
end

local function isOnCash(cashPart)
    local char = LocalPlayer.Character
    if not char then return false end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end
    return (hrp.Position - cashPart.Position).Magnitude < 5
end

local function startFarmLoop()
    farmLoop = RunService.Stepped:Connect(function()
        if not farmActive then return end
        local now = tick()
        if now - lastTeleportTime < TELEPORT_COOLDOWN then return end
        
        local char = LocalPlayer.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        
        local cashPart = findNearestCash()
        if cashPart and cashPart.Parent then
            if not isOnCash(cashPart) then
                pcall(function()
                    hrp.CFrame = CFrame.new(cashPart.Position + Vector3.new(0, 3, 0))
                    lastTeleportTime = now
                end)
            end
        end
    end)
end

local function stopFarmLoop()
    if farmLoop then
        farmLoop:Disconnect()
        farmLoop = nil
    end
end

local function startAutoJump()
    task.spawn(function()
        while autoJumpActive do
            local char = LocalPlayer.Character
            if char then
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum then
                    local cashPart = findNearestCash()
                    if cashPart and isOnCash(cashPart) then
                        hum.Jump = true
                    end
                end
            end
            task.wait(0.5)
        end
    end)
end

local function startHideUnderground()
    hideLoop = RunService.Stepped:Connect(function()
        if not hideActive then return end
        local char = LocalPlayer.Character
        if char then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then
                pcall(function()
                    hrp.CFrame = CFrame.new(Vector3.new(hrp.Position.X, -10, hrp.Position.Z))
                end)
            end
        end
    end)
end

local function stopHideLoop()
    if hideLoop then
        hideLoop:Disconnect()
        hideLoop = nil
    end
end

Tabs.FarmTab:Toggle({
    Title = "自动收集金币",
    Value = false,
    Callback = function(v)
        farmActive = v
        if v then
            local testCash = findNearestCash()
            if testCash then
                startFarmLoop()
            else
                farmActive = false
            end
        else
            stopFarmLoop()
        end
    end
})

Tabs.FarmTab:Toggle({
    Title = "自动跳跃 (帮助收集金币)",
    Value = false,
    Callback = function(v)
        autoJumpActive = v
        if v then startAutoJump() end
    end
})

Tabs.FarmTab:Toggle({
    Title = "藏地下模式",
    Value = false,
    Callback = function(v)
        hideActive = v
        if v then
            startHideUnderground()
        else
            stopHideLoop()
            local char = LocalPlayer.Character
            if char then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.CFrame = CFrame.new(Vector3.new(hrp.Position.X, 10, hrp.Position.Z))
                end
            end
        end
    end
})

Tabs.FarmTab:Button({
    Title = "传送到最近金币",
    Callback = function()
        local cashPart = findNearestCash()
        if cashPart then
            local char = LocalPlayer.Character
            if char then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.CFrame = CFrame.new(cashPart.Position + Vector3.new(0, 3, 0))
                    if autoJumpActive then
                        local hum = char:FindFirstChildOfClass("Humanoid")
                        if hum then task.wait(0.1) hum.Jump = true end
                    end
                end
            end
        end
    end
})

Tabs.SlapTab:Section({ Title = "Linda NPC" })

local function findLinda()
    for _, obj in Workspace:GetDescendants() do
        if obj.Name == "Linda" and obj:IsA("Model") then
            local rootPart = obj:FindFirstChild("HumanoidRootPart") or obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
            if rootPart then
                return obj, rootPart
            end
        end
    end
    return nil
end

Tabs.SlapTab:Button({
    Title = "召唤Linda",
    Callback = function()
        local char = LocalPlayer.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        
        local lindaModel, lindaRoot = findLinda()
        if lindaModel and lindaRoot then
            local lindaParts = {}
            for _, part in lindaModel:GetDescendants() do
                if part:IsA("BasePart") then table.insert(lindaParts, part) end
            end
            local targetPos = hrp.Position + Vector3.new(3, 0, 0)
            local offset = targetPos - lindaRoot.Position
            for _, part in lindaParts do
                part.CFrame = part.CFrame + offset
            end
        end
    end
})

local lindaStatus = Tabs.SlapTab:Paragraph({
    Title = "Linda状态:",
    Desc = "未找到"
})

local function updateLindaStatus()
    local linda = findLinda()
    if linda then
        lindaStatus:SetDesc("已找到")
    else
        lindaStatus:SetDesc("未找到")
    end
end

task.spawn(function()
    while true do
        updateLindaStatus()
        task.wait(5)
    end
end)

Tabs.SlapTab:Button({
    Title = "刷新Linda状态",
    Callback = function()
        updateLindaStatus()
    end
})

Tabs.HitboxTab:Section({ Title = "Hitbox扩展" })

local hitboxSize = 5
local hitboxEnabled = false
local hitboxParts = {}

Tabs.HitboxTab:Slider({
    Title = "Hitbox大小",
    Value = { Min = 1, Max = 50, Default = 5 },
    Callback = function(v)
        hitboxSize = v
        if hitboxEnabled then
            for _, part in hitboxParts do
                if part and part.Parent then
                    part.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
                end
            end
        end
    end
})

Tabs.HitboxTab:Toggle({
    Title = "启用Hitbox扩展",
    Value = false,
    Callback = function(v)
        hitboxEnabled = v
        if v then
            task.spawn(function()
                while hitboxEnabled do
                    for _, player in Players:GetPlayers() do
                        if player ~= LocalPlayer and player.Character then
                            for _, part in player.Character:GetDescendants() do
                                if part:IsA("BasePart") and not table.find(hitboxParts, part) then
                                    part.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
                                    table.insert(hitboxParts, part)
                                end
                            end
                        end
                    end
                    task.wait(0.1)
                end
            end)
        else
            for _, part in hitboxParts do
                if part and part.Parent then
                    part.Size = Vector3.new(2, 2, 1)
                end
            end
            hitboxParts = {}
        end
    end
})

Window:Open()
end)

Button(Tabjz, "圣奥里", function()
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 420),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5, XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1, XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button
    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end
    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0, XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1, XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5, XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1, XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1, XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    MainFuncTab = Window:Tab({ Title = "主要功能" }),
    WeaponTab = Window:Tab({ Title = "武器修改" }),
    TeleportTab = Window:Tab({ Title = "传送点" }),
    SettingsTab = Window:Tab({ Title = "设置" }),
    BulletTab = Window:Tab({ Title = "子弹追踪" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local PlayerEvent = ReplicatedStorage:WaitForChild("Remote"):WaitForChild("PlayerEvent")
local Modules = ReplicatedStorage.Modules
local Algorithms = require(Modules.Algorithms)

local Character = LocalPlayer.Character
local Humanoid = Character and Character:FindFirstChild("Humanoid")
local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

local Toggles = {
    Noclip = false,
    KillAura = false,
    Hitbox = false,
    Whitelist = false,
    Aim = false,
    NoDizziness = false,
    Taxi = false,
    AutoBus = false,
    AtmHack = false,
    Teleport = false,
    BulletTrack = false,
    ScreenPriority = true,
    DistancePriority = false,
}

local Settings = {
    HoldTime = 0,
    Distance = 25,
    KillAuraRange = 50,
    HitboxSize = 10,
    AimSmoothness = 5,
    AimMaxDistance = 200,
    AimCheckWall = true,
    NoDizzinessSpeed = 24,
    TaxiWaitTime = 7,
}

local KillAuraConnection = nil
local NoDizzinessConnection = nil
local AutoBusTask = nil
local AtmHackTask = nil
local TaxiTask = nil
local FriendWhitelist = {}

function ApplyHitbox(size)
    size = size or Settings.HitboxSize
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local char = player.Character
            if char then
                local head = char:FindFirstChild("Head")
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum and hum.Health > 0 and head then
                    head.Size = Vector3.new(size, size, size)
                    head.Transparency = 1
                    head.Color = Color3.fromRGB(255, 215, 0)
                    head.Material = Enum.Material.Neon
                    head.CanCollide = false
                end
            end
        end
    end
end

function ResetHitbox()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local char = player.Character
            if char then
                local head = char:FindFirstChild("Head")
                if head then
                    head.Size = Vector3.new(2, 2, 2)
                    head.Transparency = 0
                    head.Color = Color3.fromRGB(255, 255, 255)
                    head.Material = Enum.Material.SmoothPlastic
                    head.CanCollide = true
                end
            end
        end
    end
end

function UpdateWhitelist()
    local userId = LocalPlayer.UserId
    FriendWhitelist = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            pcall(function()
                if player:IsFriendsWith(userId) then
                    FriendWhitelist[player.UserId] = true
                end
            end)
        end
    end
end

function ToggleKillAura(enabled)
    Toggles.KillAura = enabled
    if enabled then
        pcall(function()
            PlayerEvent:FireServer("combatMode", true)
        end)
        StartKillAura()
    else
        if KillAuraConnection then KillAuraConnection:Disconnect() end
        KillAuraConnection = nil
    end
end

function StartKillAura()
    if KillAuraConnection then KillAuraConnection:Disconnect() end
    KillAuraConnection = RunService.Heartbeat:Connect(function()
        if not Toggles.KillAura then return end
        local char = LocalPlayer.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                if Toggles.Whitelist and FriendWhitelist[player.UserId] then continue end
                local targetChar = player.Character
                if targetChar then
                    local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
                    local targetHum = targetChar:FindFirstChildOfClass("Humanoid")
                    if targetRoot and targetHum and targetHum.Health > 0 then
                        local dist = (targetRoot.Position - root.Position).Magnitude
                        if dist <= Settings.KillAuraRange then
                            pcall(function()
                                PlayerEvent:FireServer("attack", targetRoot.Position)
                            end)
                        end
                    end
                end
            end
        end
    end)
end

function StartNoDizziness()
    if NoDizzinessConnection then NoDizzinessConnection:Disconnect() end
    NoDizzinessConnection = RunService.RenderStepped:Connect(function()
        if not Toggles.NoDizziness then return end
        local char = LocalPlayer.Character
        if not char then return end
        local hum = char:FindFirstChild("Humanoid")
        local root = char:FindFirstChild("HumanoidRootPart")
        if hum and root then
            local moveDir = hum.MoveDirection
            if moveDir.Magnitude > 0 then
                local speed = Settings.NoDizzinessSpeed
                root.AssemblyLinearVelocity = Vector3.new(
                    moveDir.X * speed,
                    root.AssemblyLinearVelocity.Y,
                    moveDir.Z * speed
                )
            end
        end
    end)
end

function StopNoDizziness()
    if NoDizzinessConnection then
        NoDizzinessConnection:Disconnect()
        NoDizzinessConnection = nil
    end
end

function ToggleTaxi(enabled)
    Toggles.Taxi = enabled
    if enabled then
        if TaxiTask then task.cancel(TaxiTask) end
        TaxiTask = task.spawn(function()
            while Toggles.Taxi do
                local areas = {}
                local clientContent = Workspace:FindFirstChild("Gameplay") and Workspace.Gameplay:FindFirstChild("Entities") and Workspace.Gameplay.Entities:FindFirstChild("ClientContent")
                local searchRoot = clientContent or Workspace
                for _, obj in ipairs(searchRoot:GetDescendants()) do
                    if obj.Name == "Area" then
                        table.insert(areas, obj)
                    end
                end
                if #areas == 0 then
                    task.wait(5)
                else
                    for _, area in ipairs(areas) do
                        if not Toggles.Taxi then break end
                        local char = LocalPlayer.Character
                        if not char then break end
                        local root = char:FindFirstChild("HumanoidRootPart")
                        if root then
                            pcall(function()
                                root.CFrame = area.CFrame * CFrame.new(0, 0, 5)
                            end)
                        end
                        task.wait(Settings.TaxiWaitTime)
                    end
                end
            end
        end)
    else
        if TaxiTask then
            task.cancel(TaxiTask)
            TaxiTask = nil
        end
    end
end

function StartAutoBus()
    if AutoBusTask then task.cancel(AutoBusTask) end
    AutoBusTask = task.spawn(function()
        while Toggles.AutoBus do
            local areas = {}
            local clientContent = Workspace:FindFirstChild("Gameplay") and Workspace.Gameplay:FindFirstChild("Entities") and Workspace.Gameplay.Entities:FindFirstChild("ClientContent")
            local searchRoot = clientContent or Workspace
            for _, obj in ipairs(searchRoot:GetDescendants()) do
                if obj.Name == "Area" then
                    table.insert(areas, obj)
                end
            end
            if #areas == 0 then
                task.wait(5)
            else
                for _, area in ipairs(areas) do
                    if not Toggles.AutoBus then break end
                    local char = LocalPlayer.Character
                    if not char then break end
                    local root = char:FindFirstChild("HumanoidRootPart")
                    local hum = char:FindFirstChild("Humanoid")
                    if root and hum then
                        local targetCF = (area.CFrame * CFrame.new(3, 3, 16)) * CFrame.Angles(0, math.pi, 0)
                        pcall(function()
                            local seat = hum.SeatPart
                            if seat then
                                local oldRootCF = root.CFrame
                                local newSeatCF = targetCF * oldRootCF:ToObjectSpace(seat.CFrame)
                                seat.CFrame = newSeatCF
                                seat.Velocity = Vector3.new(0, 0, 0)
                                seat.RotVelocity = Vector3.new(0, 0, 0)
                                task.wait(0.1)
                                hum.Sit = false
                            end
                        end)
                    end
                    task.wait(Settings.TaxiWaitTime)
                end
            end
        end
    end)
end

function StopAutoBus()
    if AutoBusTask then
        task.cancel(AutoBusTask)
        AutoBusTask = nil
    end
end

function ToggleAtmHack(enabled)
    Toggles.AtmHack = enabled
    if enabled then
        if AtmHackTask then task.cancel(AtmHackTask) end
        AtmHackTask = task.spawn(function()
            while Toggles.AtmHack do
                task.wait(5)
                pcall(function()
                    PlayerEvent:FireServer("atmHack")
                end)
            end
        end)
    else
        if AtmHackTask then
            task.cancel(AtmHackTask)
            AtmHackTask = nil
        end
    end
end

function TeleportTo(position)
    if not Toggles.Teleport then return end
    local char = LocalPlayer.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if root then
        pcall(function()
            root.CFrame = CFrame.new(position)
        end)
    end
end

function ToggleBulletTrack(enabled)
    Toggles.BulletTrack = enabled
    if enabled then
        pcall(function()
            local old = Algorithms.bulletSpread
            Algorithms.bulletSpread = function(...)
                return old(...)
            end
        end)
    end
end

local fireRateEnabled = false
local ammoEnabled = false
local ammoLoop = nil

local function ModifyWeaponStats()
    local garbage = getgc(true)
    for _, tbl in pairs(garbage) do
        if type(tbl) == "table" then
            pcall(function()
                if rawget(tbl, "SHOOT_MODE") then
                    rawset(tbl, "SHOOT_MODE", 2)
                end
                if rawget(tbl, "RPM") then
                    rawset(tbl, "RPM", math.huge)
                end
                if rawget(tbl, "DAMAGE") then
                    rawset(tbl, "DAMAGE", math.huge)
                end
                if rawget(tbl, "MaxAmmo") then
                    rawset(tbl, "MaxAmmo", math.huge)
                end
                if rawget(tbl, "CurrentAmmo") then
                    rawset(tbl, "CurrentAmmo", math.huge)
                end
            end)
        end
    end
end

local function SetupCharacter(char)
    if not char then return end
    local humanoid = char:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.Died:Connect(function()
            task.wait(1)
            ModifyWeaponStats()
        end)
    end
end

if LocalPlayer.Character then
    SetupCharacter(LocalPlayer.Character)
end

LocalPlayer.CharacterAdded:Connect(SetupCharacter)

Tabs.MainFuncTab:Section({ Title = "交互设置" })

Tabs.MainFuncTab:Slider({
    Title = "按住时间",
    Value = { Min = 0, Max = 10, Default = 0 },
    Callback = function(val)
        Settings.HoldTime = val
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("ProximityPrompt") then obj.HoldDuration = val end
        end
    end
})

Tabs.MainFuncTab:Slider({
    Title = "触发距离",
    Value = { Min = 5, Max = 150, Default = 25 },
    Callback = function(val)
        Settings.Distance = val
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("ProximityPrompt") then obj.MaxActivationDistance = val end
        end
    end
})

Tabs.MainFuncTab:Toggle({
    Title = "启用人物穿墙",
    Value = false,
    Callback = function(val)
        Toggles.Noclip = val
        local char = LocalPlayer.Character
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = not val end
            end
        end
    end
})

Tabs.MainFuncTab:Section({ Title = "碰撞箱扩展" })

Tabs.MainFuncTab:Toggle({
    Title = "杀戮光环",
    Value = false,
    Callback = function(val) ToggleKillAura(val) end
})

Tabs.MainFuncTab:Slider({
    Title = "杀戮光环距离",
    Value = { Min = 1, Max = 1000, Default = 50 },
    Callback = function(val) Settings.KillAuraRange = val end
})

Tabs.MainFuncTab:Toggle({
    Title = "启用头部碰撞箱",
    Value = false,
    Callback = function(val)
        Toggles.Hitbox = val
        if val then ApplyHitbox(Settings.HitboxSize) else ResetHitbox() end
    end
})

Tabs.MainFuncTab:Slider({
    Title = "头部大小",
    Value = { Min = 5, Max = 40, Default = 10 },
    Callback = function(val)
        Settings.HitboxSize = val
        if Toggles.Hitbox then ApplyHitbox(val) end
    end
})

Tabs.MainFuncTab:Toggle({
    Title = "好友检测 (白名单)",
    Value = false,
    Callback = function(val)
        Toggles.Whitelist = val
        if val then UpdateWhitelist() end
    end
})

Tabs.MainFuncTab:Section({ Title = "自瞄功能" })

Tabs.MainFuncTab:Toggle({
    Title = "启用自瞄",
    Value = false,
    Callback = function(val) Toggles.Aim = val end
})

Tabs.MainFuncTab:Slider({
    Title = "平滑度",
    Value = { Min = 1, Max = 20, Default = 5 },
    Callback = function(val) Settings.AimSmoothness = val end
})

Tabs.MainFuncTab:Slider({
    Title = "检测距离",
    Value = { Min = 50, Max = 500, Default = 200 },
    Callback = function(val) Settings.AimMaxDistance = val end
})

Tabs.MainFuncTab:Toggle({
    Title = "墙壁检测",
    Value = true,
    Callback = function(val) Settings.AimCheckWall = val end
})

Tabs.MainFuncTab:Section({ Title = "移动增强" })

Tabs.MainFuncTab:Toggle({
    Title = "无眩晕",
    Value = false,
    Callback = function(val)
        Toggles.NoDizziness = val
        if val then StartNoDizziness() else StopNoDizziness() end
    end
})

Tabs.MainFuncTab:Slider({
    Title = "移动速度",
    Value = { Min = 5, Max = 80, Default = 24 },
    Callback = function(val) Settings.NoDizzinessSpeed = val end
})

Tabs.MainFuncTab:Section({ Title = "自动赚钱" })

Tabs.MainFuncTab:Toggle({
    Title = "启用出租车自动循环",
    Value = false,
    Callback = function(val) ToggleTaxi(val) end
})

Tabs.MainFuncTab:Slider({
    Title = "出租车每次等待秒数",
    Value = { Min = 1, Max = 30, Default = 7 },
    Callback = function(val) Settings.TaxiWaitTime = val end
})

Tabs.MainFuncTab:Toggle({
    Title = "启用自动公交车 (圈)",
    Value = false,
    Callback = function(val)
        Toggles.AutoBus = val
        if val then StartAutoBus() else StopAutoBus() end
    end
})

Tabs.MainFuncTab:Toggle({
    Title = "启用ATM自动破解 (每5秒)",
    Value = false,
    Callback = function(val) ToggleAtmHack(val) end
})

Tabs.WeaponTab:Section({ Title = "武器修改" })

Tabs.WeaponTab:Toggle({
    Title = "无限射速",
    Value = false,
    Callback = function(val)
        fireRateEnabled = val
        if val then
            for i = 1, 3 do
                ModifyWeaponStats()
                task.wait(0.1)
            end
        end
    end
})

Tabs.WeaponTab:Toggle({
    Title = "无限子弹",
    Value = false,
    Callback = function(val)
        ammoEnabled = val
        if val then
            if ammoLoop then ammoLoop:Disconnect() end
            ammoLoop = RunService.Heartbeat:Connect(function()
                if not ammoEnabled then return end
                pcall(function()
                    local characterFolder = Workspace:FindFirstChild("Characters")
                    if characterFolder then
                        local playerFolder = characterFolder:FindFirstChild(LocalPlayer.Name)
                        if playerFolder then
                            for _, gun in ipairs(playerFolder:GetChildren()) do
                                local config = gun:FindFirstChild("Config")
                                if config then
                                    local Ammo = config:FindFirstChild("Ammo")
                                    local TotalAmmo = config:FindFirstChild("TotalAmmo")
                                    if Ammo then Ammo.Value = math.huge end
                                    if TotalAmmo then TotalAmmo.Value = math.huge end
                                end
                            end
                        end
                    end
                end)
            end)
        else
            if ammoLoop then
                ammoLoop:Disconnect()
                ammoLoop = nil
            end
        end
    end
})

Tabs.WeaponTab:Button({
    Title = "立即修改武器数据",
    Callback = function()
        for i = 1, 5 do
            ModifyWeaponStats()
            task.wait(0.05)
        end
    end
})

Tabs.TeleportTab:Section({ Title = "传送控制" })

Tabs.TeleportTab:Toggle({
    Title = "启用传送",
    Value = false,
    Callback = function(val) Toggles.Teleport = val end
})

local function AddTeleportButton(name, pos)
    Tabs.TeleportTab:Button({
        Title = name,
        Callback = function() TeleportTo(pos) end
    })
end

Tabs.TeleportTab:Section({ Title = "其他" })
AddTeleportButton("黑色市场", Vector3.new(1038.969849, -22.73295, 895.430237))
AddTeleportButton("鱼夫码头", Vector3.new(-50.147552, -24.555279, 1462.145996))
AddTeleportButton("农场", Vector3.new(-1268.339233, 2.572412, 2560.060303))
AddTeleportButton("监狱门口", Vector3.new(-1697.931885, 2.630666, 1284.567383))
AddTeleportButton("监狱广场", Vector3.new(-1600.602417, 2.631028, 1268.060059))
AddTeleportButton("代尔山", Vector3.new(847.062988, 194.115753, -326.212708))
AddTeleportButton("水帘洞(消星点)", Vector3.new(3040.956055, 109.688538, 2711.069336))
AddTeleportButton("大桥", Vector3.new(949.014954, 25.215754, 2897.654785))
AddTeleportButton("地图右下(消星点)", Vector3.new(-1651.38501, 2.414712, 3225.27832))
AddTeleportButton("下部加油站", Vector3.new(2270.378174, 2.630927, 154.161484))
AddTeleportButton("游戏厅", Vector3.new(2934.893799, 2.956458, 1693.660034))
AddTeleportButton("高尔夫", Vector3.new(2280.76709, 3.037836, 1982.3573))
AddTeleportButton("修船厂", Vector3.new(4096.405273, -30.401447, 2865.045166))

Tabs.TeleportTab:Section({ Title = "恭喜你 看到了彩蛋。然后呢你就看到彩蛋了。" })
AddTeleportButton("车辆经销商", Vector3.new(3719.9501953125, 3.0185735225677, -333.31185913086))
AddTeleportButton("医院", Vector3.new(3980.0910644531, 2.8760607242584, -138.79454040527))
AddTeleportButton("警察局", Vector3.new(3364.2731933594, 3.9188079834, -394.7233581543))
AddTeleportButton("圣奥里修车店", Vector3.new(2782.46875, 2.6309957504272, -418.59930419922))
AddTeleportButton("圣奥里银行", Vector3.new(3134.0541992188, 6.1160483360291, -171.36976623535))
AddTeleportButton("圣奥里服装店", Vector3.new(3617.9125976562, 3.1072206497192, -452.82064819336))
AddTeleportButton("圣奥里平民重生", Vector3.new(3741.1149902344, 3.7205736637115, -438.10598754883))
AddTeleportButton("圣奥里码头", Vector3.new(4527.65625, -23.968238830566, -280.59356689453))
AddTeleportButton("圣奥里餐饮店", Vector3.new(3182.4167480469, 3.0185918807983, 426.51791381836))
AddTeleportButton("消防部门", Vector3.new(3578.6760253906, 8.4088230133057, 579.65679931641))
AddTeleportButton("宠物店", Vector3.new(3678.237305, 3.01792, 693.114624))
AddTeleportButton("圣奥里大码头", Vector3.new(2736.307617, 2.630299, -1120.333008))
AddTeleportButton("圣奥里海滩桥下(消星点)", Vector3.new(3964.504395, -25.068211, -854.057251))

Tabs.TeleportTab:Section({ Title = "大景" })
AddTeleportButton("大景超级超市", Vector3.new(3936.582764, 3.038293, 1136.326416))
AddTeleportButton("转镜中心", Vector3.new(4152.919922, 2.631675, 941.446045))
AddTeleportButton("道路服务", Vector3.new(4271.33252, 2.628108, 1200.086914))
AddTeleportButton("大景餐饮店", Vector3.new(4476.997559, 3.037825, 906.802979))
AddTeleportButton("送货中心(美团外卖)", Vector3.new(4399.419434, 3.038999, 1609.455933))
AddTeleportButton("大景卖车店", Vector3.new(3434.377441, 42.931786, 2687.99707))

Tabs.TeleportTab:Section({ Title = "米尔顿" })
AddTeleportButton("米尔顿左上加油站", Vector3.new(1145.635742, 2.630916, -864.273682))
AddTeleportButton("米尔顿右下加油站", Vector3.new(-1646.802734, 2.630164, 1812.894653))
AddTeleportButton("米尔顿上方加油站", Vector3.new(-900.70166, 2.630927, 1124.683105))
AddTeleportButton("米尔顿居民区", Vector3.new(-528.565552, 2.630996, 1331.981689))

Tabs.TeleportTab:Section({ Title = "约克镇" })
AddTeleportButton("约克镇小银行", Vector3.new(-668.217224, 2.630995, -65.347839))
AddTeleportButton("约克镇修车厂", Vector3.new(-407.163025, 3.076807, -6.098211))
AddTeleportButton("约克镇枪店", Vector3.new(-323.869293, 3.037825, 37.14967))
AddTeleportButton("约克镇重生点", Vector3.new(-219.560318, 3.039824, -85.725433))
AddTeleportButton("约克镇当铺", Vector3.new(-168.513733, 3.039, -106.926529))
AddTeleportButton("约克镇卫星车", Vector3.new(-302.093567, 3.037825, -167.621017))
AddTeleportButton("约克镇中心点", Vector3.new(-275.995209, 2.630996, -139.985352))

Tabs.TeleportTab:Section({ Title = "莱斯维尔" })
AddTeleportButton("莱斯维尔餐饮店", Vector3.new(753.757812, 3.039824, 998.132996))
AddTeleportButton("莱斯维尔服装店", Vector3.new(820.745117, 2.766988, 1047.445679))
AddTeleportButton("莱斯维尔自由广场", Vector3.new(926.523376, 2.630995, 865.764771))
AddTeleportButton("莱斯维尔码头(游艇)", Vector3.new(947.84021, -22.529087, 1216.085693))

Tabs.SettingsTab:Section({ Title = "菜单设置" })

Tabs.SettingsTab:Toggle({
    Title = "自定义光标",
    Value = true,
    Callback = function(val) end
})

Tabs.BulletTab:Section({ Title = "追踪控制" })

Tabs.BulletTab:Toggle({
    Title = "启用子弹追踪",
    Value = false,
    Callback = function(val) ToggleBulletTrack(val) end
})

Tabs.BulletTab:Toggle({
    Title = "屏幕中心优先",
    Value = true,
    Callback = function(val) Toggles.ScreenPriority = val end
})

Tabs.BulletTab:Toggle({
    Title = "距离优先 (锁定最近)",
    Value = false,
    Callback = function(val) Toggles.DistancePriority = val end
})

LocalPlayer.CharacterAdded:Connect(function(newChar)
    Character = newChar
    task.wait(0.5)
    if Toggles.Noclip then
        for _, part in ipairs(newChar:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
    if Toggles.Hitbox then ApplyHitbox(Settings.HitboxSize) end
    if Toggles.AutoBus then StartAutoBus() end
    if Toggles.Taxi then ToggleTaxi(true) end
    if Toggles.KillAura then StartKillAura() end
    if Toggles.NoDizziness then StartNoDizziness() end
    SetupCharacter(newChar)
end)

Workspace.DescendantAdded:Connect(function(desc)
    if desc:IsA("ProximityPrompt") then
        desc.HoldDuration = Settings.HoldTime
        desc.MaxActivationDistance = Settings.Distance
    end
end)

Players.PlayerAdded:Connect(function(player)
    if Toggles.Whitelist then
        pcall(function()
            if player:IsFriendsWith(LocalPlayer.UserId) then
                FriendWhitelist[player.UserId] = true
            end
        end)
    end
end)

task.spawn(function()
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("ProximityPrompt") then
            obj.HoldDuration = 0
            obj.MaxActivationDistance = 25
        end
    end
end)

Window:Open()
loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/800b37d791e206468da59622707da3af.lua"))()
end)

Button(Tabjz, "最强战场", function()
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 420),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5, XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1, XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button
    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end
    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0, XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1, XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5, XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1, XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1, XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    InfoTab = Window:Tab({ Title = "信息" }),
    FFlagTab = Window:Tab({ Title = "FFlag执行器" }),
    ShiftTab = Window:Tab({ Title = "换挡锁修改" }),
    FreeTab = Window:Tab({ Title = "免费通行证" }),
    SupaTab = Window:Tab({ Title = "超级连招" }),
    KyotoTab = Window:Tab({ Title = "一键宏" }),
    LethalTab = Window:Tab({ Title = "致命连招" }),
    AbaTab = Window:Tab({ Title = "Aba连招" }),
    EmoteTab = Window:Tab({ Title = "表情冲刺" }),
    DashTab = Window:Tab({ Title = "侧身冲刺" }),
    LockTab = Window:Tab({ Title = "自瞄/视角锁定" }),
    AutoBlockTab = Window:Tab({ Title = "自动格挡" }),
    VisualTab = Window:Tab({ Title = "视觉效果" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer

Tabs.FFlagTab:Section({ Title = "系统设置" })

local exeMode = "Json"
Tabs.FFlagTab:Dropdown({
    Title = "执行模式",
    Values = {"Json", "RAW/URL"},
    Value = "Json",
    Callback = function(v) exeMode = v end
})

local flagName = ""
Tabs.FFlagTab:Input({
    Title = "FFlag名称",
    Value = "",
    Callback = function(v) flagName = v end
})

local flagInput = ""
Tabs.FFlagTab:Input({
    Title = "FFlag数据",
    Value = "",
    Callback = function(v) flagInput = v end
})

local function setFlg(flgNam, flgVal)
    local clnNam = flgNam:gsub("^DFFlag", ""):gsub("^FFlag", ""):gsub("^DFInt", ""):gsub("^FInt", ""):gsub("^DFString", ""):gsub("^FString", "")
    pcall(function() setfflag(tostring(clnNam), tostring(flgVal)) end)
end

local function loadFlg(jsnDat)
    local suc, dec = pcall(HttpService.JSONDecode, HttpService, jsnDat)
    if not suc then return end
    for n, v in pairs(dec) do
        setFlg(n, v)
    end
end

Tabs.FFlagTab:Button({
    Title = "执行",
    Callback = function()
        if exeMode == "Json" then
            loadFlg(flagInput)
        elseif exeMode == "RAW/URL" then
            local suc, res = pcall(game.HttpGet, game, flagInput)
            if suc then loadFlg(res) end
        end
    end
})

local player = LocalPlayer
local gui = player:WaitForChild("PlayerGui")
local shiftlock = gui:FindFirstChild("MobileShiftlockCursor", 5)
local cursor = shiftlock and shiftlock:FindFirstChild("CursorImage")
local originalImage = cursor and cursor.Image or "rbxassetid://15444391295"
local finalImage = ""
local isOverriding = false

if cursor then
    cursor:GetPropertyChangedSignal("Image"):Connect(function()
        if isOverriding and cursor.Image ~= finalImage then
            cursor.Image = finalImage
        end
    end)
end

local function applyShiftlock(imgUrl, assetName)
    if not cursor then return end
    isOverriding = true
    if imgUrl:match("^http") then
        if isfile and isfile(assetName) then
            finalImage = getcustomasset(assetName)
        else
            local suc, imgData = pcall(game.HttpGet, game, imgUrl)
            if suc and writefile and isfile then
                writefile(assetName, imgData)
                finalImage = getcustomasset(assetName)
            else
                finalImage = imgUrl
            end
        end
    else
        finalImage = imgUrl
    end
    cursor.Image = finalImage
end

Tabs.ShiftTab:Section({ Title = "配置" })

Tabs.ShiftTab:Button({
    Title = "重置为默认",
    Callback = function()
        isOverriding = false
        if cursor then
            cursor.Image = originalImage
        end
    end
})

local repoFiles = {}
local loading = false
local loadIndex = 1

local function fetchRepoFiles()
    if #repoFiles > 0 or loading then return true end
    loading = true
    local suc, res = pcall(game.HttpGet, game, "https://api.github.com/repos/Zuriyx/Shiftlock/contents/")
    loading = false
    if suc then
        local suc2, dec = pcall(HttpService.JSONDecode, HttpService, res)
        if suc2 and type(dec) == "table" then
            for _, file in ipairs(dec) do
                if file.type == "file" and (file.name:sub(-4) == ".png" or file.name:sub(-4) == ".jpg" or file.name:sub(-5) == ".jpeg") then
                    table.insert(repoFiles, file)
                end
            end
            return true
        end
    end
    return false
end

Tabs.ShiftTab:Button({
    Title = "加载图片库 (5张)",
    Callback = function()
        task.spawn(function()
            local ready = fetchRepoFiles()
            if not ready or #repoFiles == 0 then return end
            
            local max = math.min(loadIndex + 4, #repoFiles)
            for i = loadIndex, max do
                local file = repoFiles[i]
                local name = file.name:gsub("%.png$", ""):gsub("%.jpg$", ""):gsub("%.jpeg$", "")
                local url = file.download_url
                local assetName = "sl_" .. file.name
                
                local localImg = url
                if isfile and writefile and getcustomasset then
                    if not isfile(assetName) then
                        pcall(function() writefile(assetName, game:HttpGet(url)) end)
                    end
                    if isfile(assetName) then
                        localImg = getcustomasset(assetName)
                    end
                end

                Tabs.ShiftTab:Paragraph({
                    Title = name,
                    Desc = "",
                    Image = localImg,
                    ImageSize = 64,
                })

                Tabs.ShiftTab:Button({
                    Title = "设置此图标",
                    Callback = function()
                        applyShiftlock(url, assetName)
                    end
                })
            end
            
            loadIndex = max + 1
            if loadIndex > #repoFiles then
                loadIndex = 1
            end
        end)
    end
})

Tabs.FreeTab:Section({ Title = "解锁通行证" })

Tabs.FreeTab:Button({
    Title = "解锁VIP服务器拥有者",
    Callback = function()
        workspace:SetAttribute("VIPServer", tostring(LocalPlayer.UserId))
        workspace:SetAttribute("VIPServerOwner", LocalPlayer.Name)
    end
})

Tabs.FreeTab:Button({
    Title = "解锁额外槽位",
    Callback = function()
        RunService.RenderStepped:Connect(function()
            if LocalPlayer then
                LocalPlayer:SetAttribute("ExtraSlots", true)
            end
        end)
    end
})

Tabs.FreeTab:Button({
    Title = "解锁表情搜索栏",
    Callback = function()
        RunService.RenderStepped:Connect(function()
            if LocalPlayer then
                LocalPlayer:SetAttribute("EmoteSearchBar", true)
            end
        end)
    end
})

Tabs.FreeTab:Button({
    Title = "解锁额外表情页面",
    Callback = function()
        RunService.RenderStepped:Connect(function()
            if LocalPlayer then
                LocalPlayer:SetAttribute("EmotePages", true)
            end
        end)
    end
})

Tabs.FreeTab:Section({ Title = "解锁装扮" })

Tabs.FreeTab:Button({
    Title = "解锁所有表情",
    Callback = function()
    end
})

Tabs.FreeTab:Button({
    Title = "解锁所有称号/装扮/光环",
    Callback = function()
    end
})

local supaEnabled = false
local legitHeightEnabled = false
local lockTiltEnabled = false
local shakeEnabled = true
local cancelOnEvasiveEnabled = false

Tabs.SupaTab:Section({ Title = "超级连招 V2" })

Tabs.SupaTab:Toggle({
    Title = "启用超级连招",
    Value = false,
    Callback = function(state)
        supaEnabled = state
    end
})

Tabs.SupaTab:Toggle({
    Title = "合法高度检测",
    Desc = "如果敌人飞太高则取消连招",
    Value = false,
    Callback = function(state)
        legitHeightEnabled = state
    end
})

Tabs.SupaTab:Toggle({
    Title = "锁定玩家倾斜",
    Value = false,
    Callback = function(state)
        lockTiltEnabled = state
    end
})

Tabs.SupaTab:Toggle({
    Title = "启用震动效果",
    Value = true,
    Callback = function(state)
        shakeEnabled = state
    end
})

Tabs.SupaTab:Toggle({
    Title = "检测到闪避则取消",
    Value = false,
    Callback = function(state)
        cancelOnEvasiveEnabled = state
    end
})

local sideDashDelay = 2.27
local lethalDelay = 0

Tabs.KyotoTab:Section({ Title = "一键宏设置" })

Tabs.KyotoTab:Input({
    Title = "侧身冲刺延迟 (秒)",
    Value = tostring(sideDashDelay),
    Callback = function(val)
        local num = tonumber(val)
        if num then sideDashDelay = num end
    end
})

Tabs.KyotoTab:Input({
    Title = "致命旋风延迟 (秒)",
    Value = tostring(lethalDelay),
    Callback = function(val)
        local num = tonumber(val)
        if num then lethalDelay = num end
    end
})

Tabs.KyotoTab:Button({
    Title = "执行一键宏",
    Callback = function()
        local char = LocalPlayer.Character
        if not char then return end
        local backpack = LocalPlayer:FindFirstChild("Backpack")
        
        local flowingWater = (backpack and backpack:FindFirstChild("Flowing Water")) or (char and char:FindFirstChild("Flowing Water"))
        local lethalWhirlwind = (backpack and backpack:FindFirstChild("Lethal Whirlwind Stream")) or (char and char:FindFirstChild("Lethal Whirlwind Stream"))
        
        if flowingWater and char:FindFirstChild("Communicate") then
            char.Communicate:FireServer({Tool = flowingWater, Goal = "Console Move"})
        end
        
        task.wait(sideDashDelay)
        
        local cam = workspace.CurrentCamera
        cam.CFrame = cam.CFrame * CFrame.Angles(0, math.rad(90), 0)
        if char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(90), 0)
        end
        
        game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.D, false, game)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.Q, false, game)
        game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.Q, false, game)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.D, false, game)
        
        local newPos = cam.CFrame.Position + cam.CFrame.RightVector * 10
        cam.CFrame = CFrame.new(newPos, newPos + cam.CFrame.LookVector)
        
        if lethalDelay > 0 then
            task.wait(lethalDelay)
        end
        
        if lethalWhirlwind and char:FindFirstChild("Communicate") then
            char.Communicate:FireServer({Tool = lethalWhirlwind, Goal = "Console Move"})
            task.wait(1)
            char.Communicate:FireServer({Goal = "Auto Use End", Tool = lethalWhirlwind})
        end
    end
})

local lethalEnabled = false
local lethalConn = nil
local animId = "rbxassetid://12296113986"

Tabs.LethalTab:Section({ Title = "致命连招" })

Tabs.LethalTab:Toggle({
    Title = "启用致命连招",
    Value = false,
    Callback = function(state)
        lethalEnabled = state
        if state then
            local char = LocalPlayer.Character
            if not char then return end
            local hum = char:FindFirstChildOfClass("Humanoid")
            if not hum then return end
            
            lethalConn = hum.AnimationPlayed:Connect(function(animTrack)
                if animTrack.Animation and animTrack.Animation.AnimationId == animId then
                    task.wait(1.7)
                    local char2 = LocalPlayer.Character
                    if char2 then
                        local hrp = char2:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            hrp.AssemblyLinearVelocity = Vector3.new(0, 64, 0)
                        end
                    end
                end
            end)
        else
            if lethalConn then
                lethalConn:Disconnect()
                lethalConn = nil
            end
        end
    end
})

Tabs.AbaTab:Section({ Title = "连招" })

Tabs.AbaTab:Toggle({
    Title = "显示按钮",
    Value = false,
    Callback = function(v) end
})

Tabs.AbaTab:Toggle({
    Title = "按钮可拖动",
    Value = false,
    Callback = function(v) end
})

Tabs.AbaTab:Toggle({
    Title = "启用转身",
    Value = false,
    Callback = function(v) end
})

Tabs.AbaTab:Button({
    Title = "执行连招",
    Callback = function()
        local char = LocalPlayer.Character
        if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hum then return end
        
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        
        for _, track in pairs(hum:GetPlayingAnimationTracks()) do
            track:Stop()
        end
        
        local anim = Instance.new("Animation")
        anim.AnimationId = "rbxassetid://10480793962"
        local track = hum:LoadAnimation(anim)
        track:Play()
        
        local bv = Instance.new("BodyVelocity")
        bv.Velocity = hrp.CFrame.RightVector * 38 + Vector3.new(0, 8, 0)
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.Parent = hrp
        task.delay(0.27, function() bv:Destroy() end)
        
        local cam = workspace.CurrentCamera
        cam.CFrame = cam.CFrame * CFrame.Angles(0, math.rad(70), 0)
        
        task.wait(0.003)
        game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.Q, false, game)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.Q, false, game)
    end
})

Tabs.EmoteTab:Section({ Title = "表情冲刺" })

Tabs.EmoteTab:Toggle({
    Title = "显示按钮",
    Value = false,
    Callback = function(v) end
})

Tabs.EmoteTab:Toggle({
    Title = "按钮可拖动",
    Value = false,
    Callback = function(v) end
})

Tabs.EmoteTab:Button({
    Title = "执行表情冲刺",
    Callback = function()
        local char = LocalPlayer.Character
        if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hum then return end
        
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        
        for _, track in pairs(hum:GetPlayingAnimationTracks()) do
            track:Stop()
        end
        
        local anim = Instance.new("Animation")
        anim.AnimationId = "rbxassetid://10480793962"
        local track = hum:LoadAnimation(anim)
        track:Play()
        
        local cam = workspace.CurrentCamera
        cam.CFrame = cam.CFrame * CFrame.Angles(0, math.rad(90), 0)
        
        local bv = Instance.new("BodyVelocity")
        bv.Velocity = hrp.CFrame.RightVector * 38 + Vector3.new(0, 8, 0)
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.Parent = hrp
        task.delay(0.27, function() bv:Destroy() end)
    end
})

local dashEnabled = false

Tabs.DashTab:Section({ Title = "侧身冲刺辅助" })

Tabs.DashTab:Toggle({
    Title = "启用侧身冲刺辅助",
    Value = false,
    Callback = function(state)
        dashEnabled = state
    end
})

Tabs.DashTab:Button({
    Title = "侧身冲刺 V2",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Zuriyx/Techs/refs/heads/main/Side-Dash-Assist-V2.txt"))()
    end
})

Tabs.DashTab:Button({
    Title = "侧身冲刺 V3",
    Callback = function()
        loadstring(game:HttpGet("https://api.getpolsec.com/scripts/hosted/23bcf4264b586dc93b16a9b054eddae259938b7421ac5096353079b2e9d74e24.lua"))()
    end
})

local lockSettings = {
    Enabled = false,
    TargetPart = "HumanoidRootPart",
    Mode = "视角锁定",
    MaxDistance = 200
}

Tabs.LockTab:Section({ Title = "设置" })

Tabs.LockTab:Dropdown({
    Title = "模式",
    Values = {"视角锁定", "自瞄"},
    Value = "视角锁定",
    Callback = function(v)
        lockSettings.Mode = v
    end
})

Tabs.LockTab:Dropdown({
    Title = "锁定部位",
    Values = {"HumanoidRootPart", "Head", "Torso"},
    Value = "HumanoidRootPart",
    Callback = function(v)
        lockSettings.TargetPart = v
    end
})

Tabs.LockTab:Toggle({
    Title = "显示按钮",
    Value = false,
    Callback = function(v) end
})

Tabs.LockTab:Toggle({
    Title = "按钮可拖动",
    Value = false,
    Callback = function(v) end
})

local blockEnabled = false
local blockDistance = 15

Tabs.AutoBlockTab:Section({ Title = "自动格挡" })

Tabs.AutoBlockTab:Toggle({
    Title = "启用自动格挡",
    Value = false,
    Callback = function(state)
        blockEnabled = state
        if state then
            task.spawn(function()
                while blockEnabled do
                    task.wait(0.05)
                    local char = LocalPlayer.Character
                    if not char then break end
                    local rootPos = char:FindFirstChild("HumanoidRootPart")
                    if not rootPos then break end
                    
                    local liveFolder = workspace:FindFirstChild("Live")
                    if not liveFolder then break end
                    
                    for _, model in pairs(liveFolder:GetChildren()) do
                        if model:IsA("Model") and model ~= char then
                            local humanoid = model:FindFirstChildOfClass("Humanoid")
                            local hrp = model:FindFirstChild("HumanoidRootPart")
                            if humanoid and hrp and humanoid.Health > 0 then
                                local dist = (hrp.Position - rootPos.Position).Magnitude
                                if dist <= blockDistance then
                                    local animator = humanoid:FindFirstChild("Animator")
                                    if animator then
                                        for _, track in pairs(animator:GetPlayingAnimationTracks()) do
                                            if track.Animation and track.Animation.AnimationId then
                                                local animId = track.Animation.AnimationId:match("%d+")
                                                if animId then
                                                    local detectIDs = {
                                                        ["10469493270"]=true,["10469630950"]=true,["10469639222"]=true,
                                                        ["10469643643"]=true,["13532562418"]=true,["13532600125"]=true,
                                                        ["13294471966"]=true,["13491635433"]=true,["13296577783"]=true,
                                                    }
                                                    if detectIDs[animId] and track.TimePosition <= 0.08 then
                                                        local comms = char:FindFirstChild("Communicate")
                                                        if comms then
                                                            comms:FireServer({Goal = "KeyPress", Key = Enum.KeyCode.F})
                                                            task.wait(0.2)
                                                            comms:FireServer({Goal = "KeyRelease", Key = Enum.KeyCode.F})
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
})

Tabs.AutoBlockTab:Toggle({
    Title = "格挡后自动攻击",
    Value = false,
    Callback = function(state) end
})

Tabs.AutoBlockTab:Input({
    Title = "格挡距离范围",
    Value = "15",
    Callback = function(v)
        local num = tonumber(v)
        if num then blockDistance = num end
    end
})

Tabs.VisualTab:Section({ Title = "特效" })

Tabs.VisualTab:Dropdown({
    Title = "选择特效",
    Values = {"无", "奇犽", "虎杖", "火焰", "五条悟"},
    Value = "无",
    Callback = function(val) end
})

Tabs.VisualTab:Toggle({
    Title = "无头",
    Value = false,
    Callback = function(state)
        if state then
            local char = LocalPlayer.Character
            if not char then return end
            local hum = char:FindFirstChildOfClass("Humanoid")
            if not hum then return end
            
            if hum.RigType ~= Enum.HumanoidRigType.R6 then
                return
            end
            
            for _, track in pairs(hum:GetPlayingAnimationTracks()) do
                track:Stop()
                track:Destroy()
            end
            
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://68433924"
            local track = hum:LoadAnimation(anim)
            track:Play()
            track:AdjustSpeed(0)
            
            RunService.Heartbeat:Connect(function()
                if not track or not track.Parent then return end
                track:Play(0, 0, 0)
                track:AdjustSpeed(0)
            end)
        end
    end
})

Window:Open()
end)

Button(Tabjz, "渴求的吸血鬼", function()
    local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"
))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 400),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5,  XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button

    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end

    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5,  XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    FarmTab = Window:Tab({ Title = "功能" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

local vars = getgenv().vars or {
    Enabled = false,
    MaxDistance = 20,
    ESPEnabled = true,
}

local Main = getgenv().Main or {
    connections = {},
    services = {
        RunService = game:GetService("RunService"),
        Players = game:GetService("Players"),
        Teams = game:GetService("Teams"),
    }
}

for i, v in next, Main.connections do
    v:Disconnect()
end
Main.connections = {}

local Services = Main.services
local Players = Services.Players
local RunService = Services.RunService
local Teams = Services.Teams
local lp = Players.LocalPlayer

local currentTarget = nil
local currentHighlight = nil

local function clearESP()
    if currentHighlight then
        currentHighlight:Destroy()
        currentHighlight = nil
    end
end

local function setTarget(player)
    if player == currentTarget then return end
    currentTarget = player
    clearESP()
    if not vars.ESPEnabled then return end
    if not player or not player.Character then return end
    local char = player.Character
    local highlight = Instance.new("Highlight")
    highlight.Name = "XIONTargetESP"
    highlight.Adornee = char
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    highlight.Parent = char
    currentHighlight = highlight
end

local function isEnemy(p)
    if p == lp then return false end
    if not p.Character then return false end
    local hrp = p.Character:FindFirstChild("HumanoidRootPart")
    local hum = p.Character:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum or hum.Health <= 0 then return false end
    if Teams and lp.Team and p.Team and p.Team == lp.Team then return false end
    return true
end

local function getClosestEnemy(maxDistance)
    local char = lp.Character
    if not char then return nil end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    local closestPlayer = nil
    local closestDist = nil
    for _, plr in next, Players:GetPlayers() do
        if isEnemy(plr) then
            local thrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
            if thrp then
                local dist = (hrp.Position - thrp.Position).Magnitude
                if dist <= maxDistance and (not closestDist or dist < closestDist) then
                    closestDist = dist
                    closestPlayer = plr
                end
            end
        end
    end
    return closestPlayer
end

local function getVampireRemote()
    local char = lp.Character
    if not char then return nil end
    local vamp = char:FindFirstChild("Vampire")
    if not vamp then return nil end
    return vamp:FindFirstChild("VampireEvent")
end

local function vampireInit()
    local char = lp.Character or lp.CharacterAdded:Wait()
    local vamp = char:WaitForChild("Vampire")
    local remote = vamp:WaitForChild("VampireEvent")
    for _, v in next, {"Charging", "CancelCharging", "Punch"} do
        remote:FireServer(v)
    end
end

Tabs.FarmTab:Section({ Title = "战斗功能" })

Tabs.FarmTab:Toggle({
    Title = "远程攻击",
    Value = vars.Enabled,
    Callback = function(state)
        vars.Enabled = state
        if state then
            task.spawn(function() pcall(vampireInit) end)
        else
            setTarget(nil)
        end
    end
})

Tabs.FarmTab:Slider({
    Title = "攻击距离",
    Value = { Min = 5, Max = 100, Default = vars.MaxDistance },
    Callback = function(value)
        vars.MaxDistance = value
    end
})

Tabs.FarmTab:Toggle({
    Title = "显示目标高亮",
    Value = vars.ESPEnabled,
    Callback = function(state)
        vars.ESPEnabled = state
        if not state then
            setTarget(nil)
        elseif currentTarget then
            setTarget(currentTarget)
        end
    end
})

local hbConn = RunService.Heartbeat:Connect(function()
    if not vars.Enabled then
        setTarget(nil)
        return
    end

    local char = lp.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local remote = getVampireRemote()
    if not remote then return end

    local target = getClosestEnemy(vars.MaxDistance or 20)
    setTarget(target)

    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        remote:FireServer("PunchHit", { hit = target.Character.HumanoidRootPart })
    end
end)

table.insert(Main.connections, hbConn)
end)

Button(Tabjz, "po大po", function()
    local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"
))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 400),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5,  XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button

    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end

    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5,  XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    FarmTab = Window:Tab({ Title = "功能" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

local autoPoopThread = nil
local autoPacketThread = nil
local autoShopBuyThread = nil
local autoUseConsumablesThread = nil

local SHOP_BUY_BUFFERS = {
    "\n\v\aLettuce\000",
    "\n\v\fGlazed Donut\000",
    "\n\v\tHot Sauce\000",
    "\n\v\004Cola\000",
    "\n\v\006Banana\000",
    "\n\v\004Milk\000",
    "\n\v\fGolden Apple\000",
    "\n\v\fEnergy Drink\000",
    "\n\v\005Pizza\000",
}

local SHOP_ITEM_NAMES = {
    "Lettuce",
    "Glazed Donut",
    "Hot Sauce",
    "Cola",
    "Banana",
    "Milk",
    "Golden Apple",
    "Energy Drink",
    "Pizza",
}

local function getRemote()
    return game:GetService("ReplicatedStorage"):WaitForChild("Packets"):WaitForChild("Packet"):WaitForChild("RemoteEvent")
end

local function countShopItemTools(itemName)
    local lp = game.Players.LocalPlayer
    local n = 0
    for _, child in ipairs(lp.Backpack:GetChildren()) do
        if child:IsA("Tool") and child.Name == itemName then
            n = n + 1
        end
    end
    if lp.Character then
        for _, child in ipairs(lp.Character:GetChildren()) do
            if child:IsA("Tool") and child.Name == itemName then
                n = n + 1
            end
        end
    end
    return n
end

local function tryUseShopItemTool(itemName)
    local lp = game.Players.LocalPlayer
    local char = lp.Character
    local hum = char and char:FindFirstChildWhichIsA("Humanoid")
    if not hum then return false end
    local tool = lp.Backpack:FindFirstChild(itemName)
    if not tool or not tool:IsA("Tool") then
        tool = char and char:FindFirstChild(itemName)
    end
    if not tool or not tool:IsA("Tool") then return false end
    pcall(function() hum:EquipTool(tool) end)
    task.wait(0.05)
    pcall(function() tool:Activate() end)
    return true
end

Tabs.FarmTab:Section({ Title = "自动功能" })

Tabs.FarmTab:Toggle({
    Title = "自动拉屎。",
    Value = false,
    Callback = function(state)
        if autoPoopThread then
            task.cancel(autoPoopThread)
            autoPoopThread = nil
        end
        if state then
            autoPoopThread = task.spawn(function()
                while true do
                    local args = { buffer.fromstring("\000\000\000\000") }
                    getRemote():FireServer(table.unpack(args))
                    task.wait(0.6)
                end
            end)
        end
    end
})

Tabs.FarmTab:Toggle({
    Title = "自动售卖",
    Value = false,
    Callback = function(state)
        if autoPacketThread then
            task.cancel(autoPacketThread)
            autoPacketThread = nil
        end
        if state then
            autoPacketThread = task.spawn(function()
                while true do
                    local args = { buffer.fromstring("\003\000") }
                    getRemote():FireServer(table.unpack(args))
                    task.wait(0.4)
                end
            end)
        end
    end
})

Tabs.FarmTab:Toggle({
    Title = "自动购买商店物品",
    Value = false,
    Callback = function(state)
        if autoShopBuyThread then
            task.cancel(autoShopBuyThread)
            autoShopBuyThread = nil
        end
        if state then
            autoShopBuyThread = task.spawn(function()
                local remote = getRemote()
                while true do
                    for _, bufStr in ipairs(SHOP_BUY_BUFFERS) do
                        remote:FireServer(buffer.fromstring(bufStr))
                    end
                    task.wait(10)
                end
            end)
        end
    end
})

Tabs.FarmTab:Toggle({
    Title = "自动使用商店物品",
    Value = false,
    Callback = function(state)
        if autoUseConsumablesThread then
            task.cancel(autoUseConsumablesThread)
            autoUseConsumablesThread = nil
        end
        if state then
            autoUseConsumablesThread = task.spawn(function()
                while true do
                    for _, itemName in ipairs(SHOP_ITEM_NAMES) do
                        if countShopItemTools(itemName) >= 1 then
                            tryUseShopItemTool(itemName)
                            task.wait(0.25)
                        end
                    end
                    task.wait(1)
                end
            end)
        end
    end
})
end)

Button(Tabjz, "(智商177小孩服务器)不可能的Obby+VIP Obby", function()
    local g = game
local Workspace = g:GetService("Workspace")
local ReplicatedStorage = g:GetService("ReplicatedStorage")

--// 服务器检测
local TARGET_PLACE_ID = 115787580785894 -- 目标服务器ID
local currentPlaceId = game.PlaceId

if currentPlaceId ~= TARGET_PLACE_ID then
    -- 创建绿色系提示弹窗 (右下角划出)
    local function showErrorPopup()
        local screenGui = Instance.new("ScreenGui")
        screenGui.Name = "ErrorPopup"
        screenGui.ResetOnSpawn = false
        screenGui.Parent = g:GetService("CoreGui")
        
        -- 主框架 - 从右下角滑入
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 350, 0, 80)
        frame.Position = UDim2.new(1, 10, 1, -90) -- 初始位置在右下角外部
        frame.BackgroundColor3 = Color3.fromRGB(0, 10, 0)
        frame.BackgroundTransparency = 0.15
        frame.BorderSizePixel = 0
        frame.Parent = screenGui
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 12)
        corner.Parent = frame
        
        -- 绿色边框
        local border = Instance.new("Frame")
        border.Size = UDim2.new(1, 8, 1, 8)
        border.Position = UDim2.new(0, -4, 0, -4)
        border.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
        border.BackgroundTransparency = 0.25
        border.BorderSizePixel = 0
        border.ZIndex = 0
        border.Parent = frame
        
        local borderCorner = Instance.new("UICorner")
        borderCorner.CornerRadius = UDim.new(0, 12)
        borderCorner.Parent = border
        
        local borderGrad = Instance.new("UIGradient")
        borderGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 43, 0)),
            ColorSequenceKeypoint.new(0.25, Color3.fromRGB(10, 92, 10)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(27, 155, 27)),
            ColorSequenceKeypoint.new(0.75, Color3.fromRGB(74, 222, 128)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 43, 0))
        })
        borderGrad.Parent = border
        
        -- 图标 (绿色叉号)
        local icon = Instance.new("TextLabel")
        icon.Size = UDim2.new(0, 50, 1, 0)
        icon.Position = UDim2.new(0, 10, 0, 0)
        icon.BackgroundTransparency = 1
        icon.Text = "X"
        icon.TextColor3 = Color3.fromRGB(0, 255, 100)
        icon.TextSize = 40
        icon.Font = Enum.Font.Cartoon
        icon.TextXAlignment = Enum.TextXAlignment.Center
        icon.TextYAlignment = Enum.TextYAlignment.Center
        icon.Parent = frame
        
        -- 文字
        local title = Instance.new("TextLabel")
        title.Size = UDim2.new(1, -70, 1, 0)
        title.Position = UDim2.new(0, 60, 0, 0)
        title.BackgroundTransparency = 1
        title.Text = "此服务器不可使用"
        title.TextColor3 = Color3.fromRGB(0, 255, 100)
        title.TextSize = 24
        title.Font = Enum.Font.Cartoon
        title.TextXAlignment = Enum.TextXAlignment.Left
        title.TextYAlignment = Enum.TextYAlignment.Center
        title.Parent = frame
        
        -- 滑入动画
        local startPos = frame.Position
        local endPos = UDim2.new(1, -370, 1, -90)
        frame.Position = startPos
        
        -- 平滑滑入
        local tweenService = g:GetService("TweenService")
        local tweenInfo = TweenInfo.new(
            0.5,
            Enum.EasingStyle.Quad,
            Enum.EasingDirection.Out
        )
        local tween = tweenService:Create(frame, tweenInfo, {Position = endPos})
        tween:Play()
        
        -- 3秒后滑出消失
        task.wait(3)
        
        -- 滑出动画
        local outTween = tweenService:Create(frame, tweenInfo, {Position = startPos})
        outTween:Play()
        outTween.Completed:Connect(function()
            screenGui:Destroy()
        end)
    end
    
    showErrorPopup()
    return -- 停止执行后续代码
end

--// 以下为原AC6代码 (只有在目标服务器才会执行)
local INJECT = g:GetService("TestService")
local REMOTE = "AC6_FE_Sounds"

--// varbs
local NotificationLibrary = loadstring(g:HttpGet("https://raw.githubusercontent.com/Roblox-HttpSpy/AC6-Music-Exploit/refs/heads/main/notif.luau"))()
local Chars = "qwertyuiopasdfghjklzxcvbnm"
local Random = Random.new()
local loopState, isDragging = true, false
local typof, Udim2, Color, ref = typeof, UDim2.new, Color3.new, {}
local eep, make, call, font = task.wait, Instance.new, pcall, Font.fromEnum(Enum.Font.Cartoon)
local split, tonum, ismatch = task.spawn, tonumber, string.match

--// 绿色系渐变
local gradcolor = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 43, 0)),
	ColorSequenceKeypoint.new(0.2, Color3.fromRGB(10, 92, 10)),
	ColorSequenceKeypoint.new(0.4, Color3.fromRGB(27, 155, 27)),
	ColorSequenceKeypoint.new(0.6, Color3.fromRGB(74, 222, 128)),
	ColorSequenceKeypoint.new(0.8, Color3.fromRGB(34, 197, 94)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 43, 0))
})

--// functions
local function RandomName()
	local length = Random:NextInteger(5, 10)
	local mode = Random:NextInteger(1, 3)
	local secondCapIndex
	if mode == 1 then
		secondCapIndex = Random:NextInteger(2, length)
	end
	local result = table.create(length)
	for i = 1, length do
		local index = Random:NextInteger(1, 26)
		local char = string.char(Chars:byte(index))
		if (mode == 1 and (i == 1 or i == secondCapIndex)) or (mode == 2 and i == 1) then
			char = string.upper(char)
		end
		result[i] = char
	end
	return table.concat(result)
end

local function formatAssetId(input)
	if ismatch(input, "^rbxassetid://")
		or ismatch(input, "^rbxasset://")
		or ismatch(input, "^rbxgameasset://")
		or ismatch(input, "^rbxhttp://") then
		return input
	end
	local id = ismatch(input, "/asset/(%d+)")
	return "rbxassetid://" .. (id or input)
end

local function toNumber(value, default)
	return tonumber(value) or default
end

local function notify(typ, msg, duration)
	NotificationLibrary:SendNotification(typ, msg, duration)
end

local function Query(name, parent)
	local results = parent:QueryDescendants(">>RemoteEvent#" .. name)
	return results[1]
end

local function getremote()
	return Query(REMOTE, Workspace)
		or Query(REMOTE, ReplicatedStorage)
end

local function firesound(remote, name, assetId, pitch, volume, looped)
	remote:FireServer("newSound", name, INJECT, assetId, pitch, volume, looped)
	remote:FireServer("playSound", name)
end

local function hiddengui()
	local ok, core = call(gethui)
	if ok and core then
		return core
	end
	return g:GetService("CoreGui")
end

local function insertgrad(par)
	local grad = make("UIGradient", par)
	grad.Rotation = 0
	grad.Color = gradcolor
	split(function()
		while eep(0.03) do
			grad.Rotation = (grad.Rotation + 1) % 360
		end
	end)
end

local function create(class, props, parent)
    local instance = make(class)
    if props then
        for key, value in props do
            if typof(key) == "number" and typof(value) == "Instance" then
                value.Parent = instance
            else
                local success, err = call(function()
                    instance[key] = value
                end)
                if not success then
                end
            end
        end
    end
    if parent then
        instance.Parent = parent
    end
    return instance
end

--// UI
local gooey = hiddengui()
local gui = create("ScreenGui", {
	Name = RandomName(),
	ResetOnSpawn = false,
}, gooey)

local folder = create("Folder", ref, gui)

local OhNo = create("Sound", {
	SoundId = "rbxassetid://9066167010",
	Volume = 1,
}, folder)

local Click = create("Sound", {
	SoundId = "rbxassetid://156785206",
	Volume = 1,
}, folder)

local main = create("Frame", {
	Size = Udim2(0, 400, 0, 250),
	Position = Udim2(0.5, -200, 0.5, -125),
	BackgroundColor3 = Color(0, 0, 0),
	BackgroundTransparency = 0.85,
	create("UICorner", ref),
	create("UIDragDetector", ref),
}, gui)

--// 边框
local border = create("Frame", {
	Size = Udim2(1, 10, 1, 10),
	Position = Udim2(0, -5, 0, -5),
	BackgroundColor3 = Color(0, 255, 100),
	BackgroundTransparency = 0.3,
	ZIndex = 0,
	create("UICorner", ref)
}, main) insertgrad(border)

--// 内边框发光
local innerBorder = create("Frame", {
	Size = Udim2(1, -4, 1, -4),
	Position = Udim2(0, 2, 0, 2),
	BackgroundColor3 = Color(0, 255, 100),
	BackgroundTransparency = 0.15,
	ZIndex = 0,
	create("UICorner", ref)
}, main)

local title = create("TextLabel", {
	Size = Udim2(1, 0, 0, 40),
	BackgroundTransparency = 1,
	Text = "XION 音乐播放器",
	FontFace = font,
	TextSize = 28,
	TextColor3 = Color(0, 255, 100),
}, main) insertgrad(title)

local textBox = create("TextBox", {
	Size = Udim2(0.8, 0, 0, 40),
	Position = Udim2(0.1, 0, 0.3, 0),
	BackgroundColor3 = Color(0, 0, 0),
	BackgroundTransparency = 0.7,
	TextColor3 = Color(0, 255, 100),
	PlaceholderText = "输入音乐ID (直接输入数字或完整链接)",
	PlaceholderColor3 = Color(100, 150, 100),
	Text = "",
	FontFace = font,
	TextSize = 20,
	TextWrap = true,
	create("UICorner", ref)
}, main)

local function createBox(size, pos, placeholder)
	local box = create("TextBox", {
		Size = size,
		Position = pos,
		BackgroundColor3 = Color(0, 0, 0),
		BackgroundTransparency = 0.7,
		TextColor3 = Color(0, 255, 100),
		PlaceholderText = placeholder,
		PlaceholderColor3 = Color(100, 150, 100),
		Text = "",
		FontFace = font,
		TextSize = 18,
		ClearTextOnFocus = false,
		TextWrapped = true,
		create("UICorner"),
	}, main)
	return box
end

local volumeBox = createBox(Udim2(0.25,0,0,35), Udim2(0.1,0,0.6,0), "音量/最大为inf")
local pitchBox = createBox(Udim2(0.25,0,0,35), Udim2(0.65,0,0.6,0), "音调")

local loopBox = create("TextButton", {
	Size = Udim2(0.25, 0, 0, 35),
	Position = Udim2(0.375, 0, 0.6, 0),
	BackgroundColor3 = Color(0, 0, 0),
	BackgroundTransparency = 0.7,
	TextColor3 = Color(0, 255, 100),
	FontFace = font,
	TextSize = 18,
	RichText = true,
	Text = "循环播放 <font color='rgb(0,255,100)'>开启</font>",
	create("UICorner"),
}, main)

local button = create("TextButton", {
	Size = Udim2(0.3, 0, 0, 35),
	Position = Udim2(0.35, 0, 0.8, 0),
	BackgroundColor3 = Color(0, 0, 0),
	BackgroundTransparency = 0.7,
	TextColor3 = Color(0, 255, 100),
	Text = "播放",
	FontFace = font,
	TextSize = 22,
	create("UICorner"),
}, main)

--// 按钮悬停发光效果
button.MouseEnter:Connect(function()
	button.BackgroundTransparency = 0.4
end)
button.MouseLeave:Connect(function()
	button.BackgroundTransparency = 0.7
end)

--// 缩小按钮 (改成 - )
local closeButton = create("TextButton", {
	Size = Udim2(0, 30, 0, 30),
	Position = Udim2(1, -35, 0, 5),
	BackgroundColor3 = Color(0, 0, 0),
	BackgroundTransparency = 0.7,
	TextColor3 = Color(255, 255, 255),
	Text = "−",
	FontFace = font,
	TextSize = 28,
	create("UICorner"),
}, main)

closeButton.MouseEnter:Connect(function()
	closeButton.BackgroundTransparency = 0.4
end)
closeButton.MouseLeave:Connect(function()
	closeButton.BackgroundTransparency = 0.7
end)

--// 悬浮按钮 XION (白色文字)
local bubble = create("TextButton", {
	Size = Udim2(0, 70, 0, 70),
	Position = Udim2(0.5, -35, 0.2, 0),
	BackgroundColor3 = Color(0, 30, 0),
	BackgroundTransparency = 0.3,
	TextColor3 = Color(255, 255, 255),
	Text = "XION",
	FontFace = font,
	TextSize = 22,
	Visible = false,
	create("UICorner"),
}, gui) insertgrad(bubble)

--// 悬浮按钮边框
local bubbleBorder = create("Frame", {
	Size = Udim2(1, 8, 1, 8),
	Position = Udim2(0, -4, 0, -4),
	BackgroundColor3 = Color(0, 255, 100),
	BackgroundTransparency = 0.3,
	ZIndex = 0,
	create("UICorner"),
}, bubble) insertgrad(bubbleBorder)

--// script
local drag = make("UIDragDetector", bubble)
drag.DragStart:Connect(function()
	isDragging = true
end)

drag.DragEnd:Connect(function()
	if isDragging then
		main.Visible = true
		bubble.Visible = false
		Click:Play()
	end
end)

drag.DragContinue:Connect(function()
	isDragging = false
end)

closeButton.Activated:Connect(function()
	main.Visible = false
	bubble.Visible = true
	Click:Play()
end)

loopBox.Activated:Connect(function()
    Click:Play()
    if loopState then
        loopState = false
        loopBox.Text = "循环播放 <font color='rgb(255,100,100)'>关闭</font>"
    else
        loopState = true
        loopBox.Text = "循环播放 <font color='rgb(0,255,100)'>开启</font>"
    end
end)

--// saves name & remote so you can re-edit one audio instead of creating multiple, you can instead cut and paste it below the Activated:Connect for the opposite effect
local AudioName = RandomName()
local SavedRemote = getremote()

button.Activated:Connect(function()
	local remote = (SavedRemote and SavedRemote:IsDescendantOf(g)) and SavedRemote or getremote()
	
	if not remote then
		OhNo:Play()
		return
	end
	
	local success = call(firesound,
		remote,
		AudioName,
		formatAssetId(textBox.Text),
		toNumber(pitchBox.Text, 1),
		toNumber(volumeBox.Text, 1),
		loopState
	)
	
	if not success then
		OhNo:Play()
		return
	end
	
	Click:Play()
end)
end)

Button(Tabjz, "战争大亨", function()
    local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"
))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 400),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5,  XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button

    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end

    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5,  XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    TeleportTab = Window:Tab({ Title = "传送" }),
    ESPTab = Window:Tab({ Title = "透视" }),
    FunctionTab = Window:Tab({ Title = "功能" }),
    AimTab = Window:Tab({ Title = "自瞄" }),
    RPGTab = Window:Tab({ Title = "RPG" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera

local PlayerList = {}
for _, player in pairs(Players:GetPlayers()) do
    if player ~= LP then
        PlayerList[#PlayerList + 1] = player.Name
    end
end

local Positions = {
    ["Alpha"] = CFrame.new(-1197, 65, -4790),
    ["Bravo"] = CFrame.new(-220, 65, -4919),
    ["Charlie"] = CFrame.new(797, 65, -4740),
    ["Delta"] = CFrame.new(2044, 65, -3984),
    ["Echo"] = CFrame.new(2742, 65, -3031),
    ["Foxtrot"] = CFrame.new(3045, 65, -1788),
    ["Golf"] = CFrame.new(3376, 65, -562),
    ["Hotel"] = CFrame.new(3290, 65, 587),
    ["Juliet"] = CFrame.new(2955, 65, 1804),
    ["Kilo"] = CFrame.new(2569, 65, 2926),
    ["Lima"] = CFrame.new(989, 65, 3419),
    ["Omega"] = CFrame.new(-319, 65, 3932),
    ["Romeo"] = CFrame.new(-1479, 65, 3722),
    ["Sierra"] = CFrame.new(-2528, 65, 2549),
    ["Tango"] = CFrame.new(-3018, 65, 1503),
    ["Victor"] = CFrame.new(-3587, 65, 634),
    ["Yankee"] = CFrame.new(-3957, 65, -287),
    ["Zulu"] = CFrame.new(-4049, 65, -1334)
}

local ExcludedBases = {}
local C_NPlayers = {}
local deathPosition = nil
local deathOrientation = nil

local function GetAvailableBases()
    local bases = {}
    if not workspace:FindFirstChild("Tycoon") or not workspace.Tycoon:FindFirstChild("Tycoons") then
        return bases
    end
    local tycoons = workspace.Tycoon.Tycoons:GetChildren()
    for _, tycoon in ipairs(tycoons) do
        if not table.find(ExcludedBases, tycoon.Name) then
            table.insert(bases, tycoon.Name)
        end
    end
    return bases
end

-- ================ 传送Tab ================
Tabs.TeleportTab:Section({ Title = "传送基地" })

Tabs.TeleportTab:Dropdown({
    Title = "传送基地",
    Values = {"Alpha", "Bravo", "Charlie", "Delta", "Echo", "Foxtrot", "Golf", "Hotel", "Juliet", "Kilo", "Lima", "Omega", "Romeo", "Sierra", "Tango", "Victor", "Yankee", "Zulu"},
    Value = "Alpha",
    Callback = function(d)
        if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
            LP.Character:FindFirstChild("HumanoidRootPart").CFrame = Positions[d]
        end
    end
})

Tabs.TeleportTab:Dropdown({
    Title = "基地白名单(排除列表)",
    Values = GetAvailableBases(),
    Multi = true,
    Value = {},
    Callback = function(Values)
        ExcludedBases = Values
    end
})

Tabs.TeleportTab:Button({
    Title = "刷新基地列表",
    Callback = function()
        WindUI:Notify({
            Title = "通知",
            Content = "加载成功",
            Duration = 1,
            Icon = "layout-grid",
        })
    end
})

-- ================ 透视Tab ================
Tabs.ESPTab:Section({ Title = "透视设置" })

getgenv().ESPEnabled = false
getgenv().ShowBox = false
getgenv().ShowHealth = false
getgenv().ShowName = false
getgenv().ShowDistance = false
getgenv().ShowTracer = false
getgenv().TeamCheck = false
getgenv().ShowSkeleton = false
getgenv().ShowRadar = false
getgenv().ShowPlayerCount = false
getgenv().ShowWeapon = false
getgenv().ShowFOV = false
getgenv().OutOfViewArrows = false
getgenv().Chams = false

getgenv().TracerColor = Color3.new(1, 0, 0)
getgenv().SkeletonColor = Color3.new(0.2, 0.8, 1)
getgenv().BoxColor = Color3.new(1, 1, 1)
getgenv().HealthBarColor = Color3.new(0, 1, 0)
getgenv().HealthTextColor = Color3.new(1, 1, 1)
getgenv().NameColor = Color3.new(1, 1, 1)
getgenv().DistanceColor = Color3.new(1, 1, 0)
getgenv().WeaponColor = Color3.new(1, 0.5, 0)
getgenv().ArrowColor = Color3.new(1, 0, 0)
getgenv().FOVColor = Color3.new(1, 1, 1)
getgenv().ChamsColor = Color3.new(1, 0, 0)

getgenv().BoxThickness = 1
getgenv().TracerThickness = 1
getgenv().SkeletonThickness = 2
getgenv().FOVRadius = 100
getgenv().ArrowSize = 15

local function getGradientColor(time)
    local r = math.sin(time * 2) * 0.5 + 0.5
    local g = math.sin(time * 3) * 0.5 + 0.5
    local b = math.sin(time * 4) * 0.5 + 0.5
    return Color3.new(r, g, b)
end

local playerCountText = Drawing.new("Text")
playerCountText.Visible = false
playerCountText.Color = Color3.new(1, 1, 1)
playerCountText.Size = 20
playerCountText.Font = Drawing.Fonts.Monospace
playerCountText.Outline = true
playerCountText.OutlineColor = Color3.new(0, 0, 0)
playerCountText.Position = Vector2.new(Camera.ViewportSize.X / 2, 10)

local fovCircle = Drawing.new("Circle")
fovCircle.Visible = false
fovCircle.Color = getgenv().FOVColor
fovCircle.Thickness = 1
fovCircle.Filled = false
fovCircle.Radius = getgenv().FOVRadius
fovCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

local function updatePlayerCount()
    local playerCount = #Players:GetPlayers()
    playerCountText.Text = "在线玩家: " .. playerCount
    playerCountText.Visible = getgenv().ESPEnabled and getgenv().ShowPlayerCount
    local time = tick()
    playerCountText.Color = getGradientColor(time)
end

local function updateFOV()
    fovCircle.Visible = getgenv().ShowFOV
    fovCircle.Color = getgenv().FOVColor
    fovCircle.Radius = getgenv().FOVRadius
    fovCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
end

local ESPComponents = {}

local function createESP(player)
    local box = Drawing.new("Square")
    box.Visible = false
    box.Color = getgenv().BoxColor
    box.Thickness = getgenv().BoxThickness
    box.Filled = false

    local healthBar = Drawing.new("Square")
    healthBar.Visible = false
    healthBar.Color = getgenv().HealthBarColor
    healthBar.Thickness = 1
    healthBar.Filled = true

    local healthBarBackground = Drawing.new("Square")
    healthBarBackground.Visible = false
    healthBarBackground.Color = Color3.new(0, 0, 0)
    healthBarBackground.Transparency = 0.5
    healthBarBackground.Thickness = 1
    healthBarBackground.Filled = true

    local healthBarBorder = Drawing.new("Square")
    healthBarBorder.Visible = false
    healthBarBorder.Color = Color3.new(1, 1, 1)
    healthBarBorder.Thickness = 1
    healthBarBorder.Filled = false

    local healthText = Drawing.new("Text")
    healthText.Visible = false
    healthText.Color = getgenv().HealthTextColor
    healthText.Size = 14
    healthText.Font = Drawing.Fonts.Monospace
    healthText.Outline = true
    healthText.OutlineColor = Color3.new(0, 0, 0)

    local nameText = Drawing.new("Text")
    nameText.Visible = false
    nameText.Color = getgenv().NameColor
    nameText.Size = 16
    nameText.Font = Drawing.Fonts.Monospace
    nameText.Outline = true
    nameText.OutlineColor = Color3.new(0, 0, 0)

    local distanceText = Drawing.new("Text")
    distanceText.Visible = false
    distanceText.Color = getgenv().DistanceColor
    distanceText.Size = 14
    distanceText.Font = Drawing.Fonts.Monospace
    distanceText.Outline = true
    distanceText.OutlineColor = Color3.new(0, 0, 0)

    local weaponText = Drawing.new("Text")
    weaponText.Visible = false
    weaponText.Color = getgenv().WeaponColor
    weaponText.Size = 14
    weaponText.Font = Drawing.Fonts.Monospace
    weaponText.Outline = true
    weaponText.OutlineColor = Color3.new(0, 0, 0)

    local tracer = Drawing.new("Line")
    tracer.Visible = false
    tracer.Color = getgenv().TracerColor
    tracer.Thickness = getgenv().TracerThickness

    local arrow = Drawing.new("Triangle")
    arrow.Visible = false
    arrow.Color = getgenv().ArrowColor
    arrow.Filled = true
    arrow.Thickness = 1

    local skeletonLines = {}
    local skeletonPoints = {}

    local function createSkeleton()
        for i = 1, 15 do
            skeletonLines[i] = Drawing.new("Line")
            skeletonLines[i].Visible = false
            skeletonLines[i].Color = getgenv().SkeletonColor
            skeletonLines[i].Thickness = getgenv().SkeletonThickness
        end
        skeletonPoints["Head"] = Drawing.new("Circle")
        skeletonPoints["Head"].Visible = false
        skeletonPoints["Head"].Color = Color3.new(1, 0.5, 0)
        skeletonPoints["Head"].Thickness = 2
        skeletonPoints["Head"].Filled = true
        skeletonPoints["Head"].Radius = 4
    end
    createSkeleton()

    local lastHealth = 100
    local healthChangeTime = 0
    local smoothHealth = 100

    ESPComponents[player] = {
        box = box,
        healthBar = healthBar,
        healthBarBackground = healthBarBackground,
        healthBarBorder = healthBarBorder,
        healthText = healthText,
        nameText = nameText,
        distanceText = distanceText,
        weaponText = weaponText,
        tracer = tracer,
        arrow = arrow,
        skeletonLines = skeletonLines,
        skeletonPoints = skeletonPoints
    }

    RunService.RenderStepped:Connect(function()
        if not getgenv().ESPEnabled or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") or not player.Character:FindFirstChild("Humanoid") or player == LP then
            box.Visible = false
            healthBar.Visible = false
            healthBarBackground.Visible = false
            healthBarBorder.Visible = false
            healthText.Visible = false
            nameText.Visible = false
            distanceText.Visible = false
            weaponText.Visible = false
            tracer.Visible = false
            arrow.Visible = false
            for _, line in pairs(skeletonLines) do
                line.Visible = false
            end
            for _, point in pairs(skeletonPoints) do
                point.Visible = false
            end
            return
        end

        if getgenv().TeamCheck and player.Team == LP.Team then
            box.Visible = false
            healthBar.Visible = false
            healthBarBackground.Visible = false
            healthBarBorder.Visible = false
            healthText.Visible = false
            nameText.Visible = false
            distanceText.Visible = false
            weaponText.Visible = false
            tracer.Visible = false
            arrow.Visible = false
            for _, line in pairs(skeletonLines) do
                line.Visible = false
            end
            for _, point in pairs(skeletonPoints) do
                point.Visible = false
            end
            return
        end

        local character = player.Character
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        local humanoid = character:FindFirstChild("Humanoid")

        if rootPart and humanoid and humanoid.Health > 0 then
            local rootPos, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
            local headPos, _ = Camera:WorldToViewportPoint(rootPart.Position + Vector3.new(0, 3, 0))
            local legPos, _ = Camera:WorldToViewportPoint(rootPart.Position - Vector3.new(0, 3, 0))

            local weaponName = "无武器"
            for _, tool in ipairs(character:GetChildren()) do
                if tool:IsA("Tool") then
                    weaponName = tool.Name
                    break
                end
            end

            if getgenv().ShowBox and onScreen then
                box.Size = Vector2.new(1000 / rootPos.Z, headPos.Y - legPos.Y)
                box.Position = Vector2.new(rootPos.X - box.Size.X / 2, rootPos.Y - box.Size.Y / 2)
                box.Visible = true
                box.Color = getgenv().BoxColor
                box.Thickness = getgenv().BoxThickness
            else
                box.Visible = false
            end

            if getgenv().ShowHealth and onScreen then
                local healthPercentage = humanoid.Health / humanoid.MaxHealth
                local barWidth = 50
                local barHeight = 5
                local barX = headPos.X - barWidth / 2
                local barY = headPos.Y - 20

                healthBarBackground.Size = Vector2.new(barWidth, barHeight)
                healthBarBackground.Position = Vector2.new(barX, barY)
                healthBarBackground.Visible = true

                healthBarBorder.Size = Vector2.new(barWidth, barHeight)
                healthBarBorder.Position = Vector2.new(barX, barY)
                healthBarBorder.Visible = true

                smoothHealth = smoothHealth + (humanoid.Health - smoothHealth) * 0.1
                local smoothHealthPercentage = smoothHealth / humanoid.MaxHealth

                healthBar.Size = Vector2.new(barWidth * smoothHealthPercentage, barHeight)
                healthBar.Position = Vector2.new(barX, barY)

                if smoothHealthPercentage >= 0.8 then
                    healthBar.Color = Color3.new(0, 1, 0)
                elseif smoothHealthPercentage >= 0.5 then
                    healthBar.Color = Color3.new(1, 1, 0)
                elseif smoothHealthPercentage >= 0.2 then
                    healthBar.Color = Color3.new(1, 0.5, 0)
                else
                    healthBar.Color = Color3.new(1, 0, 0)
                end

                healthBar.Visible = true

                if humanoid.Health ~= lastHealth then
                    healthChangeTime = tick()
                    lastHealth = humanoid.Health
                end

                if tick() - healthChangeTime < 0.5 then
                    healthBar.Color = Color3.new(1, 0, 0)
                end

                healthText.Position = Vector2.new(barX + barWidth + 5, barY - 5)
                healthText.Text = math.floor(humanoid.Health) .. "/" .. math.floor(humanoid.MaxHealth)
                healthText.Visible = true
            else
                healthBar.Visible = false
                healthBarBackground.Visible = false
                healthBarBorder.Visible = false
                healthText.Visible = false
            end

            if getgenv().ShowName and onScreen then
                nameText.Position = Vector2.new(headPos.X, headPos.Y - 35)
                nameText.Text = player.Name
                nameText.Visible = true

                if getgenv().ShowDistance then
                    local distance = (LP.Character.HumanoidRootPart.Position - rootPart.Position).Magnitude
                    distanceText.Position = Vector2.new(headPos.X, headPos.Y + 10)
                    distanceText.Text = math.floor(distance) .. "m"
                    distanceText.Visible = true
                else
                    distanceText.Visible = false
                end

                if getgenv().ShowWeapon then
                    weaponText.Position = Vector2.new(headPos.X, headPos.Y - 50)
                    weaponText.Text = weaponName
                    weaponText.Visible = true
                else
                    weaponText.Visible = false
                end
            else
                nameText.Visible = false
                distanceText.Visible = false
                weaponText.Visible = false
            end

            if getgenv().ShowTracer then
                local head = character:FindFirstChild("Head")
                if head then
                    local headPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                    if onScreen then
                        tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                        tracer.To = Vector2.new(headPos.X, headPos.Y)
                        tracer.Visible = true
                        tracer.Color = getgenv().TracerColor
                        tracer.Thickness = getgenv().TracerThickness
                        
                        local distance = (LP.Character.HumanoidRootPart.Position - rootPart.Position).Magnitude
                        if distance < 20 then
                            tracer.Color = Color3.new(0, 1, 0)
                        elseif distance < 50 then
                            tracer.Color = Color3.new(1, 1, 0)
                        else
                            tracer.Color = getgenv().TracerColor
                        end
                    else
                        tracer.Visible = false
                    end
                else
                    tracer.Visible = false
                end
            else
                tracer.Visible = false
            end

            if getgenv().OutOfViewArrows and not onScreen then
                local direction = (rootPart.Position - Camera.CFrame.Position).Unit
                local dotProduct = Camera.CFrame.RightVector:Dot(direction)
                local crossProduct = Camera.CFrame.RightVector:Cross(direction)
                
                local screenPosition = Vector2.new(
                    Camera.ViewportSize.X / 2 + dotProduct * Camera.ViewportSize.X / 3,
                    Camera.ViewportSize.Y / 2 - crossProduct.Y * Camera.ViewportSize.Y / 3
                )
                
                screenPosition = Vector2.new(
                    math.clamp(screenPosition.X, getgenv().ArrowSize, Camera.ViewportSize.X - getgenv().ArrowSize),
                    math.clamp(screenPosition.Y, getgenv().ArrowSize, Camera.ViewportSize.Y - getgenv().ArrowSize)
                )
                
                local angle = math.atan2(screenPosition.Y - Camera.ViewportSize.Y / 2, screenPosition.X - Camera.ViewportSize.X / 2)
                
                arrow.PointA = screenPosition
                arrow.PointB = Vector2.new(
                    screenPosition.X - getgenv().ArrowSize * math.cos(angle - 0.5),
                    screenPosition.Y - getgenv().ArrowSize * math.sin(angle - 0.5)
                )
                arrow.PointC = Vector2.new(
                    screenPosition.X - getgenv().ArrowSize * math.cos(angle + 0.5),
                    screenPosition.Y - getgenv().ArrowSize * math.sin(angle + 0.5)
                )
                
                arrow.Color = getgenv().ArrowColor
                arrow.Visible = true
            else
                arrow.Visible = false
            end

            if getgenv().ShowSkeleton and onScreen then
                local head = character:FindFirstChild("Head")
                local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
                local leftArm = character:FindFirstChild("Left Arm") or character:FindFirstChild("LeftUpperArm")
                local rightArm = character:FindFirstChild("Right Arm") or character:FindFirstChild("RightUpperArm")
                local leftLeg = character:FindFirstChild("Left Leg") or character:FindFirstChild("LeftUpperLeg")
                local rightLeg = character:FindFirstChild("Right Leg") or character:FindFirstChild("RightUpperLeg")
                
                if head and torso and leftArm and rightArm and leftLeg and rightLeg then
                    local headPos = Camera:WorldToViewportPoint(head.Position)
                    local torsoPos = Camera:WorldToViewportPoint(torso.Position)
                    local leftArmPos = Camera:WorldToViewportPoint(leftArm.Position)
                    local rightArmPos = Camera:WorldToViewportPoint(rightArm.Position)
                    local leftLegPos = Camera:WorldToViewportPoint(leftLeg.Position)
                    local rightLegPos = Camera:WorldToViewportPoint(rightLeg.Position)

                    skeletonPoints["Head"].Position = Vector2.new(headPos.X, headPos.Y)
                    skeletonPoints["Head"].Visible = true

                    skeletonLines[1].From = Vector2.new(headPos.X, headPos.Y)
                    skeletonLines[1].To = Vector2.new(torsoPos.X, torsoPos.Y)
                    skeletonLines[1].Visible = true

                    skeletonLines[2].From = Vector2.new(torsoPos.X, torsoPos.Y)
                    skeletonLines[2].To = Vector2.new(leftArmPos.X, leftArmPos.Y)
                    skeletonLines[2].Visible = true

                    skeletonLines[3].From = Vector2.new(torsoPos.X, torsoPos.Y)
                    skeletonLines[3].To = Vector2.new(rightArmPos.X, rightArmPos.Y)
                    skeletonLines[3].Visible = true

                    skeletonLines[4].From = Vector2.new(torsoPos.X, torsoPos.Y)
                    skeletonLines[4].To = Vector2.new(leftLegPos.X, leftLegPos.Y)
                    skeletonLines[4].Visible = true

                    skeletonLines[5].From = Vector2.new(torsoPos.X, torsoPos.Y)
                    skeletonLines[5].To = Vector2.new(rightLegPos.X, rightLegPos.Y)
                    skeletonLines[5].Visible = true

                    if character:FindFirstChild("LeftLowerArm") then
                        local leftLowerArmPos = Camera:WorldToViewportPoint(character.LeftLowerArm.Position)
                        skeletonLines[6].From = Vector2.new(leftArmPos.X, leftArmPos.Y)
                        skeletonLines[6].To = Vector2.new(leftLowerArmPos.X, leftLowerArmPos.Y)
                        skeletonLines[6].Visible = true
                    end

                    if character:FindFirstChild("RightLowerArm") then
                        local rightLowerArmPos = Camera:WorldToViewportPoint(character.RightLowerArm.Position)
                        skeletonLines[7].From = Vector2.new(rightArmPos.X, rightArmPos.Y)
                        skeletonLines[7].To = Vector2.new(rightLowerArmPos.X, rightLowerArmPos.Y)
                        skeletonLines[7].Visible = true
                    end

                    if character:FindFirstChild("LeftLowerLeg") then
                        local leftLowerLegPos = Camera:WorldToViewportPoint(character.LeftLowerLeg.Position)
                        skeletonLines[8].From = Vector2.new(leftLegPos.X, leftLegPos.Y)
                        skeletonLines[8].To = Vector2.new(leftLowerLegPos.X, leftLowerLegPos.Y)
                        skeletonLines[8].Visible = true
                    end

                    if character:FindFirstChild("RightLowerLeg") then
                        local rightLowerLegPos = Camera:WorldToViewportPoint(character.RightLowerLeg.Position)
                        skeletonLines[9].From = Vector2.new(rightLegPos.X, rightLegPos.Y)
                        skeletonLines[9].To = Vector2.new(rightLowerLegPos.X, rightLowerLegPos.Y)
                        skeletonLines[9].Visible = true
                    end
                else
                    for _, line in pairs(skeletonLines) do
                        line.Visible = false
                    end
                    for _, point in pairs(skeletonPoints) do
                        point.Visible = false
                    end
                end
            else
                for _, line in pairs(skeletonLines) do
                    line.Visible = false
                end
                for _, point in pairs(skeletonPoints) do
                    point.Visible = false
                end
            end
        else
            box.Visible = false
            healthBar.Visible = false
            healthBarBackground.Visible = false
            healthBarBorder.Visible = false
            healthText.Visible = false
            nameText.Visible = false
            distanceText.Visible = false
            weaponText.Visible = false
            tracer.Visible = false
            arrow.Visible = false
            for _, line in pairs(skeletonLines) do
                line.Visible = false
            end
            for _, point in pairs(skeletonPoints) do
                point.Visible = false
            end
        end
    end)
end

local radar = Drawing.new("Circle")
radar.Visible = false
radar.Color = Color3.new(1, 1, 1)
radar.Thickness = 2
radar.Filled = false
radar.Radius = 100
radar.Position = Vector2.new(Camera.ViewportSize.X - 120, 120)

local radarCenter = Drawing.new("Circle")
radarCenter.Visible = false
radarCenter.Color = Color3.new(1, 1, 1)
radarCenter.Thickness = 2
radarCenter.Filled = true
radarCenter.Radius = 3
radarCenter.Position = radar.Position

local radarDirection = Drawing.new("Line")
radarDirection.Visible = false
radarDirection.Color = Color3.new(1, 1, 1)
radarDirection.Thickness = 2

local radarGridLines = {}
for i = 1, 4 do
    radarGridLines[i] = Drawing.new("Line")
    radarGridLines[i].Visible = false
    radarGridLines[i].Color = Color3.new(0.5, 0.5, 0.5)
    radarGridLines[i].Thickness = 1
end

local radarRangeText = Drawing.new("Text")
radarRangeText.Visible = false
radarRangeText.Color = Color3.new(1, 1, 1)
radarRangeText.Size = 14
radarRangeText.Font = Drawing.Fonts.Monospace
radarRangeText.Outline = true
radarRangeText.OutlineColor = Color3.new(0, 0, 0)
radarRangeText.Text = "100m"

local radarPlayers = {}

local function updateRadar()
    if not getgenv().ShowRadar then
        radar.Visible = false
        radarCenter.Visible = false
        radarDirection.Visible = false
        radarRangeText.Visible = false
        for _, line in pairs(radarGridLines) do
            line.Visible = false
        end
        for _, player in pairs(radarPlayers) do
            if player.dot then player.dot.Visible = false end
            if player.direction then player.direction.Visible = false end
            if player.name then player.name.Visible = false end
        end
        return
    end

    radar.Visible = true
    radarCenter.Visible = true
    radarDirection.Visible = true
    radarRangeText.Visible = true
    radarRangeText.Position = Vector2.new(radar.Position.X, radar.Position.Y + radar.Radius + 5)
    
    for i = 1, 4 do
        local angle = (i-1) * math.pi / 2
        radarGridLines[i].From = radar.Position
        radarGridLines[i].To = Vector2.new(
            radar.Position.X + math.cos(angle) * radar.Radius,
            radar.Position.Y + math.sin(angle) * radar.Radius
        )
        radarGridLines[i].Visible = true
    end
    
    radarDirection.From = radar.Position
    radarDirection.To = Vector2.new(radar.Position.X, radar.Position.Y - radar.Radius)

    for _, player in pairs(Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player ~= LP then
            local rootPart = player.Character.HumanoidRootPart
            local relativePosition = rootPart.Position - LP.Character.HumanoidRootPart.Position
            
            local radarX = radar.Position.X + (relativePosition.X / 10)
            local radarY = radar.Position.Y + (relativePosition.Z / 10)
            
            local distanceFromCenter = math.sqrt((radarX - radar.Position.X)^2 + (radarY - radar.Position.Y)^2)
            
            if distanceFromCenter > radar.Radius then
                local angle = math.atan2(radarY - radar.Position.Y, radarX - radar.Position.X)
                radarX = radar.Position.X + math.cos(angle) * radar.Radius
                radarY = radar.Position.Y + math.sin(angle) * radar.Radius
            end
            
            if not radarPlayers[player] then
                radarPlayers[player] = {
                    dot = Drawing.new("Circle"),
                    direction = Drawing.new("Line"),
                    name = Drawing.new("Text")
                }
                radarPlayers[player].dot.Thickness = 1
                radarPlayers[player].dot.Filled = true
                radarPlayers[player].dot.Radius = 4
                radarPlayers[player].direction.Thickness = 2
                radarPlayers[player].direction.Visible = true
                radarPlayers[player].name.Size = 12
                radarPlayers[player].name.Font = Drawing.Fonts.Monospace
                radarPlayers[player].name.Outline = true
                radarPlayers[player].name.OutlineColor = Color3.new(0, 0, 0)
            end
            
            if player.Team == LP.Team then
                radarPlayers[player].dot.Color = Color3.new(0, 1, 0)
                radarPlayers[player].direction.Color = Color3.new(0, 0.8, 0)
                radarPlayers[player].name.Color = Color3.new(0, 1, 0)
            else
                radarPlayers[player].dot.Color = Color3.new(1, 0, 0)
                radarPlayers[player].direction.Color = Color3.new(1, 0, 0)
                radarPlayers[player].name.Color = Color3.new(1, 0, 0)
            end
            
            radarPlayers[player].dot.Position = Vector2.new(radarX, radarY)
            radarPlayers[player].dot.Visible = true
            
            local lookVector = rootPart.CFrame.LookVector
            local directionLength = 10
            radarPlayers[player].direction.From = Vector2.new(radarX, radarY)
            radarPlayers[player].direction.To = Vector2.new(
                radarX + lookVector.X * directionLength,
                radarY + lookVector.Z * directionLength
            )
            
            radarPlayers[player].name.Position = Vector2.new(radarX, radarY - 15)
            radarPlayers[player].name.Text = player.Name
            radarPlayers[player].name.Visible = distanceFromCenter <= radar.Radius
        elseif radarPlayers[player] then
            radarPlayers[player].dot.Visible = false
            radarPlayers[player].direction.Visible = false
            radarPlayers[player].name.Visible = false
        end
    end
    
    for player, components in pairs(radarPlayers) do
        if not Players:FindFirstChild(player.Name) then
            components.dot.Visible = false
            components.direction.Visible = false
            components.name.Visible = false
            radarPlayers[player] = nil
        end
    end
end

RunService.RenderStepped:Connect(updateRadar)
RunService.RenderStepped:Connect(updatePlayerCount)
RunService.RenderStepped:Connect(updateFOV)

for _, player in pairs(Players:GetPlayers()) do
    if player ~= LP then
        createESP(player)
    end
end

Players.PlayerAdded:Connect(function(player)
    if player ~= LP then
        createESP(player)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if ESPComponents[player] then
        for _, component in pairs(ESPComponents[player]) do
            if typeof(component) == "table" then
                for _, drawing in pairs(component) do
                    drawing:Remove()
                end
            else
                component:Remove()
            end
        end
        ESPComponents[player] = nil
    end
end)

Tabs.ESPTab:Toggle({
    Title = "透视开启",
    Value = false,
    Callback = function(Value)
        getgenv().ESPEnabled = Value
    end
})

Tabs.ESPTab:Toggle({
    Title = "模型透视",
    Value = false,
    Callback = function(Value)
        getgenv().ShowSkeleton = Value
    end
})

Tabs.ESPTab:Toggle({
    Title = "方框透视",
    Value = false,
    Callback = function(Value)
        getgenv().ShowBox = Value
    end
})

Tabs.ESPTab:Toggle({
    Title = "射线透视",
    Value = false,
    Callback = function(Value)
        getgenv().ShowTracer = Value
    end
})

Tabs.ESPTab:Toggle({
    Title = "名字透视",
    Value = false,
    Callback = function(Value)
        getgenv().ShowName = Value
    end
})

-- ================ 功能Tab ================
Tabs.FunctionTab:Section({ Title = "功能" })

local blockFDMG = false
local isHookActive = false
local hookConnection = nil

local function initHook()
    if isHookActive then return end
    isHookActive = true
    hookConnection = hookfunction(getmetatable(game).__index, function(self, key)
        if isHookActive and self:IsA("Humanoid") and key == "Health" then
            return 100
        end
        return hookConnection(self, key)
    end)
end

local function removeHook()
    isHookActive = false
    if hookConnection then
        hookConnection = nil
    end
end

Tabs.FunctionTab:Toggle({
    Title = "坠落无伤害",
    Value = false,
    Callback = function(value)
        blockFDMG = value
        if value then
            if not isHookActive then
                initHook()
            end
        else
            if isHookActive then
                removeHook()
            end
        end
    end
})

Tabs.FunctionTab:Button({
    Title = "删除所有门",
    Callback = function()
        for k,v in pairs(Workspace.Tycoon.Tycoons:GetChildren()) do
            for x,y in pairs(v.PurchasedObjects:GetChildren()) do
                if(y.Name:find("Door") or y.Name:find("Gate")) then y:destroy(); end;
            end;
        end;
    end
})

Tabs.FunctionTab:Toggle({
    Title = "无CD状态",
    Value = false,
    Callback = function()
        local ContextActions = game:GetService("Workspace")[game.Players.LocalPlayer.Name].ContextActions
        local ContextMain = require(ContextActions.ContextMain)
        ContextMain:New({
            RobPlayerLength = 0.1,
            FixWallLength = 0.1,
            CrackSafeLength = 0.1,
            RobSafeLength = 0.1,
            RobRegisterLength = 0.1,
            PickCellLength = 0.1,
            SkinAnimalLength = 0.1
        }, 200, {
            "Get out of my shop! Outlaws are not welcome here!",
            "Hey, scoundrel! Get out before I call the sheriff!",
            "You're an outlaw! We don't serve your type here!"
        }, {
            "This here's a bandit camp! Get out!",
            "Get lost, cowboy!",
            "Are you an outlaw? Didn't think so! Scram!"
        })
    end
})

local function setupDeathTracking()
    local player = game.Players.LocalPlayer
    player.CharacterAdded:Connect(function(character)
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.Died:Connect(function()
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                deathPosition = rootPart.Position
                deathOrientation = rootPart.CFrame - rootPart.Position
            end
        end)
    end)
    if player.Character then
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Died:Connect(function()
                local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
                if rootPart then
                    deathPosition = rootPart.Position
                    deathOrientation = rootPart.CFrame - rootPart.Position
                end
            end)
        end
    end
end
setupDeathTracking()

Tabs.FunctionTab:Button({
    Title = "原地重生",
    Callback = function()
        if not deathPosition then return end
        local player = game.Players.LocalPlayer
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.Health > 0 then return end
        end
        local connection
        connection = player.CharacterAdded:Connect(function(newCharacter)
            local newRootPart = newCharacter:WaitForChild("HumanoidRootPart", 5)
            local newHumanoid = newCharacter:WaitForChild("Humanoid", 5)
            if newRootPart and newHumanoid then
                wait(0.5)
                newRootPart.CFrame = CFrame.new(deathPosition) * deathOrientation
                deathPosition = nil
                deathOrientation = nil
            end
            if connection then
                connection:Disconnect()
            end
        end)
        if not character then
            local currentTeam = player.Team
            player.Team = nil
            wait(0.1)
            player.Team = currentTeam
        else
            player:LoadCharacter()
        end
        delay(10, function()
            if connection then
                connection:Disconnect()
                WindUI:Notify({
                    Title = "超时",
                    Content = "重生过程超时",
                    Duration = 3,
                })
            end
        end)
    end
})

-- ================ 自瞄Tab ================
Tabs.AimTab:Section({ Title = "自瞄设置" })

local fov = 0
local maxDistance = 50
local autoAimEnabled = false
local fovVisible = false
local ignoreCover = false
local aimTarget = "敌对"
local aimPosition = "Head"
local rainbowEnabled = false

local FOVring = Drawing.new("Circle")
FOVring.Visible = false
FOVring.Thickness = 0.5
FOVring.Color = Color3.new(1, 1, 1)
FOVring.Filled = false
FOVring.Radius = fov
FOVring.Position = Camera.ViewportSize / 2

local function updateDrawings()
    FOVring.Position = Camera.ViewportSize / 2
end

local function onKeyDown(input)
    if input.KeyCode == Enum.KeyCode.Delete then
        RunService:UnbindFromRenderStep("FOVUpdate")
        FOVring:Remove()
    end
end
UserInputService.InputBegan:Connect(onKeyDown)

local function lookAt(target)
    local lookVector = (target - Camera.CFrame.Position).unit
    local newCFrame = CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position + lookVector)
    Camera.CFrame = newCFrame
end

local function getClosestPlayerInFOV(trg_part)
    local nearest = nil
    local last = math.huge
    local playerMousePos = Camera.ViewportSize / 2
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LP and (aimTarget == "全部" or player.TeamColor ~= LP.TeamColor) then
            local character = player.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            local part = character and character:FindFirstChild(trg_part)
            
            if part and humanoid and humanoid.Health > 0 then
                local ePos, isVisible = Camera:WorldToViewportPoint(part.Position)
                local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude
                
                if distance < last and isVisible and distance < fov then
                    if (part.Position - Camera.CFrame.Position).Magnitude <= tonumber(maxDistance) then
                        if not ignoreCover or #Camera:GetPartsObscuringTarget({part.Position}, {character, LP.Character}) == 0 then
                            last = distance
                            nearest = player
                        end
                    end
                end
            end
        end
    end
    
    return nearest
end

RunService:BindToRenderStep("FOVUpdate", 0, function()
    if autoAimEnabled then
        local target = getClosestPlayerInFOV(aimPosition)
        if target and target.Character and target.Character:FindFirstChild(aimPosition) then
            local part = target.Character[aimPosition]
            if part then
                lookAt(part.Position)
            end
        end
    end
end)

Tabs.AimTab:Toggle({
    Title = "子弹无限",
    Value = false,
    Callback = function(v)
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local gk = true
        local uj = nil
        local deathConnection = nil
        local originalGunData = {}

        local function apn()
            for i, v in next, getgc(false) do
                if typeof(v) == "function" then
                    local info = getinfo(v)
                    if tostring(info.name) == "fireGun" then
                        local gunTable = getupvalue(v, 1)
                        if not originalGunData[gunTable] then
                            originalGunData[gunTable] = {}
                            for key, value in pairs(gunTable) do
                                if typeof(value) ~= "function" then
                                    originalGunData[gunTable][key] = value
                                end
                            end
                            for key, value in pairs(gunTable) do
                                if typeof(value) == "table" then
                                    originalGunData[gunTable][key] = {}
                                    for subKey, subValue in pairs(value) do
                                        originalGunData[gunTable][key][subKey] = subValue
                                    end
                                end
                            end
                        end
                        rawset(gunTable, "Ammo", math.huge)
                        rawset(gunTable, "Distance", math.huge)
                        rawset(gunTable, "BSpeed", 99999)
                        rawset(gunTable, "BDrop", 0)
                        rawset(gunTable, "FireRate", 2000)
                        rawset(gunTable, "MaxSpread", 0)
                        rawset(gunTable, "MinSpread", 0)
                        rawset(gunTable.FireModes, "Auto", true)
                        rawset(gunTable.FireModes, "Semi", true)
                        rawset(gunTable.FireModes, "ChangeFiremode", true)
                        rawset(gunTable, "MinRecoilPower", 0)
                        rawset(gunTable, "MaxRecoilPower", 0)
                        rawset(gunTable, "RecoilPowerStepAmount", 0)
                        rawset(gunTable, "RecoilPunch", 0)
                        rawset(gunTable, "DPunchBase", 0)
                        rawset(gunTable, "AimRecover", 1)
                        rawset(gunTable, "HPunchBase", 0)
                        rawset(gunTable, "VPunchBase", 0)
                        rawset(gunTable, "PunchRecover", 1)
                        rawset(gunTable, "SwayBase", 0)
                        rawset(gunTable, "AimRecoilReduction", math.huge)
                        for key, value in next, gunTable do
                            if typeof(value) == "table" then
                                for subKey, subValue in next, value do
                                    if typeof(subValue) == "number" then
                                        rawset(value, subKey, 0)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end

        local function resetGuns()
            for gunTable, data in pairs(originalGunData) do
                for key, value in pairs(data) do
                    if typeof(value) == "table" then
                        if gunTable[key] then
                            for subKey, subValue in pairs(value) do
                                rawset(gunTable[key], subKey, subValue)
                            end
                        end
                    else
                        rawset(gunTable, key, value)
                    end
                end
            end
            originalGunData = {}
        end

        local function onCharacterDeath()
            resetGuns()
            if gk then
                LocalPlayer.CharacterAdded:Wait()
                task.wait(1)
                apn()
            end
        end

        local function setupDeathListener()
            if deathConnection then
                deathConnection:Disconnect()
                deathConnection = nil
            end
            deathConnection = LocalPlayer.CharacterAdded:Connect(function(char)
                local humanoid = char:WaitForChild("Humanoid")
                humanoid.Died:Connect(onCharacterDeath)
            end)
            if LocalPlayer.Character then
                local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.Died:Connect(onCharacterDeath)
                end
            end
        end

        gk = true
        if LocalPlayer.Character then
            apn()
        end
        setupDeathListener()
        uj = LocalPlayer.CharacterAdded:Connect(function()
            if gk then
                task.wait(1)
                apn()
                setupDeathListener()
            end
        end)
    end
})

local bulletTrackingEnabled = true
local oldHook = nil

Tabs.AimTab:Toggle({
    Title = "子追",
    Value = false,
    Callback = function(t)
        bulletTrackingEnabled = t
        local function setupBulletTracking()
            local Workspace = game:GetService("Workspace")
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local Camera = Workspace.CurrentCamera

            local function getClosestHead()
                if not LocalPlayer.Character then return nil end
                if not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return nil end
                local closestHead = nil
                local closestDistance = math.huge
                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character then
                        local character = player.Character
                        local root = character:FindFirstChild("HumanoidRootPart")
                        local head = character:FindFirstChild("Head")
                        local humanoid = character:FindFirstChildOfClass("Humanoid")
                        local forcefield = character:FindFirstChild("ForceField")
                        if root and head and humanoid and not forcefield and humanoid.Health > 0 then
                            local distance = (root.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                            if distance < closestDistance then
                                closestHead = head
                                closestDistance = distance
                            end
                        end
                    end
                end
                return closestHead
            end

            if not oldHook then
                oldHook = hookmetamethod(game, "__namecall", function(self, ...)
                    local method = getnamecallmethod()
                    local args = {...}
                    if bulletTrackingEnabled and method == "Raycast" and not checkcaller() then
                        local origin = args[1] or Camera.CFrame.Position
                        local closestHead = getClosestHead()
                        if closestHead then
                            return {
                                Instance = closestHead,
                                Position = closestHead.Position,
                                Normal = (origin - closestHead.Position).Unit,
                                Material = Enum.Material.Plastic,
                                Distance = (closestHead.Position - origin).Magnitude
                            }
                        end
                    end
                    return oldHook(self, ...)
                end)
            end
        end
        bulletTrackingEnabled = true
        setupBulletTracking()
    end
})

Tabs.AimTab:Toggle({
    Title = "显示范围",
    Value = false,
    Callback = function(t)
        fovVisible = t
        FOVring.Visible = fovVisible
    end
})

Tabs.AimTab:Toggle({
    Title = "玩家自瞄",
    Value = false,
    Callback = function(t)
        autoAimEnabled = t
    end
})

Tabs.AimTab:Toggle({
    Title = "掩体不瞄",
    Value = false,
    Callback = function(t)
        ignoreCover = t
    end
})

Tabs.AimTab:Slider({
    Title = "自瞄范围",
    Value = { Min = 1, Max = 200, Default = 50 },
    Callback = function(s)
        fov = tonumber(s)
        FOVring.Radius = fov
    end
})

Tabs.AimTab:Slider({
    Title = "自瞄距离",
    Value = { Min = 0, Max = 1200, Default = 50 },
    Callback = function(s)
        maxDistance = tonumber(s)
    end
})

Tabs.AimTab:Slider({
    Title = "自瞄圈粗细",
    Value = { Min = 1, Max = 10, Default = 1 },
    Callback = function(s)
        FOVring.Thickness = tonumber(s)
    end
})

Tabs.AimTab:Dropdown({
    Title = "选择自瞄目标",
    Values = {"敌对", "全部"},
    Value = "敌对",
    Callback = function(value)
        aimTarget = value
    end
})

Tabs.AimTab:Dropdown({
    Title = "选择自瞄位置",
    Values = {"头部", "躯干"},
    Value = "头部",
    Callback = function(value)
        if value == "头部" then
            aimPosition = "Head"
        elseif value == "躯干" then
            aimPosition = "Torso"
        end
    end
})

Tabs.AimTab:Dropdown({
    Title = "选择圈的颜色",
    Values = {"红", "黄", "蓝", "绿", "青", "紫", "彩虹"},
    Value = "红",
    Callback = function(value)
        if value == "彩虹" then
            rainbowEnabled = true
        else
            rainbowEnabled = false
            local colors = {
                ["红"] = Color3.new(1, 0, 0),
                ["黄"] = Color3.new(1, 1, 0),
                ["蓝"] = Color3.new(0, 0, 1),
                ["绿"] = Color3.new(0, 1, 0),
                ["青"] = Color3.new(0, 1, 1),
                ["紫"] = Color3.new(1, 0, 1)
            }
            FOVring.Color = colors[value]
        end
    end
})

Tabs.AimTab:Dropdown({
    Title = "不攻击的玩家(多选)",
    Values = PlayerList,
    Value = {},
    Multi = true,
    AllowNone = true,
    Callback = function(values)
        C_NPlayers = values or {}
    end
})

Tabs.AimTab:Button({
    Title = "刷新玩家列表",
    Callback = function()
        PlayerList = {}
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LP then
                table.insert(PlayerList, player.Name)
            end
        end
        WindUI:Notify({
            Title = "通知",
            Content = "加载成功",
            Duration = 1,
            Icon = "layout-grid",
        })
    end
})

-- ================ RPGTab ================
Tabs.RPGTab:Section({ Title = "RPG" })

Tabs.RPGTab:Button({
    Title = "获取RPG",
    Callback = function()
        local Players = game:GetService("Players")
        local localPlayer = Players.LocalPlayer
        local TycoonsFolder = workspace.Tycoon.Tycoons
        local savedPosition

        local function findNearestTeleportPosition()
            local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            local playerPosition = humanoidRootPart.Position
            local closestDistance = math.huge
            local closestCFrame = nil
            for _, tycoonModel in ipairs(TycoonsFolder:GetChildren()) do
                if tycoonModel:IsA("Model") then
                    local purchasedObjects = tycoonModel:FindFirstChild("PurchasedObjects")
                    if purchasedObjects then
                        local rpgGiver = purchasedObjects:FindFirstChild("RPG Giver")
                        if rpgGiver then
                            local prompt = rpgGiver:FindFirstChild("Prompt")
                            if prompt and prompt:IsA("BasePart") then
                                local distance = (playerPosition - prompt.Position).Magnitude
                                if distance < closestDistance then
                                    closestDistance = distance
                                    closestCFrame = prompt.CFrame
                                end
                            end
                        end
                    end
                end
            end
            return closestCFrame
        end

        local function teleportPlayer()
            local character = localPlayer.Character
            if not character then return end
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                savedPosition = humanoidRootPart.CFrame
            end
            local targetCFrame = findNearestTeleportPosition()
            if targetCFrame then
                humanoidRootPart.CFrame = targetCFrame
                spawn(function()
                    while wait(0.5) do
                        if not character.Parent then break end
                        local backpack = localPlayer:FindFirstChild("Backpack")
                        if backpack and backpack:FindFirstChild("RPG") then
                            humanoidRootPart.CFrame = savedPosition
                            break
                        end
                    end
                end)
            else
                WindUI:Notify({
                    Title = "ERROR",
                    Content = "未能找到附近的RPG",
                    Duration = 4,
                })
            end
        end
        teleportPlayer()
    end
})

local loopActive = false
local rpgAttackThread = nil

Tabs.RPGTab:Toggle({
    Title = "RPG轰炸",
    Value = false,
    Callback = function(value)
        loopActive = value
        if loopActive then
            if rpgAttackThread then
                coroutine.close(rpgAttackThread)
                rpgAttackThread = nil
            end
            rpgAttackThread = coroutine.create(function()
                local Players = game:GetService("Players")
                local LocalPlayer = Players.LocalPlayer
                local ReplicatedStorage = game:GetService("ReplicatedStorage")
                local RocketSystem = ReplicatedStorage:WaitForChild("RocketSystem")
                local FireRocket = RocketSystem.Events.FireRocket
                local RocketHit = RocketSystem.Events.RocketHit
                local attackPhase = "attack"
                local phaseStartTime = os.clock()

                while loopActive do
                    local currentTime = os.clock()
                    local elapsed = currentTime - phaseStartTime
                    if not loopActive then break end
                    if attackPhase == "attack" then
                        if elapsed >= 3 then
                            attackPhase = "pause"
                            phaseStartTime = os.clock()
                        else
                            local character = LocalPlayer.Character
                            if character and character:FindFirstChild("HumanoidRootPart") then
                                local attackPosition = character.HumanoidRootPart.Position + Vector3.new(0, 1000, 0)
                                local weapon = character:FindFirstChild("RPG")
                                if weapon then
                                    for _, player in ipairs(Players:GetPlayers()) do
                                        if player ~= LocalPlayer and player.Character and not table.find(C_NPlayers, player.Name) then
                                            local target = player.Character:FindFirstChild("HumanoidRootPart")
                                            if target then
                                                FireRocket:InvokeServer(Vector3.new(), weapon, weapon, attackPosition)
                                                RocketHit:FireServer(attackPosition, Vector3.new(), weapon, weapon, target, nil, "asdfghvcqawRocket4")
                                                task.wait(0.3)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    elseif attackPhase == "pause" then
                        if elapsed >= 2 then
                            attackPhase = "attack"
                            phaseStartTime = os.clock()
                        end
                    end
                    task.wait(0.1)
                end
            end)
            coroutine.resume(rpgAttackThread)
        else
            if rpgAttackThread then
                coroutine.close(rpgAttackThread)
                rpgAttackThread = nil
            end
        end
    end
})
end)

Button(Tabjz, "力量传奇", function()
    local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"
))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 400),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5,  XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button

    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end

    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5,  XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    AutoTab = Window:Tab({ Title = "自动功能" }),
    TeleportTab = Window:Tab({ Title = "传送功能" }),
    TrainTab = Window:Tab({ Title = "自动锻炼" }),
    RunTab = Window:Tab({ Title = "自动跑步" }),
    SquatTab = Window:Tab({ Title = "自动蹲起" }),
    PullTab = Window:Tab({ Title = "引体向上" }),
    LiftTab = Window:Tab({ Title = "自动举重" }),
    ThrowTab = Window:Tab({ Title = "自动投石" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

local configName = "default"

Tabs.AutoTab:Section({ Title = "属性修改" })

Tabs.AutoTab:Input({
    Title = "修改力量",
    Value = configName,
    Callback = function(FXM)
        game:GetService("Players").LocalPlayer.leaderstats.Strength.Value = FXM
    end
})

Tabs.AutoTab:Input({
    Title = "修改重生",
    Value = configName,
    Callback = function(FXM)
        game:GetService("Players").LocalPlayer.leaderstats.Rebirths.Value = FXM
    end
})

Tabs.AutoTab:Input({
    Title = "修改击杀",
    Value = configName,
    Callback = function(FXM)
        game:GetService("Players").LocalPlayer.leaderstats.Kills.Value = FXM
    end
})

Tabs.AutoTab:Input({
    Title = "修改获胜",
    Value = configName,
    Callback = function(FXM)
        game:GetService("Players").LocalPlayer.leaderstats.Brawls.Value = FXM
    end
})

Tabs.AutoTab:Divider()

Tabs.AutoTab:Toggle({
    Title = "自动重生",
    Value = false,
    Callback = function(Value)
        if Value then
            while Value do
                game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
                wait()
            end
        end
    end
})

Tabs.AutoTab:Toggle({
    Title = "自动修改体积为2",
    Value = false,
    Callback = function(Value)
        if Value then
            while Value do
                game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote:InvokeServer("changeSize",2)
                wait()
            end
        end
    end
})

Tabs.AutoTab:Toggle({
    Title = "自动传送肌肉之王",
    Value = false,
    Callback = function(Value)
        if Value then
            while Value do
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8625.9296875, 13.566278457641602, -5730.4736328125)
                wait()
            end
        end
    end
})

Tabs.AutoTab:Divider()

local Jump = false

Tabs.AutoTab:Toggle({
    Title = "0石头",
    Value = false,
    Callback = function(Value)
        getgenv().RK0 = Value
        Jump = Value
        if Value then
            spawn(function()
                while Jump do
                    local plr = game.Players.LocalPlayer
                    if plr and plr.Character then
                        local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                        local rootPart = plr.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            rootPart.CFrame = CFrame.new(15.53,0.76,2117.85)
                        end
                        local punch = plr.Backpack:FindFirstChild("Punch")
                        if punch and punch:IsA("Tool") and humanoid then
                            humanoid:EquipTool(punch)
                        end
                        local args = {"punch","rightHand"}
                        game:GetService("Players").LocalPlayer:WaitForChild("muscleEvent"):FireServer(unpack(args))
                    end
                    wait(0.1)
                end
            end)
        else
            local plr = game.Players.LocalPlayer
            if plr and plr.Character then
                local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:UnequipTools()
                end
            end
        end
    end
})

Tabs.AutoTab:Toggle({
    Title = "10石头",
    Value = false,
    Callback = function(Value)
        getgenv().RK0 = Value
        Jump = Value
        if Value then
            spawn(function()
                while Jump do
                    local plr = game.Players.LocalPlayer
                    if plr and plr.Character then
                        local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                        local rootPart = plr.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            rootPart.CFrame = CFrame.new(-151.39,2.10,437.53)
                        end
                        local punch = plr.Backpack:FindFirstChild("Punch")
                        if punch and punch:IsA("Tool") and humanoid then
                            humanoid:EquipTool(punch)
                        end
                        local args = {"punch","rightHand"}
                        game:GetService("Players").LocalPlayer:WaitForChild("muscleEvent"):FireServer(unpack(args))
                    end
                    wait(0.1)
                end
            end)
        else
            local plr = game.Players.LocalPlayer
            if plr and plr.Character then
                local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:UnequipTools()
                end
            end
        end
    end
})

Tabs.AutoTab:Toggle({
    Title = "100石头",
    Value = false,
    Callback = function(Value)
        getgenv().RK0 = Value
        Jump = Value
        if Value then
            spawn(function()
                while Jump do
                    local plr = game.Players.LocalPlayer
                    if plr and plr.Character then
                        local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                        local rootPart = plr.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            rootPart.CFrame = CFrame.new(164.47,1.24,-137.76)
                        end
                        local punch = plr.Backpack:FindFirstChild("Punch")
                        if punch and punch:IsA("Tool") and humanoid then
                            humanoid:EquipTool(punch)
                        end
                        local args = {"punch","rightHand"}
                        game:GetService("Players").LocalPlayer:WaitForChild("muscleEvent"):FireServer(unpack(args))
                    end
                    wait(0.1)
                end
            end)
        else
            local plr = game.Players.LocalPlayer
            if plr and plr.Character then
                local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:UnequipTools()
                end
            end
        end
    end
})

Tabs.AutoTab:Toggle({
    Title = "5000石头",
    Value = false,
    Callback = function(Value)
        getgenv().RK0 = Value
        Jump = Value
        if Value then
            spawn(function()
                while Jump do
                    local plr = game.Players.LocalPlayer
                    if plr and plr.Character then
                        local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                        local rootPart = plr.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            rootPart.CFrame = CFrame.new(313.02,2.06,-559.59)
                        end
                        local punch = plr.Backpack:FindFirstChild("Punch")
                        if punch and punch:IsA("Tool") and humanoid then
                            humanoid:EquipTool(punch)
                        end
                        local args = {"punch","rightHand"}
                        game:GetService("Players").LocalPlayer:WaitForChild("muscleEvent"):FireServer(unpack(args))
                    end
                    wait(0.1)
                end
            end)
        else
            local plr = game.Players.LocalPlayer
            if plr and plr.Character then
                local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:UnequipTools()
                end
            end
        end
    end
})

Tabs.AutoTab:Toggle({
    Title = "150000石头",
    Value = false,
    Callback = function(Value)
        getgenv().RK0 = Value
        Jump = Value
        if Value then
            spawn(function()
                while Jump do
                    local plr = game.Players.LocalPlayer
                    if plr and plr.Character then
                        local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                        local rootPart = plr.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            rootPart.CFrame = CFrame.new(-2514.23,1.07,-256.83)
                        end
                        local punch = plr.Backpack:FindFirstChild("Punch")
                        if punch and punch:IsA("Tool") and humanoid then
                            humanoid:EquipTool(punch)
                        end
                        local args = {"punch","rightHand"}
                        game:GetService("Players").LocalPlayer:WaitForChild("muscleEvent"):FireServer(unpack(args))
                    end
                    wait(0.1)
                end
            end)
        else
            local plr = game.Players.LocalPlayer
            if plr and plr.Character then
                local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:UnequipTools()
                end
            end
        end
    end
})

Tabs.AutoTab:Toggle({
    Title = "400000石头",
    Value = false,
    Callback = function(Value)
        getgenv().RK0 = Value
        Jump = Value
        if Value then
            spawn(function()
                while Jump do
                    local plr = game.Players.LocalPlayer
                    if plr and plr.Character then
                        local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                        local rootPart = plr.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            rootPart.CFrame = CFrame.new(2186.48,8.09,1290.90)
                        end
                        local punch = plr.Backpack:FindFirstChild("Punch")
                        if punch and punch:IsA("Tool") and humanoid then
                            humanoid:EquipTool(punch)
                        end
                        local args = {"punch","rightHand"}
                        game:GetService("Players").LocalPlayer:WaitForChild("muscleEvent"):FireServer(unpack(args))
                    end
                    wait(0.1)
                end
            end)
        else
            local plr = game.Players.LocalPlayer
            if plr and plr.Character then
                local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:UnequipTools()
                end
            end
        end
    end
})

Tabs.AutoTab:Toggle({
    Title = "750000石头",
    Value = false,
    Callback = function(Value)
        getgenv().RK0 = Value
        Jump = Value
        if Value then
            spawn(function()
                while Jump do
                    local plr = game.Players.LocalPlayer
                    if plr and plr.Character then
                        local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                        local rootPart = plr.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            rootPart.CFrame = CFrame.new(-7262.31,9.66,-1218.25)
                        end
                        local punch = plr.Backpack:FindFirstChild("Punch")
                        if punch and punch:IsA("Tool") and humanoid then
                            humanoid:EquipTool(punch)
                        end
                        local args = {"punch","rightHand"}
                        game:GetService("Players").LocalPlayer:WaitForChild("muscleEvent"):FireServer(unpack(args))
                    end
                    wait(0.1)
                end
            end)
        else
            local plr = game.Players.LocalPlayer
            if plr and plr.Character then
                local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:UnequipTools()
                end
            end
        end
    end
})

Tabs.AutoTab:Toggle({
    Title = "100万石头",
    Value = false,
    Callback = function(Value)
        getgenv().RK0 = Value
        Jump = Value
        if Value then
            spawn(function()
                while Jump do
                    local plr = game.Players.LocalPlayer
                    if plr and plr.Character then
                        local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                        local rootPart = plr.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            rootPart.CFrame = CFrame.new(4132.50,991.64,-4035.54)
                        end
                        local punch = plr.Backpack:FindFirstChild("Punch")
                        if punch and punch:IsA("Tool") and humanoid then
                            humanoid:EquipTool(punch)
                        end
                        local args = {"punch","rightHand"}
                        game:GetService("Players").LocalPlayer:WaitForChild("muscleEvent"):FireServer(unpack(args))
                    end
                    wait(0.1)
                end
            end)
        else
            local plr = game.Players.LocalPlayer
            if plr and plr.Character then
                local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:UnequipTools()
                end
            end
        end
    end
})

Tabs.AutoTab:Toggle({
    Title = "500万石头",
    Value = false,
    Callback = function(Value)
        getgenv().RK0 = Value
        Jump = Value
        if Value then
            spawn(function()
                while Jump do
                    local plr = game.Players.LocalPlayer
                    if plr and plr.Character then
                        local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                        local rootPart = plr.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            rootPart.CFrame = CFrame.new(-8985.91,17.23,-5989.86)
                        end
                        local punch = plr.Backpack:FindFirstChild("Punch")
                        if punch and punch:IsA("Tool") and humanoid then
                            humanoid:EquipTool(punch)
                        end
                        local args = {"punch","rightHand"}
                        game:GetService("Players").LocalPlayer:WaitForChild("muscleEvent"):FireServer(unpack(args))
                    end
                    wait(0.1)
                end
            end)
        else
            local plr = game.Players.LocalPlayer
            if plr and plr.Character then
                local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:UnequipTools()
                end
            end
        end
    end
})

Tabs.AutoTab:Toggle({
    Title = "1000万石头",
    Value = false,
    Callback = function(Value)
        getgenv().RK0 = Value
        Jump = Value
        if Value then
            spawn(function()
                while Jump do
                    local plr = game.Players.LocalPlayer
                    if plr and plr.Character then
                        local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                        local rootPart = plr.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            rootPart.CFrame = CFrame.new(-7639.93,4.30,3007.76)
                        end
                        local punch = plr.Backpack:FindFirstChild("Punch")
                        if punch and punch:IsA("Tool") and humanoid then
                            humanoid:EquipTool(punch)
                        end
                        local args = {"punch","rightHand"}
                        game:GetService("Players").LocalPlayer:WaitForChild("muscleEvent"):FireServer(unpack(args))
                    end
                    wait(0.1)
                end
            end)
        else
            local plr = game.Players.LocalPlayer
            if plr and plr.Character then
                local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:UnequipTools()
                end
            end
        end
    end
})
Tabs.TeleportTab:Section({ Title = "传送" })

Tabs.TeleportTab:Button({
    Title = "自动宝箱（传送+检测）[重复2次]",
    Callback = function()
        spawn(function()
            local repeatTimes = 2
            for cycle = 1, repeatTimes do
                local teleportPoints = {
                    CFrame.new(-138.17,7.33,-276.85),
                    CFrame.new(4680.29,1001.05,-3689.63),
                    CFrame.new(2213.03,7.33,918.64),
                    CFrame.new(-6713.86,7.33,-1454.19),
                    CFrame.new(-2572.08,7.33,-556.94),
                    CFrame.new(40.71,7.33,410.27),
                    CFrame.new(-7914.54,4.30,3028.47)
                }
                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local rootPart = character:WaitForChild("HumanoidRootPart")
                
                for _, targetCFrame in ipairs(teleportPoints) do
                    rootPart.CFrame = targetCFrame
                    task.wait(5)
                end
                task.wait(1)
                
                local ReplicatedStorage = game:GetService("ReplicatedStorage")
                local chestRewards = ReplicatedStorage:FindFirstChild("chestRewards")
                local checkRemote = ReplicatedStorage:FindFirstChild("rEvents"):FindFirstChild("checkChestRemote")
                
                if chestRewards and checkRemote then
                    local jk = {}
                    for _, v in pairs(chestRewards:GetDescendants()) do
                        if v.Name ~= "Light Karma Chest" and v.Name ~= "Evil Karma Chest" then
                            table.insert(jk, v.Name)
                        end
                    end
                    for _, chestName in ipairs(jk) do
                        checkRemote:InvokeServer(chestName)
                        task.wait(2)
                    end
                end
                task.wait(3)
            end
        end)
    end
})

Tabs.TeleportTab:Divider()

Tabs.TeleportTab:Button({
    Title = "沙滩",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-42.7, 3.7, 404.2)
    end
})

Tabs.TeleportTab:Button({
    Title = "小岛（0-1000力量）",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-37.636775970458984, 3.86960768699646, 1879.180908203125)
    end
})

Tabs.TeleportTab:Button({
    Title = "冰霜健身房（1重生）",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2623.022216796875, 3.716249465942383, -409.0733337402344)
    end
})

Tabs.TeleportTab:Button({
    Title = "神话健身房（5重生）",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2250.778076171875, 3.716248035430908, 1073.2266845703125)
    end
})

Tabs.TeleportTab:Button({
    Title = "永恒健身房（15重生）",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6758.9638671875, 3.71626353263855, -1284.918701171875)
    end
})

Tabs.TeleportTab:Button({
    Title = "传奇健身房（30重生）",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4603.28173828125, 987.869140625, -3897.86572265625)
    end
})

Tabs.TeleportTab:Button({
    Title = "力量之王健身房（5重生）",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8625.9296875, 13.566278457641602, -5730.4736328125)
    end
})

Tabs.TeleportTab:Button({
    Title = "狂野健身房（60重生）",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8693.0927734375, 8.93972396850586, 2400.66259765625)
    end
})

Tabs.TrainTab:Section({ Title = "自动锻炼" })

local AutoTrainEnabled = false
local TrainThread = nil

Tabs.TrainTab:Toggle({
    Title = "自动锻炼",
    Value = false,
    Callback = function(Value)
        AutoTrainEnabled = Value
        if TrainThread then
            task.cancel(TrainThread)
            TrainThread = nil
        end
        if AutoTrainEnabled then
            TrainThread = task.spawn(function()
                while AutoTrainEnabled do
                    local args = {[1] = "rep"}
                    local muscleEvent = game.Players.LocalPlayer:FindFirstChild("muscleEvent")
                    if muscleEvent then
                        muscleEvent:FireServer(unpack(args))
                    end
                    task.wait(0.1)
                end
            end)
        end
    end
})

local AutoPunchEnabled = false
local PunchThread = nil

Tabs.TrainTab:Toggle({
    Title = "自动挥拳",
    Value = false,
    Callback = function(Value)
        AutoPunchEnabled = Value
        if PunchThread then
            task.cancel(PunchThread)
            PunchThread = nil
        end
        if AutoPunchEnabled then
            PunchThread = task.spawn(function()
                while AutoPunchEnabled do
                    local args = {[1] = "punch", [2] = "rightHand"}
                    local muscleEvent = game.Players.LocalPlayer:FindFirstChild("muscleEvent")
                    if muscleEvent then
                        muscleEvent:FireServer(unpack(args))
                    end
                    task.wait(0.1)
                end
            end)
        end
    end
})

Tabs.TrainTab:Divider()

Tabs.TrainTab:Toggle({
    Title = "自动哑铃",
    Value = false,
    Callback = function(Value)
        for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v.ClassName == "Tool" and v.Name == "Weight" then
                v.Parent = game.Players.LocalPlayer.Character
                wait()
            end
        end
        if Value then
            local AutoRep = Value
            while AutoRep do
                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                wait()
            end
        end
    end
})

Tabs.TrainTab:Toggle({
    Title = "自动俯卧撑",
    Value = false,
    Callback = function(Value)
        for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v.ClassName == "Tool" and v.Name == "Pushups" then
                v.Parent = game.Players.LocalPlayer.Character
                wait()
            end
        end
        if Value then
            local AutoRep = Value
            while AutoRep do
                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                wait()
            end
        end
    end
})

Tabs.TrainTab:Toggle({
    Title = "自动仰卧起坐",
    Value = false,
    Callback = function(Value)
        for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v.ClassName == "Tool" and v.Name == "Situps" then
                v.Parent = game.Players.LocalPlayer.Character
                wait()
            end
        end
        if Value then
            local AutoRep = Value
            while AutoRep do
                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                wait()
            end
        end
    end
})

Tabs.TrainTab:Toggle({
    Title = "自动倒立",
    Value = false,
    Callback = function(Value)
        for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v.ClassName == "Tool" and v.Name == "Handstands" then
                v.Parent = game.Players.LocalPlayer.Character
                wait()
            end
        end
        if Value then
            local AutoRep = Value
            while AutoRep do
                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                wait()
            end
        end
    end
})

Tabs.TrainTab:Toggle({
    Title = "自动练全部",
    Value = false,
    Callback = function(Value)
        for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v.ClassName == "Tool" and v.Name == "Weight" or v.Name == "Handstands" or v.Name == "Pushups" or v.Name == "Situps" then
                v.Parent = game.Players.LocalPlayer.Character
                wait()
            end
        end
        if Value then
            local AutoRep = Value
            while AutoRep do
                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                wait()
            end
        end
    end
})

Tabs.RunTab:Section({ Title = "自动跑步" })

Tabs.RunTab:Toggle({
    Title = "跑步机海滩10",
    Value = false,
    Callback = function(treadmill)
        getgenv().spam = treadmill
        while getgenv().spam do
            wait()
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 10
            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(238.671112, 5.40315914, 387.713165, -0.0160072874, -2.90710176e-08, -0.99987185, -3.3434191e-09, 1, -2.90212157e-08, 0.99987185, 2.87843993e-09, -0.0160072874)
            local oldpos = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
            local RunService = game:GetService("RunService")
            local Players = game:GetService("Players")
            local localPlayer = Players.LocalPlayer
            RunService:BindToRenderStep("move",
                Enum.RenderPriority.Character.Value + 1,
                function()
                    if localPlayer.Character then
                        local humanoid = localPlayer.Character:WaitForChild("Humanoid")
                        if humanoid then
                            humanoid:Move(Vector3.new(10000, 0, -1), true)
                        end
                    end
                end
            )
        end
        if not getgenv().spam then
            local RunService = game:GetService("RunService")
            local Players = game:GetService("Players")
            local localPlayer = Players.LocalPlayer
            RunService:UnbindFromRenderStep("move",
                Enum.RenderPriority.Character.Value + 1,
                function()
                    if localPlayer.Character then
                        local humanoid = localPlayer.Character:FindFirstChild("Humanoid")
                        if humanoid then
                            humanoid:Move(Vector3.new(10000, 0, -1), true)
                        end
                    end
                end
            )
        end
    end
})

Tabs.RunTab:Toggle({
    Title = "跑步机Frost-健身房-2000",
    Value = false,
    Callback = function(treadmill)
        if game.Players.LocalPlayer.Agility.Value >= 2000 then
            getgenv().spam = treadmill
            while getgenv().spam do
                wait()
                game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 10
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-3005.37866, 14.3221855, -464.697876, -0.015773816, -1.38508964e-08, 0.999875605, -5.13225586e-08, 1, 1.30429667e-08, -0.999875605, -5.11104332e-08, -0.015773816)
                local oldpos = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
                local RunService = game:GetService("RunService")
                local Players = game:GetService("Players")
                local localPlayer = Players.LocalPlayer
                RunService:BindToRenderStep("move",
                    Enum.RenderPriority.Character.Value + 1,
                    function()
                        if localPlayer.Character then
                            local humanoid = localPlayer.Character:WaitForChild("Humanoid")
                            if humanoid then
                                humanoid:Move(Vector3.new(10000, 0, -1), true)
                            end
                        end
                    end
                )
            end
        end
        if not getgenv().spam then
            local RunService = game:GetService("RunService")
            local Players = game:GetService("Players")
            local localPlayer = Players.LocalPlayer
            RunService:UnbindFromRenderStep("move",
                Enum.RenderPriority.Character.Value + 1,
                function()
                    if localPlayer.Character then
                        local humanoid = localPlayer.Character:FindFirstChild("Humanoid")
                        if humanoid then
                            humanoid:Move(Vector3.new(10000, 0, -1), true)
                        end
                    end
                end
            )
        end
    end
})

Tabs.RunTab:Toggle({
    Title = "跑步机神话-健身房2000",
    Value = false,
    Callback = function(treadmill)
        if game.Players.LocalPlayer.Agility.Value >= 2000 then
            getgenv().spam = treadmill
            while getgenv().spam do
                wait()
                game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 10
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(2571.23706, 15.6896839, 898.650391, 0.999968231, 2.23868635e-09, -0.00797206629, -1.73198844e-09, 1, 6.35660768e-08, 0.00797206629, -6.3550246e-08, 0.999968231)
                local oldpos = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
                local RunService = game:GetService("RunService")
                local Players = game:GetService("Players")
                local localPlayer = Players.LocalPlayer
                RunService:BindToRenderStep("move",
                    Enum.RenderPriority.Character.Value + 1,
                    function()
                        if localPlayer.Character then
                            local humanoid = localPlayer.Character:WaitForChild("Humanoid")
                            if humanoid then
                                humanoid:Move(Vector3.new(10000, 0, -1), true)
                            end
                        end
                    end
                )
            end
        end
        if not getgenv().spam then
            local RunService = game:GetService("RunService")
            local Players = game:GetService("Players")
            local localPlayer = Players.LocalPlayer
            RunService:UnbindFromRenderStep("move",
                Enum.RenderPriority.Character.Value + 1,
                function()
                    if localPlayer.Character then
                        local humanoid = localPlayer.Character:FindFirstChild("Humanoid")
                        if humanoid then
                            humanoid:Move(Vector3.new(10000, 0, -1), true)
                        end
                    end
                end
            )
        end
    end
})

Tabs.RunTab:Toggle({
    Title = "永恒跑步机-健身房",
    Value = false,
    Callback = function(treadmill)
        if game.Players.LocalPlayer.Agility.Value >= 3500 then
            getgenv().spam = treadmill
            while getgenv().spam do
                wait()
                game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 10
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-7077.79102, 29.6702118, -1457.59961, -0.0322036594, -3.31122768e-10, 0.99948132, -6.44344267e-09, 1, 1.23684493e-10, -0.99948132, -6.43611742e-09, -0.0322036594)
                local oldpos = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
                local RunService = game:GetService("RunService")
                local Players = game:GetService("Players")
                local localPlayer = Players.LocalPlayer
                RunService:BindToRenderStep("move",
                    Enum.RenderPriority.Character.Value + 1,
                    function()
                        if localPlayer.Character then
                            local humanoid = localPlayer.Character:WaitForChild("Humanoid")
                            if humanoid then
                                humanoid:Move(Vector3.new(10000, 0, -1), true)
                            end
                        end
                    end
                )
            end
        end
        if not getgenv().spam then
            local RunService = game:GetService("RunService")
            local Players = game:GetService("Players")
            local localPlayer = Players.LocalPlayer
            RunService:UnbindFromRenderStep("move",
                Enum.RenderPriority.Character.Value + 1,
                function()
                    if localPlayer.Character then
                        local humanoid = localPlayer.Character:FindFirstChild("Humanoid")
                        if humanoid then
                            humanoid:Move(Vector3.new(10000, 0, -1), true)
                        end
                    end
                end
            )
        end
    end
})

Tabs.RunTab:Toggle({
    Title = "跑步机传奇-健身房",
    Value = false,
    Callback = function(treadmill)
        if game.Players.LocalPlayer.Agility.Value >= 3000 then
            getgenv().spam = treadmill
            while getgenv().spam do
                wait()
                game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 10
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(4370.82812, 999.358704, -3621.42773, -0.960604727, -8.41949266e-09, -0.27791819, -6.12478646e-09, 1, -9.12496567e-09, 0.27791819, -7.06329528e-09, -0.960604727)
                local oldpos = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
                local RunService = game:GetService("RunService")
                local Players = game:GetService("Players")
                local localPlayer = Players.LocalPlayer
                RunService:BindToRenderStep("move",
                    Enum.RenderPriority.Character.Value + 1,
                    function()
                        if localPlayer.Character then
                            local humanoid = localPlayer.Character:WaitForChild("Humanoid")
                            if humanoid then
                                humanoid:Move(Vector3.new(10000, 0, -1), true)
                            end
                        end
                    end
                )
            end
        end
        if not getgenv().spam then
            local RunService = game:GetService("RunService")
            local Players = game:GetService("Players")
            local localPlayer = Players.LocalPlayer
            RunService:UnbindFromRenderStep("move",
                Enum.RenderPriority.Character.Value + 1,
                function()
                    if localPlayer.Character then
                        local humanoid = localPlayer.Character:FindFirstChild("Humanoid")
                        if humanoid then
                            humanoid:Move(Vector3.new(10000, 0, -1), true)
                        end
                    end
                end
            )
        end
    end
})

Tabs.SquatTab:Section({ Title = "自动蹲起" })

Tabs.SquatTab:Toggle({
    Title = "沙滩",
    Value = false,
    Callback = function(rack)
        if game.Players.LocalPlayer.leaderstats.Strength.Value >= 1000 then
            getgenv().spam = rack
            while getgenv().spam do
                wait()
                if game.Players.LocalPlayer.machineInUse.Value == nil then
                    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(232.627625, 3.67689133, 96.3039856, -0.963445187, -7.78685845e-08, -0.267905563, -7.92865222e-08, 1, -5.52570167e-09, 0.267905563, 1.5917589e-08, -0.963445187)
                    local vim = game:service("VirtualInputManager")
                    vim:SendKeyEvent(true, "E", false, game)
                else
                    local A_1 = "rep"
                    local A_2 = game:GetService("Workspace").machinesFolder["Squat Rack"].interactSeat
                    local Event = game:GetService("Players").LocalPlayer.muscleEvent
                    Event:FireServer(A_1, A_2)
                end
            end
        end
        if not getgenv().spam then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
        end
    end
})

Tabs.SquatTab:Toggle({
    Title = "冰冻健身房",
    Value = false,
    Callback = function(rack)
        if game.Players.LocalPlayer.leaderstats.Strength.Value >= 4000 then
            getgenv().spam = rack
            while getgenv().spam do
                wait()
                if game.Players.LocalPlayer.machineInUse.Value == nil then
                    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-2629.13818, 3.36860609, -609.827454, -0.995664716, -2.67296816e-08, -0.0930150598, -1.90042453e-08, 1, -8.39415222e-08, 0.0930150598, -8.18099295e-08, -0.995664716)
                    local vim = game:service("VirtualInputManager")
                    vim:SendKeyEvent(true, "E", false, game)
                else
                    local A_1 = "rep"
                    local A_2 = game:GetService("Workspace").machinesFolder["Squat Rack"].interactSeat
                    local Event = game:GetService("Players").LocalPlayer.muscleEvent
                    Event:FireServer(A_1, A_2)
                end
            end
        end
        if not getgenv().spam then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
        end
    end
})

Tabs.SquatTab:Toggle({
    Title = "传奇健身房",
    Value = false,
    Callback = function(rack)
        getgenv().spam = rack
        while getgenv().spam do
            wait()
            if game.Players.LocalPlayer.machineInUse.Value == nil then
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(4443.04443, 987.521484, -4061.12988, 0.83309716, 3.33018835e-09, 0.553126693, -2.87759438e-09, 1, -1.68654424e-09, -0.553126693, -1.86619012e-10, 0.83309716)
                local vim = game:service("VirtualInputManager")
                vim:SendKeyEvent(true, "E", false, game)
            else
                local A_1 = "rep"
                local A_2 = game:GetService("Workspace").machinesFolder["Squat Rack"].interactSeat
                local Event = game:GetService("Players").LocalPlayer.muscleEvent
                Event:FireServer(A_1, A_2)
            end
        end
        if not getgenv().spam then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
        end
    end
})

Tabs.SquatTab:Toggle({
    Title = "肌肉健身房",
    Value = false,
    Callback = function(rack)
        getgenv().spam = rack
        while getgenv().spam do
            wait()
            if game.Players.LocalPlayer.machineInUse.Value == nil then
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-8757.37012, 13.2186356, -6051.24365, -0.902269304, 1.63610299e-08, -0.431172907, 1.71076486e-08, 1, 2.14606288e-09, 0.431172907, -5.44002754e-09, -0.902269304)
                local vim = game:service("VirtualInputManager")
                vim:SendKeyEvent(true, "E", false, game)
            else
                local A_1 = "rep"
                local A_2 = game:GetService("Workspace").machinesFolder["Squat Rack"].interactSeat
                local Event = game:GetService("Players").LocalPlayer.muscleEvent
                Event:FireServer(A_1, A_2)
            end
        end
        if not getgenv().spam then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
        end
    end
})

Tabs.PullTab:Section({ Title = "引体向上" })

Tabs.PullTab:Toggle({
    Title = "海滩",
    Value = false,
    Callback = function(pull)
        if game.Players.LocalPlayer.leaderstats.Strength.Value >= 1000 then
            getgenv().spam = pull
            while getgenv().spam do
                wait()
                if game.Players.LocalPlayer.machineInUse.Value == nil then
                    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-185.157745, 5.81071186, 104.747154, 0.227061391, -8.2363325e-09, 0.97388047, 5.58502826e-08, 1, -4.56432803e-09, -0.97388047, 5.54278827e-08, 0.227061391)
                    local vim = game:service("VirtualInputManager")
                    vim:SendKeyEvent(true, "E", false, game)
                else
                    local A_1 = "rep"
                    local A_2 = game:GetService("Workspace").machinesFolder["Legends Pullup"].interactSeat
                    local Event = game:GetService("Players").LocalPlayer.muscleEvent
                    Event:FireServer(A_1, A_2)
                end
            end
        end
        if not getgenv().spam then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
        end
    end
})

Tabs.PullTab:Toggle({
    Title = "神话",
    Value = false,
    Callback = function(pull)
        if game.Players.LocalPlayer.leaderstats.Strength.Value >= 4000 then
            getgenv().spam = pull
            while getgenv().spam do
                wait()
                if game.Players.LocalPlayer.machineInUse.Value == nil then
                    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(2315.82104, 5.81071281, 847.153076, 0.993555248, 6.99809632e-08, 0.113349125, -7.05298859e-08, 1, 8.32554692e-10, -0.113349125, -8.82168916e-09, 0.993555248)
                    local vim = game:service("VirtualInputManager")
                    vim:SendKeyEvent(true, "E", false, game)
                else
                    local A_1 = "rep"
                    local A_2 = game:GetService("Workspace").machinesFolder["Legends Pullup"].interactSeat
                    local Event = game:GetService("Players").LocalPlayer.muscleEvent
                    Event:FireServer(A_1, A_2)
                end
            end
        end
        if not getgenv().spam then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
        end
    end
})

Tabs.PullTab:Toggle({
    Title = "传奇",
    Value = false,
    Callback = function(pull)
        getgenv().spam = pull
        while getgenv().spam do
            wait()
            if game.Players.LocalPlayer.machineInUse.Value == nil then
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(4305.08203, 989.963623, -4118.44873, -0.953815758, -7.58000382e-08, -0.30039227, -8.98859724e-08, 1, 3.30721512e-08, 0.30039227, 5.85457904e-08, -0.953815758)
                local vim = game:service("VirtualInputManager")
                vim:SendKeyEvent(true, "E", false, game)
            else
                local A_1 = "rep"
                local A_2 = game:GetService("Workspace").machinesFolder["Legends Pullup"].interactSeat
                local Event = game:GetService("Players").LocalPlayer.muscleEvent
                Event:FireServer(A_1, A_2)
            end
        end
        if not getgenv().spam then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
        end
    end
})

Tabs.LiftTab:Section({ Title = "自动举重" })

Tabs.LiftTab:Toggle({
    Title = "海滩",
    Value = false,
    Callback = function(lift)
        if game.Players.LocalPlayer.leaderstats.Strength.Value >= 1500 then
            getgenv().spam = lift
            while getgenv().spam do
                wait()
                if game.Players.LocalPlayer.machineInUse.Value == nil then
                    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(136.606216, 3.67689133, 97.661499, -0.974106729, -1.89495477e-08, 0.226088539, -1.78365624e-08, 1, 6.96555214e-09, -0.226088539, 2.75254886e-09, -0.974106729)
                    local vim = game:service("VirtualInputManager")
                    vim:SendKeyEvent(true, "E", false, game)
                else
                    local A_1 = "rep"
                    local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
                    local Event = game:GetService("Players").LocalPlayer.muscleEvent
                    Event:FireServer(A_1, A_2)
                end
            end
        end
        if not getgenv().spam then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
        end
    end
})

Tabs.LiftTab:Toggle({
    Title = "传说健身房",
    Value = false,
    Callback = function(lift)
        if game.Players.LocalPlayer.leaderstats.Strength.Value >= 5000 then
            getgenv().spam = lift
            while getgenv().spam do
                wait()
                if game.Players.LocalPlayer.machineInUse.Value == nil then
                    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-2916.11572, 3.67689204, -212.97438, -0.241641939, -6.10995343e-08, 0.970365465, 6.65890596e-08, 1, 7.9547597e-08, -0.970365465, 8.38377616e-08, -0.241641939)
                    local vim = game:service("VirtualInputManager")
                    vim:SendKeyEvent(true, "E", false, game)
                else
                    local A_1 = "rep"
                    local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
                    local Event = game:GetService("Players").LocalPlayer.muscleEvent
                    Event:FireServer(A_1, A_2)
                end
            end
        end
        if not getgenv().spam then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
        end
    end
})

Tabs.LiftTab:Toggle({
    Title = "传奇健身房",
    Value = false,
    Callback = function(lift)
        getgenv().spam = lift
        while getgenv().spam do
            wait()
            if game.Players.LocalPlayer.machineInUse.Value == nil then
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(4538.42627, 987.829834, -4008.82007, -0.830109239, 2.21324914e-08, 0.557600796, 8.02302083e-08, 1, 7.97476361e-08, -0.557600796, 1.1093568e-07, -0.830109239)
                local vim = game:service("VirtualInputManager")
                vim:SendKeyEvent(true, "E", false, game)
            else
                local A_1 = "rep"
                local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
                local Event = game:GetService("Players").LocalPlayer.muscleEvent
                Event:FireServer(A_1, A_2)
            end
        end
        if not getgenv().spam then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
        end
    end
})

Tabs.LiftTab:Toggle({
    Title = "肌肉之王",
    Value = false,
    Callback = function(lift)
        getgenv().spam = lift
        while getgenv().spam do
            wait()
            if game.Players.LocalPlayer.machineInUse.Value == nil then
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-8768.4375, 13.5269203, -5681.62256, -0.997508109, -5.4007393e-10, 0.0705519542, 1.52984292e-10, 1, 9.81797044e-09, -0.0705519542, 9.80429782e-09, -0.997508109)
                local vim = game:service("VirtualInputManager")
                vim:SendKeyEvent(true, "E", false, game)
            else
                local A_1 = "rep"
                local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
                local Event = game:GetService("Players").LocalPlayer.muscleEvent
                Event:FireServer(A_1, A_2)
            end
        end
        if not getgenv().spam then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
        end
    end
})

Tabs.ThrowTab:Section({ Title = "自动投石" })

Tabs.ThrowTab:Toggle({
    Title = "海滩",
    Value = false,
    Callback = function(lift)
        if game.Players.LocalPlayer.leaderstats.Strength.Value >= 3000 then
            getgenv().spam = lift
            while getgenv().spam do
                wait()
                if game.Players.LocalPlayer.machineInUse.Value == nil then
                    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-91.6730804, 3.67689133, -292.42868, -0.221022144, -2.21041621e-08, -0.975268781, 1.21414407e-08, 1, -2.54162646e-08, 0.975268781, -1.7458726e-08, -0.221022144)
                    local vim = game:service("VirtualInputManager")
                    vim:SendKeyEvent(true, "E", false, game)
                else
                    local A_1 = "rep"
                    local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
                    local Event = game:GetService("Players").LocalPlayer.muscleEvent
                    Event:FireServer(A_1, A_2)
                end
            end
        end
        if not getgenv().spam then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
        end
    end
})

Tabs.ThrowTab:Toggle({
    Title = "神话",
    Value = false,
    Callback = function(lift)
        if game.Players.LocalPlayer.leaderstats.Strength.Value >= 10000 then
            getgenv().spam = lift
            while getgenv().spam do
                wait()
                if game.Players.LocalPlayer.machineInUse.Value == nil then
                    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(2486.01733, 3.67689276, 1237.89331, 0.883595645, -2.06135038e-08, -0.468250751, -3.3286871e-09, 1, -5.03036404e-08, 0.468250751, 4.60067362e-08, 0.883595645)
                    local vim = game:service("VirtualInputManager")
                    vim:SendKeyEvent(true, "E", false, game)
                else
                    local A_1 = "rep"
                    local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
                    local Event = game:GetService("Players").LocalPlayer.muscleEvent
                    Event:FireServer(A_1, A_2)
                end
            end
        end
        if not getgenv().spam then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
        end
    end
})

Tabs.ThrowTab:Toggle({
    Title = "传奇",
    Value = false,
    Callback = function(lift)
        getgenv().spam = lift
        while getgenv().spam do
            wait()
            if game.Players.LocalPlayer.machineInUse.Value == nil then
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(4189.96143, 987.829773, -3903.0166, 0.422592968, 0, 0.906319559, 0, 1, 0, -0.906319559, 0, 0.422592968)
                local vim = game:service("VirtualInputManager")
                vim:SendKeyEvent(true, "E", false, game)
            else
                local A_1 = "rep"
                local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
                local Event = game:GetService("Players").LocalPlayer.muscleEvent
                Event:FireServer(A_1, A_2)
            end
        end
        if not getgenv().spam then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
        end
    end
})

Tabs.ThrowTab:Toggle({
    Title = "肌肉之王",
    Value = false,
    Callback = function(lift)
        getgenv().spam = lift
        while getgenv().spam do
            wait()
            if game.Players.LocalPlayer.machineInUse.Value == nil then
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(8933.69434, 13.5269222, -5700.12598, -0.823058188, 6.96304259e-09, 0.567957044, -1.19721832e-08, 1, -2.96093621e-08, -0.567957044, -3.11699146e-08, -0.823058188)
                local vim = game:service("VirtualInputManager")
                vim:SendKeyEvent(true, "E", false, game)
            else
                local A_1 = "rep"
                local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
                local Event = game:GetService("Players").LocalPlayer.muscleEvent
                Event:FireServer(A_1, A_2)
            end
        end
        if not getgenv().spam then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
        end
    end
})
end)

Button(Tabjz, "抢劫一栋房子", function()
    --司空自愿开源发出，此行可选择是否复制(效果都一样都可执行)
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local homePos = nil
local autoFarm = false
local currentTrophy = nil
local flowTime = 0

local function Tween(obj, props, time, ease)
	TweenService:Create(obj, TweenInfo.new(time or 0.2, ease or Enum.EasingStyle.Quad, Enum.EasingDirection.Out), props):Play()
end

local function SetInstant(prompt)
	if prompt:IsA("ProximityPrompt") then
		prompt.HoldDuration = 0
	end
end
for _, v in ipairs(game:GetDescendants()) do SetInstant(v) end
game.DescendantAdded:Connect(SetInstant)

local function SafeToNumber(str)
	if not str then return 0 end
	local clean = str:gsub(",", "")
	return tonumber(clean) or 0
end

local function ScanTrophies()
	local best, maxSteal = nil, 0
	for _, gui in ipairs(game:GetDescendants()) do
		if gui.Name == "TrophyDespawnGui" and gui:IsA("BillboardGui") then
			local m = gui.Parent
			if m and m:IsA("Model") then
				local steal = 0
				for _, lbl in ipairs(m:GetDescendants()) do
					if lbl:IsA("TextLabel") and lbl.Text:find("Steal") then
						local n = lbl.Text:match("%$(%d[%d,]*)")
						if n then steal = SafeToNumber(n) end
					end
				end
				if steal > maxSteal then
					maxSteal = steal
					best = m
				end
			end
		end
	end
	return best, maxSteal
end

local function TP(pos)
	local char = LocalPlayer.Character
	if char and char:FindFirstChild("HumanoidRootPart") then
		char.HumanoidRootPart.CFrame = CFrame.new(pos + Vector3.new(0, 3, 0))
	end
end

local function GetTrophyPos(trophy)
	local part = trophy.PrimaryPart or trophy:FindFirstChildWhichIsA("BasePart")
	return part and part.Position or nil
end

local function TriggerPickUp(trophy)
	for _, v in ipairs(trophy:GetDescendants()) do
		if v:IsA("ProximityPrompt") and v.Name == "PickUpPrompt" then
			pcall(function() v:InputHoldBegin() end)
			pcall(function() fireproximityprompt(v) end)
			return
		end
	end
end

spawn(function()
	while true do
		if autoFarm and homePos then
			local trophy, steal = ScanTrophies()
			if trophy and trophy ~= currentTrophy then
				currentTrophy = trophy
				local pos = GetTrophyPos(trophy)
				if pos then
					local startPos = pos
					local parented = trophy.Parent
					TP(pos)
					local waited = 0
					local gotIt = false
					while autoFarm and waited < 30 do
						wait(0.2)
						waited = waited + 0.2
						TriggerPickUp(trophy)
						local stillThere = trophy and trophy.Parent == parented
						local newPos = GetTrophyPos(trophy)
						local moved = newPos and startPos and (newPos - startPos).Magnitude > 5
						if not stillThere or moved then
							gotIt = true
							break
						end
					end
					if gotIt then
						TP(homePos)
						currentTrophy = nil
						wait(0.2)
					else
						currentTrophy = nil
					end
				end
			end
		end
		wait(0.3)
	end
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TrophyFarmUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 260, 0, 170)
Main.Position = UDim2.new(0.5, -130, 0.22, 0)
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 18)
MainCorner.Parent = Main

local FlowLayer = Instance.new("Frame")
FlowLayer.Size = UDim2.new(1, 0, 1, 0)
FlowLayer.Position = UDim2.new(0, 0, 0, 0)
FlowLayer.BackgroundTransparency = 0.93
FlowLayer.BorderSizePixel = 0
FlowLayer.ZIndex = 0
FlowLayer.Parent = Main

local FlowGrad = Instance.new("UIGradient")
FlowGrad.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 170, 255)),
	ColorSequenceKeypoint.new(0.33, Color3.fromRGB(160, 120, 255)),
	ColorSequenceKeypoint.new(0.66, Color3.fromRGB(80, 240, 200)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 170, 255))
}
FlowGrad.Rotation = 45
FlowGrad.Parent = FlowLayer

local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(248, 248, 252)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = Main

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 18)
TitleCorner.Parent = TitleBar

local BottomMask = Instance.new("Frame")
BottomMask.Size = UDim2.new(1, 0, 0, 16)
BottomMask.Position = UDim2.new(0, 0, 1, -16)
BottomMask.BackgroundColor3 = Color3.fromRGB(248, 248, 252)
BottomMask.BorderSizePixel = 0
BottomMask.Parent = TitleBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Position = UDim2.new(0, 16, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "奖杯自动获取"
Title.TextColor3 = Color3.fromRGB(40, 40, 60)
Title.TextSize = 17
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

local FoldBtn = Instance.new("TextButton")
FoldBtn.Size = UDim2.new(0, 22, 0, 22)
FoldBtn.Position = UDim2.new(1, -30, 0, 9)
FoldBtn.BackgroundColor3 = Color3.fromRGB(255, 85, 75)
FoldBtn.Text = ""
FoldBtn.Parent = TitleBar

local FoldCorner = Instance.new("UICorner")
FoldCorner.CornerRadius = UDim.new(1, 0)
FoldCorner.Parent = FoldBtn

local dragging, dragStart, startPos
TitleBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = Main.Position
	end
end)
TitleBar.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
	end
end)
TitleBar.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragStart
		Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

local function MakeBtn(text, accentColor, yPos)

	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -32, 0, 46)
	btn.Position = UDim2.new(0, 16, 0, yPos)
	btn.BackgroundColor3 = Color3.fromRGB(245, 245, 250)
	btn.BorderSizePixel = 0
	btn.ClipsDescendants = true
	btn.Text = ""
	btn.AutoButtonColor = false
	btn.Parent = Main

	local btnCorner = Instance.new("UICorner")
	btnCorner.CornerRadius = UDim.new(0, 12)
	btnCorner.Parent = btn

	local AccentBar = Instance.new("Frame")
	AccentBar.Size = UDim2.new(0, 4, 0.55, 0)
	AccentBar.Position = UDim2.new(0, 0, 0.225, 0)
	AccentBar.BackgroundColor3 = accentColor
	AccentBar.BorderSizePixel = 0
	AccentBar.Parent = btn

	local AccentCorner = Instance.new("UICorner")
	AccentCorner.CornerRadius = UDim.new(0, 2)
	AccentCorner.Parent = AccentBar

	local btnLabel = Instance.new("TextLabel")
	btnLabel.Size = UDim2.new(1, -24, 1, 0)
	btnLabel.Position = UDim2.new(0, 18, 0, 0)
	btnLabel.BackgroundTransparency = 1
	btnLabel.Text = text
	btnLabel.TextColor3 = Color3.fromRGB(50, 50, 70)
	btnLabel.TextSize = 15
	btnLabel.Font = Enum.Font.GothamBold
	btnLabel.TextXAlignment = Enum.TextXAlignment.Left
	btnLabel.ZIndex = 3
	btnLabel.Parent = btn

	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(230, 230, 240)
	stroke.Thickness = 1
	stroke.Parent = btn

	local function SpawnShine()
		local Shine = Instance.new("Frame")
		Shine.Size = UDim2.new(0.3, 0, 1, 0)
		Shine.Position = UDim2.new(-0.4, 0, 0, 0)
		Shine.BackgroundColor3 = accentColor
		Shine.BackgroundTransparency = 0.55
		Shine.BorderSizePixel = 0
		Shine.ZIndex = 1  
		Shine.Parent = btn

		local ShineGrad = Instance.new("UIGradient")
		ShineGrad.Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
			ColorSequenceKeypoint.new(0.5, accentColor),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
		}
		ShineGrad.Transparency = NumberSequence.new{
			NumberSequenceKeypoint.new(0, 1),
			NumberSequenceKeypoint.new(0.5, 0.2),
			NumberSequenceKeypoint.new(1, 1)
		}
		ShineGrad.Parent = Shine

		local t = TweenService:Create(Shine,
			TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
			{Position = UDim2.new(1.1, 0, 0, 0)}
		)
		t:Play()
		t.Completed:Connect(function()
			Shine:Destroy()
		end)
	end

	btn.MouseButton1Down:Connect(function()
		Tween(btn, {BackgroundColor3 = Color3.fromRGB(232, 232, 242)}, 0.06)
		SpawnShine()
	end)

	btn.MouseButton1Up:Connect(function()
		Tween(btn, {BackgroundColor3 = Color3.fromRGB(245, 245, 250)}, 0.12)
	end)

	btn.MouseLeave:Connect(function()
		Tween(btn, {BackgroundColor3 = Color3.fromRGB(245, 245, 250)}, 0.1)
	end)

	return btn, btnLabel
end

local BtnAuto, AutoLabel = MakeBtn("开始运行", Color3.fromRGB(50, 200, 100), 56)
local BtnHome, HomeLabel = MakeBtn("记录家的位置", Color3.fromRGB(60, 130, 255), 110)

BtnAuto.MouseButton1Up:Connect(function()
	if not homePos then
		AutoLabel.Text = "请先记录家的位置!"
		AutoLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
		wait(1.5)
		AutoLabel.Text = "开始运行"
		AutoLabel.TextColor3 = Color3.fromRGB(50, 50, 70)
		return
	end
	autoFarm = not autoFarm
	if autoFarm then
		AutoLabel.Text = "停止运行"
		AutoLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
	else
		AutoLabel.Text = "开始运行"
		AutoLabel.TextColor3 = Color3.fromRGB(50, 50, 70)
	end
end)

BtnHome.MouseButton1Up:Connect(function()
	local char = LocalPlayer.Character
	if char and char:FindFirstChild("HumanoidRootPart") then
		homePos = char.HumanoidRootPart.Position
		HomeLabel.Text = "家的位置已记录"
		HomeLabel.TextColor3 = Color3.fromRGB(50, 200, 100)
		wait(1.5)
		HomeLabel.Text = "重新记录家的位置"
		HomeLabel.TextColor3 = Color3.fromRGB(50, 50, 70)
	end
end)

local folded = false
FoldBtn.MouseButton1Click:Connect(function()
	folded = not folded
	if folded then
		BottomMask.Visible = false
		Tween(Main, {Size = UDim2.new(0, 260, 0, 42)}, 0.25, Enum.EasingStyle.Quad)
		Tween(BtnAuto, {Position = UDim2.new(0, 16, 0, -200)}, 0.2)
		Tween(BtnHome, {Position = UDim2.new(0, 16, 0, -200)}, 0.2)
		wait(0.2)
		BtnAuto.Visible = false
		BtnHome.Visible = false
	else
		BtnAuto.Visible = true
		BtnHome.Visible = true
		BottomMask.Visible = true
		Tween(Main, {Size = UDim2.new(0, 260, 0, 170)}, 0.25, Enum.EasingStyle.Quad)
		Tween(BtnAuto, {Position = UDim2.new(0, 16, 0, 56)}, 0.25)
		Tween(BtnHome, {Position = UDim2.new(0, 16, 0, 110)}, 0.25)
	end
end)

RunService.RenderStepped:Connect(function(dt)
	flowTime = flowTime + dt
	FlowGrad.Rotation = (flowTime * 5) % 360
end)
end)

Button(Tabjz, "伪装一个退化脑症", function()
    local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"
))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 400),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5,  XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button

    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end

    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5,  XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    FarmTab = Window:Tab({ Title = "功能" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

Tabs.FarmTab:Section({ Title = "ESP假脑红" })

local players = game:GetService("Players")
local lp = players.LocalPlayer or players.PlayerAdded:Wait()

local function clear(c)
    local h = c:FindFirstChild("ESPHighlight") if h then h:Destroy() end
    local head = c:FindFirstChild("Head")
    if head then
        local b = head:FindFirstChild("NameTag") if b then b:Destroy() end
    end
end

local function esp(c, name, ws)
    clear(c)
    local hl = Instance.new("Highlight")
    hl.Name = "ESPHighlight"
    hl.Adornee = c
    hl.FillColor = Color3.fromRGB(255, 0, 0)
    hl.FillTransparency = 0.5
    hl.OutlineColor = Color3.fromRGB(255, 255, 0)
    hl.OutlineTransparency = 0
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    hl.Parent = c
    local head = c:FindFirstChild("Head")
    if head then
        local hs = head.Size
        local bb = Instance.new("BillboardGui")
        bb.Name = "NameTag"
        bb.Size = UDim2.new(hs.X * 6, 0, hs.Y * 3, 0)
        bb.StudsOffset = Vector3.new(0, hs.Y * 2.5, 0)
        bb.AlwaysOnTop = true
        bb.MaxDistance = 1000
        bb.Parent = head
        local lbl = Instance.new("TextLabel")
        lbl.Size = UDim2.new(1, 0, 1, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text = name .. " | " .. tostring(ws)
        lbl.TextColor3 = Color3.fromRGB(255, 50, 50)
        lbl.TextStrokeTransparency = 0
        lbl.TextStrokeColor3 = Color3.new(0, 0, 0)
        lbl.Font = Enum.Font.SourceSansBold
        lbl.TextScaled = true
        lbl.Parent = bb
    end
end

local function check(p)
    if p == lp then return end
    local c = p.Character
    if not c then return end
    local hum = c:FindFirstChild("Humanoid")
    if not hum then return end
    local ws = hum.WalkSpeed
    if ws > 0 and ws <= 6 then
        esp(c, p.Name, ws)
    else
        clear(c)
    end
end

Tabs.FarmTab:Button({
    Title = "开启ESP假脑红",
    Callback = function()
        for _, p in pairs(players:GetPlayers()) do check(p) end

        local function bind(p, c)
            local hum = c:FindFirstChild("Humanoid")
            if hum then
                hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
                    check(p)
                end)
            end
        end

        for _, p in pairs(players:GetPlayers()) do
            p.CharacterAdded:Connect(function(c)
                wait(1)
                bind(p, c)
                check(p)
            end)
            if p.Character then bind(p, p.Character) end
        end

        players.PlayerAdded:Connect(function(p)
            p.CharacterAdded:Connect(function(c)
                wait(1.5)
                bind(p, c)
                check(p)
            end)
        end)
    end
})

Tabs.FarmTab:Section({ Title = "棒球棍无间隔" })

Tabs.FarmTab:Button({
    Title = "开启棒球棍无间隔",
    Callback = function()
        local Players = game:GetService("Players")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local RunService = game:GetService("RunService")
        local localPlayer = Players.LocalPlayer
        local bat = localPlayer.Backpack:WaitForChild("Bat", 10)
        if not bat then return end
        local batSwingEvent = ReplicatedStorage:WaitForChild("Events"):WaitForChild("BatSwing")
        local animTrack = nil
        local swingLoop = false
        local connection = nil

        bat.Equipped:Connect(function()
            local character = localPlayer.Character
            if not character then return end
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if not humanoid then return end
            local animator = humanoid:FindFirstChild("Animator")
            if not animator then return end
            local strikeAnim = bat:FindFirstChild("StrikeAnim")
            if strikeAnim then
                animTrack = animator:LoadAnimation(strikeAnim)
            end
            swingLoop = true
            connection = RunService.Heartbeat:Connect(function()
                if not swingLoop then return end
                if animTrack then
                    animTrack:Stop()
                    animTrack:Play()
                end
                local handle = bat:FindFirstChild("Handle")
                if handle then
                    local swingSound = handle:FindFirstChild("SwingSound")
                    if swingSound then
                        swingSound:Play()
                    end
                end
                batSwingEvent:FireServer()
            end)
        end)

        bat.Unequipped:Connect(function()
            swingLoop = false
            if connection then
                connection:Disconnect()
                connection = nil
            end
            if animTrack then
                animTrack:Stop()
                animTrack:Destroy()
                animTrack = nil
            end
        end)
    end
})

Tabs.FarmTab:Section({ Title = "自动收集" })

Tabs.FarmTab:Button({
    Title = "开启自动收集",
    Callback = function()
        local rs = game:GetService("ReplicatedStorage")
        local event = rs:WaitForChild("Events"):WaitForChild("ClaimOfflineCash")
        local cashVal = game.Players.LocalPlayer:WaitForChild("leaderstats"):WaitForChild("Cash")
        local count = 0
        local zeroStreak = 0
        local multiplier = 10
        local threadCount = 10

        for i = 1, threadCount do
            task.spawn(function()
                while true do
                    local before = cashVal.Value
                    pcall(function()
                        event:FireServer(multiplier)
                    end)
                    task.wait(0.8)
                    local after = cashVal.Value
                    local diff = after - before
                    count = count + diff
                    if diff > 0 then
                        zeroStreak = 0
                    else
                        zeroStreak = zeroStreak + 1
                        if zeroStreak >= 5 then
                            task.wait(4)
                            zeroStreak = 0
                        end
                    end
                end
            end)
        end
    end
})
end)

Button(Tabjz, "偷取脑萎缩基地", function()
    local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"
))()

local XION = {
    Deep     = Color3.fromHex("#002B00"),
    Mid      = Color3.fromHex("#0A5C0A"),
    Main     = Color3.fromHex("#1B9B1B"),
    Bright   = Color3.fromHex("#4ADE80"),
    Glow     = Color3.fromHex("#22C55E"),
    Light    = Color3.fromHex("#90EE90"),
    Soft     = Color3.fromHex("#BBF7D0"),
    Accent   = Color3.fromHex("#00FFAA"),
    Pale     = Color3.fromHex("#86EFAC"),
    DarkBg   = Color3.fromHex("#05140A"),
    White    = Color3.fromHex("#FFFFFF"),
}

local MarketplaceService = game:GetService("MarketplaceService")

local function getPlaceName()
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    return (ok and info and info.Name) or game.Name
end
local placeName = getPlaceName()

function gradient3(text, color1, color2, color3)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r, g, b
        if t < 0.5 then
            local s = t * 2
            r = color1.R + (color2.R - color1.R) * s
            g = color1.G + (color2.G - color1.G) * s
            b = color1.B + (color2.B - color1.B) * s
        else
            local s = (t - 0.5) * 2
            r = color2.R + (color3.R - color2.R) * s
            g = color2.G + (color3.G - color2.G) * s
            b = color2.B + (color3.B - color2.B) * s
        end
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = gradient3("XION脚本", XION.Deep, XION.Bright, XION.Light),
    Author = gradient3("司空制作", XION.Accent, XION.Main, XION.Bright),
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    IconThemed = false,
    Folder = "XION",
    Size = UDim2.fromOffset(580, 400),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 160,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

Window:Tag({
    Title = placeName,
    Radius = 5,
    Color = XION.Main,
})

Window:EditOpenButton({
    Title = "XION",
    Icon = "https://raw.githubusercontent.com/TypingSP/XION/main/1786044777935.png",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.25, XION.Main),
        ColorSequenceKeypoint.new(0.5,  XION.Bright),
        ColorSequenceKeypoint.new(0.75, XION.Light),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    }),
    Glow = true,
    GlowColor = XION.Glow,
    GlowTransparency = 0.35,
    Draggable = true,
})

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local btn = Window.OpenButtonMain.Button

    local textLabel = btn:FindFirstChildWhichIsA("TextLabel")
    if textLabel then
        textLabel.TextColor3 = XION.Bright
        textLabel.TextStrokeTransparency = 0.7
        textLabel.TextStrokeColor3 = XION.Deep
    end

    local icon = btn:FindFirstChildWhichIsA("ImageLabel")
    if icon then
        icon.ImageColor3 = XION.Bright
    end
end)

local borderEnabled = true
local COLOR_SCHEMES = {
    ["XION"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.2, XION.Mid),
            ColorSequenceKeypoint.new(0.4, XION.Bright),
            ColorSequenceKeypoint.new(0.6, XION.Light),
            ColorSequenceKeypoint.new(0.8, XION.Accent),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        }
    }
}
local currentColorScheme = "XION"

local function ensureBlurElement()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then return end
    local blur = mainFrame:FindFirstChild("Blur")
    if not blur then
        blur = Instance.new("ImageLabel")
        blur.Name = "Blur"
        blur.Size = UDim2.new(1, 0, 1, 0)
        blur.BackgroundTransparency = 1
        blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        blur.ImageTransparency = 0.15
        blur.ZIndex = 0
        blur.Parent = mainFrame
    end
    return blur
end

local function getColorSequenceForScheme(scheme)
    local data = COLOR_SCHEMES[scheme]
    if data.type == "gradient" then
        return data.colors
    end
    return ColorSequence.new(XION.Main)
end

local function applyBorderColor(c, colorSeq, e)
    e = e or 0.15
    local f = c.UIElements and c.UIElements.Main or c.Frame or c.Gui or c
    if not f then return false end
    local g = f:FindFirstChild("Blur", true)
    if g and g:IsA("ImageLabel") then
        g.ImageColor3 = XION.Main
        g.ImageTransparency = e
        local existingGrad = g:FindFirstChild("XIONBorderGrad")
        if not existingGrad then
            existingGrad = Instance.new("UIGradient")
            existingGrad.Name = "XIONBorderGrad"
            existingGrad.Color = ColorSequence.new(colorSeq)
            existingGrad.Rotation = 0
            existingGrad.Parent = g
        else
            existingGrad.Color = ColorSequence.new(colorSeq)
        end
        return true
    end
    local h = f:FindFirstChild("Shadow", true)
    if h and h:IsA("ImageLabel") then
        h.ImageColor3 = XION.Main
        h.ImageTransparency = e
        return true
    end
    return false
end

local borderConnection = nil
local borderRotation = 0

local function startBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
    if not borderEnabled then return end
    ensureBlurElement()
    borderConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        if not mainFrame or not mainFrame.Visible then return end
        borderRotation = (borderRotation + 25 * delta) % 360
        local colorSeq = getColorSequenceForScheme(currentColorScheme)
        applyBorderColor(Window, colorSeq, 0.15)
        local blur = mainFrame:FindFirstChild("Blur", true)
        if blur then
            local grad = blur:FindFirstChild("XIONBorderGrad")
            if grad then
                grad.Rotation = borderRotation
            end
        end
    end)
end

local function stopBorderAnimation()
    if borderConnection then
        borderConnection:Disconnect()
        borderConnection = nil
    end
end

local function setupVisibilityListener()
    local mainFrame = Window.UIElements and Window.UIElements.Main
    if not mainFrame then
        task.spawn(function()
            repeat task.wait() until Window.UIElements and Window.UIElements.Main
            setupVisibilityListener()
        end)
        return
    end
    if mainFrame.Visible and borderEnabled then
        startBorderAnimation()
    elseif not mainFrame.Visible then
        stopBorderAnimation()
    end
    mainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
        if mainFrame.Visible and borderEnabled then
            startBorderAnimation()
        else
            stopBorderAnimation()
        end
    end)
end

setupVisibilityListener()
Window:OnClose(function()
    stopBorderAnimation()
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainContainer = Window.UIElements.Main
    if mainContainer then
        local stroke = Instance.new("UIStroke")
        stroke.Name = "XIONStroke"
        stroke.Thickness = 2
        stroke.Color = XION.Main
        stroke.Transparency = 0.3
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = mainContainer

        local gradientElement = Instance.new("UIGradient")
        gradientElement.Name = "XIONGradient"
        gradientElement.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,   XION.Deep),
            ColorSequenceKeypoint.new(0.17, XION.Main),
            ColorSequenceKeypoint.new(0.33, XION.Bright),
            ColorSequenceKeypoint.new(0.5,  XION.Light),
            ColorSequenceKeypoint.new(0.67, XION.Accent),
            ColorSequenceKeypoint.new(0.83, XION.Soft),
            ColorSequenceKeypoint.new(1,   XION.Deep),
        })
        gradientElement.Parent = stroke

        task.spawn(function()
            while mainContainer and mainContainer.Parent do
                task.wait(0.05)
                gradientElement.Rotation = (gradientElement.Rotation + 1.5) % 360
            end
        end)
    end
end)

task.spawn(function()
    repeat task.wait() until Window.OpenButtonMain and Window.OpenButtonMain.Button
    local button = Window.OpenButtonMain.Button
    local stroke = button:FindFirstChildWhichIsA("UIStroke")
    if not stroke then return end
    local grad = stroke:FindFirstChildWhichIsA("UIGradient")
    if not grad then return end

    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   XION.Deep),
        ColorSequenceKeypoint.new(0.2, XION.Main),
        ColorSequenceKeypoint.new(0.4, XION.Bright),
        ColorSequenceKeypoint.new(0.6, XION.Light),
        ColorSequenceKeypoint.new(0.8, XION.Accent),
        ColorSequenceKeypoint.new(1,   XION.Deep),
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if grad and grad.Parent then
            grad.Rotation = (tick() * 50) % 360
        end
    end)
end)

task.spawn(function()
    repeat task.wait() until Window.UIElements and Window.UIElements.Main
    local mainFrame = Window.UIElements.Main
    if not mainFrame then return end

    local topGlow = Instance.new("Frame")
    topGlow.Name = "TopGlow"
    topGlow.Size = UDim2.new(1, 0, 0.3, 0)
    topGlow.BackgroundTransparency = 1
    topGlow.ZIndex = 0
    topGlow.Parent = mainFrame

    local topGrad = Instance.new("UIGradient")
    topGrad.Color = ColorSequence.new(XION.Bright, XION.DarkBg)
    topGrad.Transparency = NumberSequence.new(0.75, 1)
    topGrad.Rotation = 90
    topGrad.Parent = topGlow

    local bottomGlow = Instance.new("Frame")
    bottomGlow.Name = "BottomGlow"
    bottomGlow.Size = UDim2.new(1, 0, 0.25, 0)
    bottomGlow.Position = UDim2.new(0, 0, 0.75, 0)
    bottomGlow.BackgroundTransparency = 1
    bottomGlow.ZIndex = 0
    bottomGlow.Parent = mainFrame

    local bottomGrad = Instance.new("UIGradient")
    bottomGrad.Color = ColorSequence.new(XION.DarkBg, XION.Bright)
    bottomGrad.Transparency = NumberSequence.new(1, 0.92)
    bottomGrad.Rotation = 90
    bottomGrad.Parent = bottomGlow
end)

local Tabs = {
    MainTab = Window:Tab({ Title = "主页" }),
    FarmTab = Window:Tab({ Title = "功能" }),
}

local function GetInjectorInfo()
    local injectorName = "未知"
    if getexecutorname then
        injectorName = getexecutorname()
    elseif identifyexecutor then
        injectorName = identifyexecutor()
    end
    return injectorName
end

local function GetPlayerName()
    return game.Players.LocalPlayer.Name
end

local function GetServerId()
    local success, id = pcall(function()
        return game:GetService("TeleportService"):GetLocalServerId()
    end)
    if success and id and id ~= "" then
        return id
    end
    success, id = pcall(function()
        return game.JobId
    end)
    if success and id and id ~= "" then
        return id
    end
    return "未知"
end

local function GetServerRegion()
    local success, region = pcall(function()
        return game:GetService("TeleportService"):GetServerRegion()
    end)
    if success and region then
        return region
    end
    return "未知"
end

local function GetServerInfo()
    return string.format("服务器: %s | 区域: %s", GetServerId(), GetServerRegion())
end

Tabs.MainTab:Section({ Title = "玩家信息" })

local nameLabel = Tabs.MainTab:Paragraph({
    Title = "玩家名称:",
    Desc = GetPlayerName()
})

local injectorLabel = Tabs.MainTab:Paragraph({
    Title = "注入器:",
    Desc = GetInjectorInfo()
})

local serverLabel = Tabs.MainTab:Paragraph({
    Title = "服务器:",
    Desc = GetServerInfo()
})

task.spawn(function()
    while true do
        task.wait(1)
        pcall(function()
            if nameLabel then nameLabel:SetDesc(GetPlayerName()) end
            if injectorLabel then injectorLabel:SetDesc(GetInjectorInfo()) end
            if serverLabel then serverLabel:SetDesc(GetServerInfo()) end
        end)
    end
end)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local PPS = game:GetService("ProximityPromptService")
local WS = workspace
local lp = Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

local rarityWeight = { Secret = 150, Godly = 130, Mythical = 111, Legendary = 83, Rare = 42, Common = 18 }

for _, v in pairs(WS:GetDescendants()) do
    if v:IsA("ProximityPrompt") then
        pcall(function() v.HoldDuration = 0 end)
        pcall(function() v.MaxActivationDistance = math.huge end)
        pcall(function() v.RequiresLineOfSight = false end)
    end
end
WS.DescendantAdded:Connect(function(v)
    if v:IsA("ProximityPrompt") then
        pcall(function() v.HoldDuration = 0 end)
        pcall(function() v.MaxActivationDistance = math.huge end)
        pcall(function() v.RequiresLineOfSight = false end)
    end
end)

local autoConn = nil
local function startAutoFire()
    if autoConn then return end
    autoConn = PPS.PromptShown:Connect(function(prompt, pl)
        if pl == lp then
            task.wait(0.03)
            pcall(function() fireproximityprompt(prompt, 1, true) end)
        end
    end)
end
local function stopAutoFire()
    if autoConn then autoConn:Disconnect() autoConn = nil end
end

local function scanAll()
    local bases = WS:FindFirstChild("Bases")
    if not bases then return {} end
    local res = {}
    for _, base in pairs(bases:GetChildren()) do
        local slots = base:FindFirstChild("Slots")
        if slots then
            for _, slot in pairs(slots:GetChildren()) do
                local sp = slot:FindFirstChild("Spawn")
                if sp then
                    local item = sp:FindFirstChild("SpawnedItem")
                    if item then
                        local part = item:FindFirstChild("part") or item:FindFirstChildWhichIsA("BasePart")
                        local pr = item:FindFirstChildWhichIsA("ProximityPrompt", true)
                        if part and pr then
                            local w = rarityWeight[pr.ObjectText] or 5
                            local nm = (pr.ActionText or ""):gsub("Steal ", "")
                            table.insert(res, { item = item, part = part, prompt = pr, name = nm, weight = w, rarity = pr.ObjectText or "?" })
                        end
                    end
                end
            end
        end
    end
    table.sort(res, function(a, b) return a.weight > b.weight end)
    return res
end

local function itemStillThere(it)
    return it and it.Parent and it:IsDescendantOf(WS:FindFirstChild("Bases"))
end

local collecting = false
local autoOn = false
local autoHome = true
local homePos = _G.XION_HomePos

Tabs.FarmTab:Section({ Title = "自动收集" })

Tabs.FarmTab:Button({
    Title = "传送最稀有",
    Callback = function()
        local all = scanAll()
        if #all > 0 then
            hrp.CFrame = all[1].part.CFrame + Vector3.new(0, 3, 0)
        end
    end
})

Tabs.FarmTab:Toggle({
    Title = "秒互动+自动收集",
    Value = false,
    Callback = function(state)
        autoOn = state
        if state then
            startAutoFire()
            collecting = true
            task.spawn(function()
                while collecting do
                    local ok, all = pcall(scanAll)
                    if not ok or #all == 0 then
                        task.wait(0.6)
                    else
                        local t = all[1]
                        hrp.CFrame = t.part.CFrame + Vector3.new(0, 3, 0)
                        task.wait(0.1)
                        pcall(function() fireproximityprompt(t.prompt) end)
                        task.wait(0.5)
                        if autoHome and homePos then
                            hrp.CFrame = CFrame.new(homePos + Vector3.new(0, 5, 0))
                        end
                        task.wait(0.3)
                    end
                end
            end)
        else
            collecting = false
            stopAutoFire()
        end
    end
})

Tabs.FarmTab:Toggle({
    Title = "拿起自动回家",
    Value = true,
    Callback = function(state)
        autoHome = state
    end
})

Tabs.FarmTab:Button({
    Title = "记录家位置",
    Callback = function()
        homePos = hrp.Position
        _G.XION_HomePos = homePos
    end
})

Tabs.FarmTab:Button({
    Title = "传送回家",
    Callback = function()
        if homePos then
            hrp.CFrame = CFrame.new(homePos + Vector3.new(0, 5, 0))
        end
    end
})

Tabs.FarmTab:Button({
    Title = "清除家位置",
    Callback = function()
        homePos = nil
        _G.XION_HomePos = nil
    end
})
end)

pcall(function()
    loadstring(game:HttpGet("https://pastebin.com/raw/9fFu43FF"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/phareignxd/xemonscripts/refs/heads/main/antiloggerv2"))()
end)
