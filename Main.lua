local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")
local Terrain = workspace:FindFirstChildOfClass("Terrain") or workspace:FindFirstChild("Terrain")
local TweenService = game:GetService("TweenService")

local plr = Players:GetPlayers()[1]
if not plr then return end

local gui = Instance.new("ScreenGui", plr:WaitForChild("PlayerGui"))
gui.Name = "C00lkidUI"
gui.ResetOnSpawn = false

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 420, 0, 630)
main.Position = UDim2.new(0.5, -210, 0.5, -315)
main.BackgroundColor3 = Color3.new(0, 0, 0)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true

local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(255, 0, 0)
stroke.Thickness = 2

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "Vxmpingz's UI"
title.Font = Enum.Font.Cartoon
title.TextSize = 32
title.TextColor3 = Color3.fromRGB(255, 0, 0)

local function makePage(name)
    local f = Instance.new("Frame", main)
    f.Name = name
    f.BackgroundTransparency = 1
    f.Size = UDim2.new(1, 0, 1, -50)
    f.Position = UDim2.new(0, 0, 0, 50)
    local layout = Instance.new("UIListLayout", f)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 6)
    return f
end

local page1 = makePage("Page1")
local page2 = makePage("Page2")
page2.Visible = false

local function createBtn(parent, name, text)
    local btn = Instance.new("TextButton", parent)
    btn.Name = name
    btn.Text = text
    btn.Size = UDim2.new(1, -20, 0, 45)
    btn.Position = UDim2.new(0, 10, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    btn.Font = Enum.Font.Cartoon
    btn.TextSize = 20
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.AutoButtonColor = true
    Instance.new("UIStroke", btn).Color = Color3.fromRGB(0, 0, 0)
    return btn
end

local skyboxBtn = createBtn(page1, "Skybox", "1. Skybox")
local unanchorBtn = createBtn(page1, "Unanchor", "2. Unanchor")
local banToolBtn = createBtn(page1, "BanTools", "3. Ban Tools")
local crashBtn = createBtn(page1, "Crash", "4. Crash")
local rainbowBtn = createBtn(page1, "Rainbow", "5. Rainbow Map")
local floodBtn = createBtn(page1, "Flood", "6. Flood Map")
local musicBtn = createBtn(page1, "Music", "7. Music")
local hintBtn = createBtn(page1, "Hint", "8. Hint")
local banOthersBtn = createBtn(page1, "BanOthers", "9. Ban Others")
local blurBtn = createBtn(page1, "InstaBlur", "10. Insta Res + Blur")
local loopExplodeBtn = createBtn(page1, "LoopExplode", "11. Loop Explode")
local nextBtn = createBtn(page1, "NextPage", "→ Next")

nextBtn.MouseButton1Click:Connect(function()
    page1.Visible = false
    page2.Visible = true
end)

local backBtn = createBtn(page2, "BackPage", "← Back")
backBtn.MouseButton1Click:Connect(function()
    page2.Visible = false
    page1.Visible = true
end)

local closeBtn = Instance.new("TextButton", main)
closeBtn.Size = UDim2.new(0, 40, 0, 40)
closeBtn.Position = UDim2.new(1, -45, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.Font = Enum.Font.Cartoon
closeBtn.TextSize = 20
closeBtn.ZIndex = 2
Instance.new("UIStroke", closeBtn).Color = Color3.fromRGB(0, 0, 0)

local reopenBtn = Instance.new("TextButton", gui)
reopenBtn.Size = UDim2.new(0, 40, 0, 40)
reopenBtn.Position = UDim2.new(0.5, -20, 0.5, -20)
reopenBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
reopenBtn.Text = "↻"
reopenBtn.TextColor3 = Color3.new(1, 1, 1)
reopenBtn.Font = Enum.Font.Cartoon
reopenBtn.TextSize = 20
reopenBtn.Visible = false
Instance.new("UICorner", reopenBtn).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", reopenBtn).Color = Color3.fromRGB(0, 0, 0)

local function spinCollapse()
    local spinTween = TweenService:Create(main, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
        Rotation = 360,
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    })
    spinTween:Play()
    spinTween.Completed:Wait()
    main.Visible = false
    reopenBtn.Visible = true
end

local function spinExpand()
    main.Visible = true
    reopenBtn.Visible = false
    main.Rotation = 0
    main.Size = UDim2.new(0, 0, 0, 0)
    main.Position = UDim2.new(0.5, 0, 0.5, 0)
    local openTween = TweenService:Create(main, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 420, 0, 630),
        Position = UDim2.new(0.5, -210, 0.5, -315)
    })
    openTween:Play()
end

closeBtn.MouseButton1Click:Connect(spinCollapse)
reopenBtn.MouseButton1Click:Connect(spinExpand)

skyboxBtn.MouseButton1Click:Connect(function()
    local id = "rbxassetid://9103670825"
    local sky = Instance.new("Sky", Lighting)
    sky.SkyboxBk = id sky.SkyboxDn = id
    sky.SkyboxFt = id sky.SkyboxLf = id
    sky.SkyboxRt = id sky.SkyboxUp = id
end)

unanchorBtn.MouseButton1Click:Connect(function()
    for _, p in ipairs(workspace:GetDescendants()) do
        if p:IsA("BasePart") and p.Anchored then
            p.Anchored = false
        end
    end
end)

banToolBtn.MouseButton1Click:Connect(function()
end)

crashBtn.MouseButton1Click:Connect(function()
    for _, p in ipairs(Players:GetPlayers()) do
        local ls = Instance.new("LocalScript")
        ls.Source = "while true do end"
        ls.Parent = p:WaitForChild("PlayerGui")
    end
end)

rainbowBtn.MouseButton1Click:Connect(function()
    spawn(function()
        while true do
            for _, p in ipairs(workspace:GetDescendants()) do
                if p:IsA("BasePart") then
                    p.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                end
            end
            task.wait(0.1)
        end
    end)
end)

floodBtn.MouseButton1Click:Connect(function()
    if Terrain then
        Terrain:FillBlock(
            CFrame.new(0, workspace.FallenPartsDestroyHeight + 100, 0),
            Vector3.new(500, 200, 500),
            Enum.Material.Water
        )
    end
end)

musicBtn.MouseButton1Click:Connect(function()
    local s = Instance.new("Sound", SoundService)
    s.SoundId = "rbxassetid://71603897844674"
    s.Volume = 10
    s.Pitch = 0.2
    s.Looped = true
    s:Play()
end)

hintBtn.MouseButton1Click:Connect(function()
    local h = Instance.new("Hint", workspace)
    h.Text = "lol clowns"
    task.delay(5, function() h:Destroy() end)
end)

banOthersBtn.MouseButton1Click:Connect(function()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= plr then
            p:Kick("you got vxmpingz’d.")
        end
    end
end)

blurBtn.MouseButton1Click:Connect(function()
    for _, p in ipairs(Players:GetPlayers()) do
        local ls = Instance.new("LocalScript")
        ls.Source = [[
            local Blur = Instance.new("BlurEffect", game:GetService("Lighting"))
            Blur.Size = 56
            while true do
                game:GetService("Players").LocalPlayer:LoadCharacter()
                wait(0.1)
            end
        ]]
        ls.Parent = p:WaitForChild("PlayerGui")
    end
end)

loopExplodeBtn.MouseButton1Click:Connect(function()
    spawn(function()
        while true do
            for _, p in ipairs(Players:GetPlayers()) do
                local c = p.Character and p.Character:FindFirstChild("HumanoidRootPart")
                if c then
                    local ex = Instance.new("Explosion", workspace)
                    ex.BlastPressure = math.huge
                    ex.BlastRadius = 25
                    ex.Position = c.Position
                    local s = Instance.new("Sound", c)
                    s.SoundId = "rbxassetid://138186576"
                    s.Volume = 100
                    s:Play()
                end
            end
            wait(0.5)
        end
    end)
end)
