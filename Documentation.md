# Raven B4's Config Support!
### A detailed Documentation about Raven B4's Config Support!

![Book logo](https://github.com/goinglikeatrainlol/Raven-B4-Config-Support/blob/main/Raven%20B4%20Background.png)
## Features that are currently included:
- Tabs
- Modules
- Info Cards
- Mini Toggles
- Sliders
- Savesystem (Best and Easiest Savesystem by far!)
- Custom Watermark
- Blacklist/Whitelist System
- More info!

...more features like colorpickers or dropdowns are coming soon aswell!

## Raven B4 Loadstring (REQUIRED)
Raven B4 with all the Modules included so you can start without having to spend alot of time doing the basics!
```lua
shared.RavenB4Started = true
local RavenConfig = loadstring(game:HttpGet('https://raw.githubusercontent.com/goinglikeatrainlol/RavenB4Roblox/main/Raven%20Main%20Loader'))()
```
Emtpy Raven B4 so you can start from sratch! (Recommended for Roblox Games that Raven B4 doesn't support!)
```lua
shared.RavenB4Started = true
local RavenConfig = loadstring(game:HttpGet('https://raw.githubusercontent.com/goinglikeatrainlol/RavenB4Roblox/main/Raven%20NoModules%20Loader'))()
```
Pick one of the above, but dont put them both in since it will mess up everything!

`shared.RavenB4Started` is very IMPORTANT since it tells Raven B4 that your making a Config. (IF YOU DO NOT HAVE `shared.RavenB4Started` THE CONFIGS WON'T WORK!)


## Creating a Tab
`IMPORTANT` This is only if you want to make your own custom tab, else just use the preloaded Tabs that Raven B4 offers!
```lua
TabName = RavenConfig:CreateWindow("Name",Position,"IconId")

--[[
TabName = As what the Tab is going to be referenced as.
Name = 'string' - The name of the tab.
Icon = 'string' - The icon of the tab.
Position = 'UDim2' - The Position of the tab.
]]
```

## Creating a Module
As Tabs you can either put it as `Combat` `Blatant` `Render` `Utility` `Client` or any custom Tabs you made!
```lua
Module = Tab:CreateToggle({
    Name = "Name",
    StartingState = false,
    Callback = function(Callback)
end})

--[[
Module = As what the Module is going to be referenced as.
Name = 'string' - The name of the tab.
Callback = 'function' - The function of the button.
StartingState = 'bool' - Sets the State of the Module (Note that this only works when the Player inject Raven B4 for the FIRST TIME, else the SaveSystem takes over!)
]]
```

DON'T HAVE 2 MODULES WITH THE SAME NAME IF YOU WANT IT TO FUNCTION PROPERLY!

## Creating a Info Card
```lua
Module:CreateInfo(Text)

--[[
Text = 'string' - The Text you want to be shown in the Info Card.
]]
```

## Creating a Mini Toggle
```lua
Module:CreateToggle({
    Name = "Name",
    StartingState = false,
    Callback = function(Callback)
end})

--[[
Name = 'string' - The name of the tab.
Callback = 'function' - The function of the button.
StartingState = 'bool' - Sets the State of the Module (Note that this only works when the Player inject Raven B4 for the FIRST TIME, else the SaveSystem takes over!)
]]
```

## Creating a Slider
```lua
Module:CreateSlider({
    Name = "Name",
    Default = 50,
    Min = 0,
    Max = 100,
    Callback = function(Callback)
    end
})

--[[
Name = 'string' - The name of the slider.
Default = 'number' - Sets the State of the Module (Note that this only works when the Player inject Raven B4 for the FIRST TIME, else the SaveSystem takes over!)
Min = 'number' - The minimum value of the slider.
Max - 'number' - The maxium value of the slider.
Callback = 'function' - The function of the slider.
]]
```
## Creating a DropDown
```lua
Module:CreateDropDown({
    Name = "Name",
    Title = "Testing",
    DefaultOption = "Test1",
    Options = {"Test1","Test2"},
    Callback = function()
end})

--[[
Name = 'string' - The name of the DropDown.
Title = 'string' - The name that will be displayed on the dropdown!
DefaultOption = 'string' - The Default option that will be displayed when you open up Raven B4 for the first time! (DefaultOption only works if the option is in the Option Table)
Options = 'table' - What the Dropdown will contain!
Callback = 'function' - Callback of the option selected.
]]
```
## Creating a Notification
```lua
RavenConfig:createnotification("Message",Time)

--[[
Message = 'string' - the message you want to tell the Player.
Time = 'number' - the amount of time you want the Notification to stay.
]]
```
## Finishing your Config! (REQUIRED!)
```lua
shared.RavenB4Completed = true
```
Put this at the end of your Code to make Raven B4 save your Config!

# Exclusive Raven B4 features!
These are exclusive to Raven B4 since it adds complex features with a easy way to configure them!

## Custom Folder
```lua
shared.RavenConfigName = "My Config Name"
```
`shared.RavenConfigName` Is what ur Textfile is going to be called, put this above the Loadstring!

If this is left blank, the Name of your Textfile will be called `Default Config`

## Custom WaterMark
```lua
shared.WaterMark = "Random Config Name"
shared.WaterMarkColor = Color3.fromRGB(255,255,255) -- Put any RGB Value you want here!
```
`shared.WaterMark` will make a new module called `Custom Watermark` so you can have your own custom WaterMark!

`shared.WaterMarkColor` explains itself really, just makes the Watermark Color different!

Put these `shared` values above the loadstring for it to function correctly!

## Whitelist/Blacklist
```lua
shared.RavenWhitelist = {"HWID of a User","HWID of another User"}
shared.RavenBlacklist = {"HWID of a User","HWID of another User"}
```
`shared.RavenWhitelist` will kick anyone that doesn't have the same HWID as the one in the table, the Whitelist automaticly deletes itself when its done checking!

`shared.RavenBlacklist` will kick anyone that does have the same HWID as the one in the table, the Blacklist automaticly deletes itself when its done checking!

If you use any of these Whitelists or Blacklists, put them above your loadstring for it to function correctly!

## Script Protection
`Lua Obfuscators` are something you want to keep in mind when creating your configs, sadly Raven B4 doesn't offer any obfuscators for lua, but I do have some to recommend, mainly MoonSec V3 since it offers pretty good protection that doesn't allow people to skid of your configs + it is 100% free!
(You can also pay for an obfuscator if you're rich enough, but MoonSec V3 offers pretty good lua protection!)

## HTTP interceptor!
`Webhooks` are also something I kept in mind when creating Raven B4 since most people use it for malicious intent!

Thats why Raven B4 has a HTTP interceptor built in that allows you to execute Configs without worrying about it doing something in the background.

## Uninjecting Raven B4
`COMING SOON!`

# Thanks for the Support! ❤️
The amount of People actually waiting for this Update and supporting it is amazing! Thanks alot!

If you find any bugs/something in the Documentation that is wrongly written, then be sure to dm me on discord! `Discord Username: nea.r`

If you want to get more Updates about Raven B4 then join the Discord - https://discord.com/invite/TGQqnfG3Bt | RAVEN B4 ON🔝
