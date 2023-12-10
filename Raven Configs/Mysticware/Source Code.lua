--Mysticware remake
--Thank you near for help to make it work
shared.RavenB4Started = true -- REQUIRED!!!!!!
shared.RavenConfigName = 'Mysticware' --Whatever your Config name is!
shared.WaterMark = "Mysticware Remake v1"
shared.WaterMarkColor = Color3.fromRGB(196, 73, 209)
--shared.RavenBlacklist = {"ahsf-ghjfk-ijrh-rtes-3thr"} you have to put a HWID of a player in this Whitelist Table to Whitelist them!
--shared.RavenWhitelist = {"ahsf-ghjfk-ijrh-rtes-3thr"} you have to put a HWID of a player in this Blacklist Table to blacklist them!

local RavenConfig = loadstring(game:HttpGet('https://raw.githubusercontent.com/goinglikeatrainlol/RavenB4Roblox/main/Raven%20Main%20Loader'))()
RavenConfig:createnotification("Mysticware Loaded!",5)

local Players = game:GetService("Players")
local lplr = Players.LocalPlayer
local gameCamera = game:GetService("Workspace").CurrentCamera
Utility:CreateToggle({
    Name = "InfiniteJump",
    Callback = function(Callback)
        if Callback then
        end
        game:GetService("UserInputService").JumpRequest:Connect(function()
            local localPlayer = game:GetService("Players").LocalPlayer
            local character = localPlayer.Character
            if character and character:FindFirstChildOfClass("Humanoid") then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                humanoid:ChangeState("Jumping")
            end
        end)  
end})
Utility:CreateToggle({
    Name = "Fly Loader",
    Callback = function(Callback)
        if Callback then
            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                loadstring(game:HttpGet(('https://pastebin.com/raw/h5QDPy6s'),true))()
                RavenConfig:createnotification("Flight Should Be Loaded Enjoy! -TheRealRed",5)
            end
        end
end})
function IsAlive(plr)
    plr = plr or lplr
    if not plr.Character then return false end
    if not plr.Character:FindFirstChild("Head") then return false end
    if not plr.Character:FindFirstChild("Humanoid") then return false end
    if plr.Character:FindFirstChild("Humanoid").Health < 0.11 then return false end
    return true
end
local AnimationPlayer = {Enabled = false}
local AnimationPlayerBox = {Value = "11335949902"}
local AnimationPlayerSpeed = {Speed = 1}
local playedanim
Utility:CreateToggle({
    Name = "InvisibleExploit",
    Callback = function(Callback)
        if Callback then 
            if IsAlive(lplr) then 
                if playedanim then 
                    playedanim:Stop() 
                    playedanim.Animation:Destroy()
                    playedanim = nil 
                end
                local anim = Instance.new("Animation")
                local suc, id = pcall(function() return string.match(game:GetObjects("rbxassetid://"..AnimationPlayerBox.Value)[1].AnimationId, "%?id=(%d+)") end)
                if not suc then
                    id = AnimationPlayerBox.Value
                end
                anim.AnimationId = "rbxassetid://"..id
                local suc, res = pcall(function() playedanim = lplr.character.Humanoid.Animator:LoadAnimation(anim) end)
                if suc then
                    lplr.Character.Humanoid.CameraOffset = Vector3.new(0, 3 / -2, 0)
                    lplr.Character.HumanoidRootPart.Size = Vector3.new(2, 3, 1.1)
                    
                    playedanim.Priority = Enum.AnimationPriority.Action4
                    playedanim.Looped = true
                    playedanim:Play()
                    playedanim:AdjustSpeed(0 / 10)
                    table.insert(AnimationPlayer.Connections, playedanim.Stopped:Connect(function()
                        if AnimationPlayer.Enabled then
                            AnimationPlayer.ToggleButton(false)
                            AnimationPlayer.ToggleButton(false)
                        end
                    end))
                else
                    RavenConfig:createnotification("failed to load anim : "..(res or "invalid animation id"),5)
                end
            end
            table.insert(AnimationPlayer.Connections, lplr.CharacterAdded:Connect(function()
                repeat task.wait() until IsAlive(lplr)
                task.wait(0.5)
                if playedanim then 
                    playedanim:Stop() 
                    playedanim.Animation:Destroy()
                    playedanim = nil 
                end
                local anim = Instance.new("Animation")
                local suc, id = pcall(function() return string.match(game:GetObjects("rbxassetid://"..AnimationPlayerBox.Value)[1].AnimationId, "%?id=(%d+)") end)
                if not suc then
                    id = AnimationPlayerBox.Value
                end
                anim.AnimationId = "rbxassetid://"..id
                local suc, res = pcall(function() playedanim = lplr.character.Humanoid.Animator:LoadAnimation(anim) end)
                if suc then
                    playedanim.Priority = Enum.AnimationPriority.Action4
                    playedanim.Looped = true
                    playedanim:Play()
                    playedanim:AdjustSpeed(AnimationPlayerSpeed.Value / 10)
                    playedanim.Stopped:Connect(function()
                        if AnimationPlayer.Enabled then
                            AnimationPlayer.ToggleButton(false)
                            AnimationPlayer.ToggleButton(false)
                        end
                    end)
                else
                    RavenConfig:createnotification("failed to load anim : "..(res or "invalid animation id"),5)
                end
            end))
        else
            if playedanim then playedanim:Stop() playedanim = nil end
        end
    end
})
GodMode = Utility:CreateToggle({
    Name = "GodMode",
    Callback = function(Callback)
        if Callback then
            spawn(function()
                while task.wait() do
                        for i, v in pairs(game:GetService("Players"):GetChildren()) do
                            if v.Team ~= lplr.Team and IsAlive(v) and IsAlive(lplr) then
                                if v and v ~= lplr then
                                    local TargetDistance = lplr:DistanceFromCharacter(v.Character:FindFirstChild("HumanoidRootPart").CFrame.p)
                                    if TargetDistance < 25 then
                                        if not lplr.Character.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity") then
                                            if not (v.Character.HumanoidRootPart.Velocity.Y < -10*5) then
                                                lplr.Character.Archivable = true
        
                                                local Clone = lplr.Character:Clone()
                                                Clone.Parent = workspace
                                                Clone.Head:ClearAllChildren()
                                                gameCamera.CameraSubject = Clone:FindFirstChild("Humanoid")
            
                                                for i,v in pairs(Clone:GetChildren()) do
                                                    if string.lower(v.ClassName):find("part") and v.Name ~= "HumanoidRootPart" then
                                                        v.Transparency = 1
                                                    end
                                                    if v:IsA("Accessory") then
                                                        v:FindFirstChild("Handle").Transparency = 1
                                                    end
                                                end
            
                                                lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + Vector3.new(0,100000,0)
            
                                                game:GetService("RunService").RenderStepped:Connect(function()
                                                    if Clone ~= nil and Clone:FindFirstChild("HumanoidRootPart") then
                                                        Clone.HumanoidRootPart.Position = Vector3.new(lplr.Character.HumanoidRootPart.Position.X, Clone.HumanoidRootPart.Position.Y, lplr.Character.HumanoidRootPart.Position.Z)
                                                    end
                                                end)
            
                                                task.wait(0.3)
                                                lplr.Character.HumanoidRootPart.Velocity = Vector3.new(lplr.Character.HumanoidRootPart.Velocity.X, -1, lplr.Character.HumanoidRootPart.Velocity.Z)
                                                lplr.Character.HumanoidRootPart.CFrame = Clone.HumanoidRootPart.CFrame
                                                gameCamera.CameraSubject = lplr.Character:FindFirstChild("Humanoid")
                                                Clone:Destroy()
                                                task.wait(0.15)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
            end)
        end
    end
})
Utility:CreateToggle({
    Name = "4BigGuysFastExploitV4",
    StartingState = true,
    Callback = function(Callback)
        if Callback then
            task.spawn(function()
                repeat
                    task.wait()
                    local args = {
                [1] = {
                    ["weapon"] = game:GetService("ReplicatedStorage"):WaitForChild("Inventories"):WaitForChild("lplr.Name"):WaitForChild("mythic_gauntlets"),
                    ["chargeRatio"] = 0
                }
            }

                game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("SwordSwingMiss"):FireServer(unpack(args))
                until not Callback
            end)
        end
    end
})
Render:CreateToggle({
    Name = "Mystic 32x", -- "Made by 4zze with love for MysticwWare <3"
    Callback = function(Callback)
        if Callback then
        RavenConfig:createnotification("Pack loaded! Reequip your weapon to see textures.",5)
        local Players = game:GetService("Players")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Workspace = game:GetService("Workspace")
        local objs = game:GetObjects("rbxassetid://15073101583")
        local import = objs[1]
        import.Parent = ReplicatedStorage
        local index = {
            {
                name = "wood_sword",
                offset = CFrame.Angles(math.rad(0), math.rad(-89), math.rad(-90)),
                model = import:WaitForChild("Wood_Sword"),
            },	
            {
                name = "stone_sword",
                offset = CFrame.Angles(math.rad(0), math.rad(-89), math.rad(-90)),
                model = import:WaitForChild("Stone_Sword"),
            },
            {
                name = "iron_sword",
                offset = CFrame.Angles(math.rad(0), math.rad(-89), math.rad(-90)),
                model = import:WaitForChild("Iron_Sword"),
            },
            {
                name = "diamond_sword",
                offset = CFrame.Angles(math.rad(0), math.rad(-89), math.rad(-90)),
                model = import:WaitForChild("Diamond_Sword"),
            },
            {
                name = "emerald_sword",
                offset = CFrame.Angles(math.rad(0), math.rad(-89), math.rad(-90)),
                model = import:WaitForChild("Emerald_Sword"),
            },
            {
                name = "wood_scythe",
                offset = CFrame.Angles(math.rad(0),math.rad(89),math.rad(-90)),
                model = import:WaitForChild("Wood_Scythe"),
            },
            {
                name = "stone_scythe",
                offset = CFrame.Angles(math.rad(0),math.rad(89),math.rad(-90)),
                model = import:WaitForChild("Stone_Scythe"),
            },
            {
                name = "iron_scythe",
                offset = CFrame.Angles(math.rad(0),math.rad(89),math.rad(-90)),
                model = import:WaitForChild("Iron_Scythe"),
            },
            {
                name = "diamond_scythe",
                offset = CFrame.Angles(math.rad(0),math.rad(89),math.rad(-90)),
                model = import:WaitForChild("Diamond_Scythe"),
            },
            {
                name = "diamond",
                offset = CFrame.Angles(math.rad(0), math.rad(-90), math.rad(90)),
                model = import:WaitForChild("Diamond"),
            },
            {
                name = "iron",
                offset = CFrame.Angles(math.rad(0), math.rad(-90), math.rad(90)),
                model = import:WaitForChild("Iron"),
            },
            {
                name = "emerald",
                offset = CFrame.Angles(math.rad(0), math.rad(-90), math.rad(90)),
                model = import:WaitForChild("Emerald"),
            },
}
        local func = Workspace.Camera.Viewmodel.ChildAdded:Connect(function(tool)	
            if not tool:IsA("Accessory") then return end	
            for _, v in ipairs(index) do	
                if v.name == tool.Name then		
                    for _, part in ipairs(tool:GetDescendants()) do
                        if part:IsA("BasePart") or part:IsA("MeshPart") or part:IsA("UnionOperation") then				
                            part.Transparency = 1
                        end			
                    end		
                    local model = v.model:Clone()
                    model.CFrame = tool:WaitForChild("Handle").CFrame * v.offset
                    model.CFrame *= CFrame.Angles(math.rad(0), math.rad(-50), math.rad(0))
                    model.Parent = tool			
                    local weld = Instance.new("WeldConstraint", model)
                    weld.Part0 = model
                    weld.Part1 = tool:WaitForChild("Handle")			
                    local tool2 = Players.LocalPlayer.Character:WaitForChild(tool.Name)			
                    for _, part in ipairs(tool2:GetDescendants()) do
                        if part:IsA("BasePart") or part:IsA("MeshPart") or part:IsA("UnionOperation") then				
                            part.Transparency = 1				
                        end			
                    end			
                    local model2 = v.model:Clone()
                    model2.Anchored = false
                    model2.CFrame = tool2:WaitForChild("Handle").CFrame * v.offset
                    model2.CFrame *= CFrame.Angles(math.rad(0), math.rad(-50), math.rad(0))
                    if v.name:match("rageblade") then
                        model2.CFrame *= CFrame.new(0.7, 0, -1)                           
                    elseif v.name:match("sword") or v.name:match("blade") then
                        model2.CFrame *= CFrame.new(.6, 0, -1.1) - Vector3.new(0, 0, -.3)
                    elseif v.name:match("axe") and not v.name:match("pickaxe") and v.name:match("diamond") then
                        model2.CFrame *= CFrame.new(.08, 0, -1.1) - Vector3.new(0, 0, -1.1)
                    elseif v.name:match("axe") and not v.name:match("pickaxe") and not v.name:match("diamond") then
                        model2.CFrame *= CFrame.new(-.2, 0, -2.4) + Vector3.new(0, 0, 2.12)
                    elseif v.name:match("scythe") then
                        model2.CFrame *= CFrame.new(-1.15, 0.2, -2.1)
                    elseif v.name:match("iron") then
                        model2.CFrame *= CFrame.new(0, -.24, 0)
                    elseif v.name:match("gold") then
                        model2.CFrame *= CFrame.new(0, .03, 0)
                    elseif v.name:match("diamond") then
                        model2.CFrame *= CFrame.new(0, .027, 0)
                    elseif v.name:match("emerald") then
                        model2.CFrame *= CFrame.new(0, .001, 0)
                    elseif v.name:match("telepearl") then
                        model2.CFrame *= CFrame.new(.1, 0, .1)
                    elseif v.name:match("bow") and not v.name:match("crossbow") then
                        model2.CFrame *= CFrame.new(-.29, .1, -.2)
                    elseif v.name:match("wood_crossbow") and not v.name:match("tactical_crossbow") then
                        model2.CFrame *= CFrame.new(-.6, 0, 0)
                    elseif v.name:match("tactical_crossbow") and not v.name:match("wood_crossbow") then
                        model2.CFrame *= CFrame.new(-.5, 0, -1.2)
                    else
                        model2.CFrame *= CFrame.new(.2, 0, -.2)
                    end
                    model2.Parent = tool2
                    local weld2 = Instance.new("WeldConstraint", model)
                    weld2.Part0 = model2
                    weld2.Part1 = tool2:WaitForChild("Handle")
                end
            end
        end)  
    end        
end})
shared.RavenB4Completed = true --- REQUIRED!!!!
