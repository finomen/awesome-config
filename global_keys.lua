function next_app()
    awful.client.focus.byidx(1)
    if client.focus then client.focus:raise() end
end

function prev_app()
    awful.client.focus.byidx(-1)
    if client.focus then client.focus:raise() end
end

function history_prev ()
    awful.client.focus.history.previous()
    if client.focus then
        client.focus:raise()
    end
end


local globalkeys = awful.util.table.join(
    -- Menu control
    awful.key({ modkey }, "w", function() app_menu.main_menu:toggle() end),
    awful.key({ modkey }, "p", function () top_menu.show() end),

    -- Keyboard Layout
    awful.key({ "Control" }, "Shift_L", function () kbdcfg.switch() end),

    Alsa.Keys

)

function tag_view_only(i)
    return function()
        local screen = mouse.screen
        local tag = awful.tag.gettags(screen)[i]
        if tag then
            awful.tag.viewonly(tag)
        end
    end
end

function tag_toggle_view(i)
    return function() 
        local screen = mouse.screen
        local tag = awful.tag.gettags(screen)[i]
        if tag then
            awful.tag.viewtoggle(tag)
        end
    end
end

function tag_app_move(i)
    return function()
        local screen = mouse.screen
        local tag = awful.tag.gettags(screen)[i]
        if tag then
            awful.client.movetotag(tag)
        end
    end
end

function tag_toggle(i)
    return function()
        local screen = mouse.screen
        local tag = awful.tag.gettags(screen)[i]
        if tag then
            awful.client.toggletag(tag)
        end
   end
end


for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        -- View tag only
        awful.key({ modkey }, "#" .. i + 9, tag_view_only(i)),
        -- Toggle view
        awful.key({ modkey , "Control" }, "#" .. i + 9, tag_toggle_view(i)),
        -- Move app to tag
        awful.key({ modkey, "Shift" }, "#" .. i + 9, tag_app_move(i)),
        -- Toggle tag
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, tag_toggle(i))
    )
end

root.keys(globalkeys)

 -- Standard program
--    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),

    --awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
--    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
--    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
--    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
--    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
--    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
--    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
--    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),
--
--    awful.key({ modkey, "Control" }, "n", awful.client.restore),
--
    -- Prompt
--    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),
--
--    awful.key({ modkey }, "x",
--              function ()
--                  awful.prompt.run({ prompt = "Run Lua code: " },
--                  mypromptbox[mouse.screen].widget,
--                  awful.util.eval, nil,
--                  awful.util.getdir("cache") .. "/history_eval")
--              end),

