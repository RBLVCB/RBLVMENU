-- ================================================
--   RBLV Library v2.0  |  Redesigned Visual Layer
-- ================================================

local UserInputService = game:GetService("UserInputService")
local TweenService     = game:GetService("TweenService")
local RunService       = game:GetService("RunService")
local CoreGui          = game:GetService("CoreGui")
local HttpService      = game:GetService("HttpService")

local Library = {}
Library.Flags       = {}
Library.Elements    = {}
Library.SearchIndex = {}
Library.IsOpen      = true

-- Pick a random theme name at load time
local _themeNames = {
    "Default","DarkBlue","DarkRed","Ocean","Amethyst","Emerald","Sunset",
    "Carbon","Midnight","Cyberpunk","Void","Crimson","Gold","Mint",
    "Synthwave","Nebula","Aurora","Dracula","Cherry","Sapphire",
}
local _randomTheme = _themeNames[math.random(1, #_themeNames)]

Library.Settings = {
    Theme        = _randomTheme,
    Transparency = false,
}

-- ==================== THEMES ====================

Library.Themes = {
    Default   = {Main = Color3.fromRGB(20,20,20),  Top = Color3.fromRGB(30,30,30),  Accent = Color3.fromRGB(0,160,255),  Text = Color3.fromRGB(255,255,255), Element = Color3.fromRGB(35,35,35),  Glow = Color3.fromRGB(0,110,220)},
    DarkBlue  = {Main = Color3.fromRGB(15,20,30),  Top = Color3.fromRGB(20,25,40),  Accent = Color3.fromRGB(50,100,255), Text = Color3.fromRGB(240,240,255), Element = Color3.fromRGB(25,30,45),  Glow = Color3.fromRGB(40,80,200)},
    DarkRed   = {Main = Color3.fromRGB(30,15,15),  Top = Color3.fromRGB(40,20,20),  Accent = Color3.fromRGB(255,60,60),  Text = Color3.fromRGB(255,240,240), Element = Color3.fromRGB(45,25,25),  Glow = Color3.fromRGB(200,40,40)},
    Ocean     = {Main = Color3.fromRGB(10,30,35),  Top = Color3.fromRGB(15,40,45),  Accent = Color3.fromRGB(0,200,200),  Text = Color3.fromRGB(220,255,255), Element = Color3.fromRGB(20,50,55),  Glow = Color3.fromRGB(0,150,150)},
    Amethyst  = {Main = Color3.fromRGB(30,20,35),  Top = Color3.fromRGB(40,25,45),  Accent = Color3.fromRGB(180,80,255), Text = Color3.fromRGB(250,230,255), Element = Color3.fromRGB(45,30,50),  Glow = Color3.fromRGB(140,60,200)},
    Emerald   = {Main = Color3.fromRGB(20,35,20),  Top = Color3.fromRGB(25,45,25),  Accent = Color3.fromRGB(50,200,80),  Text = Color3.fromRGB(230,255,230), Element = Color3.fromRGB(30,50,30),  Glow = Color3.fromRGB(40,160,60)},
    Sunset    = {Main = Color3.fromRGB(35,25,20),  Top = Color3.fromRGB(45,30,25),  Accent = Color3.fromRGB(255,140,50), Text = Color3.fromRGB(255,240,220), Element = Color3.fromRGB(50,35,30),  Glow = Color3.fromRGB(200,100,40)},
    Carbon    = {Main = Color3.fromRGB(10,10,10),  Top = Color3.fromRGB(20,20,20),  Accent = Color3.fromRGB(120,120,120),Text = Color3.fromRGB(200,200,200), Element = Color3.fromRGB(30,30,30),  Glow = Color3.fromRGB(80,80,80)},
    Midnight  = {Main = Color3.fromRGB(10,10,20),  Top = Color3.fromRGB(15,15,30),  Accent = Color3.fromRGB(100,100,255),Text = Color3.fromRGB(240,240,255), Element = Color3.fromRGB(25,25,45),  Glow = Color3.fromRGB(80,80,220)},
    Cyberpunk = {Main = Color3.fromRGB(10,10,15),  Top = Color3.fromRGB(20,20,25),  Accent = Color3.fromRGB(255,230,0),  Text = Color3.fromRGB(255,255,255), Element = Color3.fromRGB(30,30,35),  Glow = Color3.fromRGB(0,255,255)},
    Void      = {Main = Color3.fromRGB(5,5,5),     Top = Color3.fromRGB(15,15,15),  Accent = Color3.fromRGB(255,255,255),Text = Color3.fromRGB(255,255,255), Element = Color3.fromRGB(25,25,25),  Glow = Color3.fromRGB(150,150,150)},
    Crimson   = {Main = Color3.fromRGB(25,10,10),  Top = Color3.fromRGB(40,15,15),  Accent = Color3.fromRGB(220,20,60),  Text = Color3.fromRGB(255,230,230), Element = Color3.fromRGB(50,25,25),  Glow = Color3.fromRGB(255,0,50)},
    Gold      = {Main = Color3.fromRGB(30,25,10),  Top = Color3.fromRGB(45,40,20),  Accent = Color3.fromRGB(255,215,0),  Text = Color3.fromRGB(255,255,220), Element = Color3.fromRGB(55,50,30),  Glow = Color3.fromRGB(220,180,0)},
    Mint      = {Main = Color3.fromRGB(20,30,25),  Top = Color3.fromRGB(30,45,35),  Accent = Color3.fromRGB(0,255,170),  Text = Color3.fromRGB(230,255,240), Element = Color3.fromRGB(40,60,50),  Glow = Color3.fromRGB(0,200,140)},
    Synthwave = {Main = Color3.fromRGB(20,10,30),  Top = Color3.fromRGB(30,15,45),  Accent = Color3.fromRGB(255,0,255),  Text = Color3.fromRGB(255,255,255), Element = Color3.fromRGB(50,25,70),  Glow = Color3.fromRGB(0,255,255)},
    Nebula    = {Main = Color3.fromRGB(18,8,28),   Top = Color3.fromRGB(28,14,42),  Accent = Color3.fromRGB(180,50,255), Text = Color3.fromRGB(245,225,255), Element = Color3.fromRGB(40,20,58),  Glow = Color3.fromRGB(150,0,255)},
    Aurora    = {Main = Color3.fromRGB(5,20,15),   Top = Color3.fromRGB(8,32,25),   Accent = Color3.fromRGB(50,255,160), Text = Color3.fromRGB(210,255,240), Element = Color3.fromRGB(12,45,35),  Glow = Color3.fromRGB(20,230,140)},
    Dracula   = {Main = Color3.fromRGB(40,42,54),  Top = Color3.fromRGB(68,71,90),  Accent = Color3.fromRGB(189,147,249),Text = Color3.fromRGB(248,248,242), Element = Color3.fromRGB(98,114,164),Glow = Color3.fromRGB(255,121,198)},
    Cherry    = {Main = Color3.fromRGB(25,15,20),  Top = Color3.fromRGB(40,25,30),  Accent = Color3.fromRGB(255,50,100), Text = Color3.fromRGB(255,230,240), Element = Color3.fromRGB(55,35,45),  Glow = Color3.fromRGB(200,80,120)},
    Sapphire  = {Main = Color3.fromRGB(5,10,40),   Top = Color3.fromRGB(10,18,60),  Accent = Color3.fromRGB(15,82,186),  Text = Color3.fromRGB(220,235,255), Element = Color3.fromRGB(15,28,75),  Glow = Color3.fromRGB(0,100,255)},
}

Library.CurrentTheme = Library.Themes[_randomTheme] or Library.Themes["Default"]

-- ==================== UTILITY ====================

local function CreateTween(obj, props, t)
    local tw = TweenService:Create(obj, TweenInfo.new(t or 0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), props)
    tw:Play(); return tw
end

local function MakeDraggable(handle, frame)
    local drag, startPos, startFrame = false, nil, nil
    handle.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            drag = true; startPos = i.Position; startFrame = frame.Position
            i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then drag = false end end)
        end
    end)
    handle.InputChanged:Connect(function(i)
        if drag and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
            local d = i.Position - startPos
            frame.Position = UDim2.new(startFrame.X.Scale, startFrame.X.Offset + d.X, startFrame.Y.Scale, startFrame.Y.Offset + d.Y)
        end
    end)
end

-- ==================== FILE SYSTEM ====================

local FOLDER_NAME = "RBLVMENU"
local CONFIG_FILE = FOLDER_NAME .. "/evade.json"

pcall(function()
    if makefolder and not (isfolder and isfolder(FOLDER_NAME)) then
        makefolder(FOLDER_NAME)
    end
end)

Library._GetFloatData = nil
Library._SetFloatData = nil

local function SaveConfig()
    pcall(function()
        if not writefile then return end
        if makefolder and not (isfolder and isfolder(FOLDER_NAME)) then
            makefolder(FOLDER_NAME)
        end
        local data = {}
        for k, v in pairs(Library.Flags) do
            if typeof(v) == "EnumItem" then
                data[k] = tostring(v)
            else
                data[k] = v
            end
        end
        data["__theme"] = Library.Settings.Theme
        if Library._GetFloatData then
            data["__floats"] = Library._GetFloatData()
        end
        writefile(CONFIG_FILE, HttpService:JSONEncode(data))
    end)
end

local function LoadConfig()
    local found = false
    pcall(function()
        if not (isfile and isfile(CONFIG_FILE)) then return end
        found = true
        local data = HttpService:JSONDecode(readfile(CONFIG_FILE))
        if data["__theme"] and Library.Themes[data["__theme"]] then
            Library.CurrentTheme   = Library.Themes[data["__theme"]]
            Library.Settings.Theme = data["__theme"]
        end
        if data["__floats"] and Library._SetFloatData then
            Library._SetFloatData(data["__floats"])
        end
        for k, v in pairs(data) do
            if k == "__theme" or k == "__floats" then continue end
            if Library.Elements[k] then
                pcall(function()
                    if type(v) == "string" and v:sub(1, 13) == "Enum.KeyCode." then
                        local kc = Enum.KeyCode[v:sub(14)]
                        if kc then Library.Elements[k]:Set(kc) end
                    else
                        Library.Elements[k]:Set(v)
                    end
                end)
            end
        end
    end)
    return found
end

Library.SaveConfig = SaveConfig
Library.LoadConfig = LoadConfig

-- ==================== NOTIFICATION ====================

function Library:Notification(opts)
    opts = opts or {}
    local Title    = opts.Title    or "RBLV"
    local Content  = opts.Content  or ""
    local Duration = opts.Duration or 4
    local T        = Library.CurrentTheme

    local NotifGui = Instance.new("ScreenGui")
    NotifGui.Name            = "RBLV_Notif_" .. tostring(tick())
    NotifGui.Parent          = CoreGui
    NotifGui.ResetOnSpawn    = false
    NotifGui.ZIndexBehavior  = Enum.ZIndexBehavior.Sibling
    NotifGui.DisplayOrder    = 9999

    -- Pill-shaped notification: left accent stripe, icon dot, title, body
    local NF = Instance.new("Frame")
    NF.Parent            = NotifGui
    NF.BackgroundColor3  = Color3.fromRGB(
        math.clamp(T.Main.R * 255 + 12, 0, 255),
        math.clamp(T.Main.G * 255 + 12, 0, 255),
        math.clamp(T.Main.B * 255 + 12, 0, 255)
    )
    NF.BorderSizePixel   = 0
    NF.AnchorPoint       = Vector2.new(1, 1)
    NF.Position          = UDim2.new(1, -14, 1, -14)
    NF.Size              = UDim2.new(0, 290, 0, 0)
    NF.ClipsDescendants  = true
    Instance.new("UICorner", NF).CornerRadius = UDim.new(0, 12)

    -- Glowing border
    local NFS = Instance.new("UIStroke", NF)
    NFS.Color     = T.Accent
    NFS.Thickness = 1
    NFS.Transparency = 0.6

    -- Left accent pill
    local Pill = Instance.new("Frame", NF)
    Pill.BackgroundColor3 = T.Accent
    Pill.BorderSizePixel  = 0
    Pill.Position         = UDim2.new(0, 0, 0, 0)
    Pill.Size             = UDim2.new(0, 4, 1, 0)
    Instance.new("UICorner", Pill).CornerRadius = UDim.new(0, 4)

    -- Accent dot
    local Dot = Instance.new("Frame", NF)
    Dot.BackgroundColor3 = T.Accent
    Dot.BorderSizePixel  = 0
    Dot.Position         = UDim2.new(0, 14, 0, 14)
    Dot.Size             = UDim2.new(0, 8, 0, 8)
    Instance.new("UICorner", Dot).CornerRadius = UDim.new(1, 0)

    local NT = Instance.new("TextLabel", NF)
    NT.BackgroundTransparency = 1
    NT.Position  = UDim2.new(0, 30, 0, 8)
    NT.Size      = UDim2.new(1, -36, 0, 18)
    NT.Font      = Enum.Font.GothamBold
    NT.Text      = Title
    NT.TextColor3 = T.Text
    NT.TextSize  = 13
    NT.TextXAlignment = Enum.TextXAlignment.Left

    local ND = Instance.new("TextLabel", NF)
    ND.BackgroundTransparency = 1
    ND.Position  = UDim2.new(0, 14, 0, 28)
    ND.Size      = UDim2.new(1, -18, 0, 34)
    ND.Font      = Enum.Font.Gotham
    ND.Text      = Content
    ND.TextColor3 = Color3.fromRGB(160, 160, 170)
    ND.TextSize  = 12
    ND.TextXAlignment = Enum.TextXAlignment.Left
    ND.TextWrapped    = true

    -- Progress bar at the bottom
    local PBg = Instance.new("Frame", NF)
    PBg.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    PBg.BorderSizePixel  = 0
    PBg.Position         = UDim2.new(0, 0, 1, -3)
    PBg.Size             = UDim2.new(1, 0, 0, 3)

    local PFill = Instance.new("Frame", PBg)
    PFill.BackgroundColor3 = T.Accent
    PFill.BorderSizePixel  = 0
    PFill.Size             = UDim2.new(1, 0, 1, 0)

    CreateTween(NF, {Size = UDim2.new(0, 290, 0, 75)}, 0.3)
    task.delay(0.3, function()
        CreateTween(PFill, {Size = UDim2.new(0, 0, 1, 0)}, Duration - 0.2)
    end)
    task.delay(Duration, function()
        CreateTween(NF, {Size = UDim2.new(0, 290, 0, 0), BackgroundTransparency = 1}, 0.3)
        CreateTween(NT, {TextTransparency = 1}, 0.2)
        CreateTween(ND, {TextTransparency = 1}, 0.2)
        task.wait(0.35); NotifGui:Destroy()
    end)
end

-- ==================== CREATE WINDOW ====================

function Library:CreateWindow(opts)
    opts = opts or {}
    local Title = opts.Name or "RBLV Menu"
    local KeySystemConfig = {
        Enabled = opts.KeySystem or false,
        KeyName = opts.KeyName   or "Key System",
        Key     = opts.Key       or "",
        KeySite = opts.KeySite   or "",
    }

    Library.CurrentTheme = Library.Themes[Library.Settings.Theme] or Library.Themes["Default"]

    pcall(function() CoreGui:FindFirstChild("RBLV_UI"):Destroy() end)

    local TitanUI = Instance.new("ScreenGui")
    TitanUI.Name           = "RBLV_UI"
    TitanUI.Parent         = CoreGui
    TitanUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    TitanUI.ResetOnSpawn   = false
    TitanUI.DisplayOrder   = 9000

    -- ── Re-open floating button (redesigned as a slim horizontal capsule) ──
    local OpenBtnFrame = Instance.new("TextButton")
    OpenBtnFrame.Name             = "OpenButton"
    OpenBtnFrame.Parent           = TitanUI
    OpenBtnFrame.BackgroundColor3 = Library.CurrentTheme.Top
    OpenBtnFrame.Position         = UDim2.new(0.04, 0, 0.08, 0)
    OpenBtnFrame.Size             = UDim2.new(0, 100, 0, 32)
    OpenBtnFrame.Transparency     = 1
    OpenBtnFrame.Visible          = false
    OpenBtnFrame.Active           = true
    OpenBtnFrame.Text             = "▶  RBLV"
    OpenBtnFrame.TextColor3       = Library.CurrentTheme.Accent
    OpenBtnFrame.Font             = Enum.Font.GothamBold
    OpenBtnFrame.TextSize         = 13
    OpenBtnFrame.BorderSizePixel  = 0
    OpenBtnFrame.AutoButtonColor  = false
    Instance.new("UICorner", OpenBtnFrame).CornerRadius = UDim.new(1, 0)
    local OBS = Instance.new("UIStroke", OpenBtnFrame)
    OBS.Color = Library.CurrentTheme.Accent; OBS.Thickness = 1.2; OBS.Transparency = 0.4
    MakeDraggable(OpenBtnFrame, OpenBtnFrame)

    -- ── Main Frame (slightly wider, taller, more breathing room) ──
    local MainFrame = Instance.new("Frame")
    MainFrame.Name             = "MainFrame"
    MainFrame.Parent           = TitanUI
    MainFrame.AnchorPoint      = Vector2.new(0.5, 0.5)
    MainFrame.Position         = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.Size             = UDim2.new(0, 600, 0, 390)
    MainFrame.BackgroundColor3 = Library.CurrentTheme.Main
    MainFrame.ClipsDescendants = true
    MainFrame.Visible          = not KeySystemConfig.Enabled
    if KeySystemConfig.Enabled then MainFrame.Size = UDim2.new(0, 0, 0, 0) end

    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 14)

    -- Outer glow stroke
    local MS = Instance.new("UIStroke", MainFrame)
    MS.Color       = Library.CurrentTheme.Glow or Library.CurrentTheme.Accent
    MS.Thickness   = 1.5
    MS.Transparency = 0.35

    -- Subtle dot-grid background texture
    local Pattern = Instance.new("ImageLabel", MainFrame)
    Pattern.BackgroundTransparency = 1
    Pattern.Size             = UDim2.new(1, 0, 1, 0)
    Pattern.Image            = "rbxassetid://2151741365"
    Pattern.ImageTransparency = 0.97
    Pattern.TileSize         = UDim2.new(0, 20, 0, 20)
    Pattern.ScaleType        = Enum.ScaleType.Tile
    Pattern.ZIndex           = 0

    -- ── Topbar (tall, full-width gradient band) ──
    local Topbar = Instance.new("Frame", MainFrame)
    Topbar.Name             = "Topbar"
    Topbar.BackgroundColor3 = Library.CurrentTheme.Top
    Topbar.Size             = UDim2.new(1, 0, 0, 52)
    Instance.new("UICorner", Topbar).CornerRadius = UDim.new(0, 14)

    -- Square off the bottom corners of the topbar
    local FixB = Instance.new("Frame", Topbar)
    FixB.Name             = "FixB"
    FixB.BorderSizePixel  = 0
    FixB.BackgroundColor3 = Library.CurrentTheme.Top
    FixB.Position         = UDim2.new(0, 0, 1, -6)
    FixB.Size             = UDim2.new(1, 0, 0, 6)

    -- Gradient on topbar: left = slightly brighter, right fades
    local TopGradient = Instance.new("UIGradient", Topbar)
    TopGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 180, 180))
    }
    TopGradient.Rotation = 0

    -- Thin accent underline at bottom of topbar
    local TopAccentLine = Instance.new("Frame", Topbar)
    TopAccentLine.BackgroundColor3 = Library.CurrentTheme.Accent
    TopAccentLine.BorderSizePixel  = 0
    TopAccentLine.Position         = UDim2.new(0, 0, 1, -2)
    TopAccentLine.Size             = UDim2.new(1, 0, 0, 2)

    -- Logo/title block
    local LogoDot = Instance.new("Frame", Topbar)
    LogoDot.BackgroundColor3 = Library.CurrentTheme.Accent
    LogoDot.BorderSizePixel  = 0
    LogoDot.Position         = UDim2.new(0, 14, 0.5, -6)
    LogoDot.Size             = UDim2.new(0, 4, 0, 24)
    Instance.new("UICorner", LogoDot).CornerRadius = UDim.new(0, 2)

    local TitleLbl = Instance.new("TextLabel", Topbar)
    TitleLbl.BackgroundTransparency = 1
    TitleLbl.Position = UDim2.new(0, 26, 0, 0)
    TitleLbl.Size     = UDim2.new(0.5, 0, 1, 0)
    TitleLbl.Font     = Enum.Font.GothamBold
    TitleLbl.Text     = Title
    TitleLbl.TextColor3 = Library.CurrentTheme.Text
    TitleLbl.TextSize   = 15
    TitleLbl.TextXAlignment = Enum.TextXAlignment.Left

    -- Subtitle / version tag
    local SubLbl = Instance.new("TextLabel", Topbar)
    SubLbl.BackgroundTransparency = 1
    SubLbl.Position = UDim2.new(0, 26, 0, 30)
    SubLbl.Size     = UDim2.new(0.4, 0, 0, 14)
    SubLbl.Font     = Enum.Font.Gotham
    SubLbl.Text     = "v2.0  •  " .. Library.Settings.Theme
    SubLbl.TextColor3 = Color3.fromRGB(120, 120, 130)
    SubLbl.TextSize   = 10
    SubLbl.TextXAlignment = Enum.TextXAlignment.Left

    -- Close button (styled X pill)
    local CloseBtn = Instance.new("TextButton", Topbar)
    CloseBtn.BackgroundColor3     = Color3.fromRGB(200, 60, 60)
    CloseBtn.Position             = UDim2.new(1, -40, 0.5, -10)
    CloseBtn.Size                 = UDim2.new(0, 20, 0, 20)
    CloseBtn.Font                 = Enum.Font.GothamBold
    CloseBtn.Text                 = "✕"
    CloseBtn.TextColor3           = Color3.fromRGB(255, 255, 255)
    CloseBtn.TextSize             = 10
    CloseBtn.AutoButtonColor      = false
    CloseBtn.BorderSizePixel      = 0
    Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(1, 0)
    CloseBtn.MouseEnter:Connect(function()
        CreateTween(CloseBtn, {BackgroundColor3 = Color3.fromRGB(255, 80, 80)}, 0.1)
    end)
    CloseBtn.MouseLeave:Connect(function()
        CreateTween(CloseBtn, {BackgroundColor3 = Color3.fromRGB(200, 60, 60)}, 0.1)
    end)

    Library.IsOpen = true
    function Library:Toggle()
        Library.IsOpen = not Library.IsOpen
        if Library.IsOpen then
            OpenBtnFrame.Visible = false; MainFrame.Visible = true
            CreateTween(MainFrame, {Size = UDim2.new(0, 600, 0, 390)}, 0.4)
        else
            local close = CreateTween(MainFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.4)
            close.Completed:Connect(function()
                if not Library.IsOpen then MainFrame.Visible = false; OpenBtnFrame.Visible = true end
            end)
        end
    end

    CloseBtn.MouseButton1Click:Connect(function() Library:Toggle() end)
    OpenBtnFrame.MouseButton1Click:Connect(function() Library:Toggle() end)
    MakeDraggable(Topbar, MainFrame)

    -- ── Search Bar (repositioned inside a rounded box right of topbar) ──
    local SearchWrap = Instance.new("Frame", MainFrame)
    SearchWrap.BackgroundColor3 = Library.CurrentTheme.Top
    SearchWrap.BorderSizePixel  = 0
    SearchWrap.Position         = UDim2.new(1, -178, 0, 14)
    SearchWrap.Size             = UDim2.new(0, 130, 0, 26)
    Instance.new("UICorner", SearchWrap).CornerRadius = UDim.new(1, 0)
    Instance.new("UIStroke", SearchWrap).Color = Color3.fromRGB(60, 60, 70)

    local SearchIcon = Instance.new("ImageLabel", SearchWrap)
    SearchIcon.BackgroundTransparency = 1
    SearchIcon.Position = UDim2.new(0, 6, 0.5, -8)
    SearchIcon.Size     = UDim2.new(0, 16, 0, 16)
    SearchIcon.Image    = "rbxassetid://6031154871"
    SearchIcon.ImageColor3 = Color3.fromRGB(110, 110, 120)

    local SearchBar = Instance.new("TextBox", SearchWrap)
    SearchBar.Name              = "SearchBar"
    SearchBar.BackgroundTransparency = 1
    SearchBar.BorderSizePixel   = 0
    SearchBar.Position          = UDim2.new(0, 26, 0, 0)
    SearchBar.Size              = UDim2.new(1, -30, 1, 0)
    SearchBar.Font              = Enum.Font.Gotham
    SearchBar.PlaceholderText   = "Search..."
    SearchBar.PlaceholderColor3 = Color3.fromRGB(90, 90, 100)
    SearchBar.Text              = ""
    SearchBar.TextColor3        = Color3.fromRGB(220, 220, 230)
    SearchBar.TextSize          = 12

    -- ── Left Sidebar (tabs) ──
    -- Background panel for sidebar
    local SidePanel = Instance.new("Frame", MainFrame)
    SidePanel.BackgroundColor3 = Color3.fromRGB(
        math.clamp(Library.CurrentTheme.Main.R * 255 - 4, 0, 255),
        math.clamp(Library.CurrentTheme.Main.G * 255 - 4, 0, 255),
        math.clamp(Library.CurrentTheme.Main.B * 255 - 4, 0, 255)
    )
    SidePanel.BorderSizePixel  = 0
    SidePanel.Position         = UDim2.new(0, 0, 0, 52)
    SidePanel.Size             = UDim2.new(0, 158, 1, -52)

    -- Thin right border on sidebar
    local SideBorder = Instance.new("Frame", SidePanel)
    SideBorder.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    SideBorder.BorderSizePixel  = 0
    SideBorder.Position         = UDim2.new(1, -1, 0, 0)
    SideBorder.Size             = UDim2.new(0, 1, 1, 0)

    local TabContainer = Instance.new("ScrollingFrame", SidePanel)
    TabContainer.BackgroundTransparency = 1
    TabContainer.Position          = UDim2.new(0, 0, 0, 10)
    TabContainer.Size              = UDim2.new(1, -1, 1, -10)
    TabContainer.ScrollBarThickness = 0
    TabContainer.BorderSizePixel   = 0
    local TabListLayout = Instance.new("UIListLayout", TabContainer)
    TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabListLayout.Padding   = UDim.new(0, 2)
    local TabPad = Instance.new("UIPadding", TabContainer)
    TabPad.PaddingLeft  = UDim.new(0, 8)
    TabPad.PaddingRight = UDim.new(0, 8)

    -- ── Page Container ──
    local PageContainer = Instance.new("Frame", MainFrame)
    PageContainer.BackgroundTransparency = 1
    PageContainer.Position         = UDim2.new(0, 162, 0, 58)
    PageContainer.Size             = UDim2.new(1, -170, 1, -66)
    PageContainer.ClipsDescendants = true

    local PagesFolder = Instance.new("Frame", PageContainer)
    PagesFolder.Name                  = "Pages"
    PagesFolder.BackgroundTransparency = 1
    PagesFolder.Size                  = UDim2.new(1, 0, 1, 0)

    -- ── Search Logic ──
    local function SwitchToTab(PageName)
        for _, v in pairs(TabContainer:GetChildren()) do
            if v:IsA("TextButton") then
                if v.Text == PageName then
                    -- Active: accent-colored left pip + brighter text
                    CreateTween(v, {BackgroundColor3 = Library.CurrentTheme.Accent, BackgroundTransparency = 0.85, TextColor3 = Library.CurrentTheme.Accent}, 0.2)
                    if v:FindFirstChild("Pip") then
                        CreateTween(v.Pip, {BackgroundTransparency = 0}, 0.2)
                    end
                else
                    CreateTween(v, {BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(120, 120, 130)}, 0.2)
                    if v:FindFirstChild("Pip") then
                        CreateTween(v.Pip, {BackgroundTransparency = 1}, 0.2)
                    end
                end
            end
        end
        for _, v in pairs(PagesFolder:GetChildren()) do
            if v:IsA("ScrollingFrame") then v.Visible = (v.Name == PageName) end
        end
    end

    SearchBar:GetPropertyChangedSignal("Text"):Connect(function()
        local txt = SearchBar.Text:lower()
        if txt == "" then return end
        for _, item in pairs(Library.SearchIndex) do
            if string.find(item.Name:lower(), txt) then
                SwitchToTab(item.Tab)
                local Page = PagesFolder:FindFirstChild(item.Tab)
                if Page and item.Instance then
                    local yPos = item.Instance.AbsolutePosition.Y - Page.AbsolutePosition.Y + Page.CanvasPosition.Y
                    CreateTween(Page, {CanvasPosition = Vector2.new(0, yPos)}, 0.4)
                end
                break
            end
        end
    end)

    -- ── Theme Refresh ──
    function Library:RefreshTheme()
        local T = Library.CurrentTheme
        CreateTween(MainFrame, {BackgroundColor3 = T.Main, BackgroundTransparency = Library.Settings.Transparency and 0.45 or 0}, 0.3)
        CreateTween(Topbar,    {BackgroundColor3 = T.Top}, 0.3)
        CreateTween(FixB,      {BackgroundColor3 = T.Top}, 0.3)
        CreateTween(SearchWrap,{BackgroundColor3 = T.Top}, 0.3)
        CreateTween(SidePanel, {BackgroundColor3 = Color3.fromRGB(
            math.clamp(T.Main.R * 255 - 4, 0, 255),
            math.clamp(T.Main.G * 255 - 4, 0, 255),
            math.clamp(T.Main.B * 255 - 4, 0, 255)
        )}, 0.3)
        CreateTween(TopAccentLine, {BackgroundColor3 = T.Accent}, 0.3)
        CreateTween(LogoDot, {BackgroundColor3 = T.Accent}, 0.3)
        TopGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 180, 180))
        }
        CreateTween(MS, {Color = T.Glow or T.Accent}, 0.3)
        TitleLbl.TextColor3 = T.Text
        SubLbl.Text = "v2.0  •  " .. Library.Settings.Theme
        OpenBtnFrame.BackgroundColor3 = T.Top
        OBS.Color = T.Accent
        for _, obj in pairs(TabContainer:GetChildren()) do
            if obj:IsA("TextButton") then
                if obj.BackgroundTransparency < 0.9 then
                    obj.TextColor3 = T.Accent
                    if obj:FindFirstChild("Pip") then obj.Pip.BackgroundColor3 = T.Accent end
                end
            end
        end
        for _, page in pairs(PagesFolder:GetChildren()) do
            if page:IsA("ScrollingFrame") then
                for _, elem in pairs(page:GetChildren()) do
                    if elem:IsA("Frame") and elem.Name == "ElementFrame" then
                        CreateTween(elem, {BackgroundColor3 = T.Element}, 0.3)
                        local lbl = elem:FindFirstChildOfClass("TextLabel")
                        if lbl then lbl.TextColor3 = T.Text end
                    elseif elem:IsA("TextLabel") and elem.Name == "SectionLabel" then
                        elem.TextColor3 = T.Accent
                        if elem:FindFirstChild("Line") then elem.Line.BackgroundColor3 = T.Accent end
                    end
                end
            end
        end
    end

    function Library:SetTheme(ThemeName)
        if Library.Themes[ThemeName] then
            Library.CurrentTheme   = Library.Themes[ThemeName]
            Library.Settings.Theme = ThemeName
            Library:RefreshTheme()
        end
    end

    -- ── Key System ──
    if KeySystemConfig.Enabled then
        local KF = Instance.new("Frame", TitanUI)
        KF.BackgroundColor3  = Color3.fromRGB(18, 18, 22)
        KF.AnchorPoint       = Vector2.new(0.5, 0.5)
        KF.Position          = UDim2.new(0.5, 0, 0.5, 0)
        KF.Size              = UDim2.new(0, 400, 0, 250)
        KF.ClipsDescendants  = true
        Instance.new("UICorner", KF).CornerRadius = UDim.new(0, 14)
        local KFS = Instance.new("UIStroke", KF)
        KFS.Color = Library.CurrentTheme.Accent; KFS.Thickness = 1.5; KFS.Transparency = 0.5

        local KAccentBar = Instance.new("Frame", KF)
        KAccentBar.BackgroundColor3 = Library.CurrentTheme.Accent
        KAccentBar.BorderSizePixel  = 0
        KAccentBar.Position         = UDim2.new(0, 0, 0, 0)
        KAccentBar.Size             = UDim2.new(1, 0, 0, 4)

        local KTitle = Instance.new("TextLabel", KF)
        KTitle.BackgroundTransparency = 1
        KTitle.Position = UDim2.new(0, 0, 0, 18)
        KTitle.Size     = UDim2.new(1, 0, 0, 30)
        KTitle.Font     = Enum.Font.GothamBold
        KTitle.Text     = KeySystemConfig.KeyName
        KTitle.TextColor3 = Color3.fromRGB(235, 235, 245)
        KTitle.TextSize   = 20

        local KInput = Instance.new("TextBox", KF)
        KInput.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
        KInput.Position  = UDim2.new(0.08, 0, 0.38, 0)
        KInput.Size      = UDim2.new(0.84, 0, 0, 40)
        KInput.Font      = Enum.Font.Gotham
        KInput.PlaceholderText = "Enter Key..."
        KInput.PlaceholderColor3 = Color3.fromRGB(80, 80, 90)
        KInput.Text      = ""
        KInput.TextColor3 = Color3.fromRGB(230, 230, 240)
        KInput.TextSize   = 14
        Instance.new("UICorner", KInput).CornerRadius = UDim.new(0, 8)
        local KIS = Instance.new("UIStroke", KInput); KIS.Color = Color3.fromRGB(55, 55, 65); KIS.Thickness = 1

        local KBtn = Instance.new("TextButton", KF)
        KBtn.BackgroundColor3 = Library.CurrentTheme.Accent
        KBtn.Position  = UDim2.new(0.08, 0, 0.65, 0)
        KBtn.Size      = UDim2.new(0.38, 0, 0, 36)
        KBtn.Font      = Enum.Font.GothamBold
        KBtn.Text      = "Login"
        KBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        KBtn.TextSize   = 14
        KBtn.BorderSizePixel = 0
        Instance.new("UICorner", KBtn).CornerRadius = UDim.new(0, 8)

        local KLink = Instance.new("TextButton", KF)
        KLink.BackgroundColor3 = Color3.fromRGB(38, 38, 48)
        KLink.Position  = UDim2.new(0.54, 0, 0.65, 0)
        KLink.Size      = UDim2.new(0.38, 0, 0, 36)
        KLink.Font      = Enum.Font.GothamBold
        KLink.Text      = "Get Key"
        KLink.TextColor3 = Library.CurrentTheme.Accent
        KLink.TextSize   = 14
        KLink.BorderSizePixel = 0
        Instance.new("UICorner", KLink).CornerRadius = UDim.new(0, 8)
        MakeDraggable(KF, KF)

        KLink.MouseButton1Click:Connect(function()
            if setclipboard then setclipboard(KeySystemConfig.KeySite)
                Library:Notification({Title = "Key System", Content = "Link copied!"})
            end
        end)

        KBtn.MouseButton1Click:Connect(function()
            local inp  = string.gsub(KInput.Text, "%s+", "")
            local real = string.gsub(tostring(KeySystemConfig.Key), "%s+", "")
            if inp == real then
                Library:Notification({Title = "Success", Content = "Key Verified!"})
                CreateTween(KF, {Size = UDim2.new(0, 0, 0, 0)}, 0.4).Completed:Connect(function()
                    KF.Visible = false; MainFrame.Visible = true
                    CreateTween(MainFrame, {Size = UDim2.new(0, 600, 0, 390)}, 0.4)
                end)
            else
                Library:Notification({Title = "Error", Content = "Incorrect Key!"})
            end
        end)
    else
        if LoadConfig() then
            Library:RefreshTheme()
            Library:Notification({Title = "Evade Config", Content = "Loaded from evade.json", Duration = 3})
        end
        CreateTween(MainFrame, {Size = UDim2.new(0, 600, 0, 390)}, 0.4)
    end

    -- ==========================================
    -- WINDOW OBJECT
    -- ==========================================
    local Window   = {}
    local FirstTab = true

    function Window:Tab(name)
        local Tab = {}

        -- Tab button: full-width, left-aligned, with a left pip indicator
        local TabBtn = Instance.new("TextButton", TabContainer)
        TabBtn.BackgroundColor3       = Color3.fromRGB(255, 255, 255)
        TabBtn.BackgroundTransparency = 1
        TabBtn.Size                   = UDim2.new(1, 0, 0, 32)
        TabBtn.Font                   = Enum.Font.GothamMedium
        TabBtn.Text                   = name
        TabBtn.TextColor3             = Color3.fromRGB(120, 120, 130)
        TabBtn.TextSize               = 13
        TabBtn.TextXAlignment         = Enum.TextXAlignment.Left
        TabBtn.BorderSizePixel        = 0
        TabBtn.AutoButtonColor        = false
        Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(0, 8)

        -- Left pip (hidden when inactive)
        local Pip = Instance.new("Frame", TabBtn)
        Pip.Name              = "Pip"
        Pip.BackgroundColor3  = Library.CurrentTheme.Accent
        Pip.BorderSizePixel   = 0
        Pip.BackgroundTransparency = 1
        Pip.Position          = UDim2.new(0, 0, 0.5, -8)
        Pip.Size              = UDim2.new(0, 3, 0, 16)
        Instance.new("UICorner", Pip).CornerRadius = UDim.new(0, 2)

        -- Indent text to make room for pip
        local TBPad = Instance.new("UIPadding", TabBtn)
        TBPad.PaddingLeft = UDim.new(0, 12)

        local Page = Instance.new("ScrollingFrame", PagesFolder)
        Page.Name                  = name
        Page.BackgroundTransparency = 1
        Page.Size                  = UDim2.new(1, 0, 1, 0)
        Page.ScrollBarThickness    = 2
        Page.ScrollBarImageColor3  = Library.CurrentTheme.Accent
        Page.Visible               = false
        Page.CanvasSize            = UDim2.new(0, 0, 0, 0)
        Page.BorderSizePixel       = 0

        local PL = Instance.new("UIListLayout", Page)
        PL.SortOrder = Enum.SortOrder.LayoutOrder; PL.Padding = UDim.new(0, 6)
        local PP = Instance.new("UIPadding", Page)
        PP.PaddingTop   = UDim.new(0, 6)
        PP.PaddingLeft  = UDim.new(0, 4)
        PP.PaddingRight = UDim.new(0, 8)

        PL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            Page.CanvasSize = UDim2.new(0, 0, 0, PL.AbsoluteContentSize.Y + 20)
        end)

        TabBtn.MouseButton1Click:Connect(function() SwitchToTab(name) end)
        TabBtn.MouseEnter:Connect(function()
            if TabBtn.BackgroundTransparency > 0.5 then
                CreateTween(TabBtn, {BackgroundTransparency = 0.95, TextColor3 = Color3.fromRGB(200, 200, 210)}, 0.15)
            end
        end)
        TabBtn.MouseLeave:Connect(function()
            if TabBtn.BackgroundTransparency > 0.5 then
                CreateTween(TabBtn, {BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(120, 120, 130)}, 0.15)
            end
        end)

        if FirstTab then
            FirstTab = false
            CreateTween(TabBtn, {BackgroundColor3 = Library.CurrentTheme.Accent, BackgroundTransparency = 0.85, TextColor3 = Library.CurrentTheme.Accent}, 0.2)
            CreateTween(Pip, {BackgroundTransparency = 0}, 0.2)
            Page.Visible = true
        end

        -- ────────────────────────────────────────
        -- ELEMENTS
        -- ────────────────────────────────────────

        -- LABEL (section header)
        function Tab:Label(text)
            local SL = Instance.new("TextLabel", Page)
            SL.Name               = "SectionLabel"
            SL.BackgroundTransparency = 1
            SL.Size               = UDim2.new(1, 0, 0, 22)
            SL.Font               = Enum.Font.GothamBold
            SL.Text               = "  " .. text:upper()
            SL.TextColor3         = Library.CurrentTheme.Accent
            SL.TextSize           = 10
            SL.TextXAlignment     = Enum.TextXAlignment.Left
            SL.LayoutOrder        = 0

            local Line = Instance.new("Frame", SL)
            Line.Name             = "Line"
            Line.BackgroundColor3 = Library.CurrentTheme.Accent
            Line.BorderSizePixel  = 0
            Line.Position         = UDim2.new(0, 0, 1, -1)
            Line.Size             = UDim2.new(1, 0, 0, 1)
            Line.BackgroundTransparency = 0.7
            return SL
        end
        Tab.Paragraph = Tab.Label

        -- BUTTON
        function Tab:Button(text, callback)
            local T   = Library.CurrentTheme
            local Btn = Instance.new("Frame", Page)
            Btn.Name            = "ElementFrame"
            Btn.BackgroundColor3 = T.Element
            Btn.Size            = UDim2.new(1, 0, 0, 36)
            Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 8)

            -- Left accent stripe on hover/click
            local Stripe = Instance.new("Frame", Btn)
            Stripe.BackgroundColor3 = T.Accent
            Stripe.BorderSizePixel  = 0
            Stripe.BackgroundTransparency = 1
            Stripe.Position = UDim2.new(0, 0, 0.5, -10)
            Stripe.Size     = UDim2.new(0, 3, 0, 20)
            Instance.new("UICorner", Stripe).CornerRadius = UDim.new(0, 2)

            local BT = Instance.new("TextButton", Btn)
            BT.BackgroundTransparency = 1
            BT.Size                   = UDim2.new(1, 0, 1, 0)
            BT.Font                   = Enum.Font.Gotham
            BT.Text                   = text
            BT.TextColor3             = T.Text
            BT.TextSize               = 13
            BT.AutoButtonColor        = false

            BT.MouseEnter:Connect(function()
                CreateTween(Stripe, {BackgroundTransparency = 0}, 0.15)
                CreateTween(BT, {TextColor3 = T.Accent}, 0.15)
            end)
            BT.MouseLeave:Connect(function()
                CreateTween(Stripe, {BackgroundTransparency = 1}, 0.15)
                CreateTween(BT, {TextColor3 = T.Text}, 0.15)
            end)
            BT.MouseButton1Click:Connect(function()
                CreateTween(Btn, {BackgroundColor3 = T.Accent}, 0.08)
                task.wait(0.08)
                CreateTween(Btn, {BackgroundColor3 = Library.CurrentTheme.Element}, 0.12)
                pcall(callback)
            end)
            table.insert(Library.SearchIndex, {Name = text, Tab = name, Instance = Btn})
            return BT
        end

        -- TOGGLE
        function Tab:Toggle(text, default, callback)
            local T       = Library.CurrentTheme
            local Toggled = default or false
            Library.Flags[text] = Toggled

            local TFr = Instance.new("Frame", Page)
            TFr.Name             = "ElementFrame"
            TFr.BackgroundColor3 = T.Element
            TFr.Size             = UDim2.new(1, 0, 0, 36)
            Instance.new("UICorner", TFr).CornerRadius = UDim.new(0, 8)

            local TL = Instance.new("TextLabel", TFr)
            TL.BackgroundTransparency = 1
            TL.Position = UDim2.new(0, 12, 0, 0); TL.Size = UDim2.new(0.72, 0, 1, 0)
            TL.Font = Enum.Font.Gotham; TL.Text = text; TL.TextColor3 = T.Text; TL.TextSize = 13
            TL.TextXAlignment = Enum.TextXAlignment.Left

            -- Pill toggle track
            local SB = Instance.new("Frame", TFr)
            SB.BackgroundColor3 = Toggled and T.Accent or Color3.fromRGB(55, 55, 65)
            SB.Position = UDim2.new(1, -52, 0.5, -10)
            SB.Size     = UDim2.new(0, 42, 0, 20)
            Instance.new("UICorner", SB).CornerRadius = UDim.new(1, 0)

            local Dot = Instance.new("Frame", SB)
            Dot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Dot.Position = Toggled and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
            Dot.Size     = UDim2.new(0, 16, 0, 16)
            Instance.new("UICorner", Dot).CornerRadius = UDim.new(1, 0)

            local Btn = Instance.new("TextButton", TFr)
            Btn.BackgroundTransparency = 1; Btn.Size = UDim2.new(1, 0, 1, 0)
            Btn.Text = ""; Btn.AutoButtonColor = false

            local function Update(val)
                Toggled = val; Library.Flags[text] = Toggled
                CreateTween(SB,  {BackgroundColor3 = Toggled and Library.CurrentTheme.Accent or Color3.fromRGB(55, 55, 65)}, 0.2)
                CreateTween(Dot, {Position = Toggled and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)}, 0.2)
                pcall(callback, Toggled)
            end

            Btn.MouseButton1Click:Connect(function() Update(not Toggled) end)
            Library.Elements[text] = {Set = function(self, v) Update(v) end}
            table.insert(Library.SearchIndex, {Name = text, Tab = name, Instance = TFr})
            return TFr, TL
        end

        -- SLIDER
        function Tab:Slider(text, min, max, default, callback)
            local T   = Library.CurrentTheme
            local val = default or min
            local sliding = false
            Library.Flags[text] = val

            local SFr = Instance.new("Frame", Page)
            SFr.Name             = "ElementFrame"
            SFr.BackgroundColor3 = T.Element
            SFr.Size             = UDim2.new(1, 0, 0, 50)
            Instance.new("UICorner", SFr).CornerRadius = UDim.new(0, 8)

            local SL = Instance.new("TextLabel", SFr)
            SL.BackgroundTransparency = 1
            SL.Position = UDim2.new(0, 12, 0, 5); SL.Size = UDim2.new(1, -20, 0, 20)
            SL.Font = Enum.Font.Gotham; SL.Text = text; SL.TextColor3 = T.Text; SL.TextSize = 13
            SL.TextXAlignment = Enum.TextXAlignment.Left

            local VL = Instance.new("TextLabel", SFr)
            VL.Name = "ValLbl"; VL.BackgroundTransparency = 1
            VL.Position = UDim2.new(1, -58, 0, 5); VL.Size = UDim2.new(0, 48, 0, 20)
            VL.Font = Enum.Font.GothamBold; VL.Text = tostring(val)
            VL.TextColor3 = T.Accent; VL.TextSize = 13; VL.TextXAlignment = Enum.TextXAlignment.Right

            -- Track
            local Bar = Instance.new("Frame", SFr)
            Bar.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
            Bar.Position = UDim2.new(0, 12, 0, 36); Bar.Size = UDim2.new(1, -24, 0, 5)
            Instance.new("UICorner", Bar).CornerRadius = UDim.new(1, 0)

            local Fill = Instance.new("Frame", Bar)
            Fill.BackgroundColor3 = T.Accent
            Fill.Size = UDim2.new((val - min) / (max - min), 0, 1, 0)
            Instance.new("UICorner", Fill).CornerRadius = UDim.new(1, 0)

            -- Thumb dot
            local Thumb = Instance.new("Frame", Bar)
            Thumb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Thumb.AnchorPoint = Vector2.new(0.5, 0.5)
            Thumb.Position = UDim2.new((val - min) / (max - min), 0, 0.5, 0)
            Thumb.Size     = UDim2.new(0, 12, 0, 12)
            Instance.new("UICorner", Thumb).CornerRadius = UDim.new(1, 0)

            local Btn = Instance.new("TextButton", Bar)
            Btn.BackgroundTransparency = 1; Btn.Size = UDim2.new(1, 0, 1, 0)
            Btn.Text = ""; Btn.AutoButtonColor = false

            local function SetVal(v)
                val = math.clamp(v, min, max); Library.Flags[text] = val
                VL.Text = tostring(val)
                local pct = (val - min) / (max - min)
                CreateTween(Fill,  {Size = UDim2.new(pct, 0, 1, 0)}, 0.08)
                CreateTween(Thumb, {Position = UDim2.new(pct, 0, 0.5, 0)}, 0.08)
                pcall(callback, val)
            end
            local function Update(i)
                local s = math.clamp((i.Position.X - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X, 0, 1)
                SetVal(math.floor(min + (max - min) * s))
            end

            Btn.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then sliding = true; Update(i) end end)
            Btn.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then sliding = false end end)
            UserInputService.InputChanged:Connect(function(i) if sliding and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then Update(i) end end)

            Library.Elements[text] = {Set = function(self, v) SetVal(v) end}
            table.insert(Library.SearchIndex, {Name = text, Tab = name, Instance = SFr})
        end

        -- DROPDOWN
        function Tab:Dropdown(text, list, callback)
            local T       = Library.CurrentTheme
            local dropped = false
            local ITEM_H  = 30
            local LIST_H  = 150
            Library.Flags[text] = ""

            local DFr = Instance.new("Frame", Page)
            DFr.Name             = "ElementFrame"
            DFr.BackgroundColor3 = T.Element
            DFr.Size             = UDim2.new(1, 0, 0, 36)
            DFr.ClipsDescendants = true
            Instance.new("UICorner", DFr).CornerRadius = UDim.new(0, 8)

            local DL = Instance.new("TextLabel", DFr)
            DL.BackgroundTransparency = 1
            DL.Position = UDim2.new(0, 12, 0, 0); DL.Size = UDim2.new(1, -40, 0, 36)
            DL.Font = Enum.Font.Gotham; DL.Text = text; DL.TextColor3 = T.Text; DL.TextSize = 13
            DL.TextXAlignment = Enum.TextXAlignment.Left

            local Arrow = Instance.new("ImageLabel", DFr)
            Arrow.BackgroundTransparency = 1
            Arrow.Position = UDim2.new(1, -28, 0, 8)
            Arrow.Size     = UDim2.new(0, 20, 0, 20)
            Arrow.Image    = "rbxassetid://6031090990"
            Arrow.ImageColor3 = Color3.fromRGB(150, 150, 160)

            local ListScroll = Instance.new("ScrollingFrame", DFr)
            ListScroll.Name                 = "ListScroll"
            ListScroll.BackgroundColor3     = Color3.fromRGB(22, 22, 30)
            ListScroll.Position             = UDim2.new(0, 0, 0, 38)
            ListScroll.Size                 = UDim2.new(1, 0, 0, LIST_H)
            ListScroll.CanvasSize           = UDim2.new(0, 0, 0, 0)
            ListScroll.ScrollBarThickness   = 4
            ListScroll.ScrollBarImageColor3 = T.Accent
            ListScroll.BorderSizePixel      = 0
            ListScroll.Visible              = false
            ListScroll.ZIndex               = 5
            Instance.new("UICorner", ListScroll).CornerRadius = UDim.new(0, 8)

            local ItemLayout = Instance.new("UIListLayout", ListScroll)
            ItemLayout.SortOrder = Enum.SortOrder.LayoutOrder; ItemLayout.Padding = UDim.new(0, 2)

            local HitBtn = Instance.new("TextButton", DFr)
            HitBtn.BackgroundTransparency = 1
            HitBtn.Size   = UDim2.new(1, 0, 0, 36)
            HitBtn.Text   = ""; HitBtn.ZIndex = 3; HitBtn.AutoButtonColor = false

            local function SelectItem(item)
                DL.Text             = text .. "  ›  " .. item
                DL.TextColor3       = T.Accent
                Library.Flags[text] = item
                dropped             = false
                ListScroll.Visible  = false
                DFr.Size            = UDim2.new(1, 0, 0, 36)
                Arrow.Rotation      = 0
                pcall(callback, item)
            end

            local function BuildItems(itemList)
                for _, c in pairs(ListScroll:GetChildren()) do
                    if c:IsA("TextButton") then c:Destroy() end
                end
                for idx, item in ipairs(itemList) do
                    local IBtn = Instance.new("TextButton", ListScroll)
                    IBtn.Name             = "Item_" .. idx
                    IBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
                    IBtn.Size             = UDim2.new(1, -6, 0, ITEM_H - 2)
                    IBtn.Font             = Enum.Font.Gotham
                    IBtn.Text             = item
                    IBtn.TextColor3       = Color3.fromRGB(200, 200, 210)
                    IBtn.TextSize         = 12
                    IBtn.AutoButtonColor  = false
                    IBtn.BorderSizePixel  = 0
                    IBtn.LayoutOrder      = idx
                    IBtn.ZIndex           = 6
                    Instance.new("UICorner", IBtn).CornerRadius = UDim.new(0, 6)
                    IBtn.MouseButton1Click:Connect(function() SelectItem(item) end)
                    IBtn.MouseEnter:Connect(function() CreateTween(IBtn, {BackgroundColor3 = T.Accent, TextColor3 = Color3.fromRGB(255,255,255)}, 0.1) end)
                    IBtn.MouseLeave:Connect(function()  CreateTween(IBtn, {BackgroundColor3 = Color3.fromRGB(28,28,36), TextColor3 = Color3.fromRGB(200,200,210)}, 0.1) end)
                end
                local totalH = #itemList * ITEM_H + (#itemList * 2)
                ListScroll.CanvasSize = UDim2.new(0, 0, 0, totalH)
            end

            BuildItems(list)

            HitBtn.MouseButton1Click:Connect(function()
                dropped = not dropped
                if dropped then
                    ListScroll.Visible = true
                    ListScroll.CanvasPosition = Vector2.new(0, 0)
                    DFr.Size   = UDim2.new(1, 0, 0, 36 + 2 + LIST_H)
                    Arrow.Rotation = 180
                else
                    ListScroll.Visible = false
                    DFr.Size   = UDim2.new(1, 0, 0, 36)
                    Arrow.Rotation = 0
                end
                -- Update page canvas
                Page.CanvasSize = UDim2.new(0, 0, 0, PL.AbsoluteContentSize.Y + 20)
            end)

            Library.Elements[text] = {
                Set = function(self, v) SelectItem(v) end,
                Refresh = function(self, newList) list = newList; BuildItems(newList) end
            }
            table.insert(Library.SearchIndex, {Name = text, Tab = name, Instance = DFr})
            return DL
        end

        -- TEXTBOX
        function Tab:Textbox(text, placeholder, callback)
            local T = Library.CurrentTheme

            local TbFr = Instance.new("Frame", Page)
            TbFr.Name             = "ElementFrame"
            TbFr.BackgroundColor3 = T.Element
            TbFr.Size             = UDim2.new(1, 0, 0, 54)
            Instance.new("UICorner", TbFr).CornerRadius = UDim.new(0, 8)

            local TbL = Instance.new("TextLabel", TbFr)
            TbL.BackgroundTransparency = 1
            TbL.Position = UDim2.new(0, 12, 0, 4); TbL.Size = UDim2.new(1, -20, 0, 16)
            TbL.Font = Enum.Font.Gotham; TbL.Text = text; TbL.TextColor3 = T.Text; TbL.TextSize = 12
            TbL.TextXAlignment = Enum.TextXAlignment.Left

            local Box = Instance.new("TextBox", TbFr)
            Box.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
            Box.Position = UDim2.new(0, 10, 0, 22); Box.Size = UDim2.new(1, -20, 0, 26)
            Box.Font = Enum.Font.Gotham; Box.PlaceholderText = placeholder or ""
            Box.PlaceholderColor3 = Color3.fromRGB(90, 90, 100)
            Box.Text = ""; Box.TextColor3 = Color3.fromRGB(220, 220, 230); Box.TextSize = 12
            Box.ClearTextOnFocus = false; Box.BorderSizePixel = 0
            Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 6)
            local BS = Instance.new("UIStroke", Box); BS.Color = Color3.fromRGB(55, 55, 65); BS.Thickness = 1

            Box.Focused:Connect(function() CreateTween(BS, {Color = Library.CurrentTheme.Accent}, 0.15) end)
            Box.FocusLost:Connect(function(enter)
                CreateTween(BS, {Color = Color3.fromRGB(55, 55, 65)}, 0.15)
                if enter then pcall(callback, Box.Text) end
            end)

            Library.Elements[text] = {Set = function(self, v) Box.Text = v end}
            table.insert(Library.SearchIndex, {Name = text, Tab = name, Instance = TbFr})
        end

        -- KEYBIND
        function Tab:Keybind(text, default, callback)
            local T   = Library.CurrentTheme
            local key = default or Enum.KeyCode.Unknown
            local binding = false
            Library.Flags[text] = key

            local KFr = Instance.new("Frame", Page)
            KFr.Name             = "ElementFrame"
            KFr.BackgroundColor3 = T.Element
            KFr.Size             = UDim2.new(1, 0, 0, 36)
            Instance.new("UICorner", KFr).CornerRadius = UDim.new(0, 8)

            local KL = Instance.new("TextLabel", KFr)
            KL.BackgroundTransparency = 1
            KL.Position = UDim2.new(0, 12, 0, 0); KL.Size = UDim2.new(0.6, 0, 1, 0)
            KL.Font = Enum.Font.Gotham; KL.Text = text; KL.TextColor3 = T.Text; KL.TextSize = 13
            KL.TextXAlignment = Enum.TextXAlignment.Left

            local KBtn = Instance.new("TextButton", KFr)
            KBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
            KBtn.Position = UDim2.new(1, -92, 0.5, -13); KBtn.Size = UDim2.new(0, 82, 0, 26)
            KBtn.Font     = Enum.Font.GothamBold
            KBtn.Text     = key == Enum.KeyCode.Unknown and "None" or key.Name
            KBtn.TextColor3 = Color3.fromRGB(200, 200, 215); KBtn.TextSize = 11
            KBtn.AutoButtonColor = false; KBtn.BorderSizePixel = 0
            Instance.new("UICorner", KBtn).CornerRadius = UDim.new(0, 6)
            local KBS = Instance.new("UIStroke", KBtn); KBS.Color = Color3.fromRGB(60, 60, 75); KBS.Thickness = 1

            KBtn.MouseButton1Click:Connect(function()
                binding = true; KBtn.Text = "Press key..."
                KBtn.TextColor3 = T.Accent; CreateTween(KBS, {Color = T.Accent}, 0.15)
            end)

            UserInputService.InputBegan:Connect(function(input, gpe)
                if binding and not gpe and input.UserInputType == Enum.UserInputType.Keyboard then
                    key = input.KeyCode; binding = false; KBtn.Text = key.Name
                    KBtn.TextColor3 = Color3.fromRGB(200, 200, 215)
                    CreateTween(KBS, {Color = Color3.fromRGB(60, 60, 75)}, 0.15)
                    Library.Flags[text] = key
                elseif not binding and not gpe and input.UserInputType == Enum.UserInputType.Keyboard then
                    if input.KeyCode == key then pcall(callback, key) end
                end
            end)

            Library.Elements[text] = {Set = function(self, k) key = k; KBtn.Text = k.Name end}
            table.insert(Library.SearchIndex, {Name = text, Tab = name, Instance = KFr})
        end

        return Tab
    end

    -- Configuration tab
    function Window:AddConfig()
        local ConfigTab = Window:Tab("Configuration")
        ConfigTab:Label("Themes")

        local ThemeNames = {}
        for n in pairs(Library.Themes) do table.insert(ThemeNames, n) end
        table.sort(ThemeNames)

        ConfigTab:Dropdown("Theme", ThemeNames, function(selected)
            Library:SetTheme(selected)
        end)

        ConfigTab:Toggle("Transparent Background", false, function(val)
            Library.Settings.Transparency = val
            Library:RefreshTheme()
        end)

        ConfigTab:Label("Evade Config")

        ConfigTab:Button("Save Evade Config", function()
            SaveConfig()
            Library:Notification({Title = "Evade Config", Content = "Saved to evade.json", Duration = 3})
        end)

        ConfigTab:Button("Load Evade Config", function()
            if LoadConfig() then
                Library:RefreshTheme()
                Library:Notification({Title = "Evade Config", Content = "Loaded from evade.json", Duration = 3})
            else
                Library:Notification({Title = "Evade Config", Content = "No save file found.", Duration = 3})
            end
        end)

        ConfigTab:Button("Delete Evade Config", function()
            pcall(function()
                if isfile and isfile(CONFIG_FILE) then
                    delfile(CONFIG_FILE)
                    Library:Notification({Title = "Evade Config", Content = "evade.json deleted.", Duration = 3})
                else
                    Library:Notification({Title = "Evade Config", Content = "No save file to delete.", Duration = 3})
                end
            end)
        end)
    end

    return Window
end

return Library
