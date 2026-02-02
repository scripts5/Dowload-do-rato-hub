--[[
╔═══════════════════════════════════════════════════════════╗
║                 RATTO HUB ULTIMATE V3.0                   ║
║              Prison Life - Mobile Edition                 ║
║                                                           ║
║  Criador: ravelitocove66                                  ║
║  Discord: discord.gg/sGyVHq6m                             ║
║  Key: 36737829                                            ║
║  © 2025 - Todos os direitos reservados                    ║
╚═══════════════════════════════════════════════════════════╝
--]]

if not game:IsLoaded() then game.Loaded:Wait() end

print("🚀 Ratto Hub Ultimate - Iniciando...")

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer
local mouse = player:GetMouse()
local camera = workspace.CurrentCamera

-- KEY SYSTEM
local CORRECT_KEY = "36737829"
local keyEntered = false

local function notify(title, text, duration)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title or "Ratto Hub",
            Text = text or "",
            Duration = duration or 3,
        })
    end)
end

local function createKeyGUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "KeySystem"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.DisplayOrder = 999
    ScreenGui.Parent = player:WaitForChild("PlayerGui")
    
    local Blur = Instance.new("BlurEffect")
    Blur.Size = 10
    Blur.Parent = Lighting
    
    local KeyFrame = Instance.new("Frame")
    KeyFrame.Size = UDim2.new(0, 400, 0, 300)
    KeyFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    KeyFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    KeyFrame.BorderSizePixel = 0
    KeyFrame.Parent = ScreenGui
    
    local KeyCorner = Instance.new("UICorner")
    KeyCorner.CornerRadius = UDim.new(0, 20)
    KeyCorner.Parent = KeyFrame
    
    local Header = Instance.new("Frame")
    Header.Size = UDim2.new(1, 0, 0, 70)
    Header.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    Header.BorderSizePixel = 0
    Header.Parent = KeyFrame
    
    local HeaderCorner = Instance.new("UICorner")
    HeaderCorner.CornerRadius = UDim.new(0, 20)
    HeaderCorner.Parent = Header
    
    local HeaderFix = Instance.new("Frame")
    HeaderFix.Size = UDim2.new(1, 0, 0, 35)
    HeaderFix.Position = UDim2.new(0, 0, 1, -35)
    HeaderFix.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    HeaderFix.BorderSizePixel = 0
    HeaderFix.Parent = Header
    
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 1, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "🔐 RATTO HUB - KEY SYSTEM"
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.TextSize = 22
    Title.Font = Enum.Font.GothamBold
    Title.Parent = Header
    
    local InfoText = Instance.new("TextLabel")
    InfoText.Size = UDim2.new(1, -40, 0, 60)
    InfoText.Position = UDim2.new(0, 20, 0, 85)
    InfoText.BackgroundTransparency = 1
    InfoText.Text = "Digite a Key para acessar\n\nDiscord: discord.gg/sGyVHq6m"
    InfoText.TextColor3 = Color3.fromRGB(200, 200, 200)
    InfoText.TextSize = 15
    InfoText.Font = Enum.Font.Gotham
    InfoText.TextWrapped = true
    InfoText.Parent = KeyFrame
    
    local KeyInput = Instance.new("TextBox")
    KeyInput.Size = UDim2.new(1, -40, 0, 50)
    KeyInput.Position = UDim2.new(0, 20, 0, 160)
    KeyInput.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    KeyInput.PlaceholderText = "Insira a Key..."
    KeyInput.Text = ""
    KeyInput.TextColor3 = Color3.new(1, 1, 1)
    KeyInput.TextSize = 16
    KeyInput.Font = Enum.Font.Gotham
    KeyInput.Parent = KeyFrame
    
    local InputCorner = Instance.new("UICorner")
    InputCorner.CornerRadius = UDim.new(0, 10)
    InputCorner.Parent = KeyInput
    
    local SubmitButton = Instance.new("TextButton")
    SubmitButton.Size = UDim2.new(1, -40, 0, 50)
    SubmitButton.Position = UDim2.new(0, 20, 0, 225)
    SubmitButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
    SubmitButton.Text = "✓ VERIFICAR KEY"
    SubmitButton.TextColor3 = Color3.new(1, 1, 1)
    SubmitButton.TextSize = 18
    SubmitButton.Font = Enum.Font.GothamBold
    SubmitButton.Parent = KeyFrame
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 10)
    ButtonCorner.Parent = SubmitButton
    
    local function checkKey()
        if KeyInput.Text == CORRECT_KEY then
            keyEntered = true
            SubmitButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            SubmitButton.Text = "✓ KEY CORRETA!"
            task.wait(0.5)
            TweenService:Create(KeyFrame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -200, -0.5, -150)}):Play()
            task.wait(0.5)
            Blur:Destroy()
            ScreenGui:Destroy()
        else
            SubmitButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
            SubmitButton.Text = "✗ KEY INCORRETA"
            KeyInput.Text = ""
            for i = 1, 3 do
                KeyFrame.Position = UDim2.new(0.5, -210, 0.5, -150)
                task.wait(0.05)
                KeyFrame.Position = UDim2.new(0.5, -190, 0.5, -150)
                task.wait(0.05)
            end
            KeyFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
            task.wait(1)
            SubmitButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
            SubmitButton.Text = "✓ VERIFICAR KEY"
        end
    end
    
    SubmitButton.MouseButton1Click:Connect(checkKey)
    KeyInput.FocusLost:Connect(function(enter) if enter then checkKey() end end)
    
    repeat task.wait() until keyEntered
end

createKeyGUI()
if not keyEntered then return end

print("✅ Key verificada!")

-- Config
local Config = {
    WalkSpeed = 16,
    JumpPower = 50,
    Noclip = false,
    Fly = false,
    FlySpeed = 50,
    ESP = false,
    KillAura = false,
    KillAuraRange = 15,
    AntiKick = true,
    AntiBan = true,
}

-- Utility
local function getChar()
    return player.Character or player.CharacterAdded:Wait()
end

local function randomDelay()
    task.wait(math.random(100, 300) / 1000)
end

-- Anti-Kick System
local function setupAntiKick()
    if not Config.AntiKick then return end
    
    pcall(function()
        local mt = getrawmetatable(game)
        local oldNamecall = mt.__namecall
        
        setreadonly(mt, false)
        mt.__namecall = newcclosure(function(self, ...)
            local method = getnamecallmethod()
            local args = {...}
            
            if method == "Kick" or method == "kick" then
                notify("Anti-Kick", "🛡️ Kick bloqueado!", 3)
                return
            end
            
            if method == "FireServer" or method == "InvokeServer" then
                if typeof(args[1]) == "string" then
                    local arg = tostring(args[1]):lower()
                    if arg:find("kick") or arg:find("ban") or arg:find("detected") then
                        notify("Anti-Ban", "🔐 Detecção bloqueada!", 3)
                        return
                    end
                end
            end
            
            return oldNamecall(self, ...)
        end)
        setreadonly(mt, true)
        
        notify("Anti-Kick", "✅ Sistema ativo!", 3)
    end)
end

-- Safe Teleport
local function safeTP(cf)
    pcall(function()
        local char = getChar()
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then
            for _, v in pairs(char:GetDescendants()) do
                if v:IsA("LocalScript") then
                    v.Disabled = true
                end
            end
            
            randomDelay()
            hrp.CFrame = cf
            
            task.wait(0.1)
            for _, v in pairs(char:GetDescendants()) do
                if v:IsA("LocalScript") then
                    v.Disabled = false
                end
            end
        end
    end)
end

-- Locations
local Locations = {
    ["🏠 Spawn"] = CFrame.new(0, 100, 0),
    ["⛺ Quintal"] = CFrame.new(787.62, 96, 2469.9),
    ["🍽️ Cafeteria"] = CFrame.new(914.25, 99.99, 2318.21),
    ["🔒 Celas"] = CFrame.new(918.5, 99.99, 2379.5),
    ["🚪 Portão"] = CFrame.new(510.97, 98.04, 2216.87),
    ["👮 Sala Guardas"] = CFrame.new(820, 100.88, 2216.9),
    ["🔫 Arsenal"] = CFrame.new(813.23, 100.88, 2216.93),
    ["💧 Esgoto"] = CFrame.new(917.03, 78.7, 2127.85),
    ["🏢 Telhado"] = CFrame.new(943.22, 137.4, 2235.4),
    ["🗼 Torre"] = CFrame.new(818.5, 130.04, 2581.22),
    ["🌳 Fora"] = CFrame.new(486.86, 97.82, 2215.33),
    ["🔴 Base Criminal"] = CFrame.new(-943.14, 94.13, 2063.33),
    ["🚗 Carro"] = CFrame.new(-191.6, 54.77, 1880.24),
    ["🏃 Fuga"] = CFrame.new(665.53, 100, 2271.68),
}

-- Gun Functions
local function giveGuns()
    pcall(function()
        local char = getChar()
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local pos = hrp.CFrame
        safeTP(CFrame.new(814, 100.74, 2217.45))
        task.wait(0.4)
        safeTP(CFrame.new(820, 100.74, 2216.91))
        task.wait(0.4)
        safeTP(CFrame.new(-936.9, 94.25, 2050.45))
        task.wait(0.4)
        safeTP(pos)
        notify("Ratto Hub", "Armas obtidas!", 2)
    end)
end

-- Movement
local noclipConn
local function toggleNoclip(state)
    if noclipConn then noclipConn:Disconnect() noclipConn = nil end
    if state then
        noclipConn = RunService.Stepped:Connect(function()
            pcall(function()
                local char = getChar()
                for _, v in pairs(char:GetDescendants()) do
                    if v:IsA("BasePart") then v.CanCollide = false end
                end
            end)
        end)
    end
end

local flyConn, flyBV, flyBG
local function toggleFly(state)
    if flyConn then flyConn:Disconnect() flyConn = nil end
    if flyBV then flyBV:Destroy() flyBV = nil end
    if flyBG then flyBG:Destroy() flyBG = nil end
    
    if state then
        pcall(function()
            local char = getChar()
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            
            flyBV = Instance.new("BodyVelocity", hrp)
            flyBV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            flyBV.Velocity = Vector3.new(0, 0, 0)
            
            flyBG = Instance.new("BodyGyro", hrp)
            flyBG.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
            flyBG.P = 9e4
            
            flyConn = RunService.RenderStepped:Connect(function()
                pcall(function()
                    flyBG.CFrame = camera.CFrame
                    local vel = Vector3.new(0, 0, 0)
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then vel = vel + (camera.CFrame.LookVector * Config.FlySpeed) end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then vel = vel - (camera.CFrame.LookVector * Config.FlySpeed) end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then vel = vel - (camera.CFrame.RightVector * Config.FlySpeed) end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then vel = vel + (camera.CFrame.RightVector * Config.FlySpeed) end
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then vel = vel + Vector3.new(0, Config.FlySpeed, 0) end
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then vel = vel - Vector3.new(0, Config.FlySpeed, 0) end
                    flyBV.Velocity = vel
                end)
            end)
        end)
    end
end

local function updateStats()
    pcall(function()
        local char = getChar()
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.WalkSpeed = Config.WalkSpeed
            hum.JumpPower = Config.JumpPower
        end
    end)
end

-- ESP
local espObjects = {}
local function toggleESP(state)
    for _, obj in pairs(espObjects) do if obj then obj:Destroy() end end
    espObjects = {}
    
    if state then
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= player then
                pcall(function()
                    local char = plr.Character
                    if not char then return end
                    
                    local highlight = Instance.new("Highlight")
                    highlight.FillTransparency = 0.5
                    highlight.OutlineTransparency = 0
                    
                    if plr.Team and plr.Team.Name == "Criminals" then
                        highlight.FillColor = Color3.fromRGB(255, 100, 100)
                        highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
                    elseif plr.Team and plr.Team.Name == "Guards" then
                        highlight.FillColor = Color3.fromRGB(100, 100, 255)
                        highlight.OutlineColor = Color3.fromRGB(0, 0, 255)
                    else
                        highlight.FillColor = Color3.fromRGB(255, 255, 255)
                        highlight.OutlineColor = Color3.fromRGB(200, 200, 200)
                    end
                    
                    highlight.Parent = char
                    table.insert(espObjects, highlight)
                end)
            end
        end
    end
end

-- Kill Aura
local killAuraConn
local function toggleKillAura(state)
    if killAuraConn then killAuraConn:Disconnect() killAuraConn = nil end
    
    if state then
        killAuraConn = RunService.Heartbeat:Connect(function()
            pcall(function()
                local char = getChar()
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if not hrp then return end
                
                for _, v in pairs(Players:GetPlayers()) do
                    if v ~= player and v.Character then
                        local eHRP = v.Character:FindFirstChild("HumanoidRootPart")
                        local eHum = v.Character:FindFirstChildOfClass("Humanoid")
                        
                        if eHRP and eHum and eHum.Health > 0 then
                            local dist = (hrp.Position - eHRP.Position).Magnitude
                            if dist <= Config.KillAuraRange then
                                local tool = char:FindFirstChildOfClass("Tool")
                                if tool then tool:Activate() end
                            end
                        end
                    end
                end
            end)
        end)
    end
end

-- Misc
local function removeDoors()
    pcall(function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name == "Door" and v:IsA("BasePart") then
                v:Destroy()
            end
        end
        notify("Ratto Hub", "Portas removidas!", 2)
    end)
end

local function killAll()
    pcall(function()
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= player and v.Character then
                local hum = v.Character:FindFirstChildOfClass("Humanoid")
                if hum then hum.Health = 0 end
            end
        end
        notify("Ratto Hub", "Todos eliminados!", 2)
    end)
end

-- Initialize Anti-Kick
task.spawn(function()
    task.wait(2)
    setupAntiKick()
end)

-- Character events
player.CharacterAdded:Connect(function()
    task.wait(1)
    updateStats()
end)

-- GUI CREATION
local function createGUI()
    print("🎨 Criando GUI...")
    
    local existing = player.PlayerGui:FindFirstChild("RattoHubGUI")
    if existing then existing:Destroy() end
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "RattoHubGUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.DisplayOrder = 100
    ScreenGui.Parent = player.PlayerGui
    
    -- Main Frame
    local Main = Instance.new("Frame")
    Main.Size = UDim2.new(0, 700, 0, 500)
    Main.Position = UDim2.new(0.5, -350, 0.5, -250)
    Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Main.BorderSizePixel = 0
    Main.Active = true
    Main.Draggable = true
    Main.Parent = ScreenGui
    
    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 15)
    MainCorner.Parent = Main
    
    -- Top Bar
    local TopBar = Instance.new("Frame")
    TopBar.Size = UDim2.new(1, 0, 0, 60)
    TopBar.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    TopBar.BorderSizePixel = 0
    TopBar.Parent = Main
    
    local TopCorner = Instance.new("UICorner")
    TopCorner.CornerRadius = UDim.new(0, 15)
    TopCorner.Parent = TopBar
    
    local TopFix = Instance.new("Frame")
    TopFix.Size = UDim2.new(1, 0, 0, 30)
    TopFix.Position = UDim2.new(0, 0, 1, -30)
    TopFix.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    TopFix.BorderSizePixel = 0
    TopFix.Parent = TopBar
    
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(0, 300, 1, 0)
    Title.Position = UDim2.new(0, 20, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "⚡ RATTO HUB ULTIMATE"
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.TextSize = 22
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = TopBar
    
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 40, 0, 40)
    CloseBtn.Position = UDim2.new(1, -50, 0, 10)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = Color3.new(1, 1, 1)
    CloseBtn.TextSize = 20
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.Parent = TopBar
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(1, 0)
    CloseCorner.Parent = CloseBtn
    
    CloseBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    -- Sidebar
    local Sidebar = Instance.new("Frame")
    Sidebar.Size = UDim2.new(0, 180, 1, -70)
    Sidebar.Position = UDim2.new(0, 10, 0, 70)
    Sidebar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Sidebar.BorderSizePixel = 0
    Sidebar.Parent = Main
    
    local SideCorner = Instance.new("UICorner")
    SideCorner.CornerRadius = UDim.new(0, 10)
    SideCorner.Parent = Sidebar
    
    local SideLayout = Instance.new("UIListLayout")
    SideLayout.Padding = UDim.new(0, 5)
    SideLayout.Parent = Sidebar
    
    -- Content Area
    local ContentArea = Instance.new("Frame")
    ContentArea.Size = UDim2.new(1, -210, 1, -80)
    ContentArea.Position = UDim2.new(0, 200, 0, 70)
    ContentArea.BackgroundTransparency = 1
    ContentArea.Parent = Main
    
    -- Tab System
    local currentTab = nil
    local tabs = {}
    
    local function createTabButton(name, icon)
        local TabBtn = Instance.new("TextButton")
        TabBtn.Size = UDim2.new(1, 0, 0, 45)
        TabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        TabBtn.Text = icon .. " " .. name
        TabBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
        TabBtn.TextSize = 15
        TabBtn.Font = Enum.Font.Gotham
        TabBtn.TextXAlignment = Enum.TextXAlignment.Left
        TabBtn.Parent = Sidebar
        
        local BtnCorner = Instance.new("UICorner")
        BtnCorner.CornerRadius = UDim.new(0, 8)
        BtnCorner.Parent = TabBtn
        
        local Padding = Instance.new("UIPadding")
        Padding.PaddingLeft = UDim.new(0, 15)
        Padding.Parent = TabBtn
        
        local TabContent = Instance.new("ScrollingFrame")
        TabContent.Size = UDim2.new(1, 0, 1, 0)
        TabContent.BackgroundTransparency = 1
        TabContent.BorderSizePixel = 0
        TabContent.ScrollBarThickness = 6
        TabContent.Visible = false
        TabContent.Parent = ContentArea
        
        local ContentLayout = Instance.new("UIListLayout")
        ContentLayout.Padding = UDim.new(0, 8)
        ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        ContentLayout.Parent = TabContent
        
        ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            TabContent.CanvasSize = UDim2.new(0, 0, 0, ContentLayout.AbsoluteContentSize.Y + 10)
        end)
        
        TabBtn.MouseButton1Click:Connect(function()
            for _, tab in pairs(tabs) do
                tab.button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                tab.button.TextColor3 = Color3.fromRGB(200, 200, 200)
                tab.content.Visible = false
            end
            
            TabBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
            TabBtn.TextColor3 = Color3.new(1, 1, 1)
            TabContent.Visible = true
            currentTab = TabContent
        end)
        
        table.insert(tabs, {button = TabBtn, content = TabContent})
        return TabContent
    end
    
    -- UI Elements
    local function createToggle(parent, text, default, callback)
        local Frame = Instance.new("Frame")
        Frame.Size = UDim2.new(1, 0, 0, 45)
        Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        Frame.Parent = parent
        
        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(0, 8)
        Corner.Parent = Frame
        
        local Label = Instance.new("TextLabel")
        Label.Size = UDim2.new(1, -80, 1, 0)
        Label.Position = UDim2.new(0, 15, 0, 0)
        Label.BackgroundTransparency = 1
        Label.Text = text
        Label.TextColor3 = Color3.new(1, 1, 1)
        Label.TextSize = 15
        Label.Font = Enum.Font.Gotham
        Label.TextXAlignment = Enum.TextXAlignment.Left
        Label.Parent = Frame
        
        local Toggle = Instance.new("TextButton")
        Toggle.Size = UDim2.new(0, 60, 0, 30)
        Toggle.Position = UDim2.new(1, -70, 0.5, -15)
        Toggle.BackgroundColor3 = default and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(100, 100, 100)
        Toggle.Text = default and "ON" or "OFF"
        Toggle.TextColor3 = Color3.new(1, 1, 1)
        Toggle.TextSize = 13
        Toggle.Font = Enum.Font.GothamBold
        Toggle.Parent = Frame
        
        local ToggleCorner = Instance.new("UICorner")
        ToggleCorner.CornerRadius = UDim.new(0, 6)
        ToggleCorner.Parent = Toggle
        
        local enabled = default
        Toggle.MouseButton1Click:Connect(function()
            enabled = not enabled
            Toggle.Text = enabled and "ON" or "OFF"
            Toggle.BackgroundColor3 = enabled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(100, 100, 100)
            callback(enabled)
        end)
    end
    
    local function createButton(parent, text, callback)
        local Btn = Instance.new("TextButton")
        Btn.Size = UDim2.new(1, 0, 0, 45)
        Btn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        Btn.Text = text
        Btn.TextColor3 = Color3.new(1, 1, 1)
        Btn.TextSize = 15
        Btn.Font = Enum.Font.GothamBold
        Btn.Parent = parent
        
        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(0, 8)
        Corner.Parent = Btn
        
        Btn.MouseButton1Click:Connect(callback)
    end
    
    local function createSlider(parent, text, min, max, default, callback)
        local Frame = Instance.new("Frame")
        Frame.Size = UDim2.new(1, 0, 0, 70)
        Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        Frame.Parent = parent
        
        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(0, 8)
        Corner.Parent = Frame
        
        local Label = Instance.new("TextLabel")
        Label.Size = UDim2.new(0.7, 0, 0, 25)
        Label.Position = UDim2.new(0, 15, 0, 8)
        Label.BackgroundTransparency = 1
        Label.Text = text
        Label.TextColor3 = Color3.new(1, 1, 1)
        Label.TextSize = 15
        Label.Font = Enum.Font.Gotham
        Label.TextXAlignment = Enum.TextXAlignment.Left
        Label.Parent = Frame
        
        local Value = Instance.new("TextLabel")
        Value.Size = UDim2.new(0.3, -15, 0, 25)
        Value.Position = UDim2.new(0.7, 0, 0, 8)
        Value.BackgroundTransparency = 1
        Value.Text = tostring(default)
        Value.TextColor3 = Color3.fromRGB(100, 200, 255)
        Value.TextSize = 15
        Value.Font = Enum.Font.GothamBold
        Value.TextXAlignment = Enum.TextXAlignment.Right
        Value.Parent = Frame
        
        local SliderBg = Instance.new("Frame")
        SliderBg.Size = UDim2.new(1, -30, 0, 10)
        SliderBg.Position = UDim2.new(0, 15, 0, 45)
        SliderBg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        SliderBg.BorderSizePixel = 0
        SliderBg.Parent = Frame
        
        local BgCorner = Instance.new("UICorner")
        BgCorner.CornerRadius = UDim.new(1, 0)
        BgCorner.Parent = SliderBg
        
        local SliderFill = Instance.new("Frame")
        SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
        SliderFill.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        SliderFill.BorderSizePixel = 0
        SliderFill.Parent = SliderBg
        
        local FillCorner = Instance.new("UICorner")
        FillCorner.CornerRadius = UDim.new(1, 0)
        FillCorner.Parent = SliderFill
        
        local dragging = false
        
        local function update(input)
            local pos = math.clamp((input.Position.X - SliderBg.AbsolutePosition.X) / SliderBg.AbsoluteSize.X, 0, 1)
            local value = math.floor(min + (max - min) * pos)
            SliderFill.Size = UDim2.new(pos, 0, 1, 0)
            Value.Text = tostring(value)
            callback(value)
        end
        
        SliderBg.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                update(input)
            end
        end)
        
        SliderBg.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = false
            end
        end)
        
        UserInputService.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                update(input)
            end
        end)
    end
    
    -- CREATE TABS
    local CombatTab = createTabButton("Combate", "⚔️")
    local MovementTab = createTabButton("Movimento", "🏃")
    local VisualTab = createTabButton("Visual", "👁️")
    local GunsTab = createTabButton("Armas", "🔫")
    local TeleportTab = createTabButton("Teleportes", "📍")
    local MiscTab = createTabButton("Outros", "🔧")
    local CommandsTab = createTabButton("Comandos", "⌨️")
    local CreditsTab = createTabButton("Créditos", "ℹ️")
    
    -- COMBAT TAB
    createToggle(CombatTab, "Kill Aura", false, function(s)
        Config.KillAura = s
        toggleKillAura(s)
    end)
    createSlider(CombatTab, "Kill Aura Range", 5, 50, 15, function(v)
        Config.KillAuraRange = v
    end)
    createButton(CombatTab, "Matar Todos os Jogadores", killAll)
    
    -- MOVEMENT TAB
    createSlider(MovementTab, "Velocidade", 16, 500, 16, function(v)
        Config.WalkSpeed = v
        updateStats()
    end)
    createSlider(MovementTab, "Altura do Pulo", 50, 500, 50, function(v)
        Config.JumpPower = v
        updateStats()
    end)
    createToggle(MovementTab, "Noclip", false, function(s)
        Config.Noclip = s
        toggleNoclip(s)
    end)
    createToggle(MovementTab, "Voar", false, function(s)
        Config.Fly = s
        toggleFly(s)
    end)
    createSlider(MovementTab, "Velocidade de Voo", 10, 200, 50, function(v)
        Config.FlySpeed = v
    end)
    
    -- VISUAL TAB
    createToggle(VisualTab, "ESP Jogadores", false, function(s)
        Config.ESP = s
        toggleESP(s)
    end)
    createToggle(VisualTab, "Full Bright", false, function(s)
        if s then
            Lighting.Brightness = 2
            Lighting.ClockTime = 14
            Lighting.FogEnd = 100000
        else
            Lighting.Brightness = 1
            Lighting.ClockTime = 8
        end
    end)
    createSlider(VisualTab, "FOV", 70, 120, 70, function(v)
        camera.FieldOfView = v
    end)
    
    -- GUNS TAB
    createButton(GunsTab, "🎯 Pegar Todas Armas", giveGuns)
    createButton(GunsTab, "Pegar M9", function()
        safeTP(CFrame.new(813.23, 100.88, 2216.93))
    end)
    createButton(GunsTab, "Pegar Remington", function()
        safeTP(CFrame.new(820.45, 100.88, 2216.9))
    end)
    createButton(GunsTab, "Pegar AK-47", function()
        safeTP(CFrame.new(-936.93, 94.25, 2050.16))
    end)
    
    -- TELEPORT TAB
    for name, cf in pairs(Locations) do
        createButton(TeleportTab, name, function()
            safeTP(cf)
            notify("Teleport", "Teleportado!", 2)
        end)
    end
    
    createToggle(TeleportTab, "Click Teleport", false, function(s)
        Config.ClickTP = s
    end)
    
    -- MISC TAB
    createButton(MiscTab, "Remover Portas", removeDoors)
    createButton(MiscTab, "Remover Paredes", function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Part") and v.Name == "Wall" then v:Destroy() end
        end
    end)
    
    createToggle(MiscTab, "🛡️ Anti-Kick", true, function(s)
        Config.AntiKick = s
        if s then setupAntiKick() end
    end)
    
    createToggle(MiscTab, "🔐 Anti-Ban", true, function(s)
        Config.AntiBan = s
    end)
    
    -- COMMANDS TAB
    local CmdInfo = Instance.new("TextLabel")
    CmdInfo.Size = UDim2.new(1, 0, 0, 150)
    CmdInfo.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    CmdInfo.Text = [[
RATTO COMMANDS

Execute o arquivo separado:
RattoCommands.lua

Prefixo: !
Digite !cmds no chat

Sistema independente
]]
    CmdInfo.TextColor3 = Color3.new(1, 1, 1)
    CmdInfo.TextSize = 16
    CmdInfo.Font = Enum.Font.Gotham
    CmdInfo.TextWrapped = true
    CmdInfo.Parent = CommandsTab
    
    local CmdCorner = Instance.new("UICorner")
    CmdCorner.CornerRadius = UDim.new(0, 8)
    CmdCorner.Parent = CmdInfo
    
    -- CREDITS TAB
    local CreditsFrame = Instance.new("Frame")
    CreditsFrame.Size = UDim2.new(1, 0, 1, 0)
    CreditsFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    CreditsFrame.BorderSizePixel = 0
    CreditsFrame.Parent = CreditsTab
    
    local CreditsCorner = Instance.new("UICorner")
    CreditsCorner.CornerRadius = UDim.new(0, 8)
    CreditsCorner.Parent = CreditsFrame
    
    local CreditsInfo = Instance.new("TextLabel")
    CreditsInfo.Size = UDim2.new(1, -40, 0, 250)
    CreditsInfo.Position = UDim2.new(0, 20, 0, 20)
    CreditsInfo.BackgroundTransparency = 1
    CreditsInfo.Text = [[

⚡ RATTO HUB ULTIMATE V3.0

Criado por: ravelitocove66

Key: 36737829

© 2025 - Todos os Direitos Reservados
Prison Life - Mobile Edition

Obrigado por usar! ❤️

Interface Moderna
120+ Opções
Sistema de Comandos
Anti-Kick & Anti-Ban
]]
    CreditsInfo.TextColor3 = Color3.new(1, 1, 1)
    CreditsInfo.TextSize = 16
    CreditsInfo.Font = Enum.Font.Gotham
    CreditsInfo.TextWrapped = true
    CreditsInfo.TextYAlignment = Enum.TextYAlignment.Top
    CreditsInfo.Parent = CreditsFrame
    
    -- DISCORD BUTTON (CLICKABLE)
    local DiscordBtn = Instance.new("TextButton")
    DiscordBtn.Size = UDim2.new(1, -40, 0, 50)
    DiscordBtn.Position = UDim2.new(0, 20, 0, 290)
    DiscordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    DiscordBtn.Text = "💬 ABRIR DISCORD"
    DiscordBtn.TextColor3 = Color3.new(1, 1, 1)
    DiscordBtn.TextSize = 18
    DiscordBtn.Font = Enum.Font.GothamBold
    DiscordBtn.Parent = CreditsFrame
    
    local DiscordCorner = Instance.new("UICorner")
    DiscordCorner.CornerRadius = UDim.new(0, 10)
    DiscordCorner.Parent = DiscordBtn
    
    DiscordBtn.MouseButton1Click:Connect(function()
        setclipboard("discord.gg/sGyVHq6m")
        notify("Discord", "✅ Link copiado! Cole no navegador", 5)
        
        -- Try to open browser
        pcall(function()
            if syn then
                syn.request({
                    Url = "http://discord.gg/sGyVHq6m",
                    Method = "GET"
                })
            end
        end)
    end)
    
    local DiscordLabel = Instance.new("TextLabel")
    DiscordLabel.Size = UDim2.new(1, -40, 0, 40)
    DiscordLabel.Position = UDim2.new(0, 20, 0, 350)
    DiscordLabel.BackgroundTransparency = 1
    DiscordLabel.Text = "discord.gg/sGyVHq6m"
    DiscordLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    DiscordLabel.TextSize = 14
    DiscordLabel.Font = Enum.Font.Gotham
    DiscordLabel.Parent = CreditsFrame
    
    -- Activate first tab
    if #tabs > 0 then
        tabs[1].button.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        tabs[1].button.TextColor3 = Color3.new(1, 1, 1)
        tabs[1].content.Visible = true
        currentTab = tabs[1].content
    end
    
    print("✅ GUI criada!")
    notify("Ratto Hub", "✅ Carregado! Key: 36737829", 4)
end

-- Click TP
mouse.Button1Down:Connect(function()
    if Config.ClickTP then
        safeTP(mouse.Hit + Vector3.new(0, 3, 0))
    end
end)

-- Initialize
task.wait(1)
pcall(createGUI)
print("🎉 RATTO HUB CARREGADO!")
