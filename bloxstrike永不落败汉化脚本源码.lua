local RunScriptFirst = false

local Translations = {
["NeverLose"] = "永不落败<font color='#33FFEE'>Y</font><font color='#33EEFF'>i</font><font color='#33DDFF'>r</font><font color='#33CCFF'>d</font><font color='#33BBFF'>e</font><font color='#33AAFF'>X</font><font color='#3399FF'>汉</font><font color='#3388FF'>化</font>",
["Aimbot"] = "自瞄",
["Combat"] = "战斗",
["Visuals"] = "视觉",
["World"] = "世界",
["Misc"] = "杂项",
["Viewmodel"] = "视角模型",
["Hud"] = "界面",
["Skins"] = "皮肤",
["UI Settings"] = "界面设置",
["Search"] = "搜索",
["Enabled"] = "启用",
["MB2"] = "鼠标右键",
["Hitbox"] = "碰撞箱",
["Head"] = "头部",
["Priority"] = "优先级",
["Closest to Crosshair"] = "准星最近",
["Smoothing"] = "平滑度",
["Wall Check"] = "穿墙检测",
["Velocity Lead"] = "速度预判",
["Mobile Button"] = "移动端按钮",
["Legit Silent"] = "合法静默自瞄",
["Targeting"] = "目标选择",
["Team Check"] = "队伍检测",
["FOV Circle"] = "视野范围圈",
["FOV"] = "视野",
["Show FOV"] = "显示视野",
["FOV Gradient"] = "视野渐变",
["FOV Fill"] = "视野填充",
["Fill Gradient"] = "填充渐变",
["Fill Transparency"] = "填充透明度",
["No Recoil"] = "无后坐力",
["Strength (%)"] = "强度（%）",
["Triggerbot"] = "触发自瞄",
["Dont shoot in smoke"] = "烟雾中不开枪",
["Dont shoot in flash"] = "闪光中不开枪",
["Auto Scope"] = "自动开镜",
["Delay (ms)"] = "延迟（毫秒）",
["Head Hitbox"] = "头部碰撞箱",
["Scale"] = "缩放",
["Show Visual"] = "显示可视化",
["Visual Transparency"] = "可视化透明度",
["Movement"] = "移动",
["Bhop"] = "兔子跳",
["Auto Strafe"] = "自动侧移",
["Auto Stop"] = "自动停止",
["Stop on Fire"] = "开火时停止",
["Duration (ms)"] = "持续时间（毫秒）",
["Smoke ESP"] = "烟雾透视",
["Plant Zones"] = "炸弹安放区",
["Grenade Helper"] = "投掷物辅助",
["C4 Tracker"] = "C4追踪",
["Effects"] = "特效",
["Damage Indicators"] = "伤害指示器",
["Bullet Tracers"] = "子弹轨迹",
["Hit Sound"] = "命中音效",
["Hit Sound Volume"] = "命中音效音量",
["Soul Particle"] = "灵魂粒子",
["Player ESP"] = "玩家透视",
["2D Box"] = "2D方框",
["Box Gradient"] = "方框渐变",
["Box Fill"] = "方框填充",
["Fill Gradient"] = "填充渐变",
["Box Fill Transparency"] = "方框填充透明度",
["Name ESP"] = "玩家名称透视",
["Health Bar"] = "血条",
["Distance"] = "距离",
["Weapon"] = "武器",
["Weapon Icon"] = "武器图标",
["ESP Layout"] = "透视布局",
["Drag elements to reposition them"] = "拖动元素调整位置",
["Reset Layout"] = "重置布局",
["Weapon Icon"] = "武器图标",
["Flags"] = "状态标识",
["Look Direction"] = "朝向",
["Look Dir Length"] = "朝向指示长度",
["Skeleton"] = "骨骼透视",
["Arrows"] = "箭头指示",
["Arrow Distance"] = "箭头显示距离",
["Arrow Size"] = "箭头大小",
["ESP Font"] = "透视字体",
["Gotham"] = "Gotham",
["Player Chams"] = "玩家变色透视",
["Pulse Gradient"] = "脉冲渐变",
["Fill Transparency"] = "填充透明度",
["Outline Transparency"] = "轮廓透明度",
["Camera"] = "相机",
["Third Person"] = "第三人称视角",
["Hand Chams"] = "手部变色透视",
["Material"] = "材质",
["ForceField"] = "力场",
["Gradient"] = "渐变",
["Transparency"] = "透明度",
["Primary Color"] = "主色",
["Secondary Color"] = "辅色",
["Weapon Chams"] = "武器变色透视",
["Skin Changer"] = "皮肤修改器",
["Enable Skin Changer"] = "启用皮肤修改器",
["Category"] = "分类",
["Heavy"] = "重型武器",
["Weapon"] = "武器",
["Negev"] = "内格夫",
["Skin"] = "皮肤",
["Default"] = "默认",
["Knife Changer"] = "刀具修改器",
["Enable Knife Changer"] = "启用刀具修改器",
["Knife Model"] = "刀具模型",
["Skeleton Knife"] = "骷髅刀",
["Knife Skin"] = "刀具皮肤",
["Glove Changer"] = "手套修改器",
["Enable Glove Changer"] = "启用手套修改器",
["Glove Model"] = "手套模型",
["Driver Gloves"] = "驾驶手套",
["Glove Skin"] = "手套皮肤",
["Body"] = "身体",
["Lowest HP"] = "最低血量",
["Closest Distance"] = "最近距离",
["Closest"] = "最近",
["Indicators"] = "指示器",
["Watermark"] = "水印",
["Spectator List"] = "观察者列表",
["Hud Accent Color"] = "界面强调色"
}
local function translateText(text)
    if not text or type(text) ~= "string" then return text end
    if Translations[text] then return Translations[text] end
    for en, cn in pairs(Translations) do
        if text:find(en) then return text:gsub(en, cn) end
    end
    return text
end

local function translateAllElements()
    local function translateGui(gui)
        for _, element in ipairs(gui:GetDescendants()) do
            if element:IsA("TextLabel") or element:IsA("TextButton") or element:IsA("TextBox") then
                local currentText = element.Text
                if currentText and currentText ~= "" then
                    local translatedText = translateText(currentText)
                    if translatedText ~= currentText then
                        element.Text = translatedText
                    end
                end
            end
        end
    end
    
    pcall(translateGui, game:GetService("CoreGui"))
end

local function setupListener()
    local function connectToGui(gui)
        gui.DescendantAdded:Connect(function(descendant)
            if descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox") then
                local currentText = descendant.Text
                if currentText and currentText ~= "" then
                    local translatedText = translateText(currentText)
                    if translatedText ~= currentText then
                        descendant.Text = translatedText
                    end
                end
                
                descendant:GetPropertyChangedSignal("Text"):Connect(function()
                    local newText = descendant.Text
                    if newText and newText ~= "" then
                        local translatedText = translateText(newText)
                        if translatedText ~= newText then
                            descendant.Text = translatedText
                        end
                    end
                end)
            end
        end)
    end
    
    pcall(connectToGui, game:GetService("CoreGui"))
end

local function startTranslation()
    translateAllElements()
    setupListener()
end

local function loadScript()
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xranbfg132/NeverLose/refs/heads/main/main1.lua"))()
    end)

    if not success then
        warn("加载失败:", err)
    end
end

if RunScriptFirst then
    loadScript()
    startTranslation()
else
    startTranslation()
    loadScript()
end
