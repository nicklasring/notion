-- Lua functions
function ssh(name)
  return "xterm -e ssh " .. name
end

function os.customexec(cmd, raw)
    local f = assert(io.popen(cmd, 'r'))
    local s = assert(f:read('*a'))
    f:close()
    if raw then return s end
    s = string.gsub(s, '^%s+', '')
    s = string.gsub(s, '%s+$', '')
    s = string.gsub(s, '[\n\r]+', ' ')
    return s
end

function term_with_name(mplex, sub, themenu, prompt)
    if type(sub)=="string" then
        -- Backwards compat. shift
        prompt=themenu
        themenu=sub
        sub=nil
    end

    local menu=ioncore.evalmenu(themenu, mplex, sub)
    local menuname=(type(themenu)=="string" and themenu or "?")

    if not prompt then
        prompt=menuname..":"
    else
        prompt=TR(prompt)
    end

    local function xform_menu(t, m, p)
        return nil
    end

    local function complete(str)
       return nil
    end

    local ntab=xform_menu({}, menu, "")

    local function handle(mplex, str)
        ioncore.exec('xterm -xrm "XTerm.vt100.allowTitleOps: false" -T "' .. str .. '"')
    end

    mod_query.query(mplex, prompt, nil, handle,mod_query.make_completor(complete), "menu."..menuname)
end