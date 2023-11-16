-- AN EXAMPLE OF HOW YOU CAN MAKE A CONFIG!
-- Execute this in ur executor and see what happens!
shared.RavenConfigName = 'Default Config' --Whatever your Config name is!
shared.WaterMark = "Random Config Name"
shared.WaterMarkColor = Color3.fromRGB(255,255,255)
--shared.RavenBlacklist = {"ahsf-ghjfk-ijrh-rtes-3thr"} you have to put a HWID of a player in this Whitelist Table to Whitelist them!
--shared.RavenWhitelist = {"ahsf-ghjfk-ijrh-rtes-3thr"} you have to put a HWID of a player in this Blacklist Table to blacklist them!

local RavenConfig = loadstring(game:HttpGet("https://raw.githubusercontent.com/goinglikeatrainlol/RavenB4Roblox/main/Raven%20Main%20Loader"))()

RavenConfig:createnotification("Config Support Loaded!",5)

--Tab = RavenConfig:CreateWindow("Name",Position,"IconId")

ModuleTest1 = Combat:CreateToggle({
    Name = "Test",
    Callback = function(Callback) 
        print(Callback)
end})
ModuleTest1:CreateInfo("Nice Test Button you got here!")
Blatant:CreateToggle({
    Name = "Test2",
    Callback = function(Callback) 
        print(Callback)
    end
})
ModuleTest2 = Render:CreateToggle({
    Name = "Test2",
    Callback = function(Callback) 
        print(Callback)
    end
})
ModuleTest2:CreateInfo("What's up?")
ModuleTest2:CreateSlider({
    Name = "Test3",
    Default = 10, -- works only when its the Player first time injecting Raven/Config, else the Ravens SaveSystem takes over!
    Min = 0,
    Max = 100,
    Callback = function(Callback) 
        print(Callback)
    end
})
FinalModule = Utility:CreateToggle({
    Name = "Final",
    StartingState = true,
    Callback = function(Callback) 
        print(Callback)
    end
})
FinalModule:CreateToggle({
    Name = "Final Mini Button",
    Callback = function(Callback) 
    print(Callback)
end})
