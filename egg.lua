local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local PhantomForcesWindow = Library:NewWindow("EGG RNG")

local KillingCheats = PhantomForcesWindow:NewSection("Main")

KillingCheats:CreateToggle("Auto Find UGC", function(value)
    local TweenService = game:GetService("TweenService")
    local player = game.Players.LocalPlayer
    local isFinding = false
    local originalWalkSpeed = 16 -- Default WalkSpeed, adjust if necessary

    -- Function to initialize the character
    local function initializeCharacter(character)
        local humanoid = character:WaitForChild("Humanoid")
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

        -- Store the original WalkSpeed
        originalWalkSpeed = humanoid.WalkSpeed
        -- Set a new WalkSpeed for faster movement
        humanoid.WalkSpeed = 25 -- Adjust as needed

        return humanoid, humanoidRootPart
    end

    -- List of egg rarities in priority order
    local eggRarities = {
        "Secret", "Legendary", "Epic", "Very Rare", "Rare", "UnCommon", "Common"
    }

    -- Move to Bob's area
    local function moveToBobsArea(humanoid)
        local nextPosition = workspace.Bob.Area.Position + Vector3.new(0, 2, 0)
        humanoid:MoveTo(nextPosition)
        humanoid.MoveToFinished:Wait()
    end

    -- Follow and collect egg
    local function followAndCollectEgg(humanoid, humanoidRootPart, targetPart)
        while isFinding and targetPart do
            local targetPosition = targetPart.Position + Vector3.new(0, 2, 0)
            humanoid:MoveTo(targetPosition)
            humanoid.MoveToFinished:Wait()

            if (humanoidRootPart.Position - targetPart.Position).magnitude < 5 then
                if targetPart:FindFirstChild("ClickDetector") then
                    fireclickdetector(targetPart.ClickDetector)
                end
                wait(0.8)
                moveToBobsArea(humanoid)
                break
            else
                if targetPart.Position.Y > humanoidRootPart.Position.Y then
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
                wait(0.1)
            end
        end
    end

    -- Move to target
    local function moveToTarget(humanoid, humanoidRootPart)
        while isFinding do
            local foundEgg = false

            -- Check for "Secret" egg first
            local secretEgg = game.Workspace:FindFirstChild("Eggs"):FindFirstChild("Secret")
            if secretEgg and not secretEgg:FindFirstChildOfClass("RopeConstraint") then
                foundEgg = true
                followAndCollectEgg(humanoid, humanoidRootPart, secretEgg)
            else
                -- If no "Secret" egg, check for other rarities
                for _, rarity in ipairs(eggRarities) do
                    if rarity ~= "Secret" then -- Skip "Secret" since it's already checked
                        local targetPart = game.Workspace:FindFirstChild("Eggs"):FindFirstChild(rarity)
                        if targetPart and not targetPart:FindFirstChildOfClass("RopeConstraint") then
                            foundEgg = true
                            followAndCollectEgg(humanoid, humanoidRootPart, targetPart)
                            break
                        end
                    end
                end
            end

            if not foundEgg then
                wait(1)
            end
        end

        humanoid.WalkSpeed = originalWalkSpeed
    end

    -- Start auto-find process
    local function startFinding()
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid, humanoidRootPart = initializeCharacter(character)

        if isFinding then
            moveToTarget(humanoid, humanoidRootPart)
        end
    end

    -- Infinite jump
    local function enableInfiniteJump()
        game:GetService("User InputService").JumpRequest:Connect(function()
            if isFinding then
                local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:ChangeState("Jumping")
                end
            end
        end)
    end

    -- Character respawn handling
    local function onCharacterAdded(character)
        character:WaitForChild("HumanoidRootPart") -- Ensure it's fully loaded
        wait(1) -- Small delay to prevent issues
        if isFinding then
            startFinding()
        end
    end

    -- Ensure CharacterAdded is always connected
    player.CharacterAdded:Connect(onCharacterAdded)

    -- Toggle function
    if value then
        isFinding = true
        startFinding()
        enableInfiniteJump()
    else
        isFinding = false
        if player.Character then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = originalWalkSpeed
            end
        end
    end
end)

local NOCLIP = false
local Plr = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

KillingCheats:CreateToggle("NoClip", function(value)
    NOCLIP = value -- Set NOCLIP to the value of the toggle
    if NOCLIP then
        -- Enable noclip
        local Stepped = RunService.Stepped:Connect(function()
            if NOCLIP then
                for _, part in pairs(Plr.Character:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            else
                Stepped:Disconnect()
            end
        end)
    else
        -- Disable noclip
        for _, part in pairs(Plr.Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end)

KillingCheats:CreateButton("Destroy All Obstacles", function()
    -- Get the workspace
    local workspace = game:GetService("Workspace")

    -- Define the path to the Cross Roads model
    local crossRoadsModel = workspace.Map:FindFirstChild("Cross Roads")

    -- List of models to destroy
    local modelsToDestroy = {
        "Paths",
        "Tower",
        "Tower2",
        "Walls",
        "BlackrockCastle",
        "ArchBridge"
    }

    -- Check if the Cross Roads model exists
    if crossRoadsModel then
        -- Iterate through the list of models to destroy
        for _, modelName in ipairs(modelsToDestroy) do
            local model = crossRoadsModel:FindFirstChild(modelName)
            
            -- Check if the model exists and destroy it
            if model then
                model:Destroy()
                print(modelName .. " has been destroyed.")
            else
                print(modelName .. " not found.")
            end
        end
    else
        print("Cross Roads model not found.")
    end

    -- Destroy the UGC Man if it exists
    local ugcMan = workspace:FindFirstChild("UGC Man")
    if ugcMan then
        ugcMan:Destroy()
        print("UGC Man has been destroyed.")
    else
        print("UGC Man not found.")
    end

    -- Destroy the Billboard if it exists
    local billboard = workspace:FindFirstChild("Billboard")
    if billboard then
        billboard:Destroy()
        print("Billboard has been destroyed.")
    else
        print("Billboard not found.")
    end
end)

local KillingCheats = PhantomForcesWindow:NewSection("Misc")

-- LocalScript to change character speed in Roblox with toggle

-- Get the player
local player = game.Players.LocalPlayer

-- Default speed
local defaultSpeed = 16
local boostedSpeed = 25

-- Function to change the character speed
local function changeSpeed(newSpeed)
    -- Wait for the character to load
    local character = player.Character or player.CharacterAdded:Wait()
    
    -- Wait for the Humanoid to be available
    local humanoid = character:WaitForChild("Humanoid")
    
    -- Change the WalkSpeed
    humanoid.WalkSpeed = newSpeed
end

-- Create a toggle for speed
KillingCheats:CreateToggle("Speed", function(value)
    if value then
        -- If toggle is on, set speed to boostedSpeed
        changeSpeed(boostedSpeed)
    else
        -- If toggle is off, reset speed to defaultSpeed
        changeSpeed(defaultSpeed)
    end
end)

-- Optional: Reset speed when the character respawns
player.CharacterAdded:Connect(function(character)
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = defaultSpeed -- Reset to default speed
end)

KillingCheats:CreateButton("Server Hop", function()
    local TeleportService = game:GetService("TeleportService")
    local HttpService = game:GetService("HttpService")
    local Players = game:GetService("Players")

    local placeId = game.PlaceId -- Automatically detect the place ID
    local player = Players.LocalPlayer

    -- Function to retrieve a list of active servers
    local function getServers(cursor)
        local url = "https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100"
        if cursor then
            url = url .. "&cursor=" .. cursor
        end

        local success, response = pcall(function()
            return HttpService:GetAsync(url)
        end)

        if success then
            local data = HttpService:JSONDecode(response)
            if data and data.data then
                return data.data, data.nextPageCursor
            else
                warn("⚠️ No server data received.")
            end
        else
            warn("❌ Failed to fetch server list. Error: " .. tostring(response))
        end

        return nil, nil
    end

    -- Function to find and join a new server
    local function hopServer()
        local cursor = nil
        local servers = {}
        
        repeat
            local newServers, nextCursor = getServers(cursor)
            if newServers then
                for _, server in ipairs(newServers) do
                    if server.id ~= game.JobId and server.playing < server.maxPlayers then
                        table.insert(servers, server.id)
                    end
                end
            end
            cursor = nextCursor
        until not cursor

        if #servers > 0 then
            local serverId = servers[math.random(1, #servers)]
            print("✅ Joining new server: " .. serverId)
            TeleportService:TeleportToPlaceInstance(placeId, serverId, player)
        else
            warn("❌ No available servers found.")
        end
    end

    -- Debugging Info
    print("🔄 Attempting to hop server...")
    print("📌 Current Place ID: " .. placeId)
    print("📌 Current Server ID: " .. game.JobId)

    -- Execute the server hop
    hopServer()
end)

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