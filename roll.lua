local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local PhantomForcesWindow = Library:NewWindow("Ninja Fighting Simulator")

local KillingCheats = PhantomForcesWindow:NewSection("Main")

local isAutoRollEnabled = false
local autoRollConnection

KillingCheats:CreateToggle("Auto Roll", function(value)
    isAutoRollEnabled = value

    if isAutoRollEnabled then
        -- Start the auto roll loop
        autoRollConnection = game:GetService("RunService").Heartbeat:Connect(function()
            if isAutoRollEnabled then
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Roll"):FireServer()
                wait() -- Adjust the wait time as needed
            else
                -- Disconnect the connection if toggled off
                if autoRollConnection then
                    autoRollConnection:Disconnect()
                    autoRollConnection = nil
                end
            end
        end)
    else
        -- If toggled off, disconnect the connection
        if autoRollConnection then
            autoRollConnection:Disconnect()
            autoRollConnection = nil
        end
    end
end)

KillingCheats:CreateToggle("Auto Collect Gifts", function(value)
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local collecting = value -- Set collecting based on the toggle value

    -- Function to collect gifts
    local function collectGifts()
        while collecting do
            for i = 1, 9 do
                local args = { [1] = i }
                ReplicatedStorage:WaitForChild("GiftFolder"):WaitForChild("ClaimGift"):InvokeServer(unpack(args))
                wait() -- Wait for 1 second between claims to avoid spamming
            end
            wait() -- Wait before starting the next collection cycle
        end
    end

    -- Start or stop collecting gifts based on the toggle value
    if value then
        collectGifts() -- Start collecting gifts
    else
        collecting = false -- Stop collecting gifts
    end
end)

local KillingCheats = PhantomForcesWindow:NewSection("Misc")

KillingCheats:CreateButton("Anti-Afk", function()
wait(0.5)local ba=Instance.new("ScreenGui")
local ca=Instance.new("TextLabel")local da=Instance.new("Frame")
local _b=Instance.new("TextLabel")local ab=Instance.new("TextLabel")ba.Parent=game.CoreGui
ba.ZIndexBehavior=Enum.ZIndexBehavior.Sibling;ca.Parent=ba;ca.Active=true
ca.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)ca.Draggable=true
ca.Position=UDim2.new(0.698610067,0,0.098096624,0)ca.Size=UDim2.new(0,370,0,52)
ca.Font=Enum.Font.SourceSansSemibold;ca.Text="Anti AFK"ca.TextColor3=Color3.new(0,1,0)
ca.TextSize=50;da.Parent=ca
da.BackgroundColor3=Color3.new(0.196078,0.196078,0.196078)da.Position=UDim2.new(0,0,1.0192306,0)
da.Size=UDim2.new(0,370,0,107)_b.Parent=da
_b.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)_b.Position=UDim2.new(0,0,0.800455689,0)
_b.Size=UDim2.new(0,370,0,21)_b.Font=Enum.Font.Arial;_b.Text="Made By sunnii_mylife#2464"
_b.TextColor3=Color3.new(0,1,0)_b.TextSize=24;ab.Parent=da
ab.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)ab.Position=UDim2.new(0,0,0.158377,0)
ab.Size=UDim2.new(0,370,0,44)ab.Font=Enum.Font.ArialBold;ab.Text="Status: Active"
ab.TextColor3=Color3.new(0,1,0)ab.TextSize=35;local bb=game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
bb:CaptureController()bb:ClickButton2(Vector2.new())
ab.Text="Roblox tried to kick u but i kicked him instead"wait(2)ab.Text="Status : Active"end)
end)

local KillingCheats = PhantomForcesWindow:NewSection("Credit: sunnii_mylife")