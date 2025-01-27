local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local PhantomForcesWindow = Library:NewWindow("Ninja Fighting Simulator")

local KillingCheats = PhantomForcesWindow:NewSection("Main")

KillingCheats:CreateButton("Get Best Sword", function()
local args = {
    [1] = "Area5",
	[2] = "Katana",
	[3] = 1
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("EquipAndUnequipTool"):FireServer(unpack(args))
end)

local isAutoTrainEnabled = false -- Variable to track the toggle state
local autoTrainCoroutine -- Variable to hold the coroutine for the auto train action

KillingCheats:CreateToggle("Auto Swing", function(value)
    isAutoTrainEnabled = value -- Update the toggle state

    if isAutoTrainEnabled then
        -- If the toggle is turned on, start the auto train action
        print("Auto Train is enabled.")
        
        -- Create a coroutine to handle the repeating action
        autoTrainCoroutine = coroutine.create(function()
            while isAutoTrainEnabled do
                local remote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("DoAction")
                if remote then
                    remote:FireServer()
                else
                    warn("Remote 'DoAction' not found!")
                end
                wait() -- Wait for 1 second before firing again (adjust as needed)
            end
        end)
        
        coroutine.resume(autoTrainCoroutine) -- Start the coroutine
    else
        -- If the toggle is turned off, stop the auto train action
        print("Auto Train is disabled.")
        isAutoTrainEnabled = false -- Ensure the state is updated
        if autoTrainCoroutine then
            -- Stop the coroutine by breaking the loop
            coroutine.close(autoTrainCoroutine)
            autoTrainCoroutine = nil
        end
    end
end)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local autoPunching = false
local localPlayer = Players.LocalPlayer
local targetCoordinates = Vector3.new(312.123016, 29.4706249, 1182.63257) -- Define the target coordinates

-- Function to teleport the player to specified coordinates
local function teleportPlayerToCoordinates(player, coordinates)
    local character = player.Character or player.CharacterAdded:Wait() -- Wait for the character to load
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

    -- Check if the character and HumanoidRootPart exist
    if humanoidRootPart then
        humanoidRootPart.CFrame = CFrame.new(coordinates) -- Teleport to the specified coordinates
        print(player.Name .. " has been teleported to " .. tostring(coordinates))
    else
        warn("HumanoidRootPart not found for player: " .. player.Name)
    end
end

-- Function to start auto-punching
local function startAutoPunch()
    autoPunching = true
    while autoPunching do
        local args = {
            [1] = "Area5",
            [2] = "PunchingBag",
            [3] = 7
        }
        ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("DoAction"):FireServer(unpack(args))
        wait() -- Adjust the wait time as needed
    end
end

-- Function to stop auto-punching
local function stopAutoPunch()
    autoPunching = false
end

KillingCheats:CreateToggle("Auto Punch (best bag)", function(value)
    if value then
        teleportPlayerToCoordinates(localPlayer, targetCoordinates)
        startAutoPunch()
    else
        stopAutoPunch()
    end
end)

KillingCheats:CreateButton("get kick if do x10 fighter", function()
print("text")
end)

KillingCheats:CreateButton("Ex: enter Area1 and fighter is 1 ", function()
print("text")
end)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local areaInput = ""
local fighterInput = 0
local autoWinActive = false -- Variable to track if Auto Win is active

KillingCheats:CreateTextbox("Area", function(text)
    areaInput = text -- Store the area input
    print("Area set to: " .. areaInput)
end)

KillingCheats:CreateTextbox("Fighter", function(text)
    fighterInput = tonumber(text) or 0 -- Convert the fighter input to a number, default to 0 if invalid
    print("Fighter set to: " .. fighterInput)
end)

KillingCheats:CreateToggle("Auto Win", function(value)
    autoWinActive = value -- Set the autoWinActive variable based on the toggle state

    if autoWinActive then
        print("Auto Win activated with Area: " .. areaInput .. " and Fighter: " .. fighterInput)
        
        -- Start a loop to repeatedly fire the server while the toggle is on
        while autoWinActive do
            local args = {
                [1] = areaInput, -- Use the area input from the textbox
                [2] = fighterInput -- Use the fighter input from the textbox
            }

            -- Fire the server with the specified area and fighter
            ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("FightOver"):FireServer(unpack(args))
            wait() -- Adjust the wait time as needed (1 second in this case)
        end
    else
        print("Auto Win deactivated.")
    end
end)

local selectedPotion = "Luck" -- Default selected potion

KillingCheats:CreateDropdown("Potion", {"Luck", "Void", "x2Wins"}, 1, function(text)
    selectedPotion = text -- Update the selected potion when the dropdown changes
    print("Selected Potion: " .. selectedPotion) -- Print the selected potion
end)

KillingCheats:CreateButton("Use Potion", function()
    local args = {
        [1] = selectedPotion -- Use the selected potion from the dropdown
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("EquipPotion"):FireServer(unpack(args))
end)

local isAutoRebirthEnabled = false -- Variable to track the toggle state

KillingCheats:CreateToggle("Auto Rebirth", function(value)
    isAutoRebirthEnabled = value -- Update the toggle state

    if isAutoRebirthEnabled then
        -- If the toggle is enabled, start the auto rebirth process
        while isAutoRebirthEnabled do
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Rebirth"):FireServer()
            wait() -- Add a wait time to prevent spamming the server too quickly
        end
    end
end)

local autoClaimEnabled = false -- Variable to track the toggle state

local autoClaimEnabled = false -- Initialize the toggle state

KillingCheats:CreateToggle("Auto Claim Gifts", function(value)
    autoClaimEnabled = value -- Update the toggle state

    if autoClaimEnabled then
        -- Start a coroutine to repeatedly claim gifts
        coroutine.wrap(function()
            while autoClaimEnabled do
                for i = 1, 20 do
                    local args = { [1] = i }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ServerRewards"):FireServer(unpack(args))
                    wait() -- Wait for 1 second before claiming the next gift
                end
                wait() -- Wait for 1 second before starting the next round of claims
            end
        end)()
    end
end)

local KillingCheats = PhantomForcesWindow:NewSection("Eggs")

local selectedEgg = "Starter Egg" -- Default selected egg
local autoOpenEnabled = false -- Variable to track the toggle state

KillingCheats:CreateDropdown("DropDown", {
    "||AREA 1||", 
    "Starter Egg", 
    "Intermediate Egg", 
    "Experienced Egg", 
    "Master Egg", 
    "||AREA 2||", 
    "Ice Egg", 
    "Frozen Egg", 
    "Shard Egg", 
    "Gem Egg", 
    "Astral Egg", 
    "Diamond Egg", 
    "||AREA 3||", 
    "Fire Egg", 
    "Earth Egg", 
    "Molten Egg", 
    "Crimson Egg", 
    "Star Egg", 
    "Phoenix Egg", 
    "||AREA 4||", 
    "Sand Egg", 
    "Palm Egg", 
    "Coral Egg", 
    "||AREA 5||", 
    "Spartan Egg", 
    "Guilded Egg", 
    "Aquarius Egg"
}, 1, function(text)
    selectedEgg = text -- Update the selected egg when the dropdown changes
    print("Selected Egg: " .. selectedEgg)
end)

KillingCheats:CreateToggle("Auto Open Egg", function(value)
    autoOpenEnabled = value -- Update the toggle state

    if autoOpenEnabled then
        -- Start a coroutine to repeatedly open the egg
        coroutine.wrap(function()
            while autoOpenEnabled do
                local args = {
                    [1] = selectedEgg, -- Use the selected egg from the dropdown
                    [2] = 1,
                    [3] = {},
                    [4] = false
                }

                game:GetService("ReplicatedStorage"):WaitForChild("PetSystem"):WaitForChild("PurchaseEgg"):FireServer(unpack(args))
                
                wait() -- Wait for 1 second before trying to open the egg again
            end
        end)()
    end
end)

local isAutoEventEggEnabled = false -- Variable to track the toggle state

KillingCheats:CreateToggle("Auto Event Egg", function(value)
    isAutoEventEggEnabled = value -- Update the toggle state

    if isAutoEventEggEnabled then
        -- If the toggle is enabled, start the auto event egg process
        while isAutoEventEggEnabled do
            local args = { 
                [1] = 1, 
                [2] = {} 
            }

            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("EggEvent1"):FireServer(unpack(args))
            wait() -- Add a wait time to prevent spamming the server too quickly
        end
    end
end)

local KillingCheats = PhantomForcesWindow:NewSection("Teleport")

KillingCheats:CreateDropdown("Choose Area", {"Area1", "Area2", "Area3", "Area4", "Area5"}, 1, function(selectedArea)
    local Players = game:GetService("Players")

    -- Define the coordinates for each area
    local areas = {
        Area1 = Vector3.new(-153.728424, 1.22834098, 17.9206867),
        Area2 = Vector3.new(-154.091553, 4.22556305, 270.501221),
        Area3 = Vector3.new(-152.46991, 4.22556448, 583.63562),
        Area4 = Vector3.new(-136.809509, 21.8398399, 840.218384),
        Area5 = Vector3.new(248.320465, 27.3442059, 1177.66931)
    }

    -- Function to teleport the player to a specified area
    local function teleportPlayerToArea(player, areaName)
        local character = player.Character or player.CharacterAdded:Wait() -- Wait for the character to load
        if character and character:FindFirstChild("HumanoidRootPart") then
            local targetPosition = areas[areaName]
            if targetPosition then
                character.HumanoidRootPart.CFrame = CFrame.new(targetPosition) -- Teleport to the target position
                print(player.Name .. " has been teleported to " .. areaName .. " at " .. tostring(targetPosition))
            else
                warn("Area " .. areaName .. " does not exist.")
            end
        else
            warn("Character or HumanoidRootPart not found for player: " .. player.Name)
        end
    end

    -- Teleport the local player to the selected area
    local localPlayer = Players.LocalPlayer
    teleportPlayerToArea(localPlayer, selectedArea) -- Use the selected area from the dropdown
end)

KillingCheats:CreateDropdown("Choose Place", {"Golden", "Void", "Shadow", "Index"}, 1, function(selectedArea)
    local Players = game:GetService("Players")

    -- Define the coordinates for each area
    local teleportLocations = {
        Golden = Vector3.new(-102.840714, 2.92377043, 321.210876),
        Void = Vector3.new(-194.555069, 3.4556663, 622.554871),
        Index = Vector3.new(-208.582764, 2.97468591, 318.582153),
        Shadow = Vector3.new(207.67598, 65.6646652, 1370.89148)
    }

    -- Function to teleport the player to the specified area
    local function teleportToArea(player, areaName)
        local coordinates = teleportLocations[areaName]
        
        if coordinates then
            local character = player.Character or player.CharacterAdded:Wait() -- Wait for the character to load
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

            -- Check if the character and HumanoidRootPart exist
            if humanoidRootPart then
                humanoidRootPart.CFrame = CFrame.new(coordinates) -- Teleport to the specified coordinates
                print(player.Name .. " has been teleported to " .. areaName .. " at " .. tostring(coordinates))
            else
                warn("HumanoidRootPart not found for player: " .. player.Name)
            end
        else
            warn("Invalid area name: " .. areaName)
        end
    end

    -- Get the local player and teleport to the selected area
    local localPlayer = Players.LocalPlayer
    teleportToArea(localPlayer, selectedArea) -- Use the selected area from the dropdown
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
