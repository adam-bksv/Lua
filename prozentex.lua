if game:GetService("CoreGui"):FindFirstChild("prozentex") then
	game:GetService("CoreGui").prozentex:Destroy()
end

--UI
local prozentex = Instance.new("ScreenGui")
prozentex.Name = "prozentex"

local Frame = Instance.new("ScrollingFrame")
Frame.Name = "Frame"
Frame.Size = UDim2.new(0, 543, 0, 284)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.Position = UDim2.new(0.0316642, 0, 0.5909091, 0)
Frame.Active = true
Frame.BorderSizePixel = 0
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.ScrollBarThickness = 4
Frame.Parent = prozentex

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(189, 189, 189)
UIStroke.Parent = Frame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = Frame

local template_output = Instance.new("TextLabel")
template_output.Name = "template_output"
template_output.Size = UDim2.new(0, 543, 0, 20)
template_output.BorderColor3 = Color3.fromRGB(0, 0, 0)
template_output.BackgroundTransparency = 1
template_output.BorderSizePixel = 0
template_output.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
template_output.FontSize = Enum.FontSize.Size14
template_output.TextTruncate = Enum.TextTruncate.AtEnd
template_output.TextSize = 14
template_output.TextColor3 = Color3.fromRGB(255, 255, 255)
template_output.Text = " >> Sers"
template_output.Font = Enum.Font.RobotoMono
template_output.TextXAlignment = Enum.TextXAlignment.Left
template_output.Parent = Frame
template_output.Visible = false

local cmd_prompt = Instance.new("TextBox")
cmd_prompt.Name = "cmd_prompt"
cmd_prompt.Size = UDim2.new(0, 543, 0, 16)
cmd_prompt.BorderColor3 = Color3.fromRGB(0, 0, 0)
cmd_prompt.BackgroundTransparency = 0
cmd_prompt.Position = UDim2.new(0.032, 0, 0.885, 0)
cmd_prompt.BorderSizePixel = 0
cmd_prompt.BackgroundColor3 = Color3.fromRGB(0,0,0)
cmd_prompt.FontSize = Enum.FontSize.Size18
cmd_prompt.TextYAlignment = Enum.TextYAlignment.Bottom
cmd_prompt.TextWrapped = true
cmd_prompt.TextWrap = true
cmd_prompt.TextSize = 16
cmd_prompt.RichText = true
cmd_prompt.TextColor3 = Color3.fromRGB(255, 255, 255)
cmd_prompt.Text = ">> cmd"
cmd_prompt.CursorPosition = -1
cmd_prompt.Font = Enum.Font.RobotoMono
cmd_prompt.TextXAlignment = Enum.TextXAlignment.Left
cmd_prompt.Parent = prozentex

local UIStroke_cmd = Instance.new("UIStroke")
UIStroke_cmd.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_cmd.Color = Color3.fromRGB(189, 189, 189)
UIStroke_cmd.Parent = cmd_prompt

local Label = Instance.new("TextLabel")
Label.Name = "Label"
Label.Size = UDim2.new(0, 200, 0, 17)
Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
Label.Position = UDim2.new(0.0316642, 0, 0.573, 0)
Label.BorderSizePixel = 0
Label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Label.FontSize = Enum.FontSize.Size14
Label.TextSize = 14
Label.TextColor3 = Color3.fromRGB(255, 255, 255)
Label.TextYAlignment = Enum.TextYAlignment.Top
Label.Text = "% prozentex"
Label.Font = Enum.Font.RobotoMono
Label.Parent = prozentex

local UIStroke1 = Instance.new("UIStroke")
UIStroke1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke1.Color = Color3.fromRGB(189, 189, 189)
UIStroke1.Parent = Label

local Close = Instance.new("ImageButton")
Close.Name = "Close"
Close.Size = UDim2.new(0, 17, 0, 17)
Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
Close.BackgroundTransparency = 1
Close.Position = UDim2.new(0.915, 0, 0, 0)
Close.BorderSizePixel = 0
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.ImageTransparency = 1
Close.Image = "rbxassetid://10747384394"
Close.Parent = Label

prozentex.Parent = game:GetService("CoreGui")
-- UI end

local local_functions = {
    ["output"] = function(text)
        local template_output_clone = Instance.new("TextLabel")
            template_output_clone.Name = "template_output"
            template_output_clone.Size = UDim2.new(0, 543, 0, 20)
            template_output_clone.BorderColor3 = Color3.fromRGB(0, 0, 0)
            template_output_clone.BackgroundTransparency = 1
            template_output_clone.BorderSizePixel = 0
            template_output_clone.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            template_output_clone.FontSize = Enum.FontSize.Size14
            template_output_clone.TextTruncate = Enum.TextTruncate.AtEnd
            template_output_clone.TextSize = 14
            template_output_clone.TextColor3 = Color3.fromRGB(255, 255, 255)
            template_output_clone.MaxVisibleGraphemes = -1
            template_output_clone.Text = " >> "..tostring(text)
            template_output_clone.Font = Enum.Font.RobotoMono
            template_output_clone.TextXAlignment = Enum.TextXAlignment.Left
            template_output_clone.Parent = Frame
            template_output_clone.Visible = true
            game:GetService("TweenService"):Create(template_output_clone, TweenInfo.new(.5), {MaxVisibleGraphemes = #template_output_clone.Text}):Play()
    end,
    ["get_instance"] = function(path)
        local split_path = path:split(".")
        local inline_path = game

        for i = 2,#split_path do
            inline_path = inline_path[path[i]]
        end
        if inline_path then
            return inline_path
        end
    end,
}

-- vars
local cmds = {
    ["listinstances"] = function(command)
        if string.sub(command[2], 1, 5) == "game." then
            for _,v in pairs(game[string.sub(command[2], 6, 9999)]:GetChildren()) do
                local_functions.output("game."..v:GetFullName())
            end
        elseif string.sub(command[2], 1, 5) == "game" then
            for _,v in pairs(game:GetChildren()) do
                local_functions.output("game."..v:GetFullName())
            end
        end
    end,
};

-- functions
local functions = {
    ["cmd"] = function(command)
         for _,v in pairs(Frame:GetChildren()) do
             if v:IsA("TextLabel") and v ~= template_output then
                 v:Destroy()
             end
         end
        if cmds[command[1]] then
            cmds[command[1]](command)
        elseif string.sub(command[1], 1, 4) == "game" then
            loadstring(command[1])()
        else
            local_functions.output("Command: "..tostring(command[1]).." not found.")
        end
    end,
};

cmd_prompt.FocusLost:Connect(function(enter)
    if enter then
        local split_text = cmd_prompt.Text:split(" ")
        functions.cmd(split_text)
        cmd_prompt.Text = ">> cmd"
    end
end)

Close.MouseEnter:Connect(function()
    game:GetService("TweenService"):Create(Close, TweenInfo.new(.3), {ImageTransparency = 0}):Play()
end)
Close.MouseLeave:Connect(function()
    game:GetService("TweenService"):Create(Close, TweenInfo.new(.3), {ImageTransparency = 1}):Play()
end)
Close.Activated:Connect(function()
    prozentex:Destroy()
end)
