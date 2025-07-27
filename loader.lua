--  Script de Vuelo by 🐉𝙉𝙚𝙤𝙏𝙤𝙆𝙮𝙤 𝘽𝙚𝙖𝙩𝙨🐲

repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character
local plr = game.Players.LocalPlayer
local char = plr.Character
local humanoid = char:WaitForChild("Humanoid")
local hrp = char:WaitForChild("HumanoidRootPart")

local flying = false
local bv = Instance.new("BodyVelocity", hrp)
bv.MaxForce = Vector3.new()
bv.Velocity = Vector3.new()

local UIS = game:GetService("UserInputService")
local camera = workspace.CurrentCamera

local speed = 60

function toggleFly()
    flying = not flying
    if flying then
        bv.MaxForce = Vector3.new(100000, 100000, 100000)
        game:GetService("RunService").Heartbeat:Connect(function()
            if flying then
                local dir = Vector3.zero
                if UIS:IsKeyDown(Enum.KeyCode.W) then
                    dir += camera.CFrame.LookVector
                end
                if UIS:IsKeyDown(Enum.KeyCode.S) then
                    dir -= camera.CFrame.LookVector
                end
                if UIS:IsKeyDown(Enum.KeyCode.A) then
                    dir -= camera.CFrame.RightVector
                end
                if UIS:IsKeyDown(Enum.KeyCode.D) then
                    dir += camera.CFrame.RightVector
                end
                if UIS:IsKeyDown(Enum.KeyCode.Space) then
                    dir += camera.CFrame.UpVector
                end
                if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then
                    dir -= camera.CFrame.UpVector
                end
                bv.Velocity = dir.Unit * speed
            end
        end)
    else
        bv.Velocity = Vector3.zero
        bv.MaxForce = Vector3.zero
    end
end

UIS.InputBegan:Connect(function(key, gpe)
    if gpe then return end
    if key.KeyCode == Enum.KeyCode.E then
        toggleFly()
        print("🟢 Vuelo activado.")
    elseif key.KeyCode == Enum.KeyCode.Q then
        toggleFly()
        print("🔴 Vuelo desactivado.")
    end
end)

-- 🧩 Mensaje
game.StarterGui:SetCore("ChatMakeSystemMessage", {
    Text = "✅ Vuelo listo. Pulsa E para volar, Q para parar.";
    Color = Color3.fromRGB(0,255,0);
})
