-- SERVICES
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")
local Terrain = workspace:FindFirstChildOfClass("Terrain")
local TweenService = game:GetService("TweenService")

local plr = Players.LocalPlayer
if not plr then return end

-- MAIN UI CONTAINER
local gui = Instance.new("ScreenGui")
gui.Name = "VxmpingzUI"
gui.ResetOnSpawn = false
gui.Parent = plr:WaitForChild("PlayerGui")

-- MAIN FRAME
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 480, 0, 620)
main.Position = UDim2.new(0.5, -240, 0.5, -310)
main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = gui

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)
local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(255, 0, 0)
stroke.Thickness = 2

-- TITLE
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 60)
title.BackgroundTransparency = 1
title.Text = "Vxmpingz's UI Panel"
title.Font = Enum.Font.GothamBlack
title.TextSize = 28
title.TextColor3 = Color3.fromRGB(255, 85, 85)

-- PAGE CREATION
local function makePage(name)
	local page = Instance.new("Frame", main)
	page.Name = name
	page.Size = UDim2.new(1, -20, 1, -100)
	page.Position = UDim2.new(0, 10, 0, 70)
	page.BackgroundTransparency = 1

	local layout = Instance.new("UIGridLayout", page)
	layout.CellSize = UDim2.new(0, 210, 0, 45)
	layout.CellPadding = UDim2.new(0, 10, 0, 10)
	layout.SortOrder = Enum.SortOrder.LayoutOrder

	return page
end

local page1 = makePage("Page1")
local page2 = makePage("Page2")
page2.Visible = false

-- BUTTON TEMPLATE
local function createBtn(parent, name, text)
	local btn = Instance.new("TextButton")
	btn.Name = name
	btn.Text = text
	btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	btn.Font = Enum.Font.GothamSemibold
	btn.TextSize = 18
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Parent = parent

	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
	local stroke = Instance.new("UIStroke", btn)
	stroke.Color = Color3.fromRGB(255, 0, 0)
	stroke.Thickness = 1.5

	return btn
end

-- PAGE 1 BUTTONS
local skyboxBtn = createBtn(page1, "Skybox", "1. Skybox")
local unanchorBtn = createBtn(page1, "Unanchor", "2. Unanchor")
local crashBtn = createBtn(page1, "Crash", "3. Crash Others")
local rainbowBtn = createBtn(page1, "Rainbow", "4. Rainbow Map")
local floodBtn = createBtn(page1, "Flood", "5. Flood Map")
local musicBtn = createBtn(page1, "Music", "6. Music")
local hintBtn = createBtn(page1, "Hint", "7. Hint")
local banOthersBtn = createBtn(page1, "BanOthers", "8. Ban Others")
local blurBtn = createBtn(page1, "Blur", "9. Blur + Respawn")
local loopExplodeBtn = createBtn(page1, "Explode", "10. Loop Explode")
local nextBtn = createBtn(page1, "Next", "→ Next Page")

-- PAGE 2 BUTTONS
local backBtn = createBtn(page2, "Back", "← Back Page")

-- PAGE NAVIGATION
nextBtn.MouseButton1Click:Connect(function()
	page1.Visible = false
	page2.Visible = true
end)

backBtn.MouseButton1Click:Connect(function()
	page2.Visible = false
	page1.Visible = true
end)

-- CLOSE BUTTON
local closeBtn = Instance.new("TextButton", main)
closeBtn.Size = UDim2.new(0, 38, 0, 38)
closeBtn.Position = UDim2.new(1, -45, 0, 10)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.TextSize = 20
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", closeBtn).Color = Color3.fromRGB(0, 0, 0)

-- REOPEN BUTTON
local reopenBtn = Instance.new("TextButton", gui)
reopenBtn.Size = UDim2.new(0, 40, 0, 40)
reopenBtn.Position = UDim2.new(0.5, -20, 0.5, -20)
reopenBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
reopenBtn.Text = "↻"
reopenBtn.TextColor3 = Color3.new(1, 1, 1)
reopenBtn.Font = Enum.Font.GothamBlack
reopenBtn.TextSize = 20
reopenBtn.Visible = false
Instance.new("UICorner", reopenBtn).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", reopenBtn).Color = Color3.fromRGB(0, 0, 0)

-- ANIMATIONS
local function spinCollapse()
	local tween = TweenService:Create(main, TweenInfo.new(0.4, Enum.EasingStyle.Sine), {
		Rotation = 360,
		Size = UDim2.new(0, 0, 0, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0)
	})
	tween:Play()
	tween.Completed:Wait()
	main.Visible = false
	reopenBtn.Visible = true
end

local function spinExpand()
	main.Visible = true
	reopenBtn.Visible = false
	main.Rotation = 0
	main.Size = UDim2.new(0, 0, 0, 0)
	main.Position = UDim2.new(0.5, 0, 0.5, 0)

	local tween = TweenService:Create(main, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
		Size = UDim2.new(0, 480, 0, 620),
		Position = UDim2.new(0.5, -240, 0.5, -310)
	})
	tween:Play()
end

closeBtn.MouseButton1Click:Connect(spinCollapse)
reopenBtn.MouseButton1Click:Connect(spinExpand)

-- FEATURE BUTTON FUNCTIONS

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

crashBtn.MouseButton1Click:Connect(function()
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= plr then
			local ls = Instance.new("LocalScript")
			ls.Source = "while true do end"
			ls.Parent = p:WaitForChild("PlayerGui")
		end
	end
end)

rainbowBtn.MouseButton1Click:Connect(function()
	task.spawn(function()
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
		Terrain:FillBlock(CFrame.new(0, workspace.FallenPartsDestroyHeight + 100, 0), Vector3.new(500, 200, 500), Enum.Material.Water)
	end
end)

musicBtn.MouseButton1Click:Connect(function()
	local s = Instance.new("Sound", SoundService)
	s.SoundId = "rbxassetid://71603897844674"
	s.Volume = 10
	s.Pitch = 0.5
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
	task.spawn(function()
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
