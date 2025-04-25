local hitboxSizeIncrease = Vector3.new(5, 5, 5) -- Adjust the size increase
local duration = 5 -- How long the hitbox stays enlarged

local function enlargeHitbox(opponent)
    if opponent and opponent:FindFirstChild("HumanoidRootPart") then
        local rootPart = opponent.HumanoidRootPart
        local originalSize = rootPart.Size

        -- Enlarge hitbox
        rootPart.Size = originalSize + hitboxSizeIncrease
        rootPart.Transparency = 0.5 -- Optional: Make hitbox more visible
        rootPart.Material = Enum.Material.Neon -- Optional: Visual effect

        -- Reset after duration
        wait(duration)
        rootPart.Size = originalSize
        rootPart.Transparency = 1 -- Reset visibility
        rootPart.Material = Enum.Material.Plastic -- Reset material
    end
end

-- Trigger the hitbox effect
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        if character then
            -- Example: Apply enlarged hitbox when slapped
            character.Humanoid.Touched:Connect(function(hit)
                local opponent = hit.Parent
                if opponent:FindFirstChild("Humanoid") then
                    enlargeHitbox(opponent)
                end
            end)
        end
    end)
end)
