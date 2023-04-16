--// Initiating Library
local Lib = loadstring(dx9.Get("https://raw.githubusercontent.com/soupg/DXLibUI/main/main.lua"))()

--// Making Window
local Window = Lib:CreateWindow({Title = "DXLibUi Demo", Index = "window_1", Size = {0,0}, Resizable = true, ToggleKey = "[F5]", StartLocation = {300, 300}, Rainbow = true, FooterToggle = true, FooterRGB = true, FooterMouseCoords = true})

--// Making Tabs
local Tab1 = Window:AddTab("Tab 1")
local Tab2 = Window:AddTab("Tab 2")

if Lib.FirstRun then -- If its the first run of the library, focus tab 1
    Tab1:Focus()
end

--// Making Groupboxes
local Groupbox1 = Tab1:AddLeftGroupbox("Left Groupbox")
local Groupbox2 = Tab1:AddRightGroupbox("Right Groupbox")
local Groupbox3 = Tab1:AddMiddleGroupbox("Middle Groupbox")

--// Button
Groupbox1:AddButton("Demo Notification", function()
    --/ Code that executes on button click
    Lib:Notify("Demo Notification", 1)
end)

--// Color Picker 
local ColorPicker = Groupbox2:AddColorPicker({Index = "picker_1", Default = Lib.AccentColor, Text = "GUI Color"})

--/ If color changes
ColorPicker:OnChanged(function(color)
    Window.AccentColor = color
end)

--// Blank
Groupbox2:AddBlank(10)

--// Reset Color
Groupbox2:AddButton("Reset Color", function()
    ColorPicker:SetValue(Lib.AccentColor)
end)

--// Toggle 
local Toggle = Groupbox3:AddToggle({Index = "toggle_1", Default = true, Text = "Hover over me!"}):AddTooltip("Demo Tooltip :)")

--// Label
if Toggle.Value then Groupbox3:AddLabel("Toggled: True", {100, 255, 100}) else Groupbox3:AddLabel("Toggled: False", {255, 100, 100}) end

--// Border
Groupbox3:AddBorder()

--// Slider
local Slider = Groupbox3:AddSlider({Index = "slider_1", Default = 500, Text = "Window Width", Min = 300, Max = 1000, Suffix = "px", Rounding = 2})

Groupbox3:AddLabel("Window Width: "..Slider.Value)

--/ If slider changed
Slider:OnChanged(function(value)
    Window.Size[1] = value
end)

--// Title
Groupbox1:AddTitle("Demo Title")

--// Dropdown
local Dropdown = Groupbox1:AddDropdown({Index = "dropdown_1", Text = "GUI Theme", Default = 1, Values = {"Dark", "Light"}})

--/ If dropdown value changes
Dropdown:OnChanged(function(value)
    if value == "Dark" then
        Window.FontColor = {255, 255, 255}; 
        Window.MainColor = {25, 25, 25};
        Window.BackgroundColor = {20, 20, 20};
        Window.AccentColor = {255, 50, 255}; 
        Window.OutlineColor = {40, 40, 40};
    else
        Window.FontColor = {69, 69, 69}; 
        Window.MainColor = {150, 150, 150};
        Window.BackgroundColor = {200, 200, 200};
        Window.AccentColor = {255, 50, 255}; 
        Window.OutlineColor = {100, 100, 100};
    end
end)
