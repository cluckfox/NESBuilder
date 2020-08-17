-- NESBuilder plugin
-- samplePlugin.lua
--
-- To enable this plugin, remove the "_" from the start of the filename.

local plugin = {
    author = "SpiderDave",
}

function plugin.onInit()
    NESBuilder:createTab("sampleplugin", "Sample Plugin")
    NESBuilder:setTab("sampleplugin")
    
    local x,y,control,pad
    
    pad=6
    x=pad*1.5
    y=pad*1.5
    
    control = NESBuilder:makeLabel{x=x,y=y,name="PluginLabel",clear=true,text="This is a label."}
    y = y + control.height + pad

    -- Simple button test
    control = NESBuilder:makeButton{x=x,y=y,w=config.buttonWidth, name="PluginButton",text="Plugin test button 2"}
    y = y + control.height + pad

    -- import a method from a python module and run it.
    control = NESBuilder:makeButton{x=x,y=y,w=config.buttonWidth, name="PluginButton2",text="Python Test"}
    y = y + control.height + pad
    
end

function plugin.onBuild()
    print "onBuild!"
end

function PluginButton1_cmd()
    print("I'm a plugin button!")
end

function PluginButton2_cmd()
    -- import a method from a python module and run it.
    local hello = NESBuilder:importFunction('plugins.hello','hello')
    hello()
end


return plugin