local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local PhantomForcesWindow = Library:NewWindow("Fitness Simulator")

local KillingCheats = PhantomForcesWindow:NewSection("Main")

local selectedLocation = "Starter"  -- Default selection for location

-- Create the dropdown for selecting a location
KillingCheats:CreateDropdown("Location", {"Starter", "Beach", "Fantasy", "Desert", "Moon", "Underwater"}, 1, function(text)
    selectedLocation = text  -- Update the selected location
    print("Selected Location: " .. selectedLocation)
end)

-- Create the button to equip all dumbbells
KillingCheats:CreateButton("Equip Best Dumbbell", function()
    for i = 1, 9 do  -- Loop through dumbbells 1 to 9
        local args = {
            [1] = selectedLocation,  -- Use the selected location from the dropdown
            [2] = tostring(i),       -- Convert the number to a string for the dumbbell ID
            [3] = "Dumbbell"
        }

        local success, err = pcall(function()
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("EquipItem"):InvokeServer(unpack(args))
        end)

        if not success then
            warn("Failed to equip dumbbell " .. i .. ": " .. err)
        else
            print("Dumbbell " .. i .. " equipped successfully at location: " .. selectedLocation)
        end
    end
end)

KillingCheats:CreateButton("Equip Best Cardio", function()
    for i = 1, 9 do  -- Loop through items 1 to 9
        local args = {
            [1] = selectedLocation,  -- Use the selected location from the dropdown
            [2] = tostring(i),       -- Convert the number to a string for the item ID
            [3] = "Cardio"          -- Specify the category as "Cardio"
        }

        local success, err = pcall(function()
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("EquipItem"):InvokeServer(unpack(args))
        end)

        if not success then
            warn("Failed to equip cardio item " .. i .. ": " .. err)
        else
            print("Cardio item " .. i .. " equipped successfully at location: " .. selectedLocation)
        end
    end
end)

local isAutoTraining = false -- Variable to track the toggle state

KillingCheats:CreateToggle("Auto Train", function(value)
    isAutoTraining = value -- Update the toggle state

    if isAutoTraining then
        -- Start auto training
        while isAutoTraining do
            local args = {
                [1] = "Strength"
            }

            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Train"):FireServer(unpack(args))
            wait() -- Adjust the wait time as needed to prevent spamming
        end
    end
end)

local isAutoStamina = false

KillingCheats:CreateToggle("Auto Stamina", function(value)
    isAutoStamina = value -- Update the toggle state

    if isAutoStamina then
        -- Start auto training
        while isAutoStamina do
            local args = {
                [1] = "Stamina"
            }

            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Train"):FireServer(unpack(args))
            wait() -- Adjust the wait time as needed to prevent spamming
        end
    end
end)

local isAutoSpinning = false -- Variable to track the toggle state

KillingCheats:CreateToggle("Auto Spin", function(value)
    isAutoSpinning = value -- Update the toggle state

    if isAutoSpinning then
        -- Start auto spinning
        while isAutoSpinning do
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SpinWheel"):InvokeServer()
            wait(1) -- Adjust the wait time as needed to prevent spamming
        end
    end
end)

local isAutoCollecting = false -- Variable to track the toggle state

KillingCheats:CreateToggle("Auto Collect Gifts", function(value)
    isAutoCollecting = value -- Update the toggle state

    if isAutoCollecting then
        -- Start auto collecting gifts
        while isAutoCollecting do
            for giftNumber = 1, 12 do
                local args = {
                    [1] = tostring(giftNumber) -- Convert the number to a string
                }

                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RedeemGift"):InvokeServer(unpack(args))
                wait() -- Adjust the wait time as needed to prevent spamming
            end
            wait() -- Optional: wait before starting the next round of collection
        end
    end
end)

local KillingCheats = PhantomForcesWindow:NewSection("Eggs")

local selectedEgg = "Basic" -- Default selected egg
local autoOpenEnabled = false -- State of the auto-open toggle

KillingCheats:CreateDropdown("Choose Egg", {"||STARTER||", "Basic", "Spotted", "Void", "Electric", "||BEACH||", "Barnicle", "Kelp", "Floaty", "Aqua", "||FANTASY||", "Shielded", "Magic", "Dimensional", "||DESERT||", "Mummy", "Undead", "||MOON||", "Mystery", "||UNDERWATER||", "Treasure"}, 1, function(text)
    selectedEgg = text -- Update the selected egg
    print("Selected Egg: " .. selectedEgg)
end)

KillingCheats:CreateToggle("Auto Open Egg", function(value)
    autoOpenEnabled = value -- Update the state of the toggle

    if autoOpenEnabled then
        -- Start auto-opening eggs
        while autoOpenEnabled do
            local args = {
                [1] = selectedEgg, -- Use the selected egg
                [2] = 1,
                [3] = {}
            }

            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("BuyEgg"):InvokeServer(unpack(args))
            wait() -- Wait for a second before opening the next egg (adjust as necessary)
        end
    end
end)

local isAutoEquipping = false -- Variable to track the toggle state

KillingCheats:CreateToggle("Auto Equip Best", function(value)
    isAutoEquipping = value -- Update the toggle state

    if isAutoEquipping then
        -- Start auto equipping
        while isAutoEquipping do
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("EquipBest"):InvokeServer()
            wait(10) -- Adjust the wait time as needed to prevent spamming
        end
    end
end)

KillingCheats:CreateButton("Open Pet Index", function()
-- Get the LocalPlayer
local player = game:GetService("Players").LocalPlayer

-- Get the PetIndex GUI element
local petIndex = player.PlayerGui["User Interface"].Tabs:WaitForChild("PetIndex")

-- Function to make the PetIndex visible
local function showPetIndex()
    petIndex.Visible = true
end

-- Call the function to show the PetIndex
showPetIndex()
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