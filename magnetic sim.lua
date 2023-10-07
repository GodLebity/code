local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "God_Lebity | Magnetic Simulator", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local TpTab = Window:MakeTab({
	Name = "Upgrades",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local TeTab = Window:MakeTab({
	Name = "Teleport",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local EgTab = Window:MakeTab({
	Name = "Eggs",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local OthersTab = Window:MakeTab({
	Name = "Others",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local creTab = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddLabel("Note: Auto Collect Coins Made By ToraIsMe")

Tab:AddButton({
	Name = "Use This Script To Auto Collect Coins",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0Magnetic'))()
  	end    
})

_G.bam = true
function bam()
    while _G.bam == true do
        local args = {
    [1] = "buyallmagnets"
}

game:GetService("ReplicatedStorage"):WaitForChild("comm"):WaitForChild("re"):FireServer(unpack(args))
wait (0.5)
    end
end

Tab:AddToggle({
	Name = "Auto Buy Magnet",
	Default = false,
	Callback = function(Value)
		_G.bam = Value
            bam()
	end    
})

_G.speed = true
function speed()
    while _G.speed == true do
    local args = {
    [1] = "buyupgrade",
    [2] = "speed"
}

game:GetService("ReplicatedStorage"):WaitForChild("comm"):WaitForChild("re"):FireServer(unpack(args))
wait (0.2)
    end
end

TpTab:AddToggle({
	Name = "Auto Speed",
	Default = false,
	Callback = function(Value)
		_G.speed = Value
                speed()
	end    
})

_G.jump = true
function jump()
    while _G.jump == true do
    local args = {
    [1] = "buyupgrade",
    [2] = "jump"
}

game:GetService("ReplicatedStorage"):WaitForChild("comm"):WaitForChild("re"):FireServer(unpack(args))
wait (0.2)
    end
end

TpTab:AddToggle({
	Name = "Auto Jump",
	Default = false,
	Callback = function(Value)
		_G.jump = Value
                jump()
	end    
})

_G.coins = true
function coins()
    while _G.coins == true do
    local args = {
    [1] = "buyupgrade",
    [2] = "coins"
}

game:GetService("ReplicatedStorage"):WaitForChild("comm"):WaitForChild("re"):FireServer(unpack(args))
wait (0.2)
    end
end

TpTab:AddToggle({
	Name = "Auto Coins",
	Default = false,
	Callback = function(Value)
		_G.coins = Value
                coins()
	end    
})

_G.dm = true
function dm()
    while _G.dm == true do
    local args = {
    [1] = "buyupgrade",
    [2] = "diamonds"
}

game:GetService("ReplicatedStorage"):WaitForChild("comm"):WaitForChild("re"):FireServer(unpack(args))
wait (0.2)
    end
end

TpTab:AddToggle({
	Name = "Auto Diamonds",
	Default = false,
	Callback = function(Value)
		_G.dm = Value
                dm()
	end    
})

_G.sl = true
function sl()
    while _G.sl == true do
    local args = {
    [1] = "buyupgrade",
    [2] = "slots"
}

game:GetService("ReplicatedStorage"):WaitForChild("comm"):WaitForChild("re"):FireServer(unpack(args))
wait (0.2)
    end
end

TpTab:AddToggle({
	Name = "Auto Pet Storage",
	Default = false,
	Callback = function(Value)
		_G.sl = Value
                sl()
	end    
})

_G.peteq = true
function peteq()
    while _G.peteq == true do
    local args = {
    [1] = "buyupgrade",
    [2] = "pets"
}

game:GetService("ReplicatedStorage"):WaitForChild("comm"):WaitForChild("re"):FireServer(unpack(args))
wait (0.2)
    end
end

TpTab:AddToggle({
	Name = "Auto Pet Equips",
	Default = false,
	Callback = function(Value)
		_G.peteq = Value
                peteq()
	end    
})

_G.dbju = true
function dbju()
    while _G.dbju == true do
    local args = {
    [1] = "buyupgrade",
    [2] = "extradj"
}

game:GetService("ReplicatedStorage"):WaitForChild("comm"):WaitForChild("re"):FireServer(unpack(args))
wait (0.2)
    end
end

TpTab:AddToggle({
	Name = "Auto Double Jump",
	Default = false,
	Callback = function(Value)
		_G.dbju = Value
                dbju()
	end    
})

-- Define the default rebirth value
_G.srebirth = "1"

-- Define a table to store the rebirth prices
local selectrbprice = {
    ["1"] = 1,
    ["2"] = 2,
    ["5"] = 5,
    ["10"] = 10,
    ["25"] = 25,
    ["50"] = 50,
    ["100"] = 100,
    ["250"] = 250,
    ["500"] = 500,
    ["1K"] = 1000,
    ["5K"] = 5000,
    ["10K"] = 10000,
    ["50K"] = 50000,
    ["100K"] = 100000,
    ["500K"] = 500000,
    ["1M"] = 1000000,
    ["5M"] = 5000000,
    ["10M"] = 10000000,
    ["50M"] = 50000000,
    ["100M"] = 100000000,
    ["500M"] = 500000000,
    ["1B"] = 1000000000,
    ["5B"] = 5000000000,
    ["10B"] = 10000000000,
    ["50B"] = 50000000000,
    ["100B"] = 100000000000,
    ["500B"] = 500000000000,
    ["1T"] = 1000000000000,
    ["5T"] = 5000000000000,
    ["10T"] = 10000000000000,
    ["50T"] = 50000000000000,
    ["100T"] = 100000000000000,
    ["500T"] = 500000000000000
}

-- Initialize rb to false
_G.rb = false

function rb()
    while _G.rb do
        local args = {
            [1] = "rebirth",
            [2] = selectrbprice[_G.srebirth]
        }

        local comm = game:GetService("ReplicatedStorage"):WaitForChild("comm")
        local re = comm:WaitForChild("re")
        re:FireServer(unpack(args))
        wait(1)
    end
end

Tab:AddToggle({
    Name = "Auto Rebirth",
    Default = false,
    Callback = function(Value)
        _G.rb = Value
        if Value then
            rb()
        end
    end
})

Tab:AddDropdown({
    Name = "Rebirths",
    Default = "1",
    Options = {
        "1", "2", "5", "10", "25", "50", "100", "250", "500", "1K", "5K", "10K", "50K", "100K",
        "500K", "1M", "5M", "10M", "50M", "100M", "500M", "1B", "5B", "10B", "50B", "100B",
        "500B", "1T", "5T", "10T", "50T", "100T", "500T"
    },
    Callback = function(Value)
        _G.srebirth = Value
    end
})

-- Define the default teleport place
_G.stele = "Home"

-- Define the teleport places (reversed)
local teleportPlaces = {
    Home = "home",
    Forest = "forest",
    Snow = "snow",
    Beach = "beach",
    Ocean = "ocean",
    Space = "space",
    Graveyard = "graveyard",
    Volcano = "volcano",
    Heaven = "heaven",
    Enchanted = "enchanted",
    Crystal = "crystal",
    ["Redwood Forest"] = "redwood",
    ["Magic Sea"] = "msea",
    ["Samurai Island"] = "samurai",
    ["Sun Island"] = "sun"
}

TeTab:AddButton({
    Name = "Teleport",
    Callback = function()
        local teleportName = _G.stele
        local destination = teleportPlaces[teleportName]

        if destination then
            local teleport = workspace.teleports:FindFirstChild(destination)

            if teleport then
                -- Assuming you want to teleport the player to the CFrame of the teleport part
                game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(teleport.CFrame)
            else
                warn("Teleport destination not found:", destination)
            end
        else
            warn("Invalid teleport place:", teleportName)
        end
    end
})

TeTab:AddDropdown({
    Name = "Map",
    Default = "Home",
    Options = {
        "Home", "Forest", "Snow", "Beach", "Ocean", "Space", "Graveyard", "Volcano", "Heaven",
        "Enchanted", "Crystal", "Redwood Forest", "Magic Sea", "Samurai Island", "Sun Island"
    },
    Callback = function(Value)
        _G.stele = Value
    end
})

_G.suprb = true
function suprb()
    while _G.suprb == true do
        local args = {
    [1] = "superrebirth"
}

game:GetService("ReplicatedStorage"):WaitForChild("comm"):WaitForChild("re"):FireServer(unpack(args))
wait (1)
    end
end

Tab:AddToggle({
	Name = "Auto Super Rebirth",
	Default = false,
	Callback = function(Value)
		_G.suprb = Value
            suprb()
	end    
})

-- Define a table to map egg values to their names
local eggNames = {
    ["250"] = "Common Egg",
    ["1K"] = "Uncommon Egg",
    ["7.2K"] = "Grass Egg",
    ["250K"] = "Snow Egg",
    ["1.25M"] = "Coconut Egg",
    ["15M"] = "Oceanic Egg",
    ["250M"] = "Universal Egg",
    ["25B"] = "Radioactive Egg",
    ["500B"] = "Magma Egg",
    ["37.5T"] = "Godly Egg",
    ["Enchanted 100M"] = "Storm Egg",
    ["Enchanted 1B"] = "Abyssal Egg",
    ["Enchanted 100B"] = "Crystal Egg",
    ["Enchanted 500B"] = "Redwood Egg",
    ["Enchanted 1T"] = "Magic Sea Egg",
    ["Enchanted 50T"] = "Samurai Egg",
    ["Enchanted 500T"] = "Sun Egg"
}

-- Define the default autofarm value
_G.oppet = false
_G.selectedEggValue = "250"

-- Function to auto open eggs
function oppet()
    while _G.oppet do
        local selectedEggName = eggNames[_G.selectedEggValue] -- Get the mapped egg name

        local args = {
            [1] = "buyegg",
            [2] = selectedEggName -- Use the mapped egg name
        }

        game:GetService("ReplicatedStorage"):WaitForChild("comm"):WaitForChild("rf"):InvokeServer(unpack(args))
        wait(1)
    end
end

-- Add a toggle button to control auto opening
EgTab:AddToggle({
    Name = "Auto Open",
    Default = false,
    Callback = function(Value)
        _G.oppet = Value
        if Value then
            oppet()
        end
    end
})

-- Add a dropdown to select the egg
EgTab:AddDropdown({
    Name = "Egg",
    Default = "250",
    Options = {
        "250", "1K", "7.2K", "250K", "1.25M", "15M", "250M", "25B",
        "500B", "37.5T", "Enchanted 100M", "Enchanted 1B", "Enchanted 100B", "Enchanted 500B", "Enchanted 1T",
        "Enchanted 50T", "Enchanted 500T"
    },
    Callback = function(Value)
        _G.selectedEggValue = Value -- Store the selected egg value
    end
})

OthersTab:AddButton({
	Name = "Anit-Afk",
	Callback = function()
for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do
   v:Disable()
end
  	end    
})

OthersTab:AddButton({
	Name = "Server Hop",
	Callback = function()
local Servers = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/14927327475/servers/Public?sortOrder=Asc&limit=100"))
for i,v in pairs(Servers.data) do
  if v.playing ~= v.maxPlayers then
      game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, v.id)
  end
end
  	end    
})

OthersTab:AddButton({
	Name = "Small Server",
	Callback = function()
      		local Http = game:GetService("HttpService")
local TPS = game:GetService("TeleportService")
local Api = "https://games.roblox.com/v1/games/"

local _place = game.PlaceId
local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
function ListServers(cursor)
   local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
   return Http:JSONDecode(Raw)
end

local Server, Next; repeat
   local Servers = ListServers(Next)
   Server = Servers.data[1]
   Next = Servers.nextPageCursor
until Server

TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
  	end    
})

creTab:AddLabel("Credit: sad.bc.no.friend#2464")