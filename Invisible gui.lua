-- Simple Toggle GUI
-- LocalScript | StarterPlayerScripts

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "SimpleToggleGui"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 180, 0, 200)
frame.Position = UDim2.new(0, 20, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.Parent = gui

-- UI Corner
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,10)

-- Button creator
local function createButton(text, y)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -20, 0, 35)
	btn.Position = UDim2.new(0, 10, 0, y)
	btn.Text = text
	btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
	btn.TextColor3 = Color3.fromRGB(255,255,255)
	btn.Parent = frame
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0,8)
	return btn
end

-- Buttons
local killBtn = createButton("Toggle Kill GUI", 10)
local invisBtn = createButton("Toggle Invisible", 55)
local uninvisBtn = createButton("Toggle Uninvisible", 100)
local closeBtn = createButton("Close Script", 145)

-- Invisible function
local function setInvisible(state)
	local char = player.Character or player.CharacterAdded:Wait()
	for _, v in pairs(char:GetDescendants()) do
		if v:IsA("BasePart") then
			v.Transparency = state and 1 or 0
			v.CanCollide = not state
		elseif v:IsA("Decal") then
			v.Transparency = state and 1 or 0
		end
	end
end

-- Button actions
killBtn.MouseButton1Click:Connect(function()
	warn("Kill GUI toggled (add your kill script here)")
end)

invisBtn.MouseButton1Click:Connect(function()
	setInvisible(true)
end)

uninvisBtn.MouseButton1Click:Connect(function()
	setInvisible(false)
end)

closeBtn.MouseButton1Click:Connect(function()
	gui:Destroy()
end)
