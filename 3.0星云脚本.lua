local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local LBLG = Instance.new("ScreenGui", getParent)
local LBL = Instance.new("TextLabel", getParent)
local player = game.Players.LocalPlayer

LBLG.Name = "LBLG"
LBLG.Parent = game.CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true
LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundColor3 = Color3.new(1, 1, 1)
LBL.BackgroundTransparency = 1
LBL.BorderColor3 = Color3.new(0, 0, 0)
LBL.Position = UDim2.new(0.75,0,0.010,0)
LBL.Size = UDim2.new(0, 133, 0, 30)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "TextLabel"
LBL.TextColor3 = Color3.new(1, 1, 1)
LBL.TextScaled = true
LBL.TextSize = 14
LBL.TextWrapped = true
LBL.Visible = true

local FpsLabel = LBL
local Heartbeat = game:GetService("RunService").Heartbeat
local LastIteration, Start
local FrameUpdateTable = { }

local function HeartbeatUpdate()
	LastIteration = tick()
	for Index = #FrameUpdateTable, 1, -1 do
		FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
	end
	FrameUpdateTable[1] = LastIteration
	local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
	CurrentFPS = CurrentFPS - CurrentFPS % 1
	FpsLabel.Text = ("北京时间:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S"))
end
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)
local Window = OrionLib:MakeWindow({Name = "星云脚本", HidePremium = false, SaveConfig = true,IntroText = "星云脚本", ConfigFolder = "星云脚本"})

local about = Window:MakeTab({
    Name = "星云制作",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
about:AddParagraph("作者Q:3369370682")
about:AddParagraph("作者:云.")
about:AddParagraph("更新以及反馈QQ群:834451572")


OrionLib:MakeNotification({
	Name = "脚本",
	Content = "欢迎使用脚本",
	Image = "rbxassetid://4483345998",
	Time = 2
})

local other = Window:MakeTab({
    Name = "人物/通用",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddSlider({
	Name = "速度",
	Min = 16,
	Max = 200,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "数值",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})
Tab:AddSlider({
	Name = "跳跃高度",
	Min = 50,
	Max = 200,
	Default = 50,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "数值",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end    
})
Tab:AddTextbox({
	Name = "跳跃高度设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end
})
Tab:AddTextbox({
	Name = "移动速度设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end
})
Tab:AddTextbox({
	Name = "血量设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.Health = Value
	end
})
Tab:AddTextbox({
	Name = "范围修改",
	Default = "",
	TextDisappear = true,
	Callback = function(value)
	  print(value)
_G.HeadSize = value
_G.Disabled = true
game:GetService('RunService').RenderStepped:connect(function()
if _G.Disabled then
for i,v in next, game:GetService('Players'):GetPlayers() do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
v.Character.HumanoidRootPart.Transparency = 0.7
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
v.Character.HumanoidRootPart.Material = "Neon"
v.Character.HumanoidRootPart.CanCollide = false
end)
end
end
end
end)
   end
})

Tab:AddButton({
	Name = "键盘",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
end
})
Tab:AddToggle({
	Name = "夜视",
	Default = false,
	Callback = function(Value)
		if Value then
		    game.Lighting.Ambient = Color3.new(1, 1, 1)
		else
		    game.Lighting.Ambient = Color3.new(0, 0, 0)
		end
	end
})
Tab:AddButton({
	Name = "IY指令",
	Callback = function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
end
})

Tab:AddButton({
	Name = "汽车飞行",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/VRVxqGAE"))()
end
})
Tab:AddButton({
	Name = "点击传送工具",
	Callback = function()
mouse = game.Players.LocalPlayer:GetMouse() tool = Instance.new("Tool") tool.RequiresHandle = false tool.Name = "[FE] TELEPORT TOOL" tool.Activated:connect(function() local pos = mouse.Hit+Vector3.new(0,2.5,0) pos = CFrame.new(pos.X,pos.Y,pos.Z) game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos end) tool.Parent = game.Players.LocalPlayer.Backpack
	end
})
Tab:AddButton({
	Name = "无限跳跃",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/4jbsfvwH"))()
end
})
Tab:AddButton({
	Name = "范围",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/eWH26KPn"))()
end
})

Tab:AddButton({
	Name = "空中行走",
	Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
end
})
Tab:AddButton({
    Name = "爬墙",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
end
})

Tab:AddToggle({
	Name = "穿墙",
	Default = false,
	Callback = function(Value)
		if Value then
		    Noclip = true
		    Stepped = game.RunService.Stepped:Connect(function()
			    if Noclip == true then
				    for a, b in pairs(game.Workspace:GetChildren()) do
                        if b.Name == game.Players.LocalPlayer.Name then
                            for i, v in pairs(game.Workspace[game.Players.LocalPlayer.Name]:GetChildren()) do
                                if v:IsA("BasePart") then
                                    v.CanCollide = false
                                end
                            end
                        end
                    end
			    else
				    Stepped:Disconnect()
			    end
		    end)
	    else
		    Noclip = false
	    end
	end
})

Tab:AddButton({
	Name = "透视3",
	Callback = function()
loadstring(game:GetObjects("rbxassetid://10092697033")[1].Source)()
	end 
})

Tab:AddButton({
	Name = "透视",
	Callback = function()
local esp_settings = { 
    textsize = 8,
    colour = 255,255,255
}
 
local gui = Instance.new("BillboardGui")
local esp = Instance.new("TextLabel",gui)
 
 
 
gui.Name = "Cracked esp";
gui.ResetOnSpawn = false
gui.AlwaysOnTop = true;
gui.LightInfluence = 0;
gui.Size = UDim2.new(1.75, 0, 1.75, 0);
esp.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
esp.Text = ""
esp.Size = UDim2.new(0.0001, 0.00001, 0.0001, 0.00001);
esp.BorderSizePixel = 4;
esp.BorderColor3 = Color3.new(esp_settings.colour)
esp.BorderSizePixel = 0
esp.Font = "GothamSemibold"
esp.TextSize = esp_settings.textsize
esp.TextColor3 = Color3.fromRGB(esp_settings.colour) -- text colour
 
game:GetService("RunService").RenderStepped:Connect(function()
    for i,v in pairs (game:GetService("Players"):GetPlayers()) do
        if v ~= game:GetService("Players").LocalPlayer and v.Character.Head:FindFirstChild("Cracked esp")==nil  then
            esp.Text = "{"..v.Name.."}"
            gui:Clone().Parent = v.Character.Head
    end
end
end)
   end
})

Tab:AddButton({
	Name = "飞行V3",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/sRYn4RJ0"))()
end
})

player:AddButton({ 
	Name = "光影(浅)",
	Callback = function()
      	loadstring(game:HttpGet("https://pastebin.com/raw/jHBfJYmS"))()
  	end
})
player:AddButton({ 
	Name = "光影(深)",
	Callback = function()
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
  	end
})

local other = Window:MakeTab({
    Name = "其他脚本",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
	Name = "星月交辉",
	Callback = function()
	local SCC_CharPool={
[1]= tostring(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,116,97,110,103,120,105,97,110,99,104,117,47,53,53,48,87,95,86,51,47,109,97,105,110,47,53,53,48,87,95,86,51,46,116,120,116})end)()))}
--星月交辉 V3 模块加载
loadstring(game:HttpGet(SCC_CharPool[1]))()
	end
})

Tab:AddButton({
	Name = "白",
	Callback = function()
	_G["白脚本作者修狗"]="xdjhadgdsrfcyefjhsadcctyseyr6432478rudghfvszhxcaheey"loadstring(game:HttpGet(('https://raw.githubusercontent.com/wev666666/baijiaobengV2.0beta/main/%E7%99%BD%E8%84%9A%E6%9C%ACbeta'),true))() 
	end
})

Tab:AddButton({
    Name = "秋",
    Callback = function()
    local SCC_CharPool={
[1]= tostring(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,87,83,56,53,55,57,54,48,47,45,47,109,97,105,110,47,37,69,55,37,65,55,37,56,66,37,67,50,37,66,55,37,69,56,37,56,55,37,65,65,37,69,53,37,56,56,37,66,54,37,69,56,37,56,52,37,57,65,37,69,54,37,57,67,37,65,67,37,69,54,37,57,54,37,66,48,37,69,54,37,66,65,37,57,48,37,69,55,37,65,48,37,56,49,46,116,120,116})end)()))}
loadstring(game:HttpGet(SCC_CharPool[1]))()
    end
})

Tab:AddButton({
    Name = "杯脚本",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/zuohongjian/bjb/main/bjb"))()
    end
})

Tab:AddButton({
    Name = "核脚本",
    Callback = function()
    getgenv().he="作者鱼"loadstring(game:HelpGet("https://pastebin.com/raw/2WmdapD2"))()
    end
})

Tab:AddButton({
    Name = "剑客v4",
    Callback = function()
   jianke_V4 = "作者_初夏"jianke__V4 = "作者QQ1412152634"jianke___V4 = "剑客QQ群347724155"loadstring(game:HttpGet(('https://shz.al/~JianKeV4')))()
    end
})

Tab:AddButton({
    Name = "XC，卡密a",
    Callback = function()
    getgenv().XC="作者XC"loadstring(game:HttpGet("https://pastebin.com/raw/PAFzYx0F"))()
    end
})

Tab:AddButton({
    Name = "阿尔宙斯",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20X%20V3"))()
    end
})

Tab:AddButton({
    Name = "忍脚本",
    Callback = function()
    getgenv().ren666 = "忍脚本，加载时间长请耐心"loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,90,77,115,67,56,114,104,114})end)())))();
    end
})

Tab:AddButton({
    Name = "神光脚本",
    Callback = function()
    loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,56,102,50,76,99,113,113,80})end)())))()
    end
})

Tab:AddButton({
    Name = "青脚本",
    Callback = function()
    loadstring(game:HttpGet('https://rentry.co/ct293/raw'))()
    end
})

Tab:AddButton({
    Name = "脚本中心",
    Callback = function()
    loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\103\101\109\120\72\119\65\49"))()
    end
})

Tab:AddButton({
    Name = "鸭hub",
    Callback = function()
    loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,81,89,49,113,112,99,115,106})end)())))()
    end
})

Tab:AddButton({
	Name = "青蛙",
	Callback = function()
   
getgenv().eom = "青蛙"
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\39\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\68\122\120\115\81\82\68\85\39\41\41\40\41")()
    end
})

Tab:AddButton({
	Name = "地岩",
	Callback = function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\98\98\97\109\120\98\98\97\109\120\98\98\97\109\120\47\99\111\100\101\115\112\97\99\101\115\45\98\108\97\110\107\47\109\97\105\110\47\37\69\55\37\57\57\37\66\68\34\41\41\40\41")()
    end
})

Tab:AddButton({
    Name = "冰",
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/GR4ChWKv"))()
    end
})

local other = Window:MakeTab({
    Name = "刀刃球",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
	Name = "刀刃球 自动格挡",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3ABlade%20Ball%20Parry%20V4.0.0",true))()
	end
})

Tab:AddButton({
	Name = "红圈格挡",
	Callback = function()
	loadstring(game:HttpGet("https://shz.al/~xiaoye/red⭕️AutoBlock.txt"))()
	end
})

local other = Window:MakeTab({
    Name = "DOORS",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
	Name = "KING DOORS",
	Callback = function()
--credits to the owner--
loadstring(game:HttpGet(('https://pastebin.com/raw/R8QMbhzv')))()
end
})    
Tab:AddButton({
	Name = "MS DOORS",
	Callback = function()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/mstudio45/poopdoors_edited/main/poopdoors_edited.lua"),true))()
end
})

Tab:AddButton({
	Name = "最强脚本(汉化)",
	Callback = function()
	loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\103\101\109\120\72\119\65\49"))()
	end
})

Tab:AddButton({

	Name = "DX夜",

	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/DXuwu/test-lol/main/YO.lua"))()

	end

})

Tab:AddButton({

	Name = "脚本",

	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Doors"))()

	end

})

Tab:AddButton({

	Name = "超级脚本",

	Callback = function()

loadstring(game: HttpGet("https://raw.githubusercontent.com/Fazedrab/EntitySpawner/main/doors(orionlib).lua"))()

end

})

Tab:AddButton({

	Name = "修改",

	Callback = function()

loadstring(game:HttpGet"https://raw.githubusercontent.com/sponguss/Doors-Entity-Replicator/main/source.lua")()

	end

})

Tab:AddButton({

    Name="微山doors",

    Callback=function()

        --微山doors 2.3.2(愚人节快乐)

loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\117\72\72\112\56\102\122\83"))()

    end

})

Tab:AddButton({

    Name="ms要白名单",

    Callback=function()

        loadstring(game:HttpGet('https://raw.githubusercontent.com/zoophiliaphobic/POOPDOORS/main/script.lua'))()

    end

})

Tab:AddButton({

    Name="我的",

    Callback=function()

        loadstring(game:HttpGet("https://pastebin.com/raw/QsCas0t3"))()

    end

})

Tab:AddButton({

    Name="云doors",

    Callback=function()

        loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/EntitySpawner/main/doors(orionlib).lua"))()

    end

})

Tab:AddButton({

	Name = "最不强",

	Callback = function()

     loadstring(game:HttpGet(('https://pastebin.com/raw/R8QMbhzv')))()

  	end    

})

Tab:AddButton({

    Name="白",

    Callback=function()

        _G["白脚本作者修狗"]="xdjhadgdsrfcyefjhsadcctyseyr6432478rudghfvszhxcaheey"loadstring(game:HttpGet(('https://raw.githubusercontent.com/wev666666/baijiaobengV2.0beta/main/%E7%99%BD%E8%84%9A%E6%9C%ACbeta'),true))()

    end

})

local other = Window:MakeTab({
    Name = "BACK DOORS",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
	Name = "云汉化",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/dss3144/backdoor/main/backdoor.lua"))()
	end
})

local Tab = Window:MakeTab({
    Name = "进击的僵尸",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
	Name = "自动传送僵尸",
	Callback = function()
	local groundDistance = 8
local Player = game:GetService("Players").LocalPlayer
local function getNearest()
local nearest, dist = nil, 99999
for _,v in pairs(game.Workspace.BossFolder:GetChildren()) do
if(v:FindFirstChild("Head")~=nil)then
local m =(Player.Character.Head.Position-v.Head.Position).magnitude
if(m<dist)then
dist = m
nearest = v
end
end
end
for _,v in pairs(game.Workspace.enemies:GetChildren()) do
if(v:FindFirstChild("Head")~=nil)then
local m =(Player.Character.Head.Position-v.Head.Position).magnitude
if(m<dist)then
dist = m
nearest = v
end
end
end
return nearest
end
_G.farm2 = true
Player.Chatted:Connect(function(m)
if(m==";autofarm false")then
_G.farm2 = false
elseif(m==";autofarm true")then
_G.farm2 = true
end
end)
_G.globalTarget = nil
game:GetService("RunService").RenderStepped:Connect(function()
if(_G.farm2==true)then
local target = getNearest()
if(target~=nil)then
game:GetService("Workspace").CurrentCamera.CFrame = CFrame.new(game:GetService("Workspace").CurrentCamera.CFrame.p, target.Head.Position)
Player.Character.HumanoidRootPart.CFrame = (target.HumanoidRootPart.CFrame * CFrame.new(0, groundDistance, 9))
_G.globalTarget = target
end
end
end)
spawn(function()
while wait() do
game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
game.Players.LocalPlayer.Character.Torso.Velocity = Vector3.new(0,0,0)
end
end)
while wait() do
if(_G.farm2==true and _G.globalTarget~=nil and _G.globalTarget:FindFirstChild("Head") and Player.Character:FindFirstChildOfClass("Tool"))then
local target = _G.globalTarget
game.ReplicatedStorage.Gun:FireServer({["Normal"] = Vector3.new(0, 0, 0), ["Direction"] = target.Head.Position, ["Name"] = Player.Character:FindFirstChildOfClass("Tool").Name, ["Hit"] = target.Head, ["Origin"] = target.Head.Position, ["Pos"] = target.Head.Position,})
wait()
end
end
   end
})

local Tab = Window:MakeTab({
    Name = "鱿鱼游戏",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false

})

Tab:AddButton({
	Name = "成为主持人",
	Callback = function()
	local args = {
    [1] = true
}

game:GetService("ReplicatedStorage"):WaitForChild("FrontmanRemotes"):WaitForChild("BecomeFrontman"):InvokeServer(unpack(args))
	end
})

Tab:AddButton({
	Name = "成为守卫",
	Callback = function()
	local args = {
    [1] = true
}

game:GetService("ReplicatedStorage"):WaitForChild("GuardRemotes"):WaitForChild("BecomeGuard"):InvokeServer(unpack(args))
    end
})

local Tab = Window:MakeTab({
    Name = "枪战竞技场",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false

})

Tab:AddButton({
	Name = "子弹追踪",
	Callback = function()
	loadstring(game:HttpGet("https://pastefy.app/8IhcfZc2/raw"))()
	end
})

local Tab = Window:MakeTab({
    Name = "扫雪模拟器",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false

})

Tab:AddToggle({
	Name = "自动收集雪",
	Default = false,
	Callback = function(Value)
	toggle = Value
while toggle do wait()
local args = {
    [1] = workspace:WaitForChild("HitParts"):WaitForChild("Snow1"),
    [2] = "Snow1",
    [3] = "MagicWand"
}

game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("e8eGb8RgRXFcug8q"):FireServer(unpack(args))
    end
  end
})

local Tab = Window:MakeTab({
    Name = "Race Clicker",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false

})

Tab:AddToggle({
	Name = "自动获胜",
	Default = false,
	Callback = function(state)
	task.spawn(function()
        Settings.Win = state
        while true do
            if not Settings.Win then return end

            if LocalPlayer.PlayerGui.TimerUI.RaceTimer.Visible then                    
                LocalPlayer.Character:PivotTo(LocalPlayer.Character:GetPivot() +  Vector3.new(50000, 0, 0))
            end

            task.wait()
        end
      end)
  end
})

Tab:AddToggle({
	Name = "自动重生",
	Default = false,
	Callback = function(state)
	task.spawn(function()
        Settings.Rebirth = state
        while true do
            if not Settings.Rebirth then return end

            ReplicatedStorage.Packages.Knit.Services.RebirthService.RF.Rebirth:InvokeServer()
            task.wait(5)
        end
     end)
  end
})

local Tab = Window:MakeTab({
        Name = "地狱之塔",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
})

local Section = Tab:AddSection({
        Name = "主要功能"
})

Tab:AddButton({
        Name = "反作弊(必开)",
        Callback = function()
        local reg = getreg()

        for i, Function in next, reg do
            if type(Function) == 'function' then
                local info = getinfo(Function)

                if info.name == 'kick' then
                    if (hookfunction(info.func, function(...)end)) then
                        print'succesfully hooked kick'
                    else
                        print'failed to hook kick'
                    end
                end
            end
        end
        local playerscripts = game:GetService'Players'.LocalPlayer.PlayerScripts

        local script1 = playerscripts.LocalScript
        local script2 = playerscripts.LocalScript2

        local script1signal = script1.Changed
        local script2signal = script2.Changed

        for i, connection in next, getconnections(script1signal) do
            connection:Disable()
        end
        for i, connection in next, getconnections(script2signal) do
            connection:Disable()
        end

        script1:Destroy()
        script2:Destroy()    
          end    
})

Tab:AddButton({
        Name = "给所有物品",
        Callback = function()
        for _,e in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
            if e:IsA("Tool") then
            e:Destroy()
            end
            end
            wait() 
            for _,v in pairs(game.ReplicatedStorage.Gear:GetDescendants()) do
            if v:IsA("Tool") then
            local CloneThings = v:Clone()
            wait()
            CloneThings.Parent = game.Players.LocalPlayer.Backpack

            end
            end
          end    
})

Tab:AddButton({
        Name = "传送地点",
        Callback = function()
        local endzone = game.Workspace.tower.sections.finish.FinishGlow.CFrame

        local player = game.Players.LocalPlayer.Character
        player.HumanoidRootPart.CFrame = endzone
          end    
})

Tab:AddButton({
        Name = "无敌模式",
        Callback = function()
        for i,v in pairs(game:GetService("Workspace").tower:GetDescendants()) do
            if v:IsA("BoolValue") and v.Name == "kills" then
                v.Parent:Destroy()
            end
        end
          end    
})

local Tab = Window:MakeTab({
    Name = "宠物模拟器99",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false

})

Tab:AddToggle({
	Name = "自动收集",
	Default = false,
	Callback = function(state)
	_G.test = (state and true or false)
while _G.test do
    wait()
if workspace.__THINGS.Lootbags:FindFirstChildOfClass("Model") then
for i,v in pairs(workspace.__THINGS.Lootbags:GetChildren()) do
if v.ClassName == "Model" then
local test = v:FindFirstChildOfClass("MeshPart") or v:FindFirstChildOfClass("Part")
test.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end
end
elseif workspace.__THINGS.Orbs:FindFirstChildOfClass("Part") then
    for i,v in pairs(workspace.__THINGS.Orbs:GetChildren()) do
        if v.ClassName == "Part" then
            v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        end
    end
end
end
   end
})

Tab:AddToggle({
	Name = "自动农场",
	Default = false,
	Callback = function(state)
	_G.test2 = (state and true or false)
    _G.range = 100
    while _G.test2 do
    task.wait()
    pcall(function()
    for i,v in pairs(workspace.__THINGS.Breakables:GetChildren()) do
        if v.ClassName == "Model" and game:GetService("Players").LocalPlayer:DistanceFromCharacter(v:GetChildren()[1].Position) < _G.range  then
            print(v.PrimaryPart)
    game:GetService("ReplicatedStorage").Network.Breakables_PlayerDealDamage:FireServer(v.Name)
    task.wait()
        end
    end
    end)
    end
    end
})

Tab:AddToggle({
	Name = "自动领取排名奖励",
	Default = false,
	Callback = function(state)
	_G.reward = (state and true or false)
while _G.reward do 
    wait()
for i=1,32 do
game:GetService("ReplicatedStorage").Network.Ranks_ClaimReward:FireServer(i)
task.wait(0.1)
end
end
   end
})

local Tab = Window:MakeTab({
    Name = "战争机器",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false

})

Tab:AddButton({
	Name = "自动刷钱",
	Callback = function()
	loadstring(game:HttpGet("https://pastefy.app/vpmdmspX/raw"))()
	end
})

local Tab = Window:MakeTab({
    Name = "杀手VS警长",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false

})

Tab:AddButton({
	Name = "范围",
	Callback = function()
	_G.HeadSize = 20
    _G.Disabled = true
game:GetService('RunService').RenderStepped:connect(function()
if _G.Disabled then
for i,v in next, game:GetService('Players'):GetPlayers() do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
v.Character.HumanoidRootPart.Transparency = 0.7
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
v.Character.HumanoidRootPart.Material = "Neon"
v.Character.HumanoidRootPart.CanCollide = false
end)
end
end
end
end)
   end
})

Tab:AddButton({
	Name = "飞行",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
	end
})

Tab:AddButton({
	Name = "加速",
	Callback = function()
	function isNumber(str)
  if tonumber(str) ~= nil or str == 'inf' then
    return true
  end
end
local tspeed = 1
local hb = game:GetService("RunService").Heartbeat
local tpwalking = true
local player = game:GetService("Players")
local lplr = player.LocalPlayer
local chr = lplr.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
while tpwalking and hb:Wait() and chr and hum and hum.Parent do
  if hum.MoveDirection.Magnitude > 0 then
    if tspeed and isNumber(tspeed) then
      chr:TranslateBy(hum.MoveDirection * tonumber(tspeed))
    else
      chr:TranslateBy(hum.MoveDirection)
    end
  end
end
   end
})

Tab:AddButton({
	Name = "透视",
	Callback = function()
_G.FriendColor = Color3.fromRGB(0, 0, 255)
_G.EnemyColor = Color3.fromRGB(255, 0, 0)
_G.UseTeamColor = true

--------------------------------------------------------------------
local Holder = Instance.new("Folder", game.CoreGui)
Holder.Name = "ESP"

local Box = Instance.new("BoxHandleAdornment")
Box.Name = "nilBox"
Box.Size = Vector3.new(1, 2, 1)
Box.Color3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
Box.Transparency = 0.7
Box.ZIndex = 0
Box.AlwaysOnTop = false
Box.Visible = false

local NameTag = Instance.new("BillboardGui")
NameTag.Name = "nilNameTag"
NameTag.Enabled = false
NameTag.Size = UDim2.new(0, 200, 0, 50)
NameTag.AlwaysOnTop = true
NameTag.StudsOffset = Vector3.new(0, 1.8, 0)
local Tag = Instance.new("TextLabel", NameTag)
Tag.Name = "Tag"
Tag.BackgroundTransparency = 1
Tag.Position = UDim2.new(0, -50, 0, 0)
Tag.Size = UDim2.new(0, 300, 0, 20)
Tag.TextSize = 15
Tag.TextColor3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
Tag.TextStrokeColor3 = Color3.new(0 / 255, 0 / 255, 0 / 255)
Tag.TextStrokeTransparency = 0.4
Tag.Text = "nil"
Tag.Font = Enum.Font.SourceSansBold
Tag.TextScaled = false

local LoadCharacter = function(v)
	repeat wait() until v.Character ~= nil
	v.Character:WaitForChild("Humanoid")
	local vHolder = Holder:FindFirstChild(v.Name)
	vHolder:ClearAllChildren()
	local b = Box:Clone()
	b.Name = v.Name .. "Box"
	b.Adornee = v.Character
	b.Parent = vHolder
	local t = NameTag:Clone()
	t.Name = v.Name .. "NameTag"
	t.Enabled = true
	t.Parent = vHolder
	t.Adornee = v.Character:WaitForChild("Head", 5)
	if not t.Adornee then
		return UnloadCharacter(v)
	end
	t.Tag.Text = v.Name
	b.Color3 = Color3.new(v.TeamColor.r, v.TeamColor.g, v.TeamColor.b)
	t.Tag.TextColor3 = Color3.new(v.TeamColor.r, v.TeamColor.g, v.TeamColor.b)
	local Update
	local UpdateNameTag = function()
		if not pcall(function()
			v.Character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
			local maxh = math.floor(v.Character.Humanoid.MaxHealth)
			local h = math.floor(v.Character.Humanoid.Health)
		end) then
			Update:Disconnect()
		end
	end
	UpdateNameTag()
	Update = v.Character.Humanoid.Changed:Connect(UpdateNameTag)
end

local UnloadCharacter = function(v)
	local vHolder = Holder:FindFirstChild(v.Name)
	if vHolder and (vHolder:FindFirstChild(v.Name .. "Box") ~= nil or vHolder:FindFirstChild(v.Name .. "NameTag") ~= nil) then
		vHolder:ClearAllChildren()
	end
end

local LoadPlayer = function(v)
	local vHolder = Instance.new("Folder", Holder)
	vHolder.Name = v.Name
	v.CharacterAdded:Connect(function()
		pcall(LoadCharacter, v)
	end)
	v.CharacterRemoving:Connect(function()
		pcall(UnloadCharacter, v)
	end)
	v.Changed:Connect(function(prop)
		if prop == "TeamColor" then
			UnloadCharacter(v)
			wait()
			LoadCharacter(v)
		end
	end)
	LoadCharacter(v)
end

local UnloadPlayer = function(v)
	UnloadCharacter(v)
	local vHolder = Holder:FindFirstChild(v.Name)
	if vHolder then
		vHolder:Destroy()
	end
end

for i,v in pairs(game:GetService("Players"):GetPlayers()) do
	spawn(function() pcall(LoadPlayer, v) end)
end

game:GetService("Players").PlayerAdded:Connect(function(v)
	pcall(LoadPlayer, v)
end)

game:GetService("Players").PlayerRemoving:Connect(function(v)
	pcall(UnloadPlayer, v)
end)

game:GetService("Players").LocalPlayer.NameDisplayDistance = 0

if _G.Reantheajfdfjdgs then
    return
end

_G.Reantheajfdfjdgs = ":suifayhgvsdghfsfkajewfrhk321rk213kjrgkhj432rj34f67df"

local players = game:GetService("Players")
local plr = players.LocalPlayer

function esp(target, color)
    if target.Character then
        if not target.Character:FindFirstChild("GetReal") then
            local highlight = Instance.new("Highlight")
            highlight.RobloxLocked = true
            highlight.Name = "GetReal"
            highlight.Adornee = target.Character
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.FillColor = color
            highlight.Parent = target.Character
        else
            target.Character.GetReal.FillColor = color
        end
    end
end

while task.wait() do
    for i, v in pairs(players:GetPlayers()) do
        if v ~= plr then
            esp(v, _G.UseTeamColor and v.TeamColor.Color or ((plr.TeamColor == v.TeamColor) and _G.FriendColor or _G.EnemyColor))
        end
    end
end
   end
})

local Tab = Window:MakeTab({
    Name = "越狱",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false

})

Tab:AddButton({
	Name = "子弹范围",
	Callback = function()
	getgenv().toggled = true

getgenv().old = getgenv().old or require(game:GetService("ReplicatedStorage").Module.RayCast).RayIgnoreNonCollideWithIgnoreList

if getgenv().toggled then
	require(game:GetService("ReplicatedStorage").Module.RayCast).RayIgnoreNonCollideWithIgnoreList = function(...)
		local nearestDistance, nearestEnemy = 600, nil
	    for i,v in pairs(game:GetService("Players"):GetPlayers()) do
	    	if v.Team ~= game:GetService("Players").LocalPlayer.Team and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
	    	    if (v.Character.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < nearestDistance then
	    	    	nearestDistance, nearestEnemy = (v.Character.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude, v
	    	    end
	    	end
	    end
	    local arg = {old(...)}
	    if (tostring(getfenv(2).script) == "BulletEmitter" or tostring(getfenv(2).script) == "Taser") and nearestEnemy then
		    arg[1] = nearestEnemy.Character.HumanoidRootPart
		    arg[2] = nearestEnemy.Character.HumanoidRootPart.Position
		end
	    return unpack(arg)
	end
else
	require(game:GetService("ReplicatedStorage").Module.RayCast).RayIgnoreNonCollideWithIgnoreList = getgenv().old
end
   end
})

Tab:AddButton({
	Name = "自动开枪",
	Callback = function()
	loadstring(game:HttpGet("https://shz.al/~killaura"))()
    end
})

local Tab = Window:MakeTab({
    Name = "灌篮模拟器",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false

})

Tab:AddToggle({
	Name = "自动获取篮球",
	Default = false,
	Callback = function(bool)
	getgenv().balls = bool
   while game:GetService("RunService").RenderStepped:wait() do 
      if not balls then break end
      local args = {
         [1] = "/\229\133\179\229\141\161?\229\174\140\230\136\144\232\138\130\231\130\185",
         [2] = "\230\153\174\233\128\154\232\174\173\231\187\131",
         [3] = 0
     }

     game:GetService("ReplicatedStorage").WuKong.RemoteActionFunction:InvokeServer(unpack(args))     
   end
   end
})

Tab:AddToggle({
	Name = "自动获取奖杯",
	Default = false,
	Callback = function(bool)
	getgenv().cups = bool
   while game:GetService("RunService").RenderStepped:wait() do
      if not cups then break end
      local args = {
         [1] = "/\229\133\179\229\141\161?\229\174\140\230\136\144\232\138\130\231\130\185",
         [2] = "\230\140\145\230\136\152",
         [3] = 0
     }

     game:GetService("ReplicatedStorage").WuKong.RemoteActionFunction:InvokeServer(unpack(args))     
   end
   end
})

local Tab = Window:MakeTab({
    Name = "疯狂电梯",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false

})

Tab:AddButton({
	Name = "传送VIP室",
	Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Vip.CFrame * CFrame.new(0,5,0)
   end
})

Tab:AddButton({
	Name = "传送大厅",
	Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Laaabby.CFrame * CFrame.new(0,10,0)
   end
})

Tab:AddButton({
	Name = "传送游戏",
	Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Game.CFrame * CFrame.new(0,5,0)
   end
})

local Tab = Window:MakeTab({
    Name = "在披萨店工作",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false

})

Tab:AddButton({
	Name = "远程变成经理",
	Callback = function()
	loadstring(game:HttpGet("https://pastefy.app/8Dwwekw2/raw"))()
	end
})

local Tab = Window:MakeTab({
	Name = "点击一块石头",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local workerOptions = {
	"员工1",
	"员工2",
	"员工3",
	"员工4",
}

local selectedWorker = workerOptions[1]
local isWorkerAutofarmEnabled = false

local WorkerDropdown = Tab:AddDropdown({
	Name = "选择员工",
	Default = selectedWorker,
	Options = workerOptions,
	Callback = function(Value)
		selectedWorker = Value
	end
})

local WorkerToggle = Tab:AddToggle({
	Name = "自动员工",
	Default = isWorkerAutofarmEnabled,
	Callback = function(Value)
		isWorkerAutofarmEnabled = Value
		if isWorkerAutofarmEnabled then
			OrionLib:MakeNotification({
				Name = "警告！",
				Content = "员工自动装配始于选定的员工: " .. selectedWorker,
				Image = "rbxassetid://4335482575",
				Time = 5
			})  
			while isWorkerAutofarmEnabled do
				local args = {
					[1] = selectedWorker,
				}

				game:GetService("ReplicatedStorage").Modules.WorkerModule.Remote:FireServer(unpack(args))

				wait(0.001)
			end
		end
	end
})

local isGemAutofarmEnabled = false
local isOPAfkAutofarmEnabled = false

Tab:AddToggle({
	Name = "自动收集宝石",
	Default = isGemAutofarmEnabled,
	Callback = function(Value)
		isGemAutofarmEnabled = Value
		while isGemAutofarmEnabled do
			game:GetService("ReplicatedStorage").Remotes.GemEarned:FireServer()
			game:GetService("ReplicatedStorage").Remotes.RockClick:FireServer()
			wait(0.001)
		end
	end
})

Tab:AddToggle({
	Name = "自动重生自动宝石自动升级(反挂机)",
	Default = isOPAfkAutofarmEnabled,
	Callback = function(Value)
		isOPAfkAutofarmEnabled = Value
		while isOPAfkAutofarmEnabled do
			if isRockAndGem then
				game:GetService("ReplicatedStorage").Remotes.RockClick:FireServer()
				game:GetService("ReplicatedStorage").Remotes.GemEarned:FireServer()
			else
				local args = {
					[1] = "MainLevel"
				}
				game:GetService("ReplicatedStorage").Modules.StatModule.RemoteEventU:FireServer(unpack(args))
				game:GetService("ReplicatedStorage").Modules.RebirthModule.RemoteEvent:FireServer()
			end
			isRockAndGem = not isRockAndGem
			wait(0.001)
		end
	end
})

local isTpToGemsEnabled = false

Tab:AddToggle({
	Name = "自动传送宝石",
	Default = isTpToGemsEnabled,
	Callback = function(Value)
		isTpToGemsEnabled = Value
		while isTpToGemsEnabled do
			local player = game.Players.LocalPlayer
			local character = player.Character or player.CharacterAdded:Wait()
			local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

			local gemDroplings = game.Workspace.Map.GemDroplings

			local gemPart = gemDroplings:GetChildren()[1]

			if gemPart then
				local originalCFrame = humanoidRootPart.CFrame

				humanoidRootPart.CFrame = gemPart.CFrame
				wait(1/10)

				humanoidRootPart.CFrame = originalCFrame
			else
				OrionLib:MakeNotification({
					Name = "错误",
					Content = "没有找到宝石",
					Image = "rbxassetid://4335482575",
					Time = 5
				})
				isTpToGemsEnabled = false  -- Break the loop if no gems are found
			end

			wait(0.01)  -- Wait for 5 seconds before teleporting again
		end
	end
})

local Tab = Window:MakeTab({
    Name = "军事大亨",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false

})

Tab:AddToggle({
	Name = "自动获取金钱",
	Default = false,
	Callback = function(val)
	  getgenv().cashtog = val
    end
})

task.spawn(
    function()
        while task.wait(1) do
            if getgenv().cashtog then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").PlayerTycoons[tostring(getHash())].Essentials.Giver.CollectButton.CFrame * CFrame.new(0,3,0)
            end
        end
    end
)

local Tab = Window:MakeTab({
    Name = "节日大亨",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false

})

Tab:AddTextbox({
	Name = "修改金钱",
	Default = "",
	TextDisappear = true,
	Callback = function(txt)
	   game:GetService("ReplicatedStorage").RemoteObjects.DanceGameCash:FireServer(txt)
	end
})

local Tab = Window:MakeTab({
    Name = "被超快速的墙碾碎",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false

})

Tab:AddToggle({
	Name = "自动获取积分",
	Default = false,
	Callback = function(bool)
	_G.autofarm = bool;
   end
})

while wait() do
		if _G.autofarm == true then
            task.wait(0.025)
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1041.84729, 24.021759, 410.903748, 1, 0, 0, 0, 1, 0, 0, 0, 1)
            task.wait(0.03)
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1041.06726, 16.3217564, 412.603729, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			task.wait(0.17)
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-737.947266, 24.021759, 238.003754, 1, 0, 0, 0, 1, 0, 0, 0, 1)
            task.wait(0.03)
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-739.147522, 16.3198643, 231.56601, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			task.wait(0.17)
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-441.247253, 24.021759, 411.503754, 1, 0, 0, 0, 1, 0, 0, 0, 1)
            task.wait(0.03)
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-439.762268, 16.3393345, 417.383698, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			task.wait(0.17)
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-139.082031, 16.3098545, 237.155304, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            task.wait(0.03)
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-139.147278, 24.021759, 238.203751, 1, 0, 0, 0, 1, 0, 0, 0, 1)
			task.wait(0.14)
			prev = game:GetService("Players").LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame
			game:GetService("Players").LocalPlayer.Character.Parent = workspace.Terrain
			game:GetService("Players").LocalPlayer.Character:BreakJoints()
			game:GetService('Workspace'):WaitForChild(game:GetService("Players").LocalPlayer.Name)
			game:GetService("Players").LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame = prev
		end
	end
end)

local other = Window:MakeTab({
    Name = "伐木大亨2",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
	Name = "LuaWare",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/frencaliber/LuaWareLoader.lw/main/luawareloader.wtf",true))()
	end
})

local other = Window:MakeTab({
    Name = "死亡球",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
	Name = "死亡球",
	Callback = function()
	loadstring(game:HttpGet("https://github.com/Hosvile/InfiniX/releases/latest/download/main.lua",true))()
	end
})

local Tab = Window:MakeTab({
    Name = "动感星期五",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "动感星期五(部分可能用不了)",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nadir3709/RandomScript/main/FunkyFridayMobile"))()
end
})
local Tab = Window:MakeTab({
    Name = "基本上是FNF",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "基本上是FNF",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/MariyaFurmanova/Library/main/BasicallyFNF", true))()
end
})
local Tab = Window:MakeTab({
    Name = "BF",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "HOHO HUB(可能要卡密)",
	Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI'))() 
end
})

Tab:AddButton({
	Name = "BF脚本",
	Callback = function()
loadstring(game:HttpGet"https://raw.githubusercontent.com/xDepressionx/Free-Script/main/AllScript.lua")()
end
})

local Tab = Window:MakeTab({
    Name = "巴掌大战但是糟糕",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "搞手套",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/thanhdat4461/BaconScripterLua/main/SBBB%20Badges%20Hub.lua"))()
end
})
Tab:AddButton({
	Name = "脚本2",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/TheScriptMaster1/RSZ-Hub/main/loadstring.lua"))()
end
})

local Tab = Window:MakeTab({
    Name = "监狱人生",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "监狱人生",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/PRISONWARE_v1.3.txt"))();
end
})
Tab:AddButton({
	Name = "监狱人生脚本",
	Callback = function()
loadstring(game:HttpGet('https://paste.website/p/96d68817-3f1e-4fef-a8b8-9aafdc810329.txt'))()
end
})

local Tab = Window:MakeTab({
    Name = "最强战场",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "最强战场多功能",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nicuse/RobloxScripts/main/SaitamaBattlegrounds.lua"))()
end
})

local Tab = Window:MakeTab({
    Name = "巨魔世界",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "巨魔世界",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/RedZenXYZ/WorldOfTrollge/main/World%20Of%20Trollge"))()
end
})

local Tab = Window:MakeTab({
    Name = "力量传奇",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "力量传奇",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/littlegui/main/MuscleLegends"))()
end
})

local Tab = Window:MakeTab({
    Name = "鲨口求生",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "鲨口求生",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/YYVLbzVg", true))()
end
})
local Tab = Window:MakeTab({
    Name = "KAT",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "KAT脚本",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/6rd91GZx", true))()
end
})

local Tab = Window:MakeTab({
    Name = "FE脚本",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "黑洞脚本",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/kPcENzLB"))()
end
})

local Tab = Window:MakeTab({
    Name = "越狱",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "越狱脚本",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/opBandwidth/Magma-Core/main/Jailbreak/Main.lua"))()
end
})

local Tab = Window:MakeTab({
    Name = "巨人生存",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "HOHO",
	Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI'))()
end
})

local Tab = Window:MakeTab({
    Name = "SCP角色扮演",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "SCP角色扮演",
	Callback = function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/exehubrblx/SCP-Roleplay/main/script'),true))()
end
})

local Tab = Window:MakeTab({
    Name = "俄亥俄州",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "OHIO",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Jaepe/Visurus/main/scripts/Ohio.lua"))()
end
})

Tab:AddButton({
	Name = "OHIO脚本2",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Ohio1/main/Robloxgame1"))()
end
})

local Tab = Window:MakeTab({
    Name = "Bed wars(起床战争)",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "起床战争",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/OWJBWKQLAISH/Inferno-X/main/inferno%20X%20V2"))()
end
})

local Tab = Window:MakeTab({
    Name = "迈尔克的僵尸",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "脚本1",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/MichaelZombies.lua"))()
end
})

local Tab = Window:MakeTab({
    Name = "蜂群模拟器",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "蜂群脚本",
	Callback = function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/AltsegoD/script/master/BeeSwarmSimulator.lua')))()
end
})

local Tab = Window:MakeTab({
    Name = "战争大亨",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "战争大亨脚本",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nivex123456/War-Tycoon/main/Script"))()
end
})

local Tab = Window:MakeTab({
    Name = "奇怪的严格爸爸",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "奇怪的严格爸爸",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/yBloodz/Free-scripts/main/Weird%20Strict%20Dad"))()
end
})
local Tab = Window:MakeTab({
    Name = "彩虹朋友",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "彩虹朋友",
	Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Ihaveash0rtnamefordiscord/BorkWare/main/Scripts/' .. game.GameId .. ".lua"))(' Watermelon ? ')
end
})
local Tab = Window:MakeTab({
    Name = "忍者传奇",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "忍者传奇",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/harisiskandar178/5repo/main/script4.lua"))()
end
})

Tab:AddButton({
	Name = "忍者传奇2",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/why-png/scriptstuffz/master/ninjaleg2", true))()
end
})

local Tab = Window:MakeTab({
    Name = "自然灾害模拟器",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "自然灾害",
	Callback = function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/MrWitzbold/Natural-disaster-survival-GUI/main/main.lua'),true))()
end
})

local Tab = Window:MakeTab({
    Name = "兵工厂",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "兵工厂",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ZinityDrops/OwlHubLink/master/OwlHubBack.lua"))();
end
})

local Tab = Window:MakeTab({
    Name = "破坏者谜团",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "脚本1",
	Callback = function()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/Ethanoj1/EclipseMM2/master/Script"),true))()
end
})

local Tab = Window:MakeTab({
    Name = "The Rake",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "The Rake",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/jFn0k6Gz"))()
end
})
Tab:AddButton({
	Name = "The Rake脚本2",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/ikY8F7gv"))()
end
})


local Tab = Window:MakeTab({
    Name = "好玩的",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "猫娘脚本(NEKO)",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs-Source/main/Pendulum%20Hub%20V5.lua"))()
end
})

Tab:AddButton({
	Name = "变成蛇",
	Callback = function()
loadstring(game:HttpGet(('https://pastefy.ga/tWBTcE4R/raw'),true))()
end
})

local Tab = Window:MakeTab({
    Name = "EVADE",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "EVADE",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Evade"))()
end
})