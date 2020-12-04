--
-- Notion tiling module configuration file
--

-- Bindings for the tilings. 

defbindings("WTiling", {
    submap(CTRL.."K", {
        kpress("V", "WTiling.split_at(_, _sub, 'right', true)"),
        kpress("S", "WTiling.split_at(_, _sub, 'bottom', true)"),
        kpress("X", "WTiling.unsplit_at(_, _sub)"),
        kpress("Up", "move_current.move(_, 'up')"),
        kpress("Down", "move_current.move(_, 'down')"),
        kpress("Left", "move_current.move(_, 'left')"),
        kpress("Right", "move_current.move(_, 'right')"),
    })
})


-- Frame bindings
defbindings("WFrame", {
  submap(CTRL.."K", {
    kpress("K", "ioncore.goto_next(_, 'up')"),
    kpress("L", "xinerama_switcher(_, 'right')"),
    kpress("H", "xinerama_switcher(_, 'left')"),
    kpress("J", "ioncore.goto_next(_, 'down')"),
    kpress("N", "WFrame.switch_prev(_)"),
    kpress("M", "WFrame.switch_next(_)"),
    kpress("U", "WFrame.set_mode(_, 'floating')"),
    kpress("Y", "WFrame.set_mode(_, 'tiled')"),
    kpress("0", "WFrame.begin_kbresize(_)"),
  }),
  mdrag(META2.."Button1", "WFrame.p_tabdrag(_)"),     
})

defbindings("WFrame.floating", {
    submap(META.."K", {
        bdoc("Tile frame, if no tiling exists on the workspace"),
        kpress("B", "mod_tiling.mkbottom(_)"),
    }),
})


-- Context menu for tiled workspaces.

defctxmenu("WTiling", "Tiling", {
    menuentry("Destroy frame", 
              "WTiling.unsplit_at(_, _sub)"),

    menuentry("Split vertically", 
              "WTiling.split_at(_, _sub, 'bottom', true)"),
    menuentry("Split horizontally", 
              "WTiling.split_at(_, _sub, 'right', true)"),
    
    menuentry("Flip", "WTiling.flip_at(_, _sub)"),
    menuentry("Transpose", "WTiling.transpose_at(_, _sub)"),
    
    menuentry("Untile", "mod_tiling.untile(_)"),
    
    submenu("Float split", {
        menuentry("At left", 
                  "WTiling.set_floating_at(_, _sub, 'toggle', 'left')"),
        menuentry("At right", 
                  "WTiling.set_floating_at(_, _sub, 'toggle', 'right')"),
        menuentry("Above",
                  "WTiling.set_floating_at(_, _sub, 'toggle', 'up')"),
        menuentry("Below",
                  "WTiling.set_floating_at(_, _sub, 'toggle', 'down')"),
    }),

    submenu("At root", {
        menuentry("Split vertically", 
                  "WTiling.split_top(_, 'bottom')"),
        menuentry("Split horizontally", 
                  "WTiling.split_top(_, 'right')"),
        menuentry("Flip", "WTiling.flip_at(_)"),
        menuentry("Transpose", "WTiling.transpose_at(_)"),
    }),
})


-- Extra context menu extra entries for floatframes. 

defctxmenu("WFrame.floating", "Floating frame", {
    append=true,
    menuentry("New tiling", "mod_tiling.mkbottom(_)"),
})

