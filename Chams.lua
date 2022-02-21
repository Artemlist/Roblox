RunService.RenderStepped:Connect(function()
    if BoogaHax.Local.Chams then
        for k,v in next, dwEntities:GetPlayers() do 
            if v ~= dwLocalPlayer then
                if v.Character and
                v.Character:FindFirstChild("HumanoidRootPart") and 
                v.Character:FindFirstChild("Humanoid") and 
                v.Character:FindFirstChild("Humanoid").Health ~= 0 then
                    if BoogaHax.Local.TeamCheck == false then
                        local char = v.Character 
                        for k,b in next, char:GetChildren() do 
                            if b:IsA("BasePart") and 
                            b.Transparency ~= 1 then
                                if BoogaHax.Local.Chams then
                                    if not b:FindFirstChild("Glow") and
                                    not b:FindFirstChild("Chams") then
                                        local chams_box = Instance.new("BoxHandleAdornment", b)
                                        chams_box.Name = "Chams"
                                        chams_box.AlwaysOnTop = true 
                                        chams_box.ZIndex = 4 
                                        chams_box.Adornee = b 
                                        chams_box.Color3 = BoogaHax.ColorData.Chams_Color
                                        chams_box.Transparency = BoogaHax.ColorData.Chams_Transparency
                                        chams_box.Size = b.Size + Vector3.new(0.02, 0.02, 0.02)

                                        local glow_box = Instance.new("BoxHandleAdornment", b)
                                        glow_box.Name = "Glow"
                                        glow_box.AlwaysOnTop = false 
                                        glow_box.ZIndex = 3 
                                        glow_box.Adornee = b 
                                        glow_box.Color3 = BoogaHax.ColorData.Chams_Glow_Color
                                        glow_box.Size = chams_box.Size + Vector3.new(0.13, 0.13, 0.13)
                                    end
                                else
                                    destroy_chams(char)
                                end
                            end
                        end
                    else
                        if v.Team == dwLocalPlayer.Team then
                            destroy_chams(v.Character)
                        end
                    end
                else
                    destroy_chams(v.Character)
                end
            end
        end
    else 
        for k,v in next, dwEntities:GetPlayers() do 
            if v ~= dwLocalPlayer and 
            v.Character and 
            v.Character:FindFirstChild("HumanoidRootPart") and 
            v.Character:FindFirstChild("Humanoid") and 
            v.Character:FindFirstChild("Humanoid").Health ~= 0 then
                destroy_chams(v.Character)
            end
        end
    end
end)
