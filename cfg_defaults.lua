--
-- Notion default settings
--

dopath("cfg_keyboard")
dopath("cfg_mouse")
dopath("cfg_menuitems")
dopath("cfg_kludges")
dopath("cfg_layouts")

if os and os.execute("test -r ~/.notion/cfg_local.lua") == 0 then
    dopath("cfg_local") -- Anything that you don't want to share across machines
end

dopath("mod_query")
dopath("mod_menu")
dopath("mod_tiling")
dopath("mod_xinerama")
dopath("mod_sp")
dopath("mod_notionflux")

dopath("app")
dopath("xinerama_switcher")
dopath("net_client_list")
dopath("move_current")
dopath("look")

-- Some basic settings
ioncore.set{
    unsqueeze=true,
    screen_notify=true,
}