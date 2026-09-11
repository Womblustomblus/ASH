-- Anime Squadron Hub - NEW HUB - Part 1/2 - Properly Spaced
local plr = game.Players.LocalPlayer
local RS = game:GetService("ReplicatedStorage")
local UIS = game:GetService("UserInputService")
if plr.PlayerGui:FindFirstChild("AS_Clean") then
    plr.PlayerGui.AS_Clean:Destroy()
end
local gui = Instance.new("ScreenGui", plr.PlayerGui)
gui.Name = "AS_Clean"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 920, 0, 580)
main.Position = UDim2.new(0.5, -460, 0.5, -290)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", main).Color = Color3.fromRGB(45, 45, 45)
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1, 0, 0, 42)
header.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
header.Active = true
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 10)
local hTitle = Instance.new("TextLabel", header)
hTitle.Size = UDim2.new(1, -80, 1, 0)
hTitle.Position = UDim2.new(0, 45, 0, 0)
hTitle.Text = "Anime Squadron"
hTitle.Font = Enum.Font.GothamMedium
hTitle.TextSize = 15
hTitle.TextColor3 = Color3.new(1, 1, 1)
hTitle.TextXAlignment = Enum.TextXAlignment.Left
hTitle.BackgroundTransparency = 1
local hideBtn = Instance.new("TextButton", header)
hideBtn.Size = UDim2.new(0, 32, 0, 26)
hideBtn.Position = UDim2.new(1, -36, 0.5, -13)
hideBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
hideBtn.Text = "—"
hideBtn.Font = Enum.Font.GothamBold
hideBtn.TextSize = 14
hideBtn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", hideBtn).CornerRadius = UDim.new(0, 6)
local showBtn = Instance.new("TextButton", gui)
showBtn.Size = UDim2.new(0, 54, 0, 32)
showBtn.Position = UDim2.new(0, 12, 0.5, -16)
showBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 120)
showBtn.Text = "SHOW"
showBtn.Font = Enum.Font.GothamBold
showBtn.TextSize = 11
showBtn.TextColor3 = Color3.new(1, 1, 1)
showBtn.Visible = false
showBtn.ZIndex = 100
showBtn.Active = true
showBtn.Draggable = true
Instance.new("UICorner", showBtn).CornerRadius = UDim.new(0, 6)
local dragging, dragStart, startPos
header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)
UIS.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
local side = Instance.new("Frame", main)
side.Size = UDim2.new(0, 155, 1, -42)
side.Position = UDim2.new(0, 0, 0, 42)
side.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
Instance.new("UICorner", side).CornerRadius = UDim.new(0, 10)
local sideList = Instance.new("UIListLayout", side)
sideList.Padding = UDim.new(0, 0)
sideList.SortOrder = Enum.SortOrder.LayoutOrder
local sidePad = Instance.new("UIPadding", side)
sidePad.PaddingTop = UDim.new(0, 10)
local content = Instance.new("Frame", main)
content.Size = UDim2.new(1, -165, 1, -52)
content.Position = UDim2.new(0, 160, 0, 47)
content.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
content.ClipsDescendants = true
local pages, sideBtns = {}, {}
local function createPage(name)
    local f = Instance.new("ScrollingFrame", content)
    f.Name = name
    f.Size = UDim2.new(1, 0, 1, 0)
    f.BackgroundTransparency = 1
    f.BorderSizePixel = 0
    f.ScrollBarThickness = 3
    f.Visible = false
    f.ClipsDescendants = true
    f.AutomaticCanvasSize = Enum.AutomaticSize.Y
    f.CanvasSize = UDim2.new(0, 0, 0, 0)
    local l = Instance.new("UIListLayout", f)
    l.Padding = UDim.new(0, 10)
    l.SortOrder = Enum.SortOrder.LayoutOrder
    local p = Instance.new("UIPadding", f)
    p.PaddingTop = UDim.new(0, 6)
    p.PaddingLeft = UDim2.new(0, 8)
    p.PaddingRight = UDim2.new(0, 8)
    p.PaddingBottom = UDim.new(0, 20)
    pages[name] = f
    return f
end
local pageMain = createPage("Main")
pageMain.Visible = true
for _, n in ipairs({"Gameplay", "Macro", "Shop", "Webhook", "Bounty", "Data", "Settings"}) do
    createPage(n)
end
local function addSide(name, icon, order, active)
    local b = Instance.new("TextButton", side)
    b.Size = UDim2.new(1, 0, 0, 36)
    b.BackgroundColor3 = active and Color3.fromRGB(28, 28, 28) or Color3.fromRGB(16, 16, 16)
    b.AutoButtonColor = false
    b.Text = ""
    b.LayoutOrder = order
    local ic = Instance.new("TextLabel", b)
    ic.Name = "Icon"
    ic.Size = UDim2.new(0, 24, 0, 24)
    ic.Position = UDim2.new(0, 14, 0.5, -12)
    ic.Text = icon
    ic.TextColor3 = active and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(110, 110, 110)
    ic.Font = Enum.Font.Gotham
    ic.TextSize = 14
    ic.BackgroundTransparency = 1
    local lb = Instance.new("TextLabel", b)
    lb.Name = "Label"
    lb.Size = UDim2.new(1, -44, 1, 0)
    lb.Position = UDim2.new(0, 40, 0, 0)
    lb.Text = name
    lb.Font = active and Enum.Font.GothamMedium or Enum.Font.Gotham
    lb.TextSize = 12
    lb.TextColor3 = active and Color3.new(1, 1, 1) or Color3.fromRGB(140, 140, 140)
    lb.TextXAlignment = Enum.TextXAlignment.Left
    lb.BackgroundTransparency = 1
    sideBtns[name] = b
    b.MouseButton1Click:Connect(function()
        for n, pg in pairs(pages) do
            pg.Visible = (n == name)
        end
        for n, btn in pairs(sideBtns) do
            local a = (n == name)
            btn.BackgroundColor3 = a and Color3.fromRGB(28, 28, 28) or Color3.fromRGB(16, 16, 16)
            btn:FindFirstChild("Icon").TextColor3 = a and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(110, 110, 110)
            btn:FindFirstChild("Label").TextColor3 = a and Color3.new(1, 1, 1) or Color3.fromRGB(140, 140, 140)
        end
    end)
    return b
end
addSide("Main", "◈", 1, true)
addSide("Gameplay", "◎", 2, false)
addSide("Macro", "≡", 3, false)
addSide("Shop", "🛒", 4, false)
addSide("Webhook", "◐", 5, false)
addSide("Bounty", "◎", 6, false)
addSide("Data", "▤", 7, false)
addSide("Settings", "⚙", 8, false)
local toggleKey = Enum.KeyCode.RightShift
local killed = false
local function setHidden(h)
    main.Visible = not h
    showBtn.Visible = h
end
hideBtn.MouseButton1Click:Connect(function() setHidden(true) end)
showBtn.MouseButton1Click:Connect(function() setHidden(false) end)
UIS.InputBegan:Connect(function(inp, gp)
    if inp.KeyCode == Enum.KeyCode.RightBracket then
        killed = true
        gui:Destroy()
        print("[AS] killed by ]")
        return
    end
    if not gp and inp.KeyCode == toggleKey and not killed then
        setHidden(main.Visible)
    end
end)
local dropdownValues = setmetatable({}, {__mode = "k"})
local toggleStates = setmetatable({}, {__mode = "k"})
local function section(parent, titleText, openDefault)
    local sec = Instance.new("Frame", parent)
    sec.Size = UDim2.new(1, 0, 0, 32)
    sec.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
    Instance.new("UICorner", sec).CornerRadius = UDim.new(0, 6)
    local btn = Instance.new("TextButton", sec)
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = ""
    local lbl = Instance.new("TextLabel", btn)
    lbl.Size = UDim2.new(1, -30, 1, 0)
    lbl.Position = UDim2.new(0, 12, 0, 0)
    lbl.Text = titleText
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextSize = 12
    lbl.TextColor3 = Color3.new(1, 1, 1)
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.BackgroundTransparency = 1
    local arrow = Instance.new("TextLabel", btn)
    arrow.Size = UDim2.new(0, 20, 0, 20)
    arrow.Position = UDim2.new(1, -26, 0.5, -10)
    arrow.Text = openDefault and "∧" or "∨"
    arrow.Font = Enum.Font.Gotham
    arrow.TextSize = 12
    arrow.TextColor3 = Color3.fromRGB(150, 150, 150)
    arrow.BackgroundTransparency = 1
    local body = Instance.new("Frame", parent)
    body.Size = UDim2.new(1, 0, 0, 1)
    body.BackgroundTransparency = 1
    body.Visible = openDefault
    body.ClipsDescendants = false
    local blist = Instance.new("UIListLayout", body)
    blist.Padding = UDim.new(0, 10)
    blist:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() body.Size = UDim2.new(1, 0, 0, blist.AbsoluteContentSize.Y) end)
    btn.MouseButton1Click:Connect(function() body.Visible = not body.Visible arrow.Text = body.Visible and "∧" or "∨" end)
    return body
end
local function dropdown(parent, labelText, options, default)
    if #options == 0 then options = {"None"} default = "None" end
    local wrap = Instance.new("Frame", parent)
    wrap.Size = UDim2.new(1, 0, 0, 52)
    wrap.BackgroundTransparency = 1
    wrap.ClipsDescendants = false
    local lbl = Instance.new("TextLabel", wrap)
    lbl.Size = UDim2.new(1, 0, 0, 16)
    lbl.Text = "  " .. labelText
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 11
    lbl.TextColor3 = Color3.fromRGB(160, 160, 160)
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.BackgroundTransparency = 1
    local box = Instance.new("TextButton", wrap)
    box.Size = UDim2.new(1, 0, 0, 28)
    box.Position = UDim2.new(0, 0, 0, 20)
    box.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    box.BorderSizePixel = 0
    box.Text = "  " .. default .. "         ∨"
    box.Font = Enum.Font.Gotham
    box.TextSize = 12
    box.TextColor3 = Color3.new(1, 1, 1)
    box.TextXAlignment = Enum.TextXAlignment.Left
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 6)
    Instance.new("UIStroke", box).Color = Color3.fromRGB(50, 50, 50)
    local cur = default
    dropdownValues[wrap] = cur
    local listFrame
    local followConn
    box.MouseButton1Click:Connect(function()
        if listFrame then
            if followConn then followConn:Disconnect() followConn=nil end
            listFrame:Destroy()
            listFrame=nil
            return
        end
        listFrame = Instance.new("Frame", gui)
        listFrame.ZIndex = 50
        local function updatePos()
            if not listFrame or not box.Parent then return end
            local absPos = box.AbsolutePosition
            local absSize = box.AbsoluteSize
            listFrame.Position = UDim2.new(0, absPos.X, 0, absPos.Y + absSize.Y + 8)
            listFrame.Size = UDim2.new(0, absSize.X, 0, math.min(#options*28, 220))
        end
        updatePos()
        listFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
        listFrame.BorderSizePixel = 0
        Instance.new("UICorner", listFrame).CornerRadius = UDim.new(0, 8)
        Instance.new("UIStroke", listFrame).Color = Color3.fromRGB(70, 70, 70)
        local sc = Instance.new("ScrollingFrame", listFrame)
        sc.Size = UDim2.new(1, -4, 1, -4)
        sc.Position = UDim2.new(0, 2, 0, 2)
        sc.BackgroundTransparency = 1
        sc.BorderSizePixel = 0
        sc.CanvasSize = UDim2.new(0,0,0,#options*28)
        sc.ScrollBarThickness = 3
        sc.ZIndex = 51
        local ll = Instance.new("UIListLayout", sc)
        ll.Padding = UDim.new(0, 2)
        for _, opt in ipairs(options) do
            local o = Instance.new("TextButton", sc)
            o.Size = UDim2.new(1, -6, 0, 26)
            o.BackgroundColor3 = opt == cur and Color3.fromRGB(0,255,150) or Color3.fromRGB(38,38,38)
            o.Text = "  " .. opt
            o.Font = Enum.Font.Gotham
            o.TextSize = 12
            o.TextColor3 = opt == cur and Color3.fromRGB(20,20,20) or Color3.new(1,1,1)
            o.TextXAlignment = Enum.TextXAlignment.Left
            o.ZIndex = 52
            Instance.new("UICorner", o).CornerRadius = UDim.new(0,4)
            o.MouseButton1Click:Connect(function()
                cur = opt
                dropdownValues[wrap] = cur
                box.Text = "  " .. cur .. "         ∨"
                if followConn then followConn:Disconnect() followConn=nil end
                if listFrame then listFrame:Destroy() listFrame=nil end
            end)
        end
        followConn = game:GetService("RunService").RenderStepped:Connect(updatePos)
        task.delay(6,function() if followConn then followConn:Disconnect() followConn=nil end if listFrame then listFrame:Destroy() listFrame=nil end end)
    end)
    return wrap
end
local function toggle(parent, text)
    local f = Instance.new("Frame", parent)
    f.Size = UDim2.new(1, 0, 0, 26)
    f.BackgroundTransparency = 1
    local lbl = Instance.new("TextLabel", f)
    lbl.Size = UDim2.new(1, -50, 1, 0)
    lbl.Text = text
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 11
    lbl.TextColor3 = Color3.fromRGB(220,220,220)
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.BackgroundTransparency = 1
    local bg = Instance.new("Frame", f)
    bg.Size = UDim2.new(0, 36, 0, 20)
    bg.Position = UDim2.new(1, -36, 0.5, -10)
    bg.BackgroundColor3 = Color3.fromRGB(55,55,55)
    Instance.new("UICorner", bg).CornerRadius = UDim.new(1,0)
    local knob = Instance.new("Frame", bg)
    knob.Size = UDim2.new(0, 16, 0, 16)
    knob.Position = UDim2.new(0, 2, 0.5, -8)
    knob.BackgroundColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1,0)
    local btn = Instance.new("TextButton", bg)
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = ""
    local on = false
    toggleStates[f] = false
    btn.MouseButton1Click:Connect(function()
        on = not on
        toggleStates[f] = on
        bg.BackgroundColor3 = on and Color3.fromRGB(0,200,120) or Color3.fromRGB(55,55,55)
        knob.Position = on and UDim2.new(1,-18,0.5,-8) or UDim2.new(0,2,0.5,-8)
    end)
    return f
end
-- END PART 1 - now paste PART 2 right after this line in same file
local GREEN_ORDER = {"GT City","Marine Lobby","Ninja Village","Eclipse (Before)","The Ice Continent","Infinity Train","Great Fourth War","Shibuya (Incident)","Soul City (Destroyed)"}
local greenIndex = {}
for i,n in ipairs(GREEN_ORDER) do greenIndex[n] = i end
local ORDER_INV = {"The Lava Continent","Great Fourth War","Melovelent Shrine","Mage Castle","Soul Palace"}
local ORDER_RAID = {"GT City","Eclipse (Before)","Infinity Train","Shibuya (Destroyed)","Soul City (Destroyed)"}
local orderMap = {}
for i,n in ipairs(GREEN_ORDER) do orderMap["story:"..n]=i orderMap["squadron:"..n]=i end
for i,n in ipairs(ORDER_INV) do orderMap["invasion:"..n]=i end
for i,n in ipairs(ORDER_RAID) do orderMap["raid:"..n]=i end
local worldsData = require(RS.Common.Worlds)
local function getWorldsForMode(mode)
    local tmp = {}
    for name,data in pairs(worldsData) do if data.description and data.description[mode:lower()] then table.insert(tmp,name) end end
    local k = mode:lower()
    table.sort(tmp,function(a,b) local ai,bi=orderMap[k..":"..a] or 99,orderMap[k..":"..b] or 99 if ai~=bi then return ai<bi end return a<b end)
    if #tmp==0 then tmp=GREEN_ORDER end
    return tmp
end
local storyWorlds=getWorldsForMode("story")
local raidWorlds=getWorldsForMode("raid")
local invWorlds=getWorldsForMode("invasion")
local squadWorlds=getWorldsForMode("squadron")
local challengeWorlds={"Daily Challenge [1d]","Regular Challenge [30m]","Katakara Bridge [∞]","The Hero Hunter [∞]","Ghoul City [∞]"}
local allMats={} local matSet={} for _,mod in ipairs(RS:GetDescendants()) do if mod:IsA("ModuleScript") and mod.Name=="data" then local ok,d=pcall(require,mod) if ok and type(d)=="table" and d.type=="Material" then matSet[mod.Parent.Name]=true end end end for k,_ in pairs(matSet) do table.insert(allMats,k) end
table.sort(allMats,function(a,b) local ai,bi=greenIndex[a] or 99,greenIndex[b] or 99 if ai~=bi then return ai<bi end return a<b end)
if #allMats<5 then allMats={"Demon Fangs","Mist Fern","Spirit Quartz"} end
local evoList={} for _,mod in ipairs(RS:GetDescendants()) do if mod.Name=="data" and mod:IsA("ModuleScript") then local ok,d=pcall(require,mod) if ok and d and d.awakening and d.awakening.object then table.insert(evoList, mod.Parent.Name.." -> "..d.awakening.object.Name) end end end if #evoList==0 then evoList={"Goki (SSJ4) -> Goki (SSJ4 Full Power)"} end
local function getActCount(w,m) local d=worldsData[w] if d and d.description and d.description[m:lower()] then return #d.description[m:lower()] end return 10 end
local autoSetupBody=section(pageMain,"Auto Join Setup",true)
local storyDD=dropdown(autoSetupBody,"Story Chapter",storyWorlds, storyWorlds[1] or "The Ice Continent")
local storyActDD=dropdown(autoSetupBody,"Story Act", {"1","2","3","4","5","6","7","8","9","10"}, "1")
local squadDD=dropdown(autoSetupBody,"Squadron World",squadWorlds, squadWorlds[1] or "GT City")
local squadActDD=dropdown(autoSetupBody,"Squadron Act", {"1","2","3","4"}, "1")
local raidDD=dropdown(autoSetupBody,"Raid World",raidWorlds, raidWorlds[1] or storyWorlds[1])
local raidActDD=dropdown(autoSetupBody,"Raid Act", {"1","2","3","4"}, "1")
local invDD=dropdown(autoSetupBody,"Invasion World",invWorlds, invWorlds[1] or storyWorlds[1])
local invActDD=dropdown(autoSetupBody,"Invasion Act", {"1","2","3","4","5"}, "1")
local chalDD=dropdown(autoSetupBody,"Challenge",challengeWorlds, challengeWorlds[1])
local diffDD=dropdown(autoSetupBody,"Difficulty",{"Normal","Hard"},"Hard")
local t1=toggle(autoSetupBody,"Auto Join Map")
local t2=toggle(autoSetupBody,"Auto Matchmake")
local t3=toggle(autoSetupBody,"Only Friends")
local modeToggleBody=section(pageMain,"Enabled Modes (which to farm)",false)
local modeToggles={} for _,m in ipairs({"Story","Squadron","Raid","Invasion","Challenge"}) do local t=toggle(modeToggleBody,"Farm "..m) if m=="Story" then task.delay(0.1,function() toggleStates[t]=true end) end modeToggles[m]=t end
local prioBody=section(pageMain,"Stage Priority (exact World/Mode/Act)",false)
local stagePriority={} local prioListFrame=Instance.new("Frame",prioBody) prioListFrame.Size=UDim2.new(1,0,0,80) prioListFrame.BackgroundTransparency=1
local prioScroll=Instance.new("ScrollingFrame",prioListFrame) prioScroll.Size=UDim2.new(1,0,1,0) prioScroll.BackgroundTransparency=1 prioScroll.CanvasSize=UDim2.new(0,0,0,0) prioScroll.AutomaticCanvasSize=Enum.AutomaticSize.Y prioScroll.ScrollBarThickness=2
local prioLayout=Instance.new("UIListLayout",prioScroll) prioLayout.Padding=UDim.new(0,4)
local addPrioBtn=Instance.new("TextButton",prioBody) addPrioBtn.Size=UDim2.new(1,0,0,28) addPrioBtn.BackgroundColor3=Color3.fromRGB(0,120,255) addPrioBtn.Text="Add Current Stage to Priority (uses Story world/act)" addPrioBtn.Font=Enum.Font.GothamBold addPrioBtn.TextSize=11 addPrioBtn.TextColor3=Color3.new(1,1,1) Instance.new("UICorner",addPrioBtn).CornerRadius=UDim.new(0,6)
local addPrioBtn2=Instance.new("TextButton",prioBody) addPrioBtn2.Size=UDim2.new(1,0,0,28) addPrioBtn2.BackgroundColor3=Color3.fromRGB(120,60,255) addPrioBtn2.Text="Add Current Raid/Invasion/Squadron to Priority" addPrioBtn2.Font=Enum.Font.GothamBold addPrioBtn2.TextSize=11 addPrioBtn2.TextColor3=Color3.new(1,1,1) Instance.new("UICorner",addPrioBtn2).CornerRadius=UDim.new(0,6)
local function refreshPrio() for _,c in ipairs(prioScroll:GetChildren()) do if c:IsA("Frame") then c:Destroy() end end for i,entry in ipairs(stagePriority) do local row=Instance.new("Frame",prioScroll) row.Size=UDim2.new(1,-6,0,26) row.BackgroundColor3=Color3.fromRGB(30,30,30) Instance.new("UICorner",row).CornerRadius=UDim.new(0,6) local lbl=Instance.new("TextLabel",row) lbl.Size=UDim2.new(0.75,0,1,0) lbl.Position=UDim2.new(0,8,0,0) lbl.Text=i..". "..entry.world.." "..entry.mode.." Act "..entry.act.." ["..entry.diff.."]" lbl.Font=Enum.Font.Gotham lbl.TextSize=10 lbl.TextColor3=Color3.new(1,1,1) lbl.TextXAlignment=Enum.TextXAlignment.Left lbl.BackgroundTransparency=1 local del=Instance.new("TextButton",row) del.Size=UDim2.new(0,24,0,20) del.Position=UDim2.new(1,-28,0.5,-10) del.BackgroundColor3=Color3.fromRGB(180,40,40) del.Text="X" del.TextColor3=Color3.new(1,1,1) Instance.new("UICorner",del).CornerRadius=UDim.new(0,4) del.MouseButton1Click:Connect(function() table.remove(stagePriority,i) refreshPrio() end) end end
addPrioBtn.MouseButton1Click:Connect(function() local e={world=dropdownValues[storyDD], mode="Story", act=dropdownValues[storyActDD], diff=dropdownValues[diffDD]} table.insert(stagePriority,e) refreshPrio() end)
addPrioBtn2.MouseButton1Click:Connect(function() for _,m in ipairs({"Squadron","Raid","Invasion","Challenge"}) do if modeToggles[m] and toggleStates[modeToggles[m]] then local w=m=="Squadron" and dropdownValues[squadDD] or m=="Raid" and dropdownValues[raidDD] or m=="Invasion" and dropdownValues[invDD] or dropdownValues[chalDD] local a=m=="Squadron" and dropdownValues[squadActDD] or m=="Raid" and dropdownValues[raidActDD] or m=="Invasion" and dropdownValues[invActDD] or "1" table.insert(stagePriority,{world=w, mode=m, act=a, diff=dropdownValues[diffDD]}) end end refreshPrio() end)
local limitBody=section(pageMain,"Invasion Limits",false)
local limitToggles={} for _,world in ipairs(invWorlds) do local tA=toggle(limitBody,"Stop Join "..world.." Invasion On Reroll Limit Hit") local tB=toggle(limitBody,"Return Lobby On "..world.." Invasion Limit") limitToggles[world]={stop=tA, ret=tB} end
local rerollCounts=setmetatable({},{__mode="k"})
local mfBody=section(pageMain,"Material Farm",false)
local openMatBtn=Instance.new("TextButton",mfBody) openMatBtn.Size=UDim2.new(1,0,0,28) openMatBtn.BackgroundColor3=Color3.fromRGB(45,45,45) openMatBtn.Text="Open Material Farm Config ("..#allMats.." mats)" openMatBtn.Font=Enum.Font.Gotham openMatBtn.TextSize=12 openMatBtn.TextColor3=Color3.fromRGB(200,200,200) Instance.new("UICorner",openMatBtn).CornerRadius=UDim.new(0,6)
local statusLbl=Instance.new("TextLabel",mfBody) statusLbl.Size=UDim2.new(1,0,0,18) statusLbl.Text="Status: Idle" statusLbl.Font=Enum.Font.Gotham statusLbl.TextSize=11 statusLbl.TextColor3=Color3.fromRGB(160,160,160) statusLbl.TextXAlignment=Enum.TextXAlignment.Left statusLbl.BackgroundTransparency=1
local mfToggle=toggle(mfBody,"Material Farm")
local autoBack=toggle(mfBody,"Auto Back to Lobby when Material Reqs Met")
local evoBody=section(pageMain,"Character Evo Farm",false)
local searchBox=Instance.new("TextBox",evoBody) searchBox.Size=UDim2.new(1,0,0,26) searchBox.PlaceholderText="Search characters..." searchBox.Text="" searchBox.BackgroundColor3=Color3.fromRGB(35,35,35) searchBox.TextColor3=Color3.new(1,1,1) searchBox.Font=Enum.Font.Gotham searchBox.TextSize=11 searchBox.ClearTextOnFocus=false Instance.new("UICorner",searchBox).CornerRadius=UDim.new(0,6) Instance.new("UIStroke",searchBox).Color=Color3.fromRGB(50,50,50)
local evoDDWrap
local function rebuildEvo(filter) if evoDDWrap then evoDDWrap:Destroy() end local filtered={} local f=filter:lower() for _,v in ipairs(evoList) do if f=="" or v:lower():find(f,1,true) then table.insert(filtered,v) end end if #filtered==0 then filtered={"No results"} end evoDDWrap=dropdown(evoBody,"Character to Evo ("..#filtered..")",filtered,filtered[1]) end
rebuildEvo("") searchBox:GetPropertyChangedSignal("Text"):Connect(function() rebuildEvo(searchBox.Text) end)
local evoNeed=Instance.new("TextLabel",evoBody) evoNeed.Size=UDim2.new(1,0,0,36) evoNeed.Text="Needs: select a character" evoNeed.Font=Enum.Font.Gotham evoNeed.TextSize=11 evoNeed.TextColor3=Color3.fromRGB(200,200,200) evoNeed.TextWrapped=true evoNeed.BackgroundColor3=Color3.fromRGB(35,35,35) Instance.new("UICorner",evoNeed).CornerRadius=UDim.new(0,6)
local evoTog=toggle(evoBody,"Auto Farm Evo Items")
task.spawn(function() while task.wait(0.5) do if killed then break end if evoDDWrap then local sel=dropdownValues[evoDDWrap] if sel and sel~="No results" then local charName=sel:match("^(.-) %->") or sel:sub(1,20) pcall(function() local mod=RS.Characters:FindFirstChild(charName) and RS.Characters[charName]:FindFirstChild("data") if mod then local d=require(mod) if d.awakening and d.awakening.cost then local t="Needs: " for k,v in pairs(d.awakening.cost) do t=t..k.." x"..v.." | " end evoNeed.Text=t end end end) end end end end)
local popup=Instance.new("Frame",main) popup.Size=UDim2.new(0,720,0,420) popup.Position=UDim2.new(0.5,-260,0.5,-210) popup.BackgroundColor3=Color3.fromRGB(22,22,22) popup.Visible=false popup.ZIndex=20 Instance.new("UICorner",popup).CornerRadius=UDim.new(0,8) Instance.new("UIStroke",popup).Color=Color3.fromRGB(50,50,50)
local popHead=Instance.new("Frame",popup) popHead.Size=UDim2.new(1,0,0,36) popHead.BackgroundColor3=Color3.fromRGB(28,28,28) Instance.new("UICorner",popHead).CornerRadius=UDim.new(0,8)
local popTitle=Instance.new("TextLabel",popHead) popTitle.Size=UDim2.new(1,-100,1,0) popTitle.Position=UDim2.new(0,12,0,0) popTitle.Text="Material Farm ("..#allMats.." found)" popTitle.Font=Enum.Font.GothamMedium popTitle.TextSize=13 popTitle.TextColor3=Color3.new(1,1,1) popTitle.TextXAlignment=Enum.TextXAlignment.Left popTitle.BackgroundTransparency=1
local saveBtn=Instance.new("TextButton",popHead) saveBtn.Size=UDim2.new(0,60,0,24) saveBtn.Position=UDim2.new(1,-90,0.5,-12) saveBtn.BackgroundColor3=Color3.fromRGB(45,130,45) saveBtn.Text="Save" saveBtn.Font=Enum.Font.GothamBold saveBtn.TextSize=12 saveBtn.TextColor3=Color3.new(1,1,1) Instance.new("UICorner",saveBtn).CornerRadius=UDim.new(0,4)
local closeBtn=Instance.new("TextButton",popHead) closeBtn.Size=UDim2.new(0,24,0,24) closeBtn.Position=UDim2.new(1,-28,0.5,-12) closeBtn.BackgroundTransparency=1 closeBtn.Text="X" closeBtn.TextColor3=Color3.fromRGB(200,100,100) closeBtn.Font=Enum.Font.GothamBold closeBtn.TextSize=14 closeBtn.MouseButton1Click:Connect(function() popup.Visible=false end) saveBtn.MouseButton1Click:Connect(function() popup.Visible=false end) openMatBtn.MouseButton1Click:Connect(function() popup.Visible=true end)
local leftCol=Instance.new("Frame",popup) leftCol.Size=UDim2.new(0.5,-6,1,-46) leftCol.Position=UDim2.new(0,6,0,42) leftCol.BackgroundColor3=Color3.fromRGB(28,28,28) Instance.new("UICorner",leftCol).CornerRadius=UDim.new(0,6)
local rightCol=Instance.new("Frame",popup) rightCol.Size=UDim2.new(0.5,-6,1,-46) rightCol.Position=UDim2.new(0.5,0,0,42) rightCol.BackgroundColor3=Color3.fromRGB(28,28,28) Instance.new("UICorner",rightCol).CornerRadius=UDim.new(0,6)
local matSearch=Instance.new("TextBox",leftCol) matSearch.Size=UDim2.new(1,-6,0,22) matSearch.Position=UDim2.new(0,3,0,2) matSearch.PlaceholderText="Search materials..." matSearch.Text="" matSearch.BackgroundColor3=Color3.fromRGB(35,35,35) matSearch.TextColor3=Color3.new(1,1,1) matSearch.Font=Enum.Font.Gotham matSearch.TextSize=11 Instance.new("UICorner",matSearch).CornerRadius=UDim.new(0,4)
local matScroll=Instance.new("ScrollingFrame",leftCol) matScroll.Size=UDim2.new(1,-4,1,-30) matScroll.Position=UDim2.new(0,2,0,28) matScroll.BackgroundTransparency=1 matScroll.CanvasSize=UDim2.new(0,0,0,#allMats*26) matScroll.ScrollBarThickness=3 matScroll.AutomaticCanvasSize=Enum.AutomaticSize.Y
local ml=Instance.new("UIListLayout",matScroll) ml.Padding=UDim.new(0,1)
local selectedMat=allMats[1]
local matBtns={}
local function refreshMats() for _,b in ipairs(matBtns) do b:Destroy() end matBtns={} local f=matSearch.Text:lower() for _,m in ipairs(allMats) do if f=="" or m:lower():find(f,1,true) then local b=Instance.new("TextButton",matScroll) b.Size=UDim2.new(1,-6,0,24) b.BackgroundColor3=m==selectedMat and Color3.fromRGB(35,45,65) or Color3.fromRGB(22,22,22) b.Text="  "..m b.Font=Enum.Font.Gotham b.TextSize=11 b.TextColor3=m==selectedMat and Color3.new(1,1,1) or Color3.fromRGB(180,180,180) b.TextXAlignment=Enum.TextXAlignment.Left Instance.new("UICorner",b).CornerRadius=UDim.new(0,4) table.insert(matBtns,b) b.MouseButton1Click:Connect(function() selectedMat=m for _,btn in ipairs(matBtns) do btn.BackgroundColor3=btn.Text:sub(3)==selectedMat and Color3.fromRGB(35,45,65) or Color3.fromRGB(22,22,22) end end) end end end
matSearch:GetPropertyChangedSignal("Text"):Connect(refreshMats) refreshMats()
local reqTitle2=Instance.new("TextLabel",rightCol) reqTitle2.Size=UDim2.new(1,0,0,20) reqTitle2.Text="  Requirements" reqTitle2.Font=Enum.Font.GothamMedium reqTitle2.TextSize=11 reqTitle2.TextColor3=Color3.new(1,1,1) reqTitle2.BackgroundTransparency=1 reqTitle2.TextXAlignment=Enum.TextXAlignment.Left
local req1Lbl=Instance.new("TextLabel",rightCol) req1Lbl.Size=UDim2.new(0.6,0,22,22) req1Lbl.Position=UDim2.new(0,6,0,42) req1Lbl.Text=" "..selectedMat.." 0/" req1Lbl.Font=Enum.Font.Gotham req1Lbl.TextSize=11 req1Lbl.TextColor3=Color3.new(1,1,1) req1Lbl.BackgroundTransparency=1 req1Lbl.TextXAlignment=Enum.TextXAlignment.Left
local req1Box=Instance.new("TextBox",rightCol) req1Box.Size=UDim2.new(0,60,0,22) req1Box.Position=UDim2.new(1,-66,0,42) req1Box.BackgroundColor3=Color3.fromRGB(35,35,35) req1Box.Text="150" req1Box.Font=Enum.Font.Gotham req1Box.TextSize=11 req1Box.TextColor3=Color3.new(1,1,1) Instance.new("UICorner",req1Box).CornerRadius=UDim.new(0,4) Instance.new("UIStroke",req1Box).Color=Color3.fromRGB(60,60,60)
local webBody=section(pages["Webhook"],"Discord Webhook",true)
local whBox=Instance.new("TextBox",webBody) whBox.Size=UDim2.new(1,0,0,26) whBox.PlaceholderText="https://discord.com/api/webhooks/..." whBox.Text="" whBox.BackgroundColor3=Color3.fromRGB(35,35,35) whBox.TextColor3=Color3.new(1,1,1) whBox.Font=Enum.Font.Gotham whBox.TextSize=11 Instance.new("UICorner",whBox).CornerRadius=UDim.new(0,6)
local whTog=toggle(webBody,"Enable Webhook")
local invTog=toggle(webBody,"Auto switch stage when material reqs met")
local setBody=section(pages["Settings"],"UI Settings",true)
local keyBtn=Instance.new("TextButton",setBody) keyBtn.Size=UDim2.new(1,0,0,32) keyBtn.BackgroundColor3=Color3.fromRGB(35,35,35) keyBtn.Text="Hide/Show Key: RightShift (click to rebind)" keyBtn.Font=Enum.Font.Gotham keyBtn.TextSize=11 keyBtn.TextColor3=Color3.new(1,1,1) Instance.new("UICorner",keyBtn).CornerRadius=UDim.new(0,6)
local killLbl=Instance.new("TextLabel",setBody) killLbl.Size=UDim2.new(1,0,0,18) killLbl.Text="Kill script: Press ]" killLbl.Font=Enum.Font.Gotham killLbl.TextSize=11 killLbl.TextColor3=Color3.fromRGB(200,100,100) killLbl.BackgroundTransparency=1 killLbl.TextXAlignment=Enum.TextXAlignment.Left
local progTog=toggle(setBody,"Toggle Progress Bar") toggleStates[progTog]=true
local progressEnabled=true
local progressFrame=Instance.new("Frame",gui) progressFrame.Name="ProgressBar" progressFrame.Size=UDim2.new(0,220,0,300) progressFrame.Position=UDim2.new(1,-230,0.5,-150) progressFrame.BackgroundColor3=Color3.fromRGB(22,22,22) progressFrame.BorderSizePixel=0 progressFrame.ZIndex=15 progressFrame.Visible=true Instance.new("UICorner",progressFrame).CornerRadius=UDim.new(0,8) Instance.new("UIStroke",progressFrame).Color=Color3.fromRGB(50,50,50)
local progHeader=Instance.new("Frame",progressFrame) progHeader.Size=UDim2.new(1,0,0,28) progHeader.BackgroundColor3=Color3.fromRGB(28,28,28) Instance.new("UICorner",progHeader).CornerRadius=UDim.new(0,8)
local progTitle=Instance.new("TextLabel",progHeader) progTitle.Size=UDim2.new(1,-10,1,0) progTitle.Position=UDim2.new(0,10,0,0) progTitle.Text="Progress   [ ' to hide ]" progTitle.Font=Enum.Font.GothamMedium progTitle.TextSize=11 progTitle.TextColor3=Color3.new(1,1,1) progTitle.TextXAlignment=Enum.TextXAlignment.Left progTitle.BackgroundTransparency=1
local progScroll=Instance.new("ScrollingFrame",progressFrame) progScroll.Size=UDim2.new(1,-6,1,-34) progScroll.Position=UDim2.new(0,3,0,31) progScroll.BackgroundTransparency=1 progScroll.BorderSizePixel=0 progScroll.CanvasSize=UDim2.new(0,0,0,0) progScroll.AutomaticCanvasSize=Enum.AutomaticSize.Y progScroll.ScrollBarThickness=2
local progList=Instance.new("UIListLayout",progScroll) progList.Padding=UDim.new(0,6) local progPad=Instance.new("UIPadding",progScroll) progPad.PaddingTop=UDim.new(0,4) progPad.PaddingLeft=UDim.new(0,4) progPad.PaddingRight=UDim.new(0,4)
local function makeProgressRow(name,have,need) local row=Instance.new("Frame",progScroll) row.Size=UDim2.new(1,-4,0,38) row.BackgroundColor3=Color3.fromRGB(30,30,30) Instance.new("UICorner",row).CornerRadius=UDim.new(0,6) local lbl=Instance.new("TextLabel",row) lbl.Size=UDim2.new(1,-10,0,14) lbl.Position=UDim2.new(0,6,0,4) lbl.Text=name.."  "..have.." / "..need lbl.Font=Enum.Font.Gotham lbl.TextSize=10 lbl.TextColor3=Color3.new(1,1,1) lbl.TextXAlignment=Enum.TextXAlignment.Left lbl.BackgroundTransparency=1 local bg=Instance.new("Frame",row) bg.Size=UDim2.new(1,-12,0,10) bg.Position=UDim2.new(0,6,0,22) bg.BackgroundColor3=Color3.fromRGB(45,45,45) Instance.new("UICorner",bg).CornerRadius=UDim.new(1,0) local fill=Instance.new("Frame",bg) local pct=math.clamp(have/need,0,1) fill.Size=UDim2.new(pct,0,1,0) fill.BackgroundColor3=pct>=1 and Color3.fromRGB(0,200,120) or Color3.fromRGB(0,150,255) Instance.new("UICorner",fill).CornerRadius=UDim.new(1,0) end
local function refreshProgress() for _,c in ipairs(progScroll:GetChildren()) do if c:IsA("Frame") then c:Destroy() end end if not progressEnabled then return end if toggleStates[mfToggle] then local need=tonumber(req1Box.Text) or 150 local have=getCount(selectedMat) makeProgressRow(selectedMat,have,need) end if toggleStates[evoTog] and evoDDWrap then local sel=dropdownValues[evoDDWrap] if sel and sel~="No results" then local charName=sel:match("^(.-) %->") or sel pcall(function() local mod=RS.Characters:FindFirstChild(charName) and RS.Characters[charName]:FindFirstChild("data") if mod then local d=require(mod) if d.awakening and d.awakening.cost then for mat,need in pairs(d.awakening.cost) do if mat~="Gold" then local have=getCount(mat) makeProgressRow(charName.." : "..mat,have,need) end end end end end) end end if #progScroll:GetChildren()<=2 then makeProgressRow("No farm active",0,1) end end
progTog:FindFirstChildWhichIsA("Frame"):FindFirstChildWhichIsA("TextButton").MouseButton1Click:Connect(function() task.wait(0.05) progressEnabled=toggleStates[progTog] progressFrame.Visible=progressEnabled if progressEnabled then refreshProgress() end end)
UIS.InputBegan:Connect(function(inp,gp) if inp.KeyCode==Enum.KeyCode.Quote and not killed and progressEnabled then progressFrame.Visible=not progressFrame.Visible end end)
task.spawn(function() while task.wait(1) do if killed then break end if progressEnabled and progressFrame.Visible then refreshProgress() end end end)
local listening=false
keyBtn.MouseButton1Click:Connect(function() listening=true keyBtn.Text="Press any key... ( ] is reserved for kill )" end)
UIS.InputBegan:Connect(function(inp,gp)
    if listening and inp.KeyCode ~= Enum.KeyCode.Unknown and inp.KeyCode ~= Enum.KeyCode.RightBracket then toggleKey=inp.KeyCode keyBtn.Text="Hide/Show Key: "..toggleKey.Name.." (click to rebind)" listening=false return end
    if not gp and inp.KeyCode==toggleKey and not killed then setHidden(not main.Visible) end
    if inp.KeyCode==Enum.KeyCode.RightBracket then killed=true gui:Destroy() print("[AS] killed by ]") end
end)
for _,p in pairs({pages["Gameplay"],pages["Macro"],pages["Shop"],pages["Bounty"],pages["Data"]}) do local l=Instance.new("TextLabel",p) l.Size=UDim2.new(1,0,0,30) l.Text=p.Name.." - coming soon" l.Font=Enum.Font.Gotham l.TextSize=12 l.TextColor3=Color3.fromRGB(150,150,150) l.BackgroundTransparency=1 end
local webhookUrl="" whBox.FocusLost:Connect(function() webhookUrl=whBox.Text end)
local function getCount(name) local c=0 pcall(function() local d=RS.Remotes.Player.get:InvokeServer() local function searchBag(bag) if not bag then return nil end if bag[name]~=nil then if type(bag[name])=="table" then return bag[name].amount or bag[name].count or 1 else return bag[name] end end for k,v in pairs(bag) do if tostring(k):lower()==name:lower() then return type(v)=="table" and (v.amount or 1) or v end end return nil end local found=searchBag(d) or searchBag(d and d.inventory) or searchBag(d and d.items) or searchBag(d and d.materials) or searchBag(d and d.currencies) if found~=nil then c=found else local inv=RS.Remotes.Items and RS.Remotes.Items.get and RS.Remotes.Items.get:InvokeServer() if inv then c=searchBag(inv) or 0 end end end) return tonumber(c) or 0 end
task.spawn(function() while task.wait(3) do if killed then break end if toggleStates[t1] then local useStage=nil if #stagePriority>0 then useStage=stagePriority[1] end local mode=useStage and useStage.mode or "Story" local world=useStage and useStage.world or dropdownValues[storyDD] local act=useStage and useStage.act or dropdownValues[storyActDD] local diff=dropdownValues[diffDD] if mode=="Squadron" then world=dropdownValues[squadDD] act=dropdownValues[squadActDD] elseif mode=="Raid" then world=dropdownValues[raidDD] act=dropdownValues[raidActDD] elseif mode=="Invasion" then world=dropdownValues[invDD] act=dropdownValues[invActDD] elseif mode=="Challenge" then world=dropdownValues[chalDD] act="1" end
    local didEvo=false
    if toggleStates[evoTog] and evoDDWrap then
        local sel=dropdownValues[evoDDWrap]
        if sel and sel~="No results" then
            local charName=sel:match("^(.-) %->") or sel
            pcall(function()
                local mod=RS.Characters:FindFirstChild(charName) and RS.Characters[charName]:FindFirstChild("data")
                if mod then
                    local d=require(mod)
                    if d.awakening and d.awakening.cost then
                        for mat,need in pairs(d.awakening.cost) do if mat~="Gold" then local have=getCount(mat) if have < need then
                            local src=nil
                            for _,mod2 in ipairs(RS:GetDescendants()) do if mod2.Parent.Name==mat and mod2.Name=="data" then local ok,d2=pcall(require,mod2) if ok and d2 and d2.description then local w,m,a=d2.description:match("→%s*([^<]+)%s+(%w+)%s+Act%s+([%d, ]+)") if not w then w,a=d2.description:match("→%s*([^<]+)%s+Story Act%s+([%d, ]+)") m="Story" end if w then w=w:gsub("^%s+",""):gsub("%s+$","") a=a:match("%d+") src={world=w,mode=m or "Story",act=a or "1"} break end end end end
                            if src then
    statusLbl.Text = "EVO: Farming "..mat.." "..have.."/"..need.." at "..src.world.." "..src.mode.." Act "..src.act
    pcall(function()
        local r = RS:FindFirstChild("Remotes")
        if r and r:FindFirstChild("JoinMap") then
            r.JoinMap:FireServer(src.mode, src.world, src.act, "Hard")
        end
    end)
   if toggleStates[mfToggle] and toggleStates[invTog] then
    local need = tonumber(req1Box.Text) or 150
    local have = getCount(selectedMat)
    req1Lbl.Text = " "..selectedMat.." "..have.."/"
    statusLbl.Text = "Status: Farming "..selectedMat.." ("..have.."/"..need..") Priority: "..(useStage and useStage.world or world)
    if have >= need and toggleStates[autoBack] then
        statusLbl.Text = "Status: Done "..selectedMat.." - Next: "..(stagePriority[2] and stagePriority[2].world or "lobby")
        pcall(function() RS.Remotes.ReturnToLobby:FireServer() end)
        if #stagePriority > 1 then table.remove(stagePriority,1) refreshPrio() end
    end
end
if limitToggles[world] and toggleStates[limitToggles[world].stop] then
    rerollCounts[world] = (rerollCounts[world] or 0) + 1
    if rerollCounts[world] > (tonumber(req1Box.Text) or 50) then
        statusLbl.Text = "Reroll limit hit for "..world.." - skipping"
        if toggleStates[limitToggles[world].ret] then pcall(function() RS.Remotes.ReturnToLobby:FireServer() end) end
        if #stagePriority > 0 then table.remove(stagePriority,1) refreshPrio() end
    end
end
pcall(function()
    local r = RS:FindFirstChild("Remotes")
    if r and r:FindFirstChild("JoinMap") then
        r.JoinMap:FireServer(mode, world, act, diff)
    elseif r and r:FindFirstChild("Play") then
        r.Play:FindFirstChild("JoinWorld"):FireServer(world, act, mode)
    end
end)
    return
end
                        end end
                    end
                end
            end)
        end
    end
    if didEvo then task.wait(3) continue end
    if toggleStates[mfToggle] and toggleStates[invTog] then local need=tonumber(req1Box.Text) or 150 local have=getCount(selectedMat) req1Lbl.Text=" "..selectedMat.." "..have.."/" statusLbl.Text="Status: Farming "..selectedMat.." ("..have.."/"..need..") Priority: "..(useStage and useStage.world or world) if have>=need and toggleStates[autoBack] then statusLbl.Text="Status: Done "..selectedMat.." - Next: "..(stagePriority[2] and stagePriority[2].world or "lobby") pcall(function() RS.Remotes.ReturnToLobby:FireServer() end) if #stagePriority>1 then table.remove(stagePriority,1) refreshPrio() end end end if limitToggles[world] and toggleStates[limitToggles[world].stop] then rerollCounts[world]=(rerollCounts[world] or 0)+1 if rerollCounts[world] > (tonumber(req1Box.Text) or 50) then statusLbl.Text="Reroll limit hit for "..world.." - skipping" if toggleStates[limitToggles[world].ret] then pcall(function() RS.Remotes.ReturnToLobby:FireServer() end) end if #stagePriority>0 then table.remove(stagePriority,1) refreshPrio() end end end pcall(function() local r=RS:FindFirstChild("Remotes") if r and r:FindFirstChild("JoinMap") then r.JoinMap:FireServer(mode,world,act,diff) elseif r and r:FindFirstChild("Play") then r.Play:FindFirstChild("JoinWorld"):FireServer(world,act,mode) end end) end end end)
print("[AS] FULL - Part 2 done - save new hub.lua and Run")
