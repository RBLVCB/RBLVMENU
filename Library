-- ================================================
--   RBLV Library v1.1
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

Library.Settings = {
    Theme        = "Default",
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

Library.CurrentTheme = Library.Themes["Default"]

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

local CONFIG_FILE = "RBLV_config.json"
local function SaveConfig()
    pcall(function()
        if writefile then writefile(CONFIG_FILE, HttpService:JSONEncode(Library.Flags)) end
    end)
end
local function LoadConfig()
    local ok = pcall(function()
        if isfile and isfile(CONFIG_FILE) then
            local data = HttpService:JSONDecode(readfile(CONFIG_FILE))
            for k, v in pairs(data) do
                if Library.Elements[k] then pcall(function() Library.Elements[k]:Set(v) end) end
            end
        end
    end)
    return ok
end

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

    local NF = Instance.new("Frame")
    NF.Parent            = NotifGui
    NF.BackgroundColor3  = T.Main
    NF.BorderSizePixel   = 0
    NF.AnchorPoint       = Vector2.new(1,1)
    NF.Position          = UDim2.new(1,-10,1,-10)
    NF.Size              = UDim2.new(0,260,0,0)
    NF.ClipsDescendants  = true
    local NFC = Instance.new("UICorner"); NFC.CornerRadius = UDim.new(0,8); NFC.Parent = NF
    local NFS = Instance.new("UIStroke"); NFS.Color = T.Glow or T.Accent; NFS.Thickness = 1.5; NFS.Parent = NF

    local Bar = Instance.new("Frame")
    Bar.Parent = NF; Bar.BackgroundColor3 = T.Accent
    Bar.Size = UDim2.new(0,3,1,0); Bar.BorderSizePixel = 0
    Instance.new("UICorner", Bar).CornerRadius = UDim.new(0,3)

    local NT = Instance.new("TextLabel")
    NT.Parent = NF; NT.BackgroundTransparency = 1
    NT.Position = UDim2.new(0,12,0,8); NT.Size = UDim2.new(1,-16,0,18)
    NT.Font = Enum.Font.GothamBold; NT.Text = Title
    NT.TextColor3 = T.Text; NT.TextSize = 13; NT.TextXAlignment = Enum.TextXAlignment.Left

    local ND = Instance.new("TextLabel")
    ND.Parent = NF; ND.BackgroundTransparency = 1
    ND.Position = UDim2.new(0,12,0,28); ND.Size = UDim2.new(1,-16,0,32)
    ND.Font = Enum.Font.Gotham; ND.Text = Content
    ND.TextColor3 = Color3.fromRGB(180,180,180); ND.TextSize = 12
    ND.TextXAlignment = Enum.TextXAlignment.Left; ND.TextWrapped = true

    CreateTween(NF, {Size = UDim2.new(0,260,0,70)}, 0.3)
    task.delay(Duration, function()
        CreateTween(NF, {Size = UDim2.new(0,260,0,0), BackgroundTransparency = 1}, 0.3)
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

    -- ── Re-open floating button ──
    local OpenBtnFrame = Instance.new("TextButton")
    OpenBtnFrame.Name             = "OpenButton"
    OpenBtnFrame.Parent           = TitanUI
    OpenBtnFrame.BackgroundColor3 = Library.CurrentTheme.Top
    OpenBtnFrame.Position         = UDim2.new(0.05,0,0.1,0)
    OpenBtnFrame.Size             = UDim2.new(0,80,0,50)
    OpenBtnFrame.Transparency    = 1
    OpenBtnFrame.Visible          = false
    OpenBtnFrame.Active           = true
    OpenBtnFrame.Text             = " • "
    OpenBtnFrame.TextColor3       = Library.CurrentTheme.Text
    OpenBtnFrame.Font             = Enum.Font.GothamBold
    OpenBtnFrame.TextSize         = 22
    OpenBtnFrame.BorderSizePixel  = 0
    OpenBtnFrame.AutoButtonColor  = false
    Instance.new("UICorner", OpenBtnFrame).CornerRadius = UDim.new(0,12)
    Instance.new("UIStroke", OpenBtnFrame).Color = Color3.fromRGB(60,60,60)
    MakeDraggable(OpenBtnFrame, OpenBtnFrame)

    -- ── Main Frame ──
    local MainFrame = Instance.new("Frame")
    MainFrame.Name             = "MainFrame"
    MainFrame.Parent           = TitanUI
    MainFrame.AnchorPoint      = Vector2.new(0.5,0.5)
    MainFrame.Position         = UDim2.new(0.5,0,0.5,0)
    MainFrame.Size             = UDim2.new(0,550,0,350)
    MainFrame.BackgroundColor3 = Library.CurrentTheme.Main
    MainFrame.ClipsDescendants = true
    MainFrame.Visible          = not KeySystemConfig.Enabled
    if KeySystemConfig.Enabled then MainFrame.Size = UDim2.new(0,0,0,0) end

    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0,8)
    local MS = Instance.new("UIStroke", MainFrame)
    MS.Color = Library.CurrentTheme.Glow or Color3.fromRGB(50,50,50)
    MS.Thickness = 2; MS.Transparency = 0.5

    -- Pattern background
    local Pattern = Instance.new("ImageLabel", MainFrame)
    Pattern.BackgroundTransparency = 1
    Pattern.Size = UDim2.new(1,0,1,0)
    Pattern.Image = "rbxassetid://2151741365"
    Pattern.ImageTransparency = 0.95
    Pattern.TileSize = UDim2.new(0,25,0,25)
    Pattern.ScaleType = Enum.ScaleType.Tile
    Pattern.ZIndex = 0

    -- ── Topbar ──
    local Topbar = Instance.new("Frame", MainFrame)
    Topbar.Name = "Topbar"
    Topbar.BackgroundColor3 = Library.CurrentTheme.Top
    Topbar.Size = UDim2.new(1,0,0,40)
    Instance.new("UICorner", Topbar).CornerRadius = UDim.new(0,8)

    local TopGradient = Instance.new("UIGradient", Topbar)
    TopGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(200,200,200))
    }
    TopGradient.Rotation = 45

    local FixB = Instance.new("Frame", Topbar)
    FixB.Name = "FixB"; FixB.BorderSizePixel = 0
    FixB.BackgroundColor3 = Library.CurrentTheme.Top
    FixB.Position = UDim2.new(0,0,1,-5); FixB.Size = UDim2.new(1,0,0,5)

    local TitleLbl = Instance.new("TextLabel", Topbar)
    TitleLbl.BackgroundTransparency = 1
    TitleLbl.Position = UDim2.new(0,15,0,0); TitleLbl.Size = UDim2.new(0.5,0,1,0)
    TitleLbl.Font = Enum.Font.GothamBold; TitleLbl.Text = Title
    TitleLbl.TextColor3 = Library.CurrentTheme.Text; TitleLbl.TextSize = 14
    TitleLbl.TextXAlignment = Enum.TextXAlignment.Left

    local CloseBtn = Instance.new("ImageButton", Topbar)
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Position = UDim2.new(1,-35,0,5); CloseBtn.Size = UDim2.new(0,30,0,30)
    CloseBtn.Image = "rbxassetid://6031094678"; CloseBtn.ImageColor3 = Color3.fromRGB(200,200,200)

    Library.IsOpen = true
    function Library:Toggle()
        Library.IsOpen = not Library.IsOpen
        if Library.IsOpen then
            OpenBtnFrame.Visible = false; MainFrame.Visible = true
            CreateTween(MainFrame, {Size = UDim2.new(0,550,0,350)}, 0.4)
        else
            local close = CreateTween(MainFrame, {Size = UDim2.new(0,0,0,0)}, 0.4)
            close.Completed:Connect(function()
                if not Library.IsOpen then MainFrame.Visible = false; OpenBtnFrame.Visible = true end
            end)
        end
    end

    CloseBtn.MouseButton1Click:Connect(function() Library:Toggle() end)
    OpenBtnFrame.MouseButton1Click:Connect(function() Library:Toggle() end)
    MakeDraggable(Topbar, MainFrame)

    -- ── Search Bar ──
    local SearchBar = Instance.new("TextBox", MainFrame)
    SearchBar.Name = "SearchBar"
    SearchBar.BackgroundColor3 = Library.CurrentTheme.Top
    SearchBar.BorderSizePixel = 0
    SearchBar.Position = UDim2.new(0,10,0,50); SearchBar.Size = UDim2.new(0,130,0,30)
    SearchBar.Font = Enum.Font.Gotham; SearchBar.PlaceholderText = "Search..."
    SearchBar.Text = ""; SearchBar.TextColor3 = Color3.fromRGB(255,255,255); SearchBar.TextSize = 13
    Instance.new("UICorner", SearchBar).CornerRadius = UDim.new(0,6)
    local SBI = Instance.new("ImageLabel", SearchBar)
    SBI.BackgroundTransparency = 1; SBI.Position = UDim2.new(1,-25,0,5); SBI.Size = UDim2.new(0,20,0,20)
    SBI.Image = "rbxassetid://6031154871"; SBI.ImageColor3 = Color3.fromRGB(150,150,150)

    -- ── Tab Sidebar ──
    local TabContainer = Instance.new("ScrollingFrame", MainFrame)
    TabContainer.BackgroundTransparency = 1
    TabContainer.Position = UDim2.new(0,10,0,90)
    TabContainer.Size = UDim2.new(0,130,1,-100)
    TabContainer.ScrollBarThickness = 2; TabContainer.BorderSizePixel = 0
    local TabListLayout = Instance.new("UIListLayout", TabContainer)
    TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder; TabListLayout.Padding = UDim.new(0,5)

    -- Divider line
    local Divider = Instance.new("Frame", MainFrame)
    Divider.BackgroundColor3 = Color3.fromRGB(50,50,50); Divider.BorderSizePixel = 0
    Divider.Position = UDim2.new(0,150,0,50); Divider.Size = UDim2.new(0,1,1,-60)

    -- ── Page Container ──
    local PageContainer = Instance.new("Frame", MainFrame)
    PageContainer.BackgroundTransparency = 1
    PageContainer.Position = UDim2.new(0,160,0,50)
    PageContainer.Size = UDim2.new(1,-170,1,-60)
    PageContainer.ClipsDescendants = true

    local PagesFolder = Instance.new("Frame", PageContainer)
    PagesFolder.Name = "Pages"; PagesFolder.BackgroundTransparency = 1; PagesFolder.Size = UDim2.new(1,0,1,0)

    -- ── Search Logic ──
    local function SwitchToTab(PageName)
        for _, v in pairs(TabContainer:GetChildren()) do
            if v:IsA("TextButton") then
                if v.Text == PageName then
                    CreateTween(v, {BackgroundTransparency = 0.9, TextColor3 = Library.CurrentTheme.Text}, 0.2)
                else
                    CreateTween(v, {BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(150,150,150)}, 0.2)
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
        CreateTween(MainFrame, {BackgroundColor3 = T.Main, BackgroundTransparency = Library.Settings.Transparency and 0.5 or 0}, 0.3)
        CreateTween(Topbar,    {BackgroundColor3 = T.Top}, 0.3)
        CreateTween(FixB,      {BackgroundColor3 = T.Top}, 0.3)
        CreateTween(SearchBar, {BackgroundColor3 = T.Top}, 0.3)
        TopGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)),
            ColorSequenceKeypoint.new(1, T.Accent)
        }
        CreateTween(MS, {Color = T.Glow or T.Accent}, 0.3)
        TitleLbl.TextColor3 = T.Text
        OpenBtnFrame.BackgroundColor3 = T.Top
        for _, obj in pairs(TabContainer:GetChildren()) do
            if obj:IsA("TextButton") and obj.BackgroundTransparency < 0.9 then
                obj.TextColor3 = T.Text
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
        KF.BackgroundColor3 = Color3.fromRGB(20,20,20)
        KF.AnchorPoint = Vector2.new(0.5,0.5); KF.Position = UDim2.new(0.5,0,0.5,0)
        KF.Size = UDim2.new(0,400,0,250); KF.ClipsDescendants = true
        Instance.new("UICorner", KF).CornerRadius = UDim.new(0,10)
        Instance.new("UIStroke", KF).Color = Color3.fromRGB(60,60,60)

        local KTitle = Instance.new("TextLabel", KF)
        KTitle.BackgroundTransparency = 1; KTitle.Position = UDim2.new(0,0,0,15); KTitle.Size = UDim2.new(1,0,0,30)
        KTitle.Font = Enum.Font.GothamBold; KTitle.Text = KeySystemConfig.KeyName
        KTitle.TextColor3 = Color3.fromRGB(255,255,255); KTitle.TextSize = 20

        local KInput = Instance.new("TextBox", KF)
        KInput.BackgroundColor3 = Color3.fromRGB(35,35,35)
        KInput.Position = UDim2.new(0.1,0,0.4,0); KInput.Size = UDim2.new(0.8,0,0,40)
        KInput.Font = Enum.Font.Gotham; KInput.PlaceholderText = "Enter Key..."
        KInput.Text = ""; KInput.TextColor3 = Color3.fromRGB(255,255,255); KInput.TextSize = 14
        Instance.new("UICorner", KInput)

        local KBtn = Instance.new("TextButton", KF)
        KBtn.BackgroundColor3 = Color3.fromRGB(45,45,45)
        KBtn.Position = UDim2.new(0.1,0,0.65,0); KBtn.Size = UDim2.new(0.35,0,0,35)
        KBtn.Font = Enum.Font.GothamBold; KBtn.Text = "Login"
        KBtn.TextColor3 = Color3.fromRGB(255,255,255); KBtn.TextSize = 14; KBtn.BorderSizePixel = 0
        Instance.new("UICorner", KBtn)

        local KLink = Instance.new("TextButton", KF)
        KLink.BackgroundColor3 = Color3.fromRGB(45,45,45)
        KLink.Position = UDim2.new(0.55,0,0.65,0); KLink.Size = UDim2.new(0.35,0,0,35)
        KLink.Font = Enum.Font.GothamBold; KLink.Text = "Get Key"
        KLink.TextColor3 = Color3.fromRGB(255,255,255); KLink.TextSize = 14; KLink.BorderSizePixel = 0
        Instance.new("UICorner", KLink)
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
                CreateTween(KF, {Size = UDim2.new(0,0,0,0)}, 0.4).Completed:Connect(function()
                    KF.Visible = false; MainFrame.Visible = true
                    CreateTween(MainFrame, {Size = UDim2.new(0,550,0,350)}, 0.4)
                end)
            else
                Library:Notification({Title = "Error", Content = "Incorrect Key!"})
            end
        end)
    else
        if LoadConfig() then Library:Notification({Title = "Config", Content = "Config Loaded!"}) end
        CreateTween(MainFrame, {Size = UDim2.new(0,550,0,350)}, 0.4)
    end

    -- ==========================================
    -- WINDOW OBJECT
    -- ==========================================
    local Window   = {}
    local FirstTab = true

    function Window:Tab(name)
        local Tab = {}

        local TabBtn = Instance.new("TextButton", TabContainer)
        TabBtn.BackgroundColor3    = Color3.fromRGB(255,255,255)
        TabBtn.BackgroundTransparency = 1
        TabBtn.Size                = UDim2.new(1,0,0,30)
        TabBtn.Font                = Enum.Font.GothamMedium
        TabBtn.Text                = name
        TabBtn.TextColor3          = Color3.fromRGB(150,150,150)
        TabBtn.TextSize            = 14
        TabBtn.BorderSizePixel     = 0
        TabBtn.AutoButtonColor     = false
        Instance.new("UICorner", TabBtn)

        local Page = Instance.new("ScrollingFrame", PagesFolder)
        Page.Name = name; Page.BackgroundTransparency = 1
        Page.Size = UDim2.new(1,0,1,0); Page.ScrollBarThickness = 2
        Page.Visible = false; Page.CanvasSize = UDim2.new(0,0,0,0); Page.BorderSizePixel = 0

        local PL = Instance.new("UIListLayout", Page)
        PL.SortOrder = Enum.SortOrder.LayoutOrder; PL.Padding = UDim.new(0,5)
        local PP = Instance.new("UIPadding", Page)
        PP.PaddingTop = UDim.new(0,5); PP.PaddingLeft = UDim.new(0,5); PP.PaddingRight = UDim.new(0,5)

        PL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            Page.CanvasSize = UDim2.new(0,0,0, PL.AbsoluteContentSize.Y + 20)
        end)

        TabBtn.MouseButton1Click:Connect(function() SwitchToTab(name) end)
        TabBtn.MouseEnter:Connect(function()
            if TabBtn.BackgroundTransparency > 0.5 then
                CreateTween(TabBtn, {BackgroundTransparency = 0.95, TextColor3 = Color3.fromRGB(200,200,200)}, 0.15)
            end
        end)
        TabBtn.MouseLeave:Connect(function()
            if TabBtn.BackgroundTransparency > 0.5 then
                CreateTween(TabBtn, {BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(150,150,150)}, 0.15)
            end
        end)

        if FirstTab then
            FirstTab = false
            CreateTween(TabBtn, {BackgroundTransparency = 0.9, TextColor3 = Library.CurrentTheme.Text}, 0.2)
            Page.Visible = true
        end

        -- ────────────────────────────────────────
        -- ELEMENTS
        -- ────────────────────────────────────────

        -- LABEL
        function Tab:Label(text)
            local SL = Instance.new("TextLabel", Page)
            SL.Name = "SectionLabel"; SL.BackgroundTransparency = 1
            SL.Size = UDim2.new(1,0,0,24)
            SL.Font = Enum.Font.GothamBold; SL.Text = text
            SL.TextColor3 = Library.CurrentTheme.Accent; SL.TextSize = 13
            SL.TextXAlignment = Enum.TextXAlignment.Left

            local Line = Instance.new("Frame", SL)
            Line.Name = "Line"; Line.BackgroundColor3 = Library.CurrentTheme.Accent
            Line.BorderSizePixel = 0; Line.Position = UDim2.new(0,0,1,-1); Line.Size = UDim2.new(1,0,0,1)
            return SL
        end
        Tab.Paragraph = Tab.Label

        -- BUTTON
        function Tab:Button(text, callback)
            local T = Library.CurrentTheme
            local Btn = Instance.new("Frame", Page)
            Btn.Name = "ElementFrame"; Btn.BackgroundColor3 = T.Element
            Btn.Size = UDim2.new(1,0,0,36)
            Instance.new("UICorner", Btn)

            local BT = Instance.new("TextButton", Btn)
            BT.BackgroundTransparency = 1; BT.Size = UDim2.new(1,0,1,0)
            BT.Font = Enum.Font.Gotham; BT.Text = text
            BT.TextColor3 = T.Text; BT.TextSize = 14; BT.AutoButtonColor = false

            BT.MouseButton1Click:Connect(function()
                CreateTween(Btn, {BackgroundColor3 = T.Accent}, 0.1)
                task.wait(0.1)
                CreateTween(Btn, {BackgroundColor3 = Library.CurrentTheme.Element}, 0.1)
                pcall(callback)
            end)
            table.insert(Library.SearchIndex, {Name = text, Tab = name, Instance = Btn})
            return BT
        end

        -- TOGGLE
        function Tab:Toggle(text, default, callback)
            local T = Library.CurrentTheme
            local Toggled = default or false
            Library.Flags[text] = Toggled

            local TFr = Instance.new("Frame", Page)
            TFr.Name = "ElementFrame"; TFr.BackgroundColor3 = T.Element; TFr.Size = UDim2.new(1,0,0,36)
            Instance.new("UICorner", TFr)

            local TL = Instance.new("TextLabel", TFr)
            TL.BackgroundTransparency = 1; TL.Position = UDim2.new(0,10,0,0); TL.Size = UDim2.new(0.7,0,1,0)
            TL.Font = Enum.Font.Gotham; TL.Text = text; TL.TextColor3 = T.Text; TL.TextSize = 14
            TL.TextXAlignment = Enum.TextXAlignment.Left

            local SB = Instance.new("Frame", TFr)
            SB.BackgroundColor3 = Toggled and T.Accent or Color3.fromRGB(60,60,60)
            SB.Position = UDim2.new(1,-50,0.5,-10); SB.Size = UDim2.new(0,40,0,20)
            Instance.new("UICorner", SB).CornerRadius = UDim.new(1,0)

            local Dot = Instance.new("Frame", SB)
            Dot.BackgroundColor3 = Color3.fromRGB(255,255,255)
            Dot.Position = Toggled and UDim2.new(1,-18,0.5,-8) or UDim2.new(0,2,0.5,-8)
            Dot.Size = UDim2.new(0,16,0,16)
            Instance.new("UICorner", Dot).CornerRadius = UDim.new(1,0)

            local Btn = Instance.new("TextButton", TFr)
            Btn.BackgroundTransparency = 1; Btn.Size = UDim2.new(1,0,1,0); Btn.Text = ""; Btn.AutoButtonColor = false

            local function Update(val)
                Toggled = val; Library.Flags[text] = Toggled
                CreateTween(SB,  {BackgroundColor3 = Toggled and Library.CurrentTheme.Accent or Color3.fromRGB(60,60,60)}, 0.2)
                CreateTween(Dot, {Position = Toggled and UDim2.new(1,-18,0.5,-8) or UDim2.new(0,2,0.5,-8)}, 0.2)
                pcall(callback, Toggled)
            end

            Btn.MouseButton1Click:Connect(function() Update(not Toggled) end)
            Library.Elements[text] = {Set = function(self, v) Update(v) end}
            table.insert(Library.SearchIndex, {Name = text, Tab = name, Instance = TFr})
            return TFr, TL
        end

        -- SLIDER
        function Tab:Slider(text, min, max, default, callback)
            local T = Library.CurrentTheme
            local val = default or min
            local sliding = false
            Library.Flags[text] = val

            local SFr = Instance.new("Frame", Page)
            SFr.Name = "ElementFrame"; SFr.BackgroundColor3 = T.Element; SFr.Size = UDim2.new(1,0,0,50)
            Instance.new("UICorner", SFr)

            local SL = Instance.new("TextLabel", SFr)
            SL.BackgroundTransparency = 1; SL.Position = UDim2.new(0,10,0,5); SL.Size = UDim2.new(1,-20,0,20)
            SL.Font = Enum.Font.Gotham; SL.Text = text; SL.TextColor3 = T.Text; SL.TextSize = 14
            SL.TextXAlignment = Enum.TextXAlignment.Left

            local VL = Instance.new("TextLabel", SFr)
            VL.Name = "ValLbl"; VL.BackgroundTransparency = 1
            VL.Position = UDim2.new(1,-60,0,5); VL.Size = UDim2.new(0,50,0,20)
            VL.Font = Enum.Font.Gotham; VL.Text = tostring(val)
            VL.TextColor3 = Color3.fromRGB(200,200,200); VL.TextSize = 14; VL.TextXAlignment = Enum.TextXAlignment.Right

            local Bar = Instance.new("Frame", SFr)
            Bar.BackgroundColor3 = Color3.fromRGB(60,60,60)
            Bar.Position = UDim2.new(0,10,0,35); Bar.Size = UDim2.new(1,-20,0,6)
            Instance.new("UICorner", Bar)

            local Fill = Instance.new("Frame", Bar)
            Fill.BackgroundColor3 = T.Accent
            Fill.Size = UDim2.new((val-min)/(max-min),0,1,0)
            Instance.new("UICorner", Fill)

            local Btn = Instance.new("TextButton", Bar)
            Btn.BackgroundTransparency = 1; Btn.Size = UDim2.new(1,0,1,0); Btn.Text = ""; Btn.AutoButtonColor = false

            local function SetVal(v)
                val = math.clamp(v, min, max); Library.Flags[text] = val; VL.Text = tostring(val)
                CreateTween(Fill, {Size = UDim2.new((val-min)/(max-min),0,1,0)}, 0.1)
                pcall(callback, val)
            end
            local function Update(i)
                local s = math.clamp((i.Position.X - Bar.AbsolutePosition.X)/Bar.AbsoluteSize.X,0,1)
                SetVal(math.floor(min+(max-min)*s))
            end

            Btn.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then sliding=true; Update(i) end end)
            Btn.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then sliding=false end end)
            UserInputService.InputChanged:Connect(function(i) if sliding and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then Update(i) end end)

            Library.Elements[text] = {Set = function(self, v) SetVal(v) end}
            table.insert(Library.SearchIndex, {Name = text, Tab = name, Instance = SFr})
        end

        -- DROPDOWN
        function Tab:Dropdown(text, list, callback)
            local T       = Library.CurrentTheme
            local dropped = false
            local ITEM_H  = 30   -- height of each option row
            local LIST_H  = 150  -- max visible height of the open list
            Library.Flags[text] = ""

            -- Outer wrapper — expands downward when open
            local DFr = Instance.new("Frame", Page)
            DFr.Name            = "ElementFrame"
            DFr.BackgroundColor3 = T.Element
            DFr.Size            = UDim2.new(1, 0, 0, 36)
            DFr.ClipsDescendants = true
            Instance.new("UICorner", DFr)

            -- Header label (shows current selection)
            local DL = Instance.new("TextLabel", DFr)
            DL.BackgroundTransparency = 1
            DL.Position = UDim2.new(0, 10, 0, 0)
            DL.Size     = UDim2.new(1, -40, 0, 36)
            DL.Font     = Enum.Font.Gotham
            DL.Text     = text
            DL.TextColor3 = T.Text
            DL.TextSize = 14
            DL.TextXAlignment = Enum.TextXAlignment.Left

            -- Arrow icon
            local Arrow = Instance.new("ImageLabel", DFr)
            Arrow.BackgroundTransparency = 1
            Arrow.Position = UDim2.new(1, -30, 0, 8)
            Arrow.Size     = UDim2.new(0, 20, 0, 20)
            Arrow.Image    = "rbxassetid://6031090990"

            -- Scrollable list (sits below the header, hidden until opened)
            local ListScroll = Instance.new("ScrollingFrame", DFr)
            ListScroll.Name                = "ListScroll"
            ListScroll.BackgroundColor3    = Color3.fromRGB(25, 25, 35)
            ListScroll.Position            = UDim2.new(0, 0, 0, 38)
            ListScroll.Size                = UDim2.new(1, 0, 0, LIST_H)
            ListScroll.CanvasSize          = UDim2.new(0, 0, 0, 0)
            ListScroll.ScrollBarThickness  = 5
            ListScroll.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 160)
            ListScroll.BorderSizePixel     = 0
            ListScroll.Visible             = false
            ListScroll.ZIndex              = 5
            Instance.new("UICorner", ListScroll).CornerRadius = UDim.new(0, 6)

            local ItemLayout = Instance.new("UIListLayout", ListScroll)
            ItemLayout.SortOrder    = Enum.SortOrder.LayoutOrder
            ItemLayout.Padding      = UDim.new(0, 2)

            -- Hit button covers the header row only
            local HitBtn = Instance.new("TextButton", DFr)
            HitBtn.BackgroundTransparency = 1
            HitBtn.Size   = UDim2.new(1, 0, 0, 36)
            HitBtn.Text   = ""
            HitBtn.ZIndex = 3
            HitBtn.AutoButtonColor = false

            local function SelectItem(item)
                DL.Text             = text .. " (" .. item .. ")"
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
                    IBtn.Name            = "Item_" .. idx
                    IBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
                    IBtn.Size            = UDim2.new(1, -6, 0, ITEM_H - 2)
                    IBtn.Font            = Enum.Font.Gotham
                    IBtn.Text            = item
                    IBtn.TextColor3      = Color3.fromRGB(215, 215, 225)
                    IBtn.TextSize        = 13
                    IBtn.AutoButtonColor = false
                    IBtn.BorderSizePixel = 0
                    IBtn.LayoutOrder     = idx
                    IBtn.ZIndex          = 6
                    Instance.new("UICorner", IBtn).CornerRadius = UDim.new(0, 4)

                    IBtn.MouseButton1Click:Connect(function()
                        SelectItem(item)
                    end)
                    IBtn.MouseEnter:Connect(function()
                        IBtn.BackgroundColor3 = Color3.fromRGB(55, 75, 140)
                    end)
                    IBtn.MouseLeave:Connect(function()
                        IBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
                    end)
                end
                -- Set canvas so the scrollbar works correctly
                local totalH = #itemList * ITEM_H + (#itemList * 2)
                ListScroll.CanvasSize = UDim2.new(0, 0, 0, totalH)
            end

            BuildItems(list)

            HitBtn.MouseButton1Click:Connect(function()
                dropped = not dropped
                if dropped then
                    ListScroll.Visible = true
                    ListScroll.CanvasPosition = Vector2.new(0, 0)
                    -- Expand the outer frame to show the list
                    local expandH = 36 + 2 + LIST_H
                    DFr.Size   = UDim2.new(1, 0, 0, expandH)
                    Arrow.Rotation = 180
                else
                    ListScroll.Visible = false
                    DFr.Size   = UDim2.new(1, 0, 0, 36)
                    Arrow.Rotation = 0
                end
                -- Update the page canvas so the rest of the content scrolls correctly
                Page.CanvasSize = UDim2.new(0, 0, 0, PL.AbsoluteContentSize.Y + 20)
            end)

            Library.Elements[text] = {
                Set = function(self, v)
                    SelectItem(v)
                end,
                Refresh = function(self, newList)
                    list = newList
                    BuildItems(newList)
                end
            }
            table.insert(Library.SearchIndex, {Name = text, Tab = name, Instance = DFr})
            return DL
        end

        -- TEXTBOX
        function Tab:Textbox(text, placeholder, callback)
            local T = Library.CurrentTheme

            local TbFr = Instance.new("Frame", Page)
            TbFr.Name = "ElementFrame"; TbFr.BackgroundColor3 = T.Element; TbFr.Size = UDim2.new(1,0,0,54)
            Instance.new("UICorner", TbFr)

            local TbL = Instance.new("TextLabel", TbFr)
            TbL.BackgroundTransparency = 1; TbL.Position = UDim2.new(0,10,0,4); TbL.Size = UDim2.new(1,-20,0,16)
            TbL.Font = Enum.Font.Gotham; TbL.Text = text; TbL.TextColor3 = T.Text; TbL.TextSize = 13
            TbL.TextXAlignment = Enum.TextXAlignment.Left

            local Box = Instance.new("TextBox", TbFr)
            Box.BackgroundColor3 = Color3.fromRGB(30,30,30)
            Box.Position = UDim2.new(0,8,0,22); Box.Size = UDim2.new(1,-16,0,26)
            Box.Font = Enum.Font.Gotham; Box.PlaceholderText = placeholder or ""
            Box.PlaceholderColor3 = Color3.fromRGB(100,100,100)
            Box.Text = ""; Box.TextColor3 = Color3.fromRGB(255,255,255); Box.TextSize = 13
            Box.ClearTextOnFocus = false; Box.BorderSizePixel = 0
            Instance.new("UICorner", Box)
            local BS = Instance.new("UIStroke", Box); BS.Color = Color3.fromRGB(60,60,60)

            Box.Focused:Connect(function() CreateTween(BS, {Color = Library.CurrentTheme.Accent}, 0.15) end)
            Box.FocusLost:Connect(function(enter)
                CreateTween(BS, {Color = Color3.fromRGB(60,60,60)}, 0.15)
                if enter then pcall(callback, Box.Text) end
            end)

            Library.Elements[text] = {Set = function(self, v) Box.Text = v end}
            table.insert(Library.SearchIndex, {Name = text, Tab = name, Instance = TbFr})
        end

        -- KEYBIND
        function Tab:Keybind(text, default, callback)
            local T = Library.CurrentTheme
            local key = default or Enum.KeyCode.Unknown
            local binding = false
            Library.Flags[text] = key

            local KFr = Instance.new("Frame", Page)
            KFr.Name = "ElementFrame"; KFr.BackgroundColor3 = T.Element; KFr.Size = UDim2.new(1,0,0,36)
            Instance.new("UICorner", KFr)

            local KL = Instance.new("TextLabel", KFr)
            KL.BackgroundTransparency = 1; KL.Position = UDim2.new(0,10,0,0); KL.Size = UDim2.new(0.6,0,1,0)
            KL.Font = Enum.Font.Gotham; KL.Text = text; KL.TextColor3 = T.Text; KL.TextSize = 14
            KL.TextXAlignment = Enum.TextXAlignment.Left

            local KBtn = Instance.new("TextButton", KFr)
            KBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
            KBtn.Position = UDim2.new(1,-90,0.5,-13); KBtn.Size = UDim2.new(0,80,0,26)
            KBtn.Font = Enum.Font.GothamBold
            KBtn.Text = key == Enum.KeyCode.Unknown and "None" or key.Name
            KBtn.TextColor3 = Color3.fromRGB(220,220,220); KBtn.TextSize = 12
            KBtn.AutoButtonColor = false; KBtn.BorderSizePixel = 0
            Instance.new("UICorner", KBtn)
            local KBS = Instance.new("UIStroke", KBtn); KBS.Color = Color3.fromRGB(70,70,70)

            KBtn.MouseButton1Click:Connect(function()
                binding = true; KBtn.Text = "Press key..."
                KBtn.TextColor3 = T.Accent; CreateTween(KBS, {Color = T.Accent}, 0.15)
            end)

            UserInputService.InputBegan:Connect(function(input, gpe)
                if binding and not gpe and input.UserInputType == Enum.UserInputType.Keyboard then
                    key = input.KeyCode; binding = false; KBtn.Text = key.Name
                    KBtn.TextColor3 = Color3.fromRGB(220,220,220)
                    CreateTween(KBS, {Color = Color3.fromRGB(70,70,70)}, 0.15)
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

        ConfigTab:Label("Config")

        ConfigTab:Button("Save Config", function()
            SaveConfig()
            Library:Notification({Title = "Config", Content = "Configuration Saved!"})
        end)

        ConfigTab:Button("Load Config", function()
            if LoadConfig() then
                Library:Notification({Title = "Config", Content = "Configuration Loaded!"})
            else
                Library:Notification({Title = "Error", Content = "Config file not found."})
            end
        end)
    end

    return Window
end

return Library
