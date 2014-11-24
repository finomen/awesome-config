local StartMenu = {}

function StartMenu.Init(Core)
    local awful = Core.Module("awful")
    local beautiful = Core.Module("beautiful")

    local internet_menu = 
    {
        {" Chrome", "chromium", beautiful.chrome_icon},
        {" Post Link", os.getenv("HOME") .. "/PostLink/usr/share/PostLink/start.sh"}
    }

    local editors_menu = 
    {
        {" Sublime 3", "subl3"}
    }

    local office_menu = 
    {
        {" Writer", "libreoffice --writer"},
        {" Calc", "libreoffice --calc"}
    }

    local develop_menu = 
    {
        {" Mono Develop", "monodevelop"},
        {" Glade", "glade"},
        {" IntelliJ Idea", os.getenv("HOME") .. "/idea-IC-139.224.1/bin/idea.sh"}
    }

    local system_menu = 
    {
        {" Terminal", "terminology"},
        {" Midnight Commander", function() awful.util.spawn("terminology -e /usr/bin/mc") end},
    }

    local shutdown_menu =
    {
        {" Lock", "slimlock"}--,
    --    {" Shutdown", function () awesome.spawn("gdm-control --shutdown"); awesome.quit() end },
    --    {" Reboot", function () awesome.spawn("gdm-control --restart"); awesome.quit() end },
    }

    StartMenu.Menu = awful.menu({
        items = {
            {" Internet", internet_menu},
            {" Develop", develop_menu},
            {" Editors", editors_menu},
            {" Office", office_menu},
            {" System", system_menu},
            {" Exit", shutdown_menu}
        },
        theme = { width = 200 }
    })

    return StartMenu
end    

function StartMenu.Setup()
end

return StartMenu