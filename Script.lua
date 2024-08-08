-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MyExecutor"
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

-- Create a draggable Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 200)
frame.Position = UDim2.new(0.5, -200, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.Parent = screenGui

-- Create a title bar for dragging
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
titleBar.Parent = frame

-- Create TextBox
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(1, -20, 0, 50)
textBox.Position = UDim2.new(0, 10, 0, 40)
textBox.PlaceholderText = "Enter Lua code here..."
textBox.Parent = frame

-- Create Inject Button
local injectButton = Instance.new("TextButton")
injectButton.Size = UDim2.new(0, 100, 0, 50)
injectButton.Position = UDim2.new(0, 10, 0, 100)
injectButton.Text = "Inject"
injectButton.Parent = frame

-- Create Execute Button
local executeButton = Instance.new("TextButton")
executeButton.Size = UDim2.new(0, 100, 0, 50)
executeButton.Position = UDim2.new(0, 120, 0, 100)
executeButton.Text = "Execute"
executeButton.Parent = frame

-- Create Clear Button
local clearButton = Instance.new("TextButton")
clearButton.Size = UDim2.new(0, 100, 0, 50)
clearButton.Position = UDim2.new(0, 230, 0, 100)
clearButton.Text = "Clear"
clearButton.Parent = frame

-- Variables for dragging
local isDragging = false
local dragStart = nil
local startPos = nil

-- Function to handle dragging
titleBar.MouseButton1Down:Connect(function(mouse)
    isDragging = true
    dragStart = mouse.Position
    startPos = frame.Position
end)

titleBar.MouseMoved:Connect(function(mouse)
    if isDragging then
        local delta = mouse.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

titleBar.MouseButton1Up:Connect(function()
    isDragging = false
end)

-- Function to handle Inject button click
injectButton.MouseButton1Click:Connect(function()
    -- Code to handle injection
    -- In a real scenario, you would need to consider the legality and safety of what you're doing
    print("Injected script: " .. textBox.Text)
end)

-- Function to handle Execute button click
executeButton.MouseButton1Click:Connect(function()
    -- Execute the Lua code from the text box
    local success, result = pcall(function()
        loadstring(textBox.Text)()
    end)
    if not success then
        warn("Error executing script: " .. result)
    end
end)

-- Function to handle Clear button click
clearButton.MouseButton1Click:Connect(function()
    textBox.Text = ""
end)
