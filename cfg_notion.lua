-- Load default settings. The file cfg_defaults loads all the files
-- commented out below, except mod_dock. If you do not want to load
-- something, comment out this line, and uncomment the lines corresponding
-- the the modules or configuration files that you want, below.
-- The modules' configuration files correspond to the names of the 
-- modules with 'mod' replaced by 'cfg'.
dopath("mod_query")
dopath("mod_menu")
dopath("mod_tiling")
dopath("mod_xinerama")
dopath("mod_sp")
dopath("nik_functions")
dopath("cfg_kludges")
dopath("cfg_layouts")
dopath("cfg_nik")
dopath("cfg_mouse")
dopath("app")
dopath("xinerama_switcher")
dopath("move_current")
dopath("mod_notionflux")
dopath("net_client_list")

-- Some basic settings
ioncore.set{
    -- Maximum delay between clicks in milliseconds to be considered a
    -- double click.
    dblclick_delay=250,

    opaque_resize=true,

    -- Don't move the mouse cursor when changing frames with the keyboard
    warp=false,

    -- Default index for windows in frames: one of 'last', 'next' (for
    -- after current), or 'next-act' (for after current and anything with
    -- activity right after it).
    frame_default_index='next-act',
    
    -- Auto-unsqueeze transients/menus/queries.
    unsqueeze=true,
    
    -- Display notification tooltips for activity on hidden workspace.
    -- This is awesome in conjunction with urgentOnBell and a bell in the PROMPT
    screen_notify=true,
}