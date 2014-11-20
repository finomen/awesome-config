local TagKeys = {
	
}

function TagViewOnly(i)
    return function()
        local screen = mouse.screen
        local tag = TagKeys.awful.tag.gettags(screen)[i]
        if tag then
            TagKeys.awful.tag.viewonly(tag)
        end
    end
end

function TagToggleView(i)
    return function() 
        local screen = mouse.screen
        local tag = TagKeys.awful.tag.gettags(screen)[i]
        if tag then
            TagKeys.awful.tag.viewtoggle(tag)
        end
    end
end

function TagAppMove(i)
    return function()
        local screen = mouse.screen
        local tag = TagKeys.awful.tag.gettags(screen)[i]
        if tag then
            TagKeys.awful.client.movetotag(tag)
        end
    end
end

function TagToggle(i)
    return function()
        local screen = mouse.screen
        local tag = TagKeys.awful.tag.gettags(screen)[i]
        if tag then
            TagKeys.awful.client.toggletag(tag)
        end
   end
end


function NextApp()
    TagKeys.awful.client.focus.byidx(1)
    if client.focus then client.focus:raise() end
end

function PrevApp()
    TagKeys.awful.client.focus.byidx(-1)
    if client.focus then client.focus:raise() end
end

function HistoryPrev ()
    TagKeys.awful.client.focus.history.previous()
    if client.focus then
        client.focus:raise()
    end
end


function TagKeys.Init(Core)
	local modKey = Core.Module("Keys").ModKey
	local gk = Core.Plugin("GlobalKeys")
	local awful = Core.Module("awful")
	TagKeys.awful = awful

	-- Navigate between tags
	gk.Add({ modKey }, "Left",   awful.tag.viewprev)
   	gk.Add({ modKey }, "Right",  awful.tag.viewnext)
    gk.Add({ modKey }, "Escape", awful.tag.history.restore)

	-- Navigate between apps
    gk.Add({ modKey }, "k",   NextApp)
    gk.Add({ modKey }, "j",   PrevApp)
    gk.Add({ modKey }, "Tab",   HistoryPrev)

    for i = 1, 9 do
        -- View tag only
        gk.Add({ modkey }, "#" .. i + 9, TagViewOnly(i))
        -- Toggle view
        gk.Add({ modkey , "Control" }, "#" .. i + 9, TagToggleView(i))
        -- Move app to tag
        gk.Add({ modkey, "Shift" }, "#" .. i + 9, TagAppMove(i))
        -- Toggle tag
        gk.Add({ modkey, "Control", "Shift" }, "#" .. i + 9, TagToggle(i))
    end

	return TagKeys
end

function TagKeys.Setup()
end

return TagKeys