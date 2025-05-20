-- Credits to Albonbv for original code
-- This is modded version of his script
-- Fixed phone draggable UI by Gregory909;)
-- Enjoy boys:3

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local TARGET = "natali19871308"
local REPORTS_PER_REASON = 1500000
local DELAY = 0.001

local REASONS = {
    "Cheating",
    "Exploiting",
    "Scamming",
    "Harassment",
    "Swearing",
    "Bullying",
    "InappropriateContent",
    "PersonalInfo",
    "Dating",
    "Phishing"
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MassReportGUI"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game:GetService("CoreGui")

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 350, 0, 400)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.BackgroundTransparency = 0.2
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

local DropShadow = Instance.new("ImageLabel")
DropShadow.Name = "DropShadow"
DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow.BackgroundTransparency = 1
DropShadow.BorderSizePixel = 0
DropShadow.Position = UDim2.new(0.5, 0, 0.5, 4)
DropShadow.Size = UDim2.new(1, 10, 1, 10)
DropShadow.Image = "rbxassetid://1316045217"
DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow.ImageTransparency = 0.8
DropShadow.ScaleType = Enum.ScaleType.Slice
DropShadow.SliceCenter = Rect.new(10, 10, 118, 118)
DropShadow.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
Title.BackgroundTransparency = 0.3
Title.BorderSizePixel = 0
Title.Font = Enum.Font.GothamBold
Title.Text = "MASS REPORT v2.0"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Center
Title.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = Title

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CloseButton.BackgroundTransparency = 0.7
CloseButton.BorderSizePixel = 0
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 16
CloseButton.Parent = Title

local CloseButtonCorner = Instance.new("UICorner")
CloseButtonCorner.CornerRadius = UDim.new(0, 6)
CloseButtonCorner.Parent = CloseButton

local TargetFrame = Instance.new("Frame")
TargetFrame.Name = "TargetFrame"
TargetFrame.Size = UDim2.new(1, -20, 0, 60)
TargetFrame.Position = UDim2.new(0, 10, 0, 50)
TargetFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
TargetFrame.BackgroundTransparency = 0.3
TargetFrame.BorderSizePixel = 0
TargetFrame.Parent = MainFrame

local TargetCorner = Instance.new("UICorner")
TargetCorner.CornerRadius = UDim.new(0, 6)
TargetCorner.Parent = TargetFrame

local TargetLabel = Instance.new("TextLabel")
TargetLabel.Name = "TargetLabel"
TargetLabel.Size = UDim2.new(1, 0, 0, 20)
TargetLabel.Position = UDim2.new(0, 10, 0, 5)
TargetLabel.BackgroundTransparency = 1
TargetLabel.Font = Enum.Font.Gotham
TargetLabel.Text = "Цель:"
TargetLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
TargetLabel.TextSize = 14
TargetLabel.TextXAlignment = Enum.TextXAlignment.Left
TargetLabel.Parent = TargetFrame

local TargetBox = Instance.new("TextBox")
TargetBox.Name = "TargetBox"
TargetBox.Size = UDim2.new(1, -20, 0, 30)
TargetBox.Position = UDim2.new(0, 10, 0, 25)
TargetBox.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
TargetBox.BackgroundTransparency = 0.5
TargetBox.BorderSizePixel = 0
TargetBox.Font = Enum.Font.Gotham
TargetBox.PlaceholderText = "Введите никнейм"
TargetBox.Text = TARGET
TargetBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetBox.TextSize = 14
TargetBox.TextXAlignment = Enum.TextXAlignment.Left
TargetBox.Parent = TargetFrame

local TargetBoxCorner = Instance.new("UICorner")
TargetBoxCorner.CornerRadius = UDim.new(0, 4)
TargetBoxCorner.Parent = TargetBox

local TargetBoxPadding = Instance.new("UIPadding")
TargetBoxPadding.PaddingLeft = UDim.new(0, 8)
TargetBoxPadding.Parent = TargetBox

local SettingsFrame = Instance.new("Frame")
SettingsFrame.Name = "SettingsFrame"
SettingsFrame.Size = UDim2.new(1, -20, 0, 80)
SettingsFrame.Position = UDim2.new(0, 10, 0, 120)
SettingsFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
SettingsFrame.BackgroundTransparency = 0.3
SettingsFrame.BorderSizePixel = 0
SettingsFrame.Parent = MainFrame

local SettingsCorner = Instance.new("UICorner")
SettingsCorner.CornerRadius = UDim.new(0, 6)
SettingsCorner.Parent = SettingsFrame

local CountLabel = Instance.new("TextLabel")
CountLabel.Name = "CountLabel"
CountLabel.Size = UDim2.new(0.5, -15, 0, 20)
CountLabel.Position = UDim2.new(0, 10, 0, 5)
CountLabel.BackgroundTransparency = 1
CountLabel.Font = Enum.Font.Gotham
CountLabel.Text = "Кол-во репортов:"
CountLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
CountLabel.TextSize = 14
CountLabel.TextXAlignment = Enum.TextXAlignment.Left
CountLabel.Parent = SettingsFrame

local CountBox = Instance.new("TextBox")
CountBox.Name = "CountBox"
CountBox.Size = UDim2.new(0.5, -15, 0, 30)
CountBox.Position = UDim2.new(0, 10, 0, 25)
CountBox.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
CountBox.BackgroundTransparency = 0.5
CountBox.BorderSizePixel = 0
CountBox.Font = Enum.Font.Gotham
CountBox.PlaceholderText = "Количество"
CountBox.Text = tostring(REPORTS_PER_REASON)
CountBox.TextColor3 = Color3.fromRGB(255, 255, 255)
CountBox.TextSize = 14
CountBox.Parent = SettingsFrame

local CountBoxCorner = Instance.new("UICorner")
CountBoxCorner.CornerRadius = UDim.new(0, 4)
CountBoxCorner.Parent = CountBox

local CountBoxPadding = Instance.new("UIPadding")
CountBoxPadding.PaddingLeft = UDim.new(0, 8)
CountBoxPadding.Parent = CountBox

local DelayLabel = Instance.new("TextLabel")
DelayLabel.Name = "DelayLabel"
DelayLabel.Size = UDim2.new(0.5, -15, 0, 20)
DelayLabel.Position = UDim2.new(0.5, 5, 0, 5)
DelayLabel.BackgroundTransparency = 1
DelayLabel.Font = Enum.Font.Gotham
DelayLabel.Text = "Задержка (сек):"
DelayLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
DelayLabel.TextSize = 14
DelayLabel.TextXAlignment = Enum.TextXAlignment.Left
DelayLabel.Parent = SettingsFrame

local DelayBox = Instance.new("TextBox")
DelayBox.Name = "DelayBox"
DelayBox.Size = UDim2.new(0.5, -15, 0, 30)
DelayBox.Position = UDim2.new(0.5, 5, 0, 25)
DelayBox.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
DelayBox.BackgroundTransparency = 0.5
DelayBox.BorderSizePixel = 0
DelayBox.Font = Enum.Font.Gotham
DelayBox.PlaceholderText = "Задержка"
DelayBox.Text = tostring(DELAY)
DelayBox.TextColor3 = Color3.fromRGB(255, 255, 255)
DelayBox.TextSize = 14
DelayBox.Parent = SettingsFrame

local DelayBoxCorner = Instance.new("UICorner")
DelayBoxCorner.CornerRadius = UDim.new(0, 4)
DelayBoxCorner.Parent = DelayBox

local DelayBoxPadding = Instance.new("UIPadding")
DelayBoxPadding.PaddingLeft = UDim.new(0, 8)
DelayBoxPadding.Parent = DelayBox

local AllReasonsCheck = Instance.new("TextButton")
AllReasonsCheck.Name = "AllReasonsCheck"
AllReasonsCheck.Size = UDim2.new(1, -20, 0, 20)
AllReasonsCheck.Position = UDim2.new(0, 10, 0, 60)
AllReasonsCheck.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
AllReasonsCheck.BackgroundTransparency = 0.5
AllReasonsCheck.BorderSizePixel = 0
AllReasonsCheck.Font = Enum.Font.Gotham
AllReasonsCheck.Text = "  Все причины (10 типов)"
AllReasonsCheck.TextColor3 = Color3.fromRGB(255, 255, 255)
AllReasonsCheck.TextSize = 14
AllReasonsCheck.TextXAlignment = Enum.TextXAlignment.Left
AllReasonsCheck.Parent = SettingsFrame

local CheckIcon = Instance.new("ImageLabel")
CheckIcon.Name = "CheckIcon"
CheckIcon.Size = UDim2.new(0, 16, 0, 16)
CheckIcon.Position = UDim2.new(1, -20, 0, 2)
CheckIcon.BackgroundTransparency = 1
CheckIcon.Image = "rbxassetid://3926305904"
CheckIcon.ImageColor3 = Color3.fromRGB(100, 255, 100)
CheckIcon.ImageRectOffset = Vector2.new(50, 50)
CheckIcon.ImageRectSize = Vector2.new(48, 48)
CheckIcon.Parent = AllReasonsCheck

local StartButton = Instance.new("TextButton")
StartButton.Name = "StartButton"
StartButton.Size = UDim2.new(1, -20, 0, 40)
StartButton.Position = UDim2.new(0, 10, 0, 210)
StartButton.BackgroundColor3 = Color3.fromRGB(80, 160, 80)
StartButton.BackgroundTransparency = 0.3
StartButton.BorderSizePixel = 0
StartButton.Font = Enum.Font.GothamBold
StartButton.Text = "НАЧАТЬ МАССОВЫЙ РЕПОРТ"
StartButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StartButton.TextSize = 16
StartButton.Parent = MainFrame

local StartButtonCorner = Instance.new("UICorner")
StartButtonCorner.CornerRadius = UDim.new(0, 6)
StartButtonCorner.Parent = StartButton

local LogFrame = Instance.new("Frame")
LogFrame.Name = "LogFrame"
LogFrame.Size = UDim2.new(1, -20, 1, -260)
LogFrame.Position = UDim2.new(0, 10, 0, 260)
LogFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
LogFrame.BackgroundTransparency = 0.3
LogFrame.BorderSizePixel = 0
LogFrame.Parent = MainFrame

local LogCorner = Instance.new("UICorner")
LogCorner.CornerRadius = UDim.new(0, 6)
LogCorner.Parent = LogFrame

local LogScroller = Instance.new("ScrollingFrame")
LogScroller.Name = "LogScroller"
LogScroller.Size = UDim2.new(1, -10, 1, -10)
LogScroller.Position = UDim2.new(0, 5, 0, 5)
LogScroller.BackgroundTransparency = 1
LogScroller.BorderSizePixel = 0
LogScroller.ScrollBarThickness = 5
LogScroller.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 120)
LogScroller.Parent = LogFrame

local LogLayout = Instance.new("UIListLayout")
LogLayout.Name = "LogLayout"
LogLayout.Padding = UDim.new(0, 5)
LogLayout.SortOrder = Enum.SortOrder.LayoutOrder
LogLayout.Parent = LogScroller

local function AddLog(message, color)
    color = color or Color3.fromRGB(255, 255, 255)
    
    local LogEntry = Instance.new("TextLabel")
    LogEntry.Name = "LogEntry"
    LogEntry.Size = UDim2.new(1, 0, 0, 20)
    LogEntry.BackgroundTransparency = 1
    LogEntry.Font = Enum.Font.Gotham
    LogEntry.Text = "> "..message
    LogEntry.TextColor3 = color
    LogEntry.TextSize = 14
    LogEntry.TextXAlignment = Enum.TextXAlignment.Left
    LogEntry.TextTruncate = Enum.TextTruncate.AtEnd
    LogEntry.Parent = LogScroller
    
    LogScroller.CanvasSize = UDim2.new(0, 0, 0, LogLayout.AbsoluteContentSize.Y)
    LogScroller.CanvasPosition = Vector2.new(0, LogScroller.CanvasSize.Y.Offset)
    
    return LogEntry
end

AddLog("Готов к работе. Введите данные и нажмите кнопку.", Color3.fromRGB(200, 200, 255))

local function ButtonHoverEffect(button, defaultColor, hoverColor, transparency)
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = hoverColor, BackgroundTransparency = transparency - 0.1}):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = defaultColor, BackgroundTransparency = transparency}):Play()
    end)
end

ButtonHoverEffect(StartButton, Color3.fromRGB(80, 160, 80), Color3.fromRGB(100, 200, 100), 0.3)
ButtonHoverEffect(CloseButton, Color3.fromRGB(255, 60, 60), Color3.fromRGB(255, 80, 80), 0.7)
ButtonHoverEffect(AllReasonsCheck, Color3.fromRGB(60, 60, 80), Color3.fromRGB(80, 80, 100), 0.5)

local dragging
local dragInput
local dragStart
local startPos

local function UpdateInput(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

Title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        UpdateInput(input)
    end
end)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local function AnnounceBan(playerName)
    local msg = playerName.." has been banned"
    
    pcall(function() game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(msg) end)
    pcall(function() game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All") end)
    pcall(function() game:GetService("Players"):Chat(msg) end)
    AddLog("Объявлен бан для "..playerName, Color3.fromRGB(255, 100, 100))
end

local function MassReport()
    local target = TargetBox.Text
    local reportsCount = tonumber(CountBox.Text) or REPORTS_PER_REASON
    local delay = tonumber(DelayBox.Text) or DELAY
    
    local targetPlayer = game:GetService("Players"):FindFirstChild(target)
    if not targetPlayer then
        AddLog("Ошибка: игрок "..target.." не найден!", Color3.fromRGB(255, 80, 80))
        return
    end

    AddLog("Начинаю массовый репорт на "..target, Color3.fromRGB(100, 255, 100))
    
    for _, reason in ipairs(REASONS) do
        for i = 1, reportsCount do
            if not targetPlayer.Parent then break end 
            
            pcall(function()
                game:GetService("Players").ReportAbuse(
                    game.Players.LocalPlayer,
                    targetPlayer,
                    reason,
                    "Automated report"
                )
                AddLog("Репорт за "..reason.." ("..i.."/"..reportsCount..")")
            end)
            
            task.wait(delay)
        end
    end

    if targetPlayer.Parent then
        AnnounceBan(target)
    else

        game:GetService("Players").PlayerRemoving:Connect(function(player)
            if player.Name == target then
                AnnounceBan(target)
            end
        end)
    end
    
    AddLog("Массовый репорт завершен!", Color3.fromRGB(100, 255, 100))
end

StartButton.MouseButton1Click:Connect(function()
 
    StartButton.Text = "ВЫПОЛНЯЕТСЯ..."
    StartButton.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
    
    coroutine.wrap(function()
        MassReport()
        
        StartButton.Text = "НАЧАТЬ МАССОВЫЙ РЕПОРТ"
        StartButton.BackgroundColor3 = Color3.fromRGB(80, 160, 80)
    end)()
end)

local CreatorLabel = Instance.new("TextLabel")
CreatorLabel.Name = "CreatorLabel"
CreatorLabel.Size = UDim2.new(1, -20, 0, 20)
CreatorLabel.Position = UDim2.new(0, 10, 1, -25)
CreatorLabel.BackgroundTransparency = 1
CreatorLabel.Font = Enum.Font.Gotham
CreatorLabel.Text = "Создатель: @Albonbv"
CreatorLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
CreatorLabel.TextSize = 12
CreatorLabel.TextXAlignment = Enum.TextXAlignment.Right
CreatorLabel.Parent = MainFrame
