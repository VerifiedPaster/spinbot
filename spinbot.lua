-- Variables
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local spinning = false
local spinSpeed = 5000

-- Function to start spinning
local function startSpinning()
    while spinning do
        humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.Angles(0, math.rad(spinSpeed / 60), 0)
        wait(1/60)
    end
end

-- Toggle spinning state
local function toggleSpinning()
    spinning = not spinning
    if spinning then
        spawn(startSpinning)
    end
end

-- Detect key press
local userInputService = game:GetService("UserInputService")

userInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.T then
        toggleSpinning()
    end
end)
