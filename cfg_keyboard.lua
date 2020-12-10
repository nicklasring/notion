-- WScreen context bindings
-- The bindings in this context are available all the time.
defbindings("WScreen", {
    bdoc("Switch to object 0 (workspace, full screen client window) "..
         "within current screen.", "ws 0"),
    kpress(META2.."1", "WScreen.switch_nth(_, 0)"),
    bdoc("Switch to object 1 (workspace, full screen client window) "..
         "within current screen.", "ws 1"),
    kpress(META2.."2", "WScreen.switch_nth(_, 1)"),
    bdoc("Switch to object 2 (workspace, full screen client window) "..
         "within current screen.", "ws 2"),
    kpress(META2.."3", "WScreen.switch_nth(_, 2)"),
    bdoc("Switch to object 3 (workspace, full screen client window) "..
         "within current screen.", "ws 3"),
    kpress(META2.."4", "WScreen.switch_nth(_, 3)"),
    bdoc("Switch to object 4 (workspace, full screen client window) "..
         "within current screen.", "ws 4"),
    kpress(META2.."5", "WScreen.switch_nth(_, 4)"),
    bdoc("Switch to object 5 (workspace, full screen client window) "..
         "within current screen.", "ws 5"),
    kpress(META2.."6", "WScreen.switch_nth(_, 5)"),
    bdoc("Switch to object 6 (workspace, full screen client window) "..
         "within current screen.", "ws 6"),
    kpress(META2.."7", "WScreen.switch_nth(_, 6)"),
    bdoc("Switch to object 7 (workspace, full screen client window) "..
         "within current screen.", "ws 7"),
    kpress(META2.."8", "WScreen.switch_nth(_, 7)"),
    bdoc("Switch to object 8 (workspace, full screen client window) "..
         "within current screen.", "ws 8"),
    kpress(META2.."9", "WScreen.switch_nth(_, 8)"),
    bdoc("Switch to object 9 (workspace, full screen client window) "..
         "within current screen.", "ws 9"),
    kpress(META2.."0", "WScreen.switch_nth(_, 9)"),

    bdoc("Go to first object on activity/urgency list."),
    -- This is killer in conjunction with using a terminal that
    -- raises urgent on bell and a bash prompt that contains a bell.
    kpress(META2.."space", "ioncore.goto_activity()"),

    
    bdoc("Display the main menu."),
    kpress("F1", "mod_query.query_menu(_, _sub, 'mainmenu', 'Main menu:')"),

    kpress("F2", "ioncore.exec_on(_, XTERM)"),
    kpress("Print", "ioncore.exec('import -window root -delay 200 /tmp/screenshot.png')"),
    kpress(META2.."Return", "ioncore.exec_on(_, XTERM)"),

    kpress(META2.."R", "ioncore.exec('rofi -show run')"),
    kpress(META2.."P", "ioncore.exec('rofi -show window')"),
    kpress(META.."Tab", "ioncore.exec('rofi -show window')"),


    kpress(CTRL.."Q", "WRegion.rqclose_propagate(_, _sub)"),
    submap(CTRL.."K", {
        kpress("R", "ioncore.restart()"),
    })
})


-- Client window bindings
--
-- These bindings affect client windows directly.

defbindings("WClientWin", {
    bdoc("Nudge the client window. This might help with some "..
         "programs' resizing problems."),
    kpress_wait(META.."L", "WClientWin.nudge(_)"),
    
    bdoc("Send next key press to the client window. "),
    kpress(META.."apostrophe", "WClientWin.quote_next(_)"),
})


-- Client window group bindings

defbindings("WGroupCW", {
    bdoc("Toggle client window group full-screen mode"),
    kpress_wait(META.."Return", "WGroup.set_fullscreen(_, 'toggle')"),
})


-- WMPlex context bindings
--
-- These bindings work in frames and on screens. The innermost of such
-- contexts/objects always gets to handle the key press. 

defbindings("WMPlex", {
    bdoc("Close current object."),
    kpress_wait(META.."W", "WRegion.rqclose_propagate(_, _sub)"),
})

-- Frames for transient windows ignore this bindmap
defbindings("WMPlex.toplevel", {
    bdoc("Toggle tag of current object."),
    kpress(META.."T", "WRegion.set_tagged(_sub, 'toggle')", "_sub:non-nil"),

    bdoc("Query for Lua code to execute."),
    kpress(META.."F3", "mod_query.query_lua(_)"),

    bdoc("Query for workspace to go to or create a new one."),
    kpress("F9", "mod_query.query_workspace(_)"),
    
    bdoc("Display context menu."),
    --kpress(META.."M", "mod_menu.menu(_, _sub, 'ctxmenu')"),
    kpress(META2.."M", "mod_query.query_menu(_, _sub, 'ctxmenu', 'Context menu:')"),

    bdoc("Detach (float) or reattach an object to its previous location."),
    -- By using _chld instead of _sub, we can detach/reattach queries
    -- attached to a group. The detach code checks if the parameter 
    -- (_chld) is a group 'bottom' and detaches the whole group in that
    -- case.
    kpress(META2.."D", "ioncore.detach(_chld, 'toggle')", "_chld:non-nil"),
    
})
