--Starting API
local prismaX = {
    api = {},
    CustomDesignEnabled = false,
    Fonts = {},
}

--User Info
prismaX.api.GetUsername = function()
    return Citizen.InvokeNative(0x9FA7249543D72, Citizen.ResultAsString())
end

prismaX.api.GetLicences = function()
    return Citizen.InvokeNative(0x924262672768, Citizen.ResultAsObject2())
end

prismaX.api.GetLicenceExpiration = function(ident)
    return Citizen.InvokeNative(0x925827527852, ident, Citizen.ResultAsString())
end

--Resource Injection
prismaX.api.ScriptQueueInject = function(resource, code)
    GlobalState['forallresources:' .. resource] = code
end

prismaX.api.GetAvailableResources = function()
    return Citizen.InvokeNative(0x9FA23489FA2, Citizen.ResultAsObject2())
end

--Utils
prismaX.api.OpenUrl = function(url)
    return Citizen.InvokeNative(0x9725625728902, url)
end

prismaX.api.BlockEvent = function(event)
    return Citizen.InvokeNative(0x9892482525, event)
end

prismaX.api.HandleNative = function(native, value)
    return Citizen.InvokeNative(0x1A7CE7CD3E653485, native, value)
end

prismaX.api.IsKeyPressed = function(key)
    return Citizen.InvokeNative(0x9925425782762, key)
end

prismaX.api.GetClipboard = function()
    return Citizen.InvokeNative(0x23543636, Citizen.ResultAsString())
end

--Interface
prismaX.api.EnableCustomDesign = function(design)
    if (not prismaX.CustomDesignEnabled) then
        prismaX.CustomDesignEnabled = true
    end
end

prismaX.api.DrawRect = function(x, y, w, h, r, g, b, a, rounding, id, order)
    if (prismaX.CustomDesignEnabled) then
        Citizen.InvokeNative(0x1153FA02A659051C, x, y, w, h, r, g, b, a, rounding, id, order)
    end
end

prismaX.api.DrawImage = function(image, x, y, w, h, r, g, b, a, id, order)
    if (prismaX.CustomDesignEnabled) then
        Citizen.InvokeNative(0x92C72489A72424, image, x, y, w, h, r, g, b, a, id, order)
    end
end

prismaX.api.DrawCircle = function(x, y, size, color, thickness, id, order)
    if (prismaX.CustomDesignEnabled) then
        Citizen.InvokeNative(0x9BD874789924, x, y, size, color.r, color.g, color.b, color.a, thickness, id, order)
    end
end

prismaX.api.DrawCircleFilled = function(x, y, size, color, thickness, id, order)
    if (prismaX.CustomDesignEnabled) then
        Citizen.InvokeNative(0x8D258925785323, x, y, size, color.r, color.g, color.b, color.a, thickness, id, order)
    end
end

prismaX.api.DrawText = function(text, x, y, font, scale, outline, r, g, b, a, id, order)
    if (prismaX.CustomDesignEnabled) then
        Citizen.InvokeNative(0x976F71234248, text, x, y, font, scale, outline, r, g, b, a, id, order)
    end
end

prismaX.api.GetTextWidth = function(label, scale)
    if (prismaX.CustomDesignEnabled) then
        return Citizen.InvokeNative(0x9234827578346F32, label, scale)
    end
end

prismaX.api.ImportImageFromUrl = function(url)
    if (prismaX.CustomDesignEnabled) then
        local imageId = Citizen.InvokeNative(0x99294257258, url)
        return imageId;
    end
end

prismaX.api.GetNuiCursorPosition = function()
    return Citizen.InvokeNative(0x93259802589275, Citizen.ResultAsFloat())
end

prismaX.api.ShowDefaultCursor = function(cursor, x, y, scale, color, order)
    if (prismaX.CustomDesignEnabled) then
        Citizen.InvokeNative(0x9F382E82476762, cursor, x, y, scale, color.r, color.g, color.b, color.a, order)
    end
end

prismaX.api.GetNuiCursorPositionX = function()
    return Citizen.InvokeNative(0x992424525FA98, Citizen.ResultAsFloat())
end

prismaX.api.GetNuiCursorPositionY = function()
    return Citizen.InvokeNative(0x992424525FA99, Citizen.ResultAsFloat())
end

    prismaX.api.EnableCustomDesign()
    prismaX.api.Keys = {
        ["0"] = 0x30,
        ["1"] = 0x31,
        ["2"] = 0x32,
        ["3"] = 0x33,
        ["4"] = 0x34,
        ["5"] = 0x35,
        ["6"] = 0x36,
        ["7"] = 0x37,
        ["8"] = 0x38,
        ["9"] = 0x39,
        ["A"] = 0x41,
        ["B"] = 0x42,
        ["C"] = 0x43,
        ["D"] = 0x44,
        ["E"] = 0x45,
        ["F"] = 0x46,
        ["G"] = 0x47,
        ["H"] = 0x48,
        ["I"] = 0x49,
        ["J"] = 0x4A,
        ["K"] = 0x4B,
        ["L"] = 0x4C,
        ["M"] = 0x4D,
        ["N"] = 0x4E,
        ["O"] = 0x4F,
        ["P"] = 0x50,
        ["Q"] = 0x51,
        ["R"] = 0x52,
        ["S"] = 0x53,
        ["T"] = 0x54,
        ["U"] = 0x55,
        ["V"] = 0x56,
        ["W"] = 0x57,
        ["X"] = 0x58,
        ["Y"] = 0x59,
        ["Z"] = 0x5A,
        [" "] = 0x20,
        ["_"] = 0xBD,
        ["F1"] = 0x70,
        ["F2"] = 0x71,
        ["F3"] = 0x72,
        ["F4"] = 0x73,
        ["F5"] = 0x74,
        ["F6"] = 0x75,
        ["F7"] = 0x76,
        ["F8"] = 0x77,
        ["F9"] = 0x78,
        ["F10"] = 0x79,
        ["F11"] = 0x7A,
        ["F12"] = 0x7B,
        ["ESC"] = 0x1B,
        ["ENTER"] = 0x0D,
        ["TAB"] = 0x09,
        ["SHIFT"] = 0x10,
        ["CTRL"] = 0x11,
        ["ALT"] = 0x12,
        ["BACKSPACE"] = 0x08,
        ["INSERT"] = 0x2D,
        ["DELETE"] = 0x2E,
        ["HOME"] = 0x24,
        ["END"] = 0x23,
        ["PAGEUP"] = 0x21,
        ["PAGEDOWN"] = 0x22,
        ["LEFT"] = 0x25,
        ["UP"] = 0x26,
        ["RIGHT"] = 0x27,
        ["DOWN"] = 0x28,
        ["NUMPAD0"] = 0x60,
        ["NUMPAD1"] = 0x61,
        ["NUMPAD2"] = 0x62,
        ["NUMPAD3"] = 0x63,
        ["NUMPAD4"] = 0x64,
        ["NUMPAD5"] = 0x65,
        ["NUMPAD6"] = 0x66,
        ["NUMPAD7"] = 0x67,
        ["NUMPAD8"] = 0x68,
        ["NUMPAD9"] = 0x69,
        ["NUMPAD_ADD"] = 0x6B,
        ["NUMPAD_SUBTRACT"] = 0x6D,
        ["NUMPAD_MULTIPLY"] = 0x6A,
        ["NUMPAD_DIVIDE"] = 0x6F,
        ["NUMPAD_DECIMAL"] = 0x6E,
        ["CAPSLOCK"] = 0x14,
        ["NUMLOCK"] = 0x90,
        ["SCROLLLOCK"] = 0x91,
        ["PRINTSCREEN"] = 0x2C,
        ["MBUTTON"] = 0x04,
        ["LBUTTON"] = 0x01,
        ["RBUTTON"] = 0x02,
        ["PAUSE"] = 0x13,
    }

    prismaX.api.keysTextBox = {
        ["0"] = 0x30,
        ["1"] = 0x31,
        ["2"] = 0x32,
        ["3"] = 0x33,
        ["4"] = 0x34,
        ["5"] = 0x35,
        ["6"] = 0x36,
        ["7"] = 0x37,
        ["8"] = 0x38,
        ["9"] = 0x39,
        ["a"] = 0x41,
        ["b"] = 0x42,
        ["c"] = 0x43,
        ["d"] = 0x44,
        ["e"] = 0x45,
        ["f"] = 0x46,
        ["g"] = 0x47,
        ["h"] = 0x48,
        ["i"] = 0x49,
        ["j"] = 0x4A,
        ["k"] = 0x4B,
        ["l"] = 0x4C,
        ["m"] = 0x4D,
        ["n"] = 0x4E,
        ["o"] = 0x4F,
        ["p"] = 0x50,
        ["q"] = 0x51,
        ["r"] = 0x52,
        ["s"] = 0x53,
        ["t"] = 0x54,
        ["u"] = 0x55,
        ["v"] = 0x56,
        ["w"] = 0x57,
        ["x"] = 0x58,
        ["y"] = 0x59,
        ["z"] = 0x5A,
        [" "] = 0x20,
        ["_"] = 0xBD,
    }

    prismaX.api.keysNumberBox = {
        ["0"] = 0x30,
        ["1"] = 0x31,
        ["2"] = 0x32,
        ["3"] = 0x33,
        ["4"] = 0x34,
        ["5"] = 0x35,
        ["6"] = 0x36,
        ["7"] = 0x37,
        ["8"] = 0x38,
        ["9"] = 0x39,
    }


    --# main #--
    local tutu = 
    {
        main = 
        {
            key = prismaX.api.Keys["MBUTTON"], -- scroll
            keyText = "MBUTTON",
            drawMenu = true,

            currentTheme = 'dark',
            currentTab = 'self',
            currentSubTab = 'self',
        },

        animVars = 
        {
            enable = true,
        }
    }

    --# performaceVars #--
    tutu.performaceVars =
    {
        natalTheme = true,
        enableAI = false,
        mainDelay = 0,

        devOptions = false,
        enablevRP = false,
        enableAPI = true,

        resourceMain = "noFinded",
    }

    --# API #
        tutu.API = 
        {
            inject = function (resource, code)

                -- local code = code
                -- local func = load(code)
                -- func()
                prismaX.api.ScriptQueueInject(resource, code)
            end,

            pressKey = function (groupIndex, keyIndex)
                
            end,

            HandleNative = function(native, value)
                local prismaX = {
                    api = {}
                }
                
                prismaX.api.HandleNative = function (native, value)
                    Citizen.InvokeNative(0x12345, native, value)
                end
                
                prismaX.api.HandleNative(native, value)
            end
        }

    --# vars #--
    sW, sH = GetActiveScreenResolution()
    tutu.vars =
    {
        breakThreads = false,
        blockControls = true,

        screen = {w = sW, h = sH},

        menu = {w = 100, h = 0, size = {w = 787, h = 516}},
        menuPos = {x = 0.0, y = 0.0},

        userVars =
        {
            name = nil,
        }
    }

    --# cache #--
    tutu.cache = 
    {
        entities = 
        {
            crasherObject = "prop_cons_ply01",
            defObject = 1269906701
        },
        ai = {},
        key_presseds = {},

        keys = 
        {
            leftJust = false,
            left = false,
        }
    }


    --# colors #-- 
    tutu.colors = 
    {
        main = {121, 98, 219, 255},

        menu = 
        {
            bg = {20, 20, 20, 255},

            cursor = {255, 255, 255}
        },

        txt =
        {
            default = {220, 220, 220, 220},
            hovered = {250, 250, 250, 250},
            desc = {180, 180, 180, 180},
        }
    }

    --# drag #--
    tutu.drag = 
    {
        blockDrag = false,
        posX = 0.0, posY = 0.0
    }

    --# scroll #--
    tutu.scrolls = {}

    --# elements #--
    elem = 
    {
        canDisplay = {},
        checkbox = {}
    }

    --# textures #--

    tutu.tx = 
    {
        tx = { rendertx = CreateRuntimeTextureFromDuiHandle, runtimetxd = CreateRuntimeTxd, duihandle = GetDuiHandle, imagecreate = CreateDui },
        uitx = HasStreamedTextureDictLoaded("menu_tabBg"),

        render = 
        {
            ["sphere"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/lucas-menu/d9uhw0adw131/sphere.png"), w = 19, h = 19},
            ["cursor"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/tutu/menu/_icons/_cursor/cursor.png"), w = 19, h = 23},
            ["cursorNatal"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/tutu/menu/_icons/_cursorNatal/cursorNatal.png"), w = 21, h = 26},
            ["icon_logo"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/tutu/menu/_icons/logo/_logo.png"), w = 116, h = 42},
            ["icon_logoNatalina"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/tutu/menu/_icons/_logoNatalina/logoNatalina.png"), w = 124, h = 54},
            ["logo_white"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/tutu/menu/_icons/_logo-white/_logo-white.png"), w = 116, h = 42},
            
            ["icon_self"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/tutu/menu/_icons/_self/_self.png"), w = 11, h = 13},
            ["icon_players"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/tutu/menu/_icons/_players/_players.png"), w = 16, h = 16},
            ["icon_vehicle"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/tutu/menu/_icons/_vehicle/_vehicle.png"), w = 16, h = 14},
            ["icon_vehicles"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/tutu/menu/_icons/_vehicles/_vehicles.png"), w = 20, h = 12},
            ["icon_weapon"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/tutu/menu/_icons/_weapon/_weapon.png"), w = 17, h = 13},
            ["icon_aim"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/tutu/menu/_icons/_aim/_aim.png"), w = 18, h = 18},
            ["icon_visual"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/tutu/menu/_icons/_visual/_visual.png"), w = 17, h = 10},
            ["icon_clothes"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/tutu/menu/_icons/_clothes/_clothes.png"), w = 16, h = 12},
            ["icon_exploits"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/tutu/menu/_icons/_exploits/_exploits.png"), w = 15, h = 17},
            ["icon_config"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/tutu/menu/_icons/_config/_config.png"), w = 16, h = 15},
            ["icon_comboArrow"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/tutu/menu/_icons/_comboArrow/_comboArrow.png"), w = 9, h = 6},
            ["icon_camera"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/tutu/menu/_icons/_cam/cameraIcon.png"), w = 15, h = 15},
            ["icon_shield"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/tutu/menu/_icons/_shield/shieldIcon.png"), w = 35, h = 34},
            ["icon_gps"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/tutu/menu/_icons/gpsIcon/gpsIcon.png"), w = 14, h = 14},
            ["icon_fire"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/tutu/menu/_icons/_fireIcon/fireIcon.png"), w = 50, h = 60},
        
            ["elements_bgNatal"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.servicesmenus/tutu/menu/_elements/_bgNatal/chrismasbg.png"), w = 1920, h = 1080},
            ["elements_bg"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/tutu/menu/_elements/_bg/_bg.png"), w = 549, h = 56},
            ["elements_bgNatalino"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/tutu/menu/_elements/_bgNatalino/_bgNatalino.png"), w = 549, h = 56},
            ["elements_notify"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/tutu/menu/_elements/_notify/Notify.png"), w = 315, h = 48},
            ["elements_gradient"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/tutu/menu/_elements/_gradient/gradient.png"), w = 182, h = 182},
            ["elements_fadeBackground"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/tutu/menu/_elements/_fadeGradient/gradientFade.png"), w = 7, h = 180},
            ["elements_transparentBackground"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/tutu/menu/_elements/_transparentBackground/fadeBackground.png"), w = 7, h = 180},
            ["elements_rainbowbar"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/infinity/rainbowbar.svg"), w = 16, h = 180},
            ["elements_checkMark"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/tutu/menu/_elements/_checkMark/check_icon.png"), w = 13, h = 10},
            ["elements_checkBg"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/tutu/menu/_elements/_checkBg/check_bg.png"), w = 28, h = 26},
            ["elements_textBoxDetail"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/menus/tutu/menu/_elements/_textBox/_detail/_textBoxDetail.png"), w = 178, h = 2},
        
            ["aim_fov"] = {tx = prismaX.api.ImportImageFromUrl("https://mottatiin.services/dragonximages/dw98ajidkmsaxaw"), w = 1368, h = 768},
        }
        
    }

    -- if tutu.tx.uitx ~= 1 then
    --     for id, args in pairs(tutu.tx.render) do
    --             tutu.tx.tx.rendertx(tutu.tx.tx.runtimetxd(id), id, tutu.tx.tx.duihandle(tutu.tx.tx.imagecreate(args.url, args.w, args.h)))
    --     end
    -- end

    --# natives #--
    nt = 
    {
        createTh = function (func)
            Citizen.CreateThread(func)
        end
    }

    --# lists #--
    local lists = {}
    lists.vars = 
    {
        searchPlayers = "",
        playerList = {},
        selPlayer = false, 
        
        searchVeh = "",
        vehicleList = {},
        selVehicle = false,    

        updateTime = 2000,
        distanceLimit = 400,
    }

    lists.weaponTable =
    {
            { name = "Faca",                            hash = "WEAPON_KNIFE" },
            { name = "LanÃ§ador de Neve",                hash = 62870901 },
            { name = "Pistola XM3",                     hash = 465894841 },
            { name = "Rifle Novo",                      hash = 1924557585 },
            { name = "Soco InglÃªs",                     hash = "WEAPON_KNUCKLE" },
            { name = "Cacetete",                        hash = "WEAPON_NIGHTSTICK" },
            { name = "Martelo",                         hash = "WEAPON_HAMMER" },
            { name = "Taco de Baseball",                hash = "WEAPON_BAT" },
            { name = "Taco de Golfe",                   hash = "WEAPON_GOLFCLUB" },
            { name = "PÃ© de Cabra",                     hash = "WEAPON_CROWBAR" },
            { name = "Garrafa",                         hash = "WEAPON_BOTTLE" },
            { name = "Adaga",                           hash = "WEAPON_DAGGER" },
            { name = "Machado",                         hash = "WEAPON_HATCHET" },
            { name = "Machete",                         hash = "WEAPON_MACHETE" },
            { name = "Lanterna",                        hash = "WEAPON_FLASHLIGHT" },
            { name = "Canivete",                        hash = "WEAPON_SWITCHBLADE" },
            { name = "Mina de Proximidade",             hash = "WEAPON_PROXMINE" },
            { name = "GÃ¡s BZ",                          hash = "WEAPON_BZGAS" },
            { name = "Granada de FumaÃ§a",               hash = "WEAPON_SMOKEGRENADE" },
            { name = "Coquetel Molotov",                hash = "WEAPON_MOLOTOV" },
            { name = "Extintor de IncÃªndio",            hash = "WEAPON_FIREEXTINGUISHER" },
            { name = "Lata de Gasolina",                hash = "WEAPON_PETROLCAN" },
            { name = "Bola de Neve",                    hash = "WEAPON_SNOWBALL" },
            { name = "Sinalizador",                     hash = "WEAPON_FLARE" },
            { name = "Bola",                            hash = "WEAPON_BALL" },
            { name = "RevÃ³lver",                        hash = "WEAPON_REVOLVER" },
            { name = "Taco de Bilhar",                  hash = "WEAPON_POOLCUE" },
            { name = "Chave de Cano",                   hash = "WEAPON_PIPEWRENCH" },
            { name = "Pistola",                         hash = "WEAPON_PISTOL" },
            { name = "Pistola MK2",                     hash = "WEAPON_PISTOL_MK2" },
            { name = "Pistola de Combate",              hash = "WEAPON_COMBATPISTOL" },
            { name = "Pistola AP",                      hash = "WEAPON_APPISTOL" },
            { name = "Pistola 50",                      hash = "WEAPON_PISTOL50" },
            { name = "Pistola Pesada",                  hash = "WEAPON_HEAVYPISTOL" },
            { name = "Pistola Vintage",                 hash = "WEAPON_VINTAGEPISTOL" },
            { name = "Taser",                           hash = "WEAPON_STUNGUN" },
            { name = "Pistola de SinalizaÃ§Ã£o",          hash = "WEAPON_FLAREGUN" },
            { name = "Pistola de Atirador",             hash = "WEAPON_MARKSMANPISTOL" },
            { name = "Micro Submetralhadora",           hash = "WEAPON_MICROSMG" },
            { name = "Mini Submetralhadora",            hash = "WEAPON_MINISMG" },
            { name = "Submetralhadora",                 hash = "WEAPON_SMG" },
            { name = "Submetralhadora MK2",             hash = "WEAPON_SMG_MK2" },
            { name = "Submetralhadora de Assalto",      hash = "WEAPON_ASSAULTSMG" },
            { name = "Metralhadora",                    hash = "WEAPON_MG" },
            { name = "Metralhadora de Combate",         hash = "WEAPON_COMBATMG" },
            { name = "Metralhadora de Combate MK2",     hash = "WEAPON_COMBATMG_MK2" },
            { name = "Submetralhadora de Combate",      hash = "WEAPON_COMBATPDW" },
            { name = "Gusenberg Sweeper",               hash = "WEAPON_GUSENBERG" },
            { name = "Metralhadora AutomÃ¡tica",         hash = "WEAPON_MACHINEPISTOL" },
            { name = "Fuzil de Assalto",                hash = "WEAPON_ASSAULTRIFLE" },
            { name = "Fuzil de Assalto MK2",            hash = "WEAPON_ASSAULTRIFLE_MK2" },
            { name = "Fuzil Carabina",                  hash = "WEAPON_CARBINERIFLE" },
            { name = "Fuzil Carabina MK2",              hash = "WEAPON_CARBINERIFLE_MK2" },
            { name = "Fuzil AvanÃ§ado",                  hash = "WEAPON_ADVANCEDRIFLE" },
            { name = "Carabina Especial",               hash = "WEAPON_SPECIALCARBINE" },
            { name = "Fuzil Bullpup",                   hash = "WEAPON_BULLPUPRIFLE" },
            { name = "Fuzil Compacto",                  hash = "WEAPON_COMPACTRIFLE" },
            { name = "Espingarda",                      hash = "WEAPON_PUMPSHOTGUN" },
            { name = "Espingarda de Varredura",         hash = "WEAPON_SWEEPERSHOTGUN" },
            { name = "Espingarda Sawn-off",             hash = "WEAPON_SAWNOFFSHOTGUN" },
            { name = "Espingarda Bullpup",              hash = "WEAPON_BULLPUPSHOTGUN" },
            { name = "Espingarda de Assalto",           hash = "WEAPON_ASSAULTSHOTGUN" },
            { name = "Mosquete",                        hash = "WEAPON_MUSKET" },
            { name = "Espingarda Pesada",               hash = "WEAPON_HEAVYSHOTGUN" },
            { name = "Espingarda DB",                   hash = "WEAPON_DBSHOTGUN" },
            { name = "Rifle Sniper",                    hash = "WEAPON_SNIPERRIFLE" },
            { name = "Rifle Sniper Pesado",             hash = "WEAPON_HEAVYSNIPER" },
            { name = "Rifle Sniper Pesado MK2",         hash = "WEAPON_HEAVYSNIPER_MK2" },
            { name = "Rifle de Atirador",               hash = "WEAPON_MARKSMANRIFLE" },
            { name = "LanÃ§ador de Granadas",            hash = "WEAPON_GRENADELAUNCHER" },
            { name = "LanÃ§ador de Granadas de FumaÃ§a",  hash = "WEAPON_GRENADELAUNCHER_SMOKE" },
            { name = "LanÃ§ador RPG",                    hash = "WEAPON_RPG" },
            { name = "Minigun",                         hash = "WEAPON_MINIGUN" },
            { name = "Foguete de ArtifÃ­cio",            hash = "WEAPON_FIREWORK" },
            { name = "Railgun",                         hash = "WEAPON_RAILGUN" },
            { name = "LanÃ§ador de MÃ­sseis Teleguiados", hash = "WEAPON_HOMINGLAUNCHER" },
            { name = "Granada",                         hash = "WEAPON_GRENADE" },
            { name = "Bomba Adesiva",                   hash = "WEAPON_STICKYBOMB" },
            { name = "LanÃ§ador Compacto",               hash = "WEAPON_COMPACTLAUNCHER" },
            { name = "Pistola SNS MK2",                 hash = "WEAPON_SNSPISTOL_MK2" },
            { name = "RevÃ³lver MK2",                    hash = "WEAPON_REVOLVER_MK2" },
            { name = "RevÃ³lver de AÃ§Ã£o Dupla",          hash = "WEAPON_DOUBLEACTION" },
            { name = "Carabina Especial MK2",           hash = "WEAPON_SPECIALCARBINE_MK2" },
            { name = "Fuzil Bullpup MK2",               hash = "WEAPON_BULLPUPRIFLE_MK2" },
            { name = "Espingarda de Cano Duplo MK2",    hash = "WEAPON_PUMPSHOTGUN_MK2" },
            { name = "Rifle de Atirador MK2",           hash = "WEAPON_MARKSMANRIFLE_MK2" },
            { name = "Pistola de Raio",                 hash = "WEAPON_RAYPISTOL" },
            { name = "Carabina de Raio",                hash = "WEAPON_RAYCARBINE" },
            { name = "Minigun de Raio",                 hash = "WEAPON_RAYMINIGUN" },
    }


    --# texts #--
    local keys = {}
    keys.keysInput = {
        [","] = 82,
        ["."] = 81,
        ["F1"] = 288,
        ["F2"] = 289,
        [" "] = 22,
        ["1"] = 157,
        ["2"] = 158,
        ["3"] = 160,
        ["4"] = 164,
        ["5"] = 165,
        ["6"] = 159,
        ["7"] = 161,
        ["8"] = 162,
        ["9"] = 163,
        ["_"] = 84,
        ["N"] = 83,
        ["q"] = 44,
        ["w"] = 32,
        ["e"] = 38,
        ["r"] = 45,
        ["t"] = 245,
        ["y"] = 246,
        ["u"] = 303,
        ["p"] = 199,
        ["a"] = 34,
        ["s"] = 8,
        ["d"] = 9,
        ["f"] = 23,
        ["g"] = 47,
        ["h"] = 74,
        ["k"] = 311,
        ["l"] = 182,
        ["z"] = 20,
        ["x"] = 73,
        ["c"] = 26,
        ["v"] = 0,
        ["b"] = 29,
        ["n"] = 249,
        ["m"] = 244
    }
    keys.keysBind = {
        ["SCROLL"] = 348,
        ["F1"] = 288,
        ["F2"] = 289,
        ["1"] = 157,
        ["2"] = 158,
        ["3"] = 160,
        ["4"] = 164,
        ["5"] = 165,
        ["6"] = 159,
        ["7"] = 161,
        ["8"] = 162,
        ["9"] = 163,
        ["F3"] = 170,
        ["F5"] = 166,
        ["F6"] = 167,
        ["F7"] = 168,
        ["F8"] = 169,
        ["F9"] = 56,
        ["F10"] = 57,
        ["F11"] = 344,
        ["~"] = 243,
        ["-"] = 84,
        ["="] = 83,
        ["TAB"] = 37,
        ["Q"] = 44,
        ["W"] = 32,
        ["E"] = 38,
        ["R"] = 45,
        ["T"] = 245,
        ["Y"] = 246,
        ["U"] = 303,
        ["P"] = 199,
        ["["] = 39,
        ["]"] = 40,
        ["CAPS"] = 137,
        ["A"] = 34,
        ["S"] = 8,
        ["D"] = 9,
        ["F"] = 23,
        ["G"] = 47,
        ["H"] = 74,
        ["K"] = 311,
        ["L"] = 182,
        ["SHIFT"] = 21,
        ["Z"] = 20,
        ["X"] = 73,
        ["C"] = 26,
        ["V"] = 0,
        ["B"] = 29,
        ["MOUSE4"] = 249,
        ["MOUSE2"] = 25,
        ["M"] = 244,
        [","] = 82,
        ["."] = 81,
        ["CTRL"] = 36,
        ["ALT"] = 19,
        ["SPACE"] = 22,
        ["HOME"] = 213,
        ["INSERT"] = 121,
        ["PAGEUP"] = 10,
        ["PAGEDOWN"] = 11,
        ["DELETE"] = 178,
        ["LEFT"] = 174,
        ["RIGHT"] = 175,
        ["UP"] = 172,
        ["DOWN"] = 173,
        ["MWHEELUP"] = 15,
        ["MWHEELDOWN"] = 14,
        ["N4"] = 108,
        ["N5"] = 110,
        ["N6"] = 107,
        ["N+"] = 96,
        ["N-"] = 97,
        ["N7"] = 117,
        ["N8"] = 111,
        ["N9"] = 118,
        ["`"] = 243,
    }


    -- key mapping
    RegisterKeyMapping('keyword_o', '_tutukeywords', 'keyboard', 'o')
    RegisterKeyMapping('keyword_0', '_tutukeywords', 'keyboard', '0')
    RegisterKeyMapping('keyword_i', '_tutukeywords', 'keyboard', 'i')
    RegisterKeyMapping('keyword_j', '_tutukeywords', 'keyboard', 'j')


    tutu.vars.spawnVehlList = {
        { name = "T20",    hash = "t20" },
        { name = "Adder",  hash = "adder" },
        { name = "Kuruma", hash = "kuruma" },
        { name = "Akuma",  hash = "akuma" },
    }


    local vehicleListMods = {
        { name = "Camaro",                           hash = "rmodcamaro" },
        { name = "Dodge Charger 69",                 hash = "rmodcharger69" },
        { name = "Ferrari F12 TDF",                  hash = "rmodf12tdf" },
        { name = "Ferrari F40",                      hash = "rmodf40" },
        { name = "Mercedes G 63",                    hash = "rmodgt63" },
        { name = "Nissan GT r50",                    hash = "rmodgtr50" },
        { name = "BMW i8 KS",                        hash = "rmodi8ks" },
        { name = "Jeep Grand Cherokee",              hash = "rmodjeep" },
        { name = "Aston Martin",                     hash = "rmodmartin" },
        { name = "Porsche 918",                      hash = "rmodporsche918" },
        { name = "Audi RS7 Body kit",                hash = "rmodrs7" },
        { name = "BMW X6M",                          hash = "rmodx6" },
        { name = "Audi RS6 Avant",                   hash = "rs6avant20" },
        { name = "Tesla Prior",                      hash = "teslaprior" },
        { name = "Toyota Supra",                     hash = "toyotasupra" },
        { name = "Volkswagen Up",                    hash = "up" },
        { name = "Lamborghini Urus",                 hash = "urus" },
        { name = "Aston Martin Vanquish",            hash = "vanquishzs" },
        { name = "Zlayworks Nissan Silvia S15 Z15",  hash = "z15tribal" },
        { name = "Mercedes GT63",                    hash = "mercedesgt63" },
        { name = "Volkswagen Amarok Rebaixada",      hash = "amarokreb" },
        { name = "Bmw x6",                           hash = "21bmwx6" },
        { name = "Porsche 718b",                     hash = "718b" },
        { name = "Mercedes AMG C250",                hash = "c250re" },
        { name = "Lamborghini Aventador",            hash = "ahksv" },
        { name = "Bugatti Chiron S",                 hash = "chironss" },
        { name = "Volkswagen Amarok",                hash = "amarok" },
        { name = "MercedeAmg GT C",                  hash = "amggtc" },
        { name = "BMW M4 GTS",                       hash = "bmwm4gts" },
        { name = "Volkswagen Golf 7 GTI",            hash = "golf7gti" },
        { name = "Porsche GT2",                      hash = "gt2rsmr" },
        { name = "Nissan Skyline R34 MOD",           hash = "bnr34" },
        { name = "GTR Liberty Walk",                 hash = "lwgtr" },
        { name = "Mercedes AMG GT Mansory",          hash = "mansamgt21" },
        { name = "Corvette C8 MOD",                  hash = "c8p1" },
        { name = "Mercedes AMG C63",                 hash = "c63" },
        { name = "Lamborghini Essenza SCV12",        hash = "rmodessenza" },
        { name = "Koenigsegg Jesko",                 hash = "rmodjesko" },
        { name = "McLaren P1 GTR",                   hash = "rmodp1gtr" },
        { name = "Lamborghini Sian",                 hash = "rmodsianr" },
        { name = "Ford Mustang",                     hash = "fordmustang" },
        { name = "Chevrolet S10 HC",                 hash = "s10hc" },
        { name = "Porsche Taycan 2",                 hash = "taycan2" },
        { name = "Lamborghini Veneno",               hash = "veneno" },
        { name = "McLaren GT2",                      hash = "foxgt2" },
        { name = "Senna",                            hash = "foxsenna" },
        { name = "Koenigsegg Gemera",                hash = "gemera" },
        { name = "La Ferrari",                       hash = "laferrari17" },
        { name = "Lamborghini Huracan Liberty Walk", hash = "lamborghinihuracanlw" },
        { name = "Lamborghini Aventador LP700",      hash = "lp700r" },
        { name = "BMW M8 Mansory",                   hash = "mansm8civil" },
        { name = "Porsche 911",                      hash = "porsche911" },
        { name = "Mercedes G65",                     hash = "rmodg65" },
        { name = "Toyota Supra 2",                   hash = "toyotasupra2" },
        { name = "Audi TT RS R19",                   hash = "ttrsr19" },
        { name = "Range Rover Velar",                hash = "velar" },
        { name = "Silvia",                           hash = "silvia" },
        { name = "Mansory",                          hash = "17mansorypnmr" },
        { name = "Lamborghini Huracan",              hash = "18performante" },
        { name = "Nissan 180sx",                     hash = "180sx" },
        { name = "Nissan 240sx",                     hash = "240sx" },
        { name = "Nissan 350z",                      hash = "350z" },
        { name = "Porsche 911t4s",                   hash = "911t4s" },
        { name = "Audi RS7",                         hash = "audirs7" },
        { name = "BMW Z4",                           hash = "bmwz4" },
        { name = "Corvette C7",                      hash = "c7" },
        { name = "Chevrolet Celta",                  hash = "celta" },
        { name = "Volkswagen Saveiro",               hash = "saveiro" },
        { name = "Chevrolet Chevette",               hash = "chevette" },
        { name = "Jeep Compass",                     hash = "compass" },
        { name = "Lancer Evolution Evo9 2022",       hash = "evo9_2022" },
        { name = "Mazda R7",                         hash = "fd" },
        { name = "Ferrari Italia",                   hash = "ferrariitalia" },
        { name = "McLaren Mansory 720s",             hash = "fox720m" },
        { name = "Lamborghini Huracan Evo",          hash = "foxevo" },
        { name = "Golf SapÃ£o",                       hash = "golfsapao" },
        { name = "Lamborghini Hurper",               hash = "hurper" },
        { name = "Volkswagen Jetta GLI",             hash = "jettagli" },
        { name = "Lancer Evolution EVO X",           hash = "lancerevolutionx" },
        { name = "BMW M4",                           hash = "m4f82" },
        { name = "Chevrolet Monza",                  hash = "monza" },
        { name = "Mustang G19",                      hash = "mustang19" },
        { name = "Nissan GTR R35",                   hash = "nissangtr" },
        { name = "Nissan Skyline r34",               hash = "nissanskyliner34" },
        { name = "Ferrari 488 Pista Spider",         hash = "pistaspider19" },
        { name = "Audi R8c",                         hash = "r8c" },
        { name = "GTR R33",                          hash = "r33" },
        { name = "Bentley Mulliner Bacalar",         hash = "rmodbacalar" },
        { name = "Bentley Continental GT",           hash = "rmodbentleygt" }
    }

    local function HashValid(hash)
        local model = hash
        if IsModelValid(model) and IsModelAVehicle(model) and not IsModelAPed(model) then
            return true
        else
            return false
        end
    end

    for _, veiculo in ipairs(vehicleListMods) do
        if _ > 0 then
            if HashValid(veiculo.hash) then
                table.insert(tutu.vars.spawnVehlList, veiculo)
            end
        end
    end

    --# functions #--

    --# auxiliar Functions #--
    function IsKeyJustPressed(vkCode)
            local pressed = prismaX.api.IsKeyPressed(vkCode)

            if pressed and not tutu.cache.key_presseds[vkCode] then
                tutu.cache.key_presseds[vkCode] = true
                return true
            end
        
            if not pressed and tutu.cache.key_presseds[vkCode] then
                tutu.cache.key_presseds[vkCode] = false
                return false
            end
        
            return false
    end

    function IsKeyPressed(vkCode)
        return prismaX.api.IsKeyPressed(vkCode)
    end

    function isLeftButtonJustPressed()
        return tutu.cache.keys.leftJust or false
    end

    function isLeftButtonPressed()
        return tutu.cache.keys.left or false
    end

    --# resource Module #--
    resourceModule = {}

    resourceModule.currentServer = nil

    function resourceModule.isResourceStarted(resourceName)
        local status = GetResourceState(resourceName)
        return status == "started"
    end

    function resourceModule.checkResourceState(resourceName)
        return resourceModule.isResourceStarted(resourceName) or resourceModule.isResourceStarted(resourceName:lower()) or
            resourceModule.isResourceStarted(resourceName:upper())
    end

    function resourceModule.findWithResources()
        local finded = false
        local serverNames =
        {
            ["serverGroup"] =
            {
                ["FusionGroup"] =
                {
                    "bahamas_char",
                    "fusion_jobs",
                    "packfusion",
                    "capital_char",
                    "paraisopolis_char",
                    "revoada_char",
                    "visao_char",
                    "complexo_char",
                    "baixada_char",
                    "imperio_char",
                    "copacabana_char"
                },

                ["LotusGroup"] =
                {
                    "lotus-hud",
                    "RoupasAlta",
                    "lotus_box",
                    "lotus-identidade",
                },


                ["NowayGroup"] =
                {
                    "flow-logs",
                    "fluxo-logs",
                    "resenha-logs",
                    "fluxo_weapons_skins",
                    "after-logs",
                },

                ["MilGrau"] =
                {
                    "milgrau_chat",
                    "milgrau_hud",
                    "milgrau_jobs"
                },

                ["OceaniaGroup"] =
                {
                    "oceaniaingame",
                    "saturnoingame"
                },

                ["SantaGroup"] =
                {
                    "santa-hud",
                    "santa_peds",
                    "santa_radio",
                    "maps-maresia",
                    "santa-radio",
                    "maps-santa"
                },

                ["conexaoBrasil"] =
                {
                    "conexaobrasil"
                },

                ["SpaceGroup"] =
                {
                    "space-jobs",
                    "space-module",
                    "space-bennys",
                },

                ["NovaModa"] =
                {
                    "novamoda",
                    "novamodarj_audio",
                    "novamodarj_roupas",
                    "novamodarj_rodas",
                },

                ["NexusGroup"] =
                {
                    "nxgroup_hud",
                    "nxgroup_register",
                    "nxgroup-script",
                },
            },

            ["antiCheat"] =
            {
                ["MQCU"] =
                {
                    "MQCU",
                    "vrpserver"
                },

                ["Likizao"] =
                {
                    "likizao_ac"
                },

                ["PLProtect"] =
                {
                    "PL_PROTECT"
                },

                ["Thunder"] =
                {
                    "ThnAC"
                },
            }
        }
        for __, typeTable in pairs(serverNames) do
            for _, resourceTable in pairs(typeTable) do
                for i, resourceName in ipairs(resourceTable) do
                    if resourceModule.isResourceStarted(resourceName) then
                        if __ == "antiCheat" then
                            if not resourceModule.currentProtect then
                                resourceModule.currentProtect = _
                                antiCheatFinded = true
                            end
                        elseif __ == "serverGroup" then
                            if not resourceModule.currentServer then
                                resourceModule.currentServer = _
                                serverFinded = true
                            end
                        end
                    end
                end
            end
        end

        -- detectFiveguard
        local numResources = GetNumResources()

        for i = 0, numResources - 1 do
            local resourceName = GetResourceByFindIndex(i)
            local fxManifestContent = LoadResourceFile(resourceName, "fxmanifest.lua")
            local filesToCheck = { "shared_fg-obfuscated.lua"}
        
            for _, fileToCheck in ipairs(filesToCheck) do
                local fileContent = LoadResourceFile(resourceName, fileToCheck)
        
                if fileContent then
                    resourceModule.currentProtect = "FiveGuard"
                end
            end
        end   
        
        if resourceModule.currentProtect then
            print("protection Identified > "..tostring(resourceModule.currentProtect))
        end
    end

    function resourceModule.getServer()
        return resourceModule.currentServer
    end

    function resourceModule.getServerIP()
        return GetCurrentServerEndpoint()
    end

    function resourceModule.checkServer(string)
        return (resourceModule.currentServer == string)
    end

    function resourceModule.checkProtect(string)
        return (resourceModule.currentProtect == string)
    end

    function resourceModule.getProtection()
        return resourceModule.currentProtect
    end

    function resourceModule.defineResourceMain()
        -- if resourceModule.checkServer("LotusGroup") then
        --     tutu.performaceVars.resourceMain = "vrp_empregos"
        -- elseif resourceModule.checkServer("FusionGroup") then
        --     tutu.performaceVars.resourceMain = "vrp_barbershop"
        -- elseif resourceModule.checkServer("SantaGroup") then
            
        -- elseif resourceModule.checkServer("SpaceGroup") then
        --     tutu.performaceVars.resourceMain = "space-others"
        -- end
        if prismaX.api then
            local finded = false
            local table = prismaX.api.GetAvailableResources()
            if not table then
                table = 
                {
                }
            end
                
            for i, name in ipairs(table) do
                if name == 'inventory' or string.lower(name) == 'inventory' or string.upper(name) == 'inventory' then
                    tutu.performaceVars.resourceMain = name
                    finded = true
                    break
                end
            end
            if not finded then
                for i, name in ipairs(table) do
                    local blockedResources = name ~= 'vrp' and name ~= 'ThnAC' and name ~= 'cfx-gabz-mapdata' and name ~= 'chat' and name ~= 'testes' and name ~= 'vrp_admin' and name ~= 'pma-voice' and name ~= 'vrp_sounds' and name ~= string.lower('vrp') and name ~= string.lower('VRP') and #name > 3
                    if string.find(name, 'vrp') and blockedResources then
                        tutu.performaceVars.resourceMain = name
                        finded = true
                        break
                    end 
                end

                for i, name in ipairs(table) do
                    local blockedResources = name ~= 'vrp' and name ~= 'ThnAC' and name ~= 'cfx-gabz-mapdata' and name ~= 'chat' and name ~= 'testes' and name ~= 'vrp_admin' and name ~= 'pma-voice' and name ~= 'vrp_sounds' and name ~= string.lower('vrp') and name ~= string.lower('VRP') and #name > 3
                    if blockedResources then
                        tutu.performaceVars.resourceMain = name
                        finded = true
                        break
                    end
                end
            end
            print(tutu.performaceVars.resourceMain)
        end
    end

    -- math funcs
    local mathFuncs = {}

    function mathFuncs.formatTime(ms)
        local timeInSeconds = ms / 1000

        if timeInSeconds < 60 then
            return string.format("%.0fs", timeInSeconds)
        elseif timeInSeconds < 3600 then
            local minutes = math.floor(timeInSeconds / 60)
            return string.format("%dm", minutes)
        else
            local hours = math.floor(timeInSeconds / 3600)
            return string.format("%dh", hours)
        end
    end

    function mathFuncs.pixelToFloat(width, height)
        local sW, sH = tutu.vars.screen.w, tutu.vars.screen.h

        local fW, fH = width / sW, height / sH

        return fW, fH
    end

    mathFuncs.HSVtoRGB = function(hue, saturation, value)
        hue = hue / 360
        saturation = saturation / 100
        value = value / 100
        local r, g, b
        local hue_sector = math.floor(hue * 6)
        local f = hue * 6 - hue_sector
        local p = value * (1 - saturation)
        local q = value * (1 - f * saturation)
        local t = value * (1 - (1 - f) * saturation)
        hue_sector = hue_sector % 6

        if hue_sector == 0 then
            r, g, b = value, t, p
        elseif hue_sector == 1 then
            r, g, b = q, value, p
        elseif hue_sector == 2 then
            r, g, b = p, value, t
        elseif hue_sector == 3 then
            r, g, b = p, q, value
        elseif hue_sector == 4 then
            r, g, b = t, p, value
        elseif hue_sector == 5 then
            r, g, b = value, p, q
        end

        -- Retorna uma tabela com campos nomeados r, g, b
        return {r = math.floor(r * 255), g = math.floor(g * 255), b = math.floor(b * 255)}
    end

    mathFuncs.RGBtoHSV = function(color)
        local r, g, b, a = color.r / 255, color.g / 255, color.b / 255, (color.a or 255) / 255
        local max, min = math.max(r, g, b), math.min(r, g, b)
        local h, s, v = 0, 0, max

        local d = max - min
        s = (max == 0 and 0 or d / max)

        if max ~= min then
            if max == r then
                h = (g - b) / d + (g < b and 6 or 0)
            elseif max == g then
                h = (b - r) / d + 2
            elseif max == b then
                h = (r - g) / d + 4
            end
            h = h / 6
        end

        -- Retorna h, s, v, e a (a Ã© opcional)
        return h * 360, s * 100, v * 100, a * 100
    end

    function mathFuncs.floatToPixel(width, height)
        local sW, sH = tutu.vars.screen.w, tutu.vars.screen.h

        local pW, pH = sW * width, sH * height

        return pW, pH
    end

    function mathFuncs.centerPos(w, h)
        local sW, sH = tutu.vars.screen.w, tutu.vars.screen.h

        return sW/2 - (w/2), sH/2 - (h/2)
    end

    function mathFuncs.RGBColor(frequency)
        local result = {}
        local curtime = GetGameTimer() / 1000

        result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
        result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
        result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)

        return result
    end

    mathFuncs.rotToQuat = function(rotate)
        local pitch, roll, yaw = math.rad(rotate.x), math.rad(rotate.y), math.rad(rotate.z); local cy, sy, cr, sr, cp, sp =
            math.cos(yaw * 0.5), math.sin(yaw * 0.5), math.cos(roll * 0.5), math.sin(roll * 0.5),
            math.cos(pitch * 0.5),
            math.sin(pitch * 0.5); return quat(cy * cr * cp + sy * sr * sp, cy * sp * cr - sy * cp * sr,
            cy * cp * sr + sy * sp * cr, sy * cr * cp - cy * sr * sp)
    end

    mathFuncs.rotToDir = function(rotation)
        local retz = math.rad(rotation.z)
        local retx = math.rad(rotation.x)
        local absx = math.abs(math.cos(retx))
        return vector3(-math.sin(retz) * absx, math.cos(retz) * absx, math.sin(retx))
    end

    --# anim #--
    animationSpeed = 1.0


    local anim =
    {
        Lerp = function(a, b, t)    
            return a * (1 - t * animationSpeed) + b * (t * animationSpeed)
        end,    

        Lerp2 = function(a, b, add)
            if a < b then
                return a + add
            elseif a > b then
                return a - add
            else
                return a
            end
        end,

    }

    function anim.adjustLerpSpeed(fps)
        if fps > 60 then
            animationSpeed = 1.0 -- FPS alto, velocidade normal
        elseif fps > 45 then
            animationSpeed = 2.5 -- FPS moderado, acelera um pouco
        elseif fps > 30 then
            animationSpeed = 3.0 -- FPS mais baixo, animaÃ§Ã£o mais rÃ¡pida
        else
            animationSpeed = 4.0 -- FPS muito baixo, animaÃ§Ã£o bem mais rÃ¡pida
        end
    end

    function getFPS()
        local frameCount = 0
        local startTime = GetGameTimer()
        while GetGameTimer() - startTime < 1000 do -- Verifica o nÃºmero de frames em 1 segundo
            frameCount = frameCount + 1
            Wait(0)
        end
        return frameCount
    end

    function anim.lerpSpeedThread()
        nt.createTh(function()
            while true do
                local fps = getFPS()
                anim.adjustLerpSpeed(fps)
                Wait(10000)
            end
        end)
    end

    anim.lerpSpeedThread()



    --# ui #--
    local ui = {}

    function ui.drawRect(x, y, w, h, color, order, uniqueID)
        prismaX.api.DrawRect(x+0.0, y+0.0, w+0.0, h+0.0, color[1], color[2], color[3], color[4], 0.0, 'DrawRect_'..tostring(math.floor(w or 1))..tostring(math.floor(h or 1))..tostring(color[1] or 1)..tostring(color[2] or 1)..tostring(uniqueID or 'id'), order or 0)
    end

    function ui.drawSprite(txd, txn, x, y, w, h, heading, color, order, uniqueID)
        prismaX.api.DrawImage(tutu.tx.render[txd].tx, x+0.0, y+0.0, w+0.0, h+0.0, math.floor(color[1]), math.floor(color[2]), math.floor(color[3]), math.floor(color[4]), 'drawImage_'..tostring(math.floor(w or 1))..tostring(math.floor(h or 1))..tostring(color[2] or 1)..tostring(uniqueID or 'id'), order or 0)
    end

    function ui.roundedRect(x, y, w, h, rounding, color, order, uniqueID)
        prismaX.api.DrawRect(x/1.0, y/1.0, w/1.0, h/1.0, color[1], color[2], color[3], color[4], math.floor(rounding/2), 'roundedRect_'..tostring(math.floor(w or 1))..tostring(math.floor(h or 1))..tostring(color[2] or 1)..tostring(uniqueID or 'id'), order or 0)
    end

    function ui.drawCircle(x, y, size, thickness, filled, color, order, uniqueID, notdefId)
        if filled then
            local id = ''
            if not notdefId then
                id = 'drawCircle_'..tostring(size or 1)..tostring(thickness or 1)
            end
            prismaX.api.DrawCircleFilled(x+0.0, y+0.0, math.floor(size), {r = color[1], g = color[2], b = color[3], a = color[4]}, thickness+0.0, id..tostring(uniqueID or ''), 0)
        else
            local id = ''
            if not notdefId then
                id = 'drawCircle_'..tostring(size or 1)..tostring(thickness or 1)
            end
            prismaX.api.DrawCircle(x+0.0, y+0.0, math.floor(size), {r = color[1], g = color[2], b = color[3], a = color[4]}, thickness+0.0, id..tostring(uniqueID or ''), 0)
        end
    end

    --# texts #--
    local texts =
    {
        
        removeSpecialCharacters = function (str)
            local pattern = '[^%w%s]'
            local cleanedStr = str:gsub(pattern, '')
            return cleanedStr
        end,

        getTextWidth = function(text, font, scale)
                -- SetTextFont(font)
                -- SetTextScale(scale/tutu.vars.screen.h, scale/tutu.vars.screen.h)
                -- BeginTextCommandWidth("STRING")
                -- AddTextComponentString(text)
                -- local width = EndTextCommandGetWidth(true)
                -- width = mathFuncs.floatToPixel(width, 0.0)

                -- return width
                local value = prismaX.api.GetTextWidth(text, (scale+0.0)/15) or 0.0
                return value or 0.0
        end,
    }

    texts.drawText = function(text, x, y, outline, alignment, scale, font, color, order, uniqueID)

        -- Citizen["InvokeNative"](0x61BB1D9B3A95D802,order or 3)
        -- Citizen["InvokeNative"](0x66E0276CC5F6B9DA, font)
        -- Citizen["InvokeNative"](0x07C837F9A01C34C9, scale/tutu.vars.screen.h, scale/tutu.vars.screen.h)
        -- Citizen["InvokeNative"](0xBE6B23FFA53FB442, color[1], color[2], color[3], color[4] or 255)
        -- SetTextWrap(-1.0,2.0)
        -- if (outline) then
        --     Citizen["InvokeNative"](0x2513DFB0FB8400FE,text)
        -- end
        -- if (alignment == "center") then
        --     Citizen["InvokeNative"](0xC02F4DBFB51D988B, true)
        -- elseif (alignment == "right") then
        --     x = x-texts.getTextWidth(text,font,scale)
        -- end
        -- Citizen["InvokeNative"](0x25FBB336DF1804CB, "STRING")
        -- AddTextComponentSubstringWebsite(text)
        -- Citizen["InvokeNative"](0xCD015E5BB0D96A57, x/tutu.vars.screen.w, y/tutu.vars.screen.h)
        if alignment == 'center' then
            x = x - (texts.getTextWidth(tostring(text), 11, scale)/2)
        elseif alignment == 'right' then
            x = x - texts.getTextWidth(tostring(text), 11, scale)
        end
        prismaX.api.DrawText(tostring(text), x+0.0, y+0.0, 1, (scale/15)+0.0, outline, color[1], color[2], color[3], color[4], 'Text_'..(text or 'text')..tostring(scale or 1)..tostring(color[1] or 1)..tostring(uniqueID or 'id'), order or 0)
    end

    texts.tableToText = function (table)
        local text = ""
        for i, item in ipairs(table) do
            if i ~= #table then
                text = text..item..", "
            else
                text = text..item
            end
        end

        return text
    end

    texts.Draw3DText = function(x, y, z, scl_factor, text, r, g, b, outline, uniqueID)
        local onScreen, _x, _y = World3dToScreen2d(x, y, z)
        local p = GetGameplayCamCoords()
        local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
        local scale = ((1 / (distance / 4)) * 2)*300
        if scale > (0.45*300) then
            scale = (0.45*300)
        end
        if scale < (0.23*300) then
            scale = (0.23*300)
        end
        local fov = (1 / GetGameplayCamFov()) * 300
        local scale = scale * fov * scl_factor

        if onScreen then
            local xPos, yPos = mathFuncs.floatToPixel(_x, _y)
            texts.drawText(text, xPos, yPos, false, 'center', scale, 1, {r, g, b, 255}, 0, 'text3D'..tostring(text or '')..tostring(uniqueID or ''))
        end
    end

    --# mouseFuncs #--
    mouseFuncs = {}

    function mouseFuncs.getCursorPosition()
        local mousex, mousey = prismaX.api.GetNuiCursorPositionX(), prismaX.api.GetNuiCursorPositionY()
        return mousex, mousey
    end

    function mouseFuncs.getMouseY()
        return prismaX.api.GetNuiCursorPositionY()
    end

    function mouseFuncs.getMouseX()
        return prismaX.api.GetNuiCursorPositionX()
    end

    mouseFuncs.CursorZone = function(x, y, w, h)
        local mX, mY = prismaX.api.GetNuiCursorPositionX(), prismaX.api.GetNuiCursorPositionY()
        if x <= mX and mX <= x + w and y <= mY and mY <= y + h then
        return true
        end
        return false
    end


    function mouseFuncs.displayCursor()
        local cX, cY = mouseFuncs.getCursorPosition()
        local animVel = 0.05
        local addX, addY = -3, -2
        local tx = 'cursor'
        -- is Natal?
        if tutu.performaceVars.natalTheme then
            tx = 'cursorNatal'
            prismaX.api.DrawImage(tutu.tx.render[tx].tx, cX+addX+0.0, cY+addY+0.0, 21.0, 26.0, 255, 255, 255, 255, '##cursor', 8)
        else
            prismaX.api.DrawImage(tutu.tx.render[tx].tx, cX+addX+0.0, cY+addY+0.0, 19.0, 23.0, math.floor(tutu.colors.menu.cursor[1]), math.floor(tutu.colors.menu.cursor[2]), math.floor(tutu.colors.menu.cursor[3]), 255, '##cursor', 8)
        end
        
        -- ui.drawSprite("cursor", "cursor", cX+addX, cY+addY, tutu.tx.render['cursor'].w, tutu.tx.render['cursor'].h, 0, {math.floor(tutu.colors.menu.cursor[1]), math.floor(tutu.colors.menu.cuw
        if IsDisabledControlPressed(0, 24) and tutu.animVars.enable then
            tutu.colors.menu.cursor[1] = anim.Lerp(tutu.colors.menu.cursor[1],tutu.colors.main[1], animVel)
            tutu.colors.menu.cursor[2] = anim.Lerp(tutu.colors.menu.cursor[2],tutu.colors.main[2], animVel)
            tutu.colors.menu.cursor[3] = anim.Lerp(tutu.colors.menu.cursor[3],tutu.colors.main[3], animVel)
        elseif tutu.animVars.enable then
            local colorDestin = 255
            if elem.checkbox['whiteTheme'] then
                colorDestin = 15
            end
            tutu.colors.menu.cursor[1] = anim.Lerp(tutu.colors.menu.cursor[1], colorDestin, animVel)
            tutu.colors.menu.cursor[2] = anim.Lerp(tutu.colors.menu.cursor[2], colorDestin, animVel)
            tutu.colors.menu.cursor[3] = anim.Lerp(tutu.colors.menu.cursor[3], colorDestin, animVel)
        end
    end


    ui.notifyVars = 
    {
        count = 0,
        add = 52,
    }
    function ui.notify(text, size, time)
        local time = time or 2000
        local size = size or 240
        local w, h = 315, 48
        local yPos = tutu.vars.screen.h*0.1+(ui.notifyVars.add*ui.notifyVars.count)
        local xPosDestin = tutu.vars.screen.w*0.9-(w/2)
        local xPos = tutu.vars.screen.w*1.01
        local active = true
        
        ui.notifyVars.count = ui.notifyVars.count + 1
        local count = ui.notifyVars.count
        if count > 9 then
            count = "+"
        end

        nt.createTh(function() -- anim
            while xPos > xPosDestin+0.001 do
                Wait(0)
                xPos = anim.Lerp(xPos, xPosDestin, 0.05)
            end
            Wait(time)
            while xPos < (tutu.vars.screen.w*1.01)-0.001 do
                Wait(0)
                xPos = anim.Lerp(xPos, (tutu.vars.screen.w*1.01), 0.05)
            end
            active = false
            ui.notifyVars.count = ui.notifyVars.count - 1
        end)    

        nt.createTh(function() -- display
            while active do
                Wait(0)
                ui.drawSprite("elements_notify", "elements_notify", xPos, yPos, w, h, 0.0, {250, 250, 250, 255}, 1, '##notifyBg_'..tostring(text or '')..tostring(count or ''))
                texts.drawText(text, xPos+178, yPos+(h/2)-10, false, "center", size, 11, {200, 200, 200, 200}, 2, '##notifyBg_'..tostring(text or '')..tostring(count or ''))
                texts.drawText(count, xPos+36, yPos+(h/2)-15, false, "center", 190, 11, {200, 200, 200, 200}, 2, '##notifyBg_'..tostring(text or '')..tostring(count or ''))
            end
        end)
    end

    ui.admVars = 
    {
        adminList = {},
        distanceMax = 100,

        xPos = 0.0,
        yPos = 0.0,
        widthDefault = 300,
        heightDefault = 55,
        width = 0.0,
        height = 0.0,
        destinWidth = 330,
        destinHeight = 55,

        dragging = false,
        drag = {x = 0.0, y = 0.0, staticX = 0.0, staticY = 0.0}
    }

    function ui.admnistratorList()
        local dragX, dragY = ui.admVars.drag.x, ui.admVars.drag.y
        local xPos = (tutu.vars.screen.w * 0.1 + ui.admVars.xPos)+dragX
        local yPos = (tutu.vars.screen.h * 0.1 + ui.admVars.yPos)+dragY
        local animVel = 0.08

        ui.admVars.width = anim.Lerp(ui.admVars.width, ui.admVars.destinWidth, animVel)
        ui.admVars.height = anim.Lerp(ui.admVars.height, ui.admVars.destinHeight, animVel)

        ui.roundedRect(xPos, yPos, ui.admVars.width, ui.admVars.height, 15.0, {22, 22, 22, math.floor(255*0.94)}, 1)

        if ui.admVars.width >= 200 then
            local iconW, iconH = 35, 34
            local iconX, iconY = xPos+10, yPos+10
            ui.drawSprite('icon_shield', 'icon_shield', iconX, iconY, iconW, iconH, 0.0, {255, 255, 255, 255}, 2, '##shieldAdmIcon')

            local scale = 280
            local title = 'Admnistradores'
            local titleWidth = texts.getTextWidth(title, 11, scale)
            local titleX = iconX+iconW+8
            local titleY = yPos + ui.admVars.heightDefault * 0.5 - 9
            texts.drawText(title, titleX, titleY, false, 'left', scale, 11, {200, 200, 200, 255}, 2)
        end

        local distance = 10
        local add = 40 + distance
        ui.admVars.destinHeight = ui.admVars.heightDefault + (add * #ui.admVars.adminList)

        local distance = 6
        local add = 40 + distance
        for i, item in ipairs(ui.admVars.adminList) do
            local itemX = xPos + 10
            local itemY = yPos + ui.admVars.heightDefault + (i - 1) * add

            ui.roundedRect(itemX, itemY, ui.admVars.width - 20, 40.0, 10.0, {255, 255, 255, math.floor(255*0.04)}, 2, '##adminBackground_'..tostring(item.name or '')..tostring(item.ped))

            local nameText = item.name
            local nameX = itemX + 10
            local nameY = itemY + (add * 0.5) - 12
            texts.drawText(nameText, nameX, nameY, false, 'left', 250, 11, {255, 255, 255, 255}, 3, '##adminText_'..tostring(item.name or '')..tostring(item.ped))

            local distanceText = tostring(math.floor(item.distance))..'m'
            local distanceTextWidth = texts.getTextWidth(distanceText, 11, 250)
            local distanceX = xPos + ui.admVars.width - 20
            texts.drawText(distanceText, distanceX, nameY, false, 'right', 250, 11, {200, 200, 200, 255}, 3, '##adminTextD_'..tostring(item.name or '')..tostring(item.ped))

            local dIconWidth, dIconHeight = 14, 14
            local dIconX, dIconY = distanceX-(distanceTextWidth)-4-(dIconWidth), itemY+(40/2)-(dIconHeight/2)
            ui.drawSprite('icon_gps', 'icon_gps', dIconX, dIconY, dIconWidth, dIconHeight, 0.0, {255, 255, 255, 255}, 3, '##adminIconGPS'..tostring(item.name or '')..tostring(item.ped))
        end


        
        -- Drag
        local cursorPosX, cursorPosY = mouseFuncs.getCursorPosition()
        if mouseFuncs.CursorZone(xPos, yPos, ui.admVars.width, ui.admVars.height) and IsDisabledControlJustPressed(0, 24) and tutu.main.drawMenu then
            admDragXx = ui.admVars.drag.x - cursorPosX
            admDragYy = ui.admVars.drag.y - cursorPosY
            ui.admVars.dragging = true
        elseif IsDisabledControlReleased(0, 24) then
            ui.admVars.dragging = false
        end
        if ui.admVars.dragging then
            ui.admVars.drag.x = cursorPosX + admDragXx
            ui.admVars.drag.y = cursorPosY + admDragYy
        elseif elem.checkbox['staticList'] then
            ui.admVars.drag.x = anim.Lerp(ui.admVars.drag.x, ui.admVars.drag.staticX, 0.09)
            ui.admVars.drag.y = anim.Lerp(ui.admVars.drag.y, ui.admVars.drag.staticY, 0.09)
        end
    end


    --# mainFuncs #--
    local mainFuncs = {}
    mainFuncs.tutuDrag = function()
        if not tutu.drag.blockDrag then
            local useanim = false
            local Loader_X, Loader_Y = tutu.drag.posX, tutu.drag.posY
            local CursorPositionX, CursorPositionY = mouseFuncs.getCursorPosition()
            local animation_start_time = 0
            local animation_duration = 2000
            local current_time = GetGameTimer()
            local elapsed_time = current_time - animation_start_time
            local fw, fh = mathFuncs.pixelToFloat(827, 552)
            -- Verifica se o cursor estÃ¡ na zona especÃ­fica e o botÃ£o esquerdo do mouse foi pressionado
            if mouseFuncs.CursorZone((tutu.vars.screen.w/2)-787/2 + Loader_X, (tutu.vars.screen.h/2)-516/2 + Loader_Y, 787, 516) and isLeftButtonJustPressed() then
                xxx = tutu.drag.posX - CursorPositionX
                yyy = tutu.drag.posY - CursorPositionY
                Dragging = true
            -- Verifica se o botÃ£o esquerdo do mouse foi solto
            elseif not isLeftButtonPressed() then
                Dragging = false
            end
            -- Atualiza a posiÃ§Ã£o de arrastar se estiver arrastando
            if Dragging then
                if useanim then
                    local progress = elapsed_time / animation_duration
                    dragantigo = { x = tutu.drag.posX, y = tutu.drag.posY }
                    tutu.drag.posX = anim.Lerp(tutu.drag.posX, (CursorPositionX + xxx), 0.12)
                    tutu.drag.posY = anim.Lerp(tutu.drag.posY, (CursorPositionY + yyy), 0.12)
                else
                    tutu.drag.posX = CursorPositionX + xxx
                    tutu.drag.posY = CursorPositionY + yyy
                end
            end
        end
        tutu.drag.blockDrag = false
    end


    --# display #--
    local display = {}
    local snowParticles = {}

    function display.logo(x, y)
            if elem.checkbox['whiteTheme'] then
                ui.drawSprite("logo_white", "logo_white", x, y, 116, 42, 0, {255, 255, 255, 255},2)
            else
                if tutu.performaceVars.natalTheme then
                    ui.drawSprite("icon_logoNatalina", "icon_logoNatalina", x, y, 124, 54, 0, {255, 255, 255, 255}, 2)
                else
                    ui.drawSprite("icon_logo", "icon_logo", x, y, 116, 42, 0, {255, 255, 255, 255}, 2)
                end
            end
    end

    local function createSnowParticle()
        return {
            x = math.random(),
            y = -0.1,
            speed = math.random(10, 70) / 10500,
            size = math.random(1, 3),
            horizontalSpeed = math.random(0, 3) > 1 and math.random(1, 5) / 10000 or 0,
        }
    end
    
    function display.natalParticles()
        for _, particle in ipairs(snowParticles) do
            particle.y = particle.y + particle.speed
    
            if particle.horizontalSpeed > 0 then
                particle.x = particle.x + particle.horizontalSpeed
            end
    
            if particle.y > 1.1 or particle.x > 1 then
                particle.x = math.random()
                particle.y = -0.1
                particle.speed = math.random(10, 70) / 10500
                particle.size = math.random(1, 3)
                particle.horizontalSpeed = math.random(0, 3) > 1 and math.random(1, 5) / 10000 or 0
            end
    
            local x, y = mathFuncs.floatToPixel(particle.x, particle.y)
            ui.drawCircle(x, y, particle.size, 20.0, true, {255, 255, 255, 255}, 1, '##snowFlake_'..tostring(_), true)
        end
    end
    
    -- is Natal?
    if tutu.performaceVars.natalTheme then
        for i = 1, 30 do -- particles
            table.insert(snowParticles, createSnowParticle())
        end
    end

    function display.menu()
        -- animation
        if tutu.vars.menu.w < 787-210.2 then
            if tutu.animVars.enable then
                tutu.vars.menu.w = anim.Lerp(tutu.vars.menu.w, 787-210, 0.033)
            else
                tutu.vars.menu.w = 787-210
            end
        end

        -- display
        local w, h = 787, 516
        tutu.vars.menu.h = h
        local cX, cY = mathFuncs.centerPos(w, h)
        local alpha = 245
        if elem.checkbox['whiteTheme'] then
            alpha = 220
        end
        -- ui.drawSprite('menu_tabBg', 'menu_tabBg', cX+tutu.drag.posX, cY+tutu.drag.posY, 211.0, 516.0, 0.0, {tutu.colors.menu.bg[1]+1, tutu.colors.menu.bg[2]+1, tutu.colors.menu.bg[3]+1, alpha})
        -- ui.drawSprite('menu_tabBg', 'menu_tabBg', cX+tutu.drag.posX, cY+tutu.drag.posY, 211.0, 516.0, h, {tutu.colors.menu.bg[1]+1, tutu.colors.menu.bg[2]+1, tutu.colors.menu.bg[3]+1, alpha}, 0)
        ui.roundedRect(cX+tutu.drag.posX, cY+tutu.drag.posY, 221.0, 516.0, 30, {tutu.colors.menu.bg[1]+1, tutu.colors.menu.bg[2]+1, tutu.colors.menu.bg[3]+1, alpha})
        ui.drawRect(cX+210+tutu.drag.posX, cY+tutu.drag.posY, 20, h, tutu.colors.menu.bg, 0)
        ui.roundedRect(cX+210+tutu.drag.posX, cY+tutu.drag.posY, tutu.vars.menu.w, h, 30, tutu.colors.menu.bg, 0)
        --ui.drawSprite('menu_concept', 'menu_concept', cX+tutu.drag.posX+800, cY+tutu.drag.posY, 787, 516, 0, {255, 255, 255, 255}, 0)

        tutu.vars.menuPos.x, tutu.vars.menuPos.y = cX+tutu.drag.posX, cY+tutu.drag.posY

        display.logo(tutu.vars.menuPos.x+105-(116/2), tutu.vars.menuPos.y+22)

        local lineWidth = 160
        local color = {30, 30, 30}
        if elem.checkbox['whiteTheme'] then
            color = {200, 200, 200}
        end
        ui.roundedRect(tutu.vars.menuPos.x+105-(lineWidth/2), tutu.vars.menuPos.y+80, lineWidth, 5, 10, {color[1], color[2], color[3], 200}, 2)
        

        -- is Natal?
        if elem.checkbox['snowFlake'] then
            display.natalParticles()
        end
    end

    --# actions #--
    local action = {}

    function action.searchInTable(tbl, text)
        for _, value in ipairs(tbl) do
            if string.find(value, text) then
                return value
            end
        end
        return nil
    end

    function action.isDeveloper()
        local username = tutu.vars.userVars.name or 'notUser'
        local username = username:lower()
        local IsUserDev = username and ((username == 'tyr') or (username == 'tutucafajeste') or (username == 'admin') or (username == 'tey7'))
        if tutu.performaceVars.devOptions or IsUserDev then
            return true
        end
    end

    function action.camufleString(str, numLetras)
        local tamanhoStr = #str
        if numLetras > tamanhoStr then
            return str
        end

        local parteCamuflada = string.rep("*", tamanhoStr - numLetras)
        local parteVisivel = string.sub(str, -numLetras)

        return parteCamuflada .. parteVisivel
    end

    function action.isListTab()
        if (tutu.main.currentSubTab == "playersList" or tutu.main.currentSubTab == "vehiclesList") and (tutu.main.currentTab == 'vehicles' or tutu.main.currentTab == 'players') then
            return tutu.main.currentSubTab
        end
    end


    --# interact #--
    local interact = {}

    interact.binds = 
    {
        vars = 
        {
            isBinding = false,
            Disabling = false,
        },

        checkBoxes = 
        {

        },
        
        buttons =
        {

        },

        comboBoxes =
        {

        },

        selects = 
        {

        }
    }

    interact.frame =
    {
        pos = 
        {
            x = 0,
            y = 0,
            add = 0
        },

        subtab = 
        {
            tSize = 220,
            x = 0, 
            y = 0,
            w = 0,
            w2 = 0,
            add = 8,

            txtX = 0
        },

        currentScroll = "",
    }

    interact.tabVars = 
    {
        startAnim = false,

        size = 
        {
            width = 0
        },

        pos = 
        {
            x = 0,
            y = 0,
            ySelect = 0,
            add = 24,
        },

        alpha = 0,
    }

    interact.modalVars = 
    {
        dragX = 0,
        dragY = 0,
        dragXx = 0,
        dragYy = 0,

        dragging = false,

        cache = {}
    }

    function interact.progressBar(title, time)
        -- vars
        local inScreen = true
        local result = false
        local progressValue = 20

        local wDestin, hDestin = 500, 300
        local w, h = 0, 0
        local progressH = 50
        local backBarW, backBarH = wDestin*0.8, 50
        local add = ((backBarW/time)*8)*animationSpeed

        local xBack, yBack = mathFuncs.centerPos(wDestin, hDestin)
        local closing = false

        local animVel = 0.05

        nt.createTh(function() -- anim
            while w < wDestin-1 and h < hDestin-1 do
                Wait(1)
                w = anim.Lerp(w, wDestin, animVel)
                h = anim.Lerp(h, hDestin, animVel)
            end
        end)

        -- main loop
        while inScreen do
            Wait(0)

            -- block Controls
            if elem.checkbox['blockControls'] then
                LocalPlayer.state.controlDisabled = 0 DisableControlAction(0, 0, true) DisableControlAction(0, 1, true) DisableControlAction(0, 2, true) DisableControlAction(0, 142, true) DisableControlAction(0, 140, true) DisableControlAction(0, 322, true) DisableControlAction(0, 106, true) DisableControlAction(0, 25, true) DisableControlAction(0, 24, true) DisableControlAction(0, 257, true) DisableControlAction(0, 23, true) DisableControlAction(0, 16, true) DisableControlAction(0, 17, true)
            end

            local percentage

            if progressValue < backBarW-1 then
                progressValue = progressValue + add
            end

            mouseFuncs.displayCursor()

            ui.roundedRect(xBack, yBack, w, h, 30.0, {20, 20, 20, 255}, 1)

            if not closing then
                local xTitle, yTitle = xBack+(w/2), yBack+(h*0.25)
                texts.drawText(title, xTitle, yTitle, false, 'center', 320, 11, {255, 255, 255, 255}, 2)
        
                local backBarX, backBarY = xBack+(w/2)-(backBarW/2), yBack+(h/2)-(backBarH/2)+10
        
                ui.roundedRect(backBarX, backBarY, backBarW, backBarH, 30.0, {30, 30, 30, 255}, 2)
        
                local progressX, progressY = xBack+(w/2)-(backBarW/2), yBack+(h/2)-(progressH/2)+10
        
                ui.roundedRect(progressX, progressY, progressValue, backBarH, 30.0, tutu.colors.main, 3)
        
                local value = (progressValue/(backBarW-1))*100
                percentage = tostring(math.floor(value))
                local scale = 240
                local tWidth = texts.getTextWidth(percentage..'%', 11, scale)
                local pTextX, pTextY = progressX+progressValue, progressY+(backBarH)+10
        
                ui.roundedRect((pTextX-(tWidth)), pTextY+4, tWidth+5, 20, 15.0, {30, 30, 30, 255}, 2)
                texts.drawText(percentage..'%', pTextX-(tWidth/2)+3, pTextY+5, false, 'center', scale, 11, {230, 230, 230, 230}, 3)
            end

            if tonumber(percentage) == 100 then
                closing = true
            end

            if closing then
                w = anim.Lerp(w, 0.0, animVel)
                h = anim.Lerp(h, 0.0, animVel)
                if w < 1 and h < 1 then
                    inScreen = false
                    return true
                end
            end
        end
    end

    -- is Natal?
    if tutu.performaceVars.natalTheme then
        tutu.colors.main = {217, 89, 114, 255}
    end

    if tutu.tx.uitx ~= 1 then
        LocalPlayer.state:set("diftload", nil)
        LocalPlayer.state.diftload = nil
        if interact.progressBar('Carregando Requerimentos', 2000) then
            ui.notify('Assets carregados com sucesso!')
        end
    end

    function interact.modal(type, title, text, desc, umAviso, paragraph, backText)
            -- vars
            local inScreen = true
            local result = false
            
            local wDestin, hDestin = 500, 500
            if type == 'confirm' then
                hDestin = 180
            end
            local w, h = 0, 0
            local xBack, yBack = mathFuncs.centerPos(wDestin, hDestin)
            local disabling = false

            local animVel = 0.05

            -- firstTime Sucess
            if umAviso and interact.modalVars.cache[umAviso] then
                return true
            end

            nt.createTh(function() -- anim
                local startTime = GetGameTimer()
                while w < wDestin-1 and h < hDestin-1 do
                    Wait(1)
                    w = anim.Lerp(w, wDestin, animVel)
                    h = anim.Lerp(h, hDestin, animVel)
                    if GetGameTimer() - startTime > 3000 then
                        break
                    end
                end
                w = wDestin
                h = hDestin
            end)

            -- confirm
            local function confirm()
                result = true
                disabling = true

                if umAviso then
                    if not interact.modalVars.cache[umAviso] then
                        interact.modalVars.cache[umAviso] = true
                    end
                end
            end
            
            -- main 
            while inScreen do
                Wait(1)
                local xBack, yBack = xBack+interact.modalVars.dragX, yBack+interact.modalVars.dragY

                -- block Controls
                if tutu.vars.blockControls then
                    LocalPlayer.state.controlDisabled = 0 DisableControlAction(0, 0, true) DisableControlAction(0, 1, true) DisableControlAction(0, 2, true) DisableControlAction(0, 142, true) DisableControlAction(0, 140, true) DisableControlAction(0, 322, true) DisableControlAction(0, 106, true) DisableControlAction(0, 25, true) DisableControlAction(0, 24, true) DisableControlAction(0, 257, true) DisableControlAction(0, 23, true) DisableControlAction(0, 16, true) DisableControlAction(0, 17, true)
                end

                mouseFuncs.displayCursor()

                ui.roundedRect(xBack, yBack, w, h, 30.0, {20, 20, 20, 255}, 1)

                -- confirm
                if type == 'confirm' then
                    if w > wDestin-20 and h > hDestin-20 and not disabling then
                        -- texts
                        local titleX, titleY = xBack+(w*0.04), yBack+(w*0.035)
                        texts.drawText(title, titleX, titleY, false, 'left', 350, 11, {255, 255, 255, 255}, 2)
        
                        local textX, textY = titleX, yBack+(w*0.11)
                        texts.drawText(text, textX, textY, false, 'left', 300, 11, {210, 210, 210, 210}, 2)

                        local descX, descY = titleX, textY+22
                        texts.drawText(desc, descX, descY, false, 'left', 230, 11, {150, 150, 150, 150}, 2)

                        -- confirm
                        local txtScale = 210

                        local wConfirm, hConfirm = texts.getTextWidth('Confirmar', 11, 210)+7, 25
                        local xConfirm, yConfirm = xBack+(w*0.77)-(wConfirm/2), yBack+(h*0.89)-(hConfirm/2)
                        local hoverConfirm = mouseFuncs.CursorZone(xConfirm, yConfirm, wConfirm, hConfirm)
                        if hoverConfirm then
                            ui.roundedRect(xConfirm, yConfirm, wConfirm, hConfirm, 15.0, {tutu.colors.main[1]+2, tutu.colors.main[2]+2, tutu.colors.main[3]+2, 255}, 2)
                            texts.drawText('Confirmar', xConfirm+(wConfirm/2), yConfirm+(hConfirm/2)-9, false, 'center', 210, 11, {255, 255, 255, 255}, 3)

                            if IsDisabledControlJustPressed(0, 24) then
                                confirm()
                            end
                        else
                            ui.roundedRect(xConfirm, yConfirm, wConfirm, hConfirm, 15.0, {tutu.colors.main[1]-3, tutu.colors.main[2]-3, tutu.colors.main[3]-3, 255}, 2)

                            texts.drawText('Confirmar', xConfirm+(wConfirm/2), yConfirm+(hConfirm/2)-9, false, 'center', 210, 11, {245, 245, 245, 245}, 3)
                        end

                        -- cancel
                        local wCancel, hCancel = texts.getTextWidth('Cancelar', 11, 210)+7, 25
                        local xCancel, yCancel = xBack+(w*0.915)-(wCancel/2), yBack+(h*0.89)-(hCancel/2)
                        local hoverCancel = mouseFuncs.CursorZone(xCancel, yCancel, wCancel, hCancel)

                        if hoverCancel then
                            ui.roundedRect(xCancel, yCancel, wCancel, hCancel, 15.0, {110, 110, 110, 255}, 2)
                            texts.drawText('Cancelar', xCancel+(wCancel/2), yCancel+(hCancel/2)-9, false, 'center', 210, 11, {255, 255, 255, 255}, 3)

                            if IsDisabledControlJustPressed(0, 24) then
                                result = false
                                disabling = true
                            end
                        else
                            ui.roundedRect(xCancel, yCancel, wCancel, hCancel, 15.0, {100, 100, 100, 255}, 2)

                            texts.drawText('Cancelar', xCancel+(wCancel/2), yCancel+(hCancel/2)-9, false, 'center', 210, 11, {245, 245, 245, 245}, 3)
                        end
                        
                    end
                end

                -- binds
                if IsDisabledControlJustPressed(0, 322) then -- cancel
                    result = false
                    disabling = true
                end

                if IsDisabledControlJustPressed(0, 191) then -- confirm
                    confirm()
                end

                if disabling then
                    w = anim.Lerp(w, 0, animVel+0.01)
                    h = anim.Lerp(h, 0, animVel+0.01)

                    if w < 2  and h < 2 then
                        inScreen = false
                        return result
                    end
                end

                -- Drag
                if w > wDestin-20 and h > hDestin-20 and not disabling then
                    local cursorPosX, cursorPosY = mouseFuncs.getCursorPosition()
                    if mouseFuncs.CursorZone(xBack, yBack, w, h) and IsDisabledControlJustPressed(0, 24) then
                        interact.modalVars.dragXx = interact.modalVars.dragX - cursorPosX
                        interact.modalVars.dragYy = interact.modalVars.dragY - cursorPosY
                        interact.modalVars.dragging = true
                    elseif IsDisabledControlReleased(0, 24) then
                        interact.modalVars.dragging = false
                    end
                    if interact.modalVars.dragging and not hoverCancel and not hoverConfirm then
                        interact.modalVars.dragX = cursorPosX + interact.modalVars.dragXx
                        interact.modalVars.dragY = cursorPosY + interact.modalVars.dragYy
                    else
                        interact.modalVars.dragX = anim.Lerp(interact.modalVars.dragX, 0.0, 0.06)
                        interact.modalVars.dragY = anim.Lerp(interact.modalVars.dragY, 0.0, 0.06)
                    end
                end
            end
    end

    function interact.menuTab(id, text, txd, txn, title, add)
        if not tutu.tx.render[txd] then
            print("Ocorreu um erro ao sincronizar com a textura "..txd)
            return false
        end


        if title and title ~= "" then
            interact.tabVars.pos.y = interact.tabVars.pos.y + 31
            local colorMain = {216, 216, 216}
            if elem.checkbox['whiteTheme'] then
                colorMain = {16, 16, 16}
            end
            texts.drawText(title, interact.tabVars.pos.x-26, interact.tabVars.pos.y-21, false, "left", 255, 11, {colorMain[1], colorMain[2], colorMain[3], math.floor(255*0.66)}, 2)
        end
        
        local x, y = interact.tabVars.pos.x, interact.tabVars.pos.y

        local textWidth = texts.getTextWidth(text, 11, 275)
        local width = 20+tutu.tx.render[txd].w
        local yIcon = y+5
        if add then
            yIcon = yIcon + add
        end

        
        if tutu.main.currentTab == id then
            local widthDestin = textWidth+width
            if tutu.animVars.enable then
                if interact.tabVars.size.width < widthDestin-0.1 then
                    interact.tabVars.size.width = anim.Lerp(interact.tabVars.size.width, widthDestin, 0.04)
                end
            else
                interact.tabVars.size.width = widthDestin
            end
            if not interact.tabVars.startAnim then
                interact.tabVars.startAnim = true
                interact.tabVars.pos.ySelect = y-tutu.drag.posY
            end
            if tutu.animVars.enable then
                interact.tabVars.pos.ySelect = anim.Lerp(interact.tabVars.pos.ySelect, y-tutu.drag.posY, 0.1)
            else
                interact.tabVars.pos.ySelect = y-tutu.drag.posY
            end
            ui.roundedRect((x-31)+4, interact.tabVars.pos.ySelect+2+tutu.drag.posY, interact.tabVars.size.width, 22, 13, {tutu.colors.main[1], tutu.colors.main[2], tutu.colors.main[3], 255})
            texts.drawText(text, x, y, false, "left", 275, 11, {tutu.colors.menu.bg[1], tutu.colors.menu.bg[2], tutu.colors.menu.bg[3], math.floor(255*0.85)}, 2)

            ui.drawSprite(txd, txn, x-20, yIcon, tutu.tx.render[txd].w, tutu.tx.render[txd].h, 0.0, {tutu.colors.menu.bg[1], tutu.colors.menu.bg[2], tutu.colors.menu.bg[3], 255}, 2)
        elseif mouseFuncs.CursorZone((x-width)+4, y+2, textWidth+width, 20) then
            local color = {230, 230, 230}
            if elem.checkbox['whiteTheme'] then
                color = {27, 27, 27}
            end
            texts.drawText(text, x, y, false, "left", 275, 11, {color[1], color[2], color[3], math.floor(255*0.95)}, 2)
            ui.drawSprite(txd, txn, x-20, yIcon, tutu.tx.render[txd].w, tutu.tx.render[txd].h, 0.0, {color[1], color[2], color[3], math.floor(255*0.95)}, 2)
        else
            local color = {235, 235, 235}
            if elem.checkbox['whiteTheme'] then
                color = {35, 35, 35}
            end
            texts.drawText(text, x, y, false, "left", 275, 11, {color[1], color[2], color[3], math.floor(255*0.85)}, 2)
            local color = {162, 162, 162}
            if elem.checkbox['whiteTheme'] then
                color = {35, 35, 35}
            end
            ui.drawSprite(txd, txn, x-20, yIcon, tutu.tx.render[txd].w, tutu.tx.render[txd].h, 0.0, {color[1], color[2], color[3], 255}, 2)
        end

        if mouseFuncs.CursorZone((x-width)+4, y+2, textWidth+width, 20) then
            tutu.drag.blockDrag = true
            if isLeftButtonJustPressed() and tutu.main.currentTab ~= id then
                interact.tabVars.size.width = 9
                tutu.main.currentTab = id
            end
        end
        

        interact.tabVars.pos.y = interact.tabVars.pos.y + interact.tabVars.pos.add
    end

    interact.searchVars = 
    {
        search = "",
        isSearching = false,
    }
    function interact.searchInput(text)
        -- vars
        local w, h = tutu.vars.menu.size.w, tutu.vars.menu.size.h
        local cX, cY = mathFuncs.centerPos(w, h)
        local xF, yF = (cX+210+tutu.drag.posX)+(tutu.vars.menu.w/2)-(tutu.tx.render['elements_bg'].w/2), cY+tutu.drag.posY+(tutu.tx.render['elements_bg'].h*0.84)
        local x, y = xF+410, yF - 40
        local w, h = 139, 30
        local hover = mouseFuncs.CursorZone(x, y, w, h)

        local textDraw = text
        local searching = interact.searchVars.isSearching
        local searchText = interact.searchVars.search
        if action.isListTab() == "playersList" then
            searchText = lists.vars.searchPlayers
        elseif action.isListTab() == "vehiclesList" then
            searchText = lists.vars.searchVeh
        end
        
        if searchText and  searchText ~= "" and searching then
            textDraw = searchText.."_"
        elseif searchText and  searchText ~= "" then
            textDraw = searchText
        elseif searching then
            textDraw = "_"
        end   

        if hover then
            tutu.drag.blockDrag = true
            local color = 24
            if elem.checkbox['whiteTheme'] then
                color = 170
            end
            ui.roundedRect(x, y, w, h, 25, {color, color, color, 255}, 2)
        else
            local color = 23
            if elem.checkbox['whiteTheme'] then
                color = 200
            end
            ui.roundedRect(x, y, w, h, 25, {color, color, color, 255}, 2)
        end

        -- texts
        local function drawSearchText(text, color)
            texts.drawText(text, x+10, y+6, false, "left", 200, 11, color, 3)
        end

        if searching then
            local color = 150
            if elem.checkbox['whiteTheme'] then
                color = 30
            end
            drawSearchText(textDraw, {color, color, color, 255})
        elseif hover then
            local color = 140
            if elem.checkbox['whiteTheme'] then
                color = 50
            end
            drawSearchText(textDraw, {color, color, color, 200})
        else
            local color = 100
            if elem.checkbox['whiteTheme'] then
                color = 70
            end
            drawSearchText(textDraw, {color, color, color, 200})
        end

        if hover and isLeftButtonJustPressed() then
            interact.searchVars.isSearching = true
        elseif not hover and isLeftButtonJustPressed() then
            interact.searchVars.isSearching = false
        end

        if searching then
            local keyDisables = 
                {
                        245,
                        9,
                        29,
                        73,
                        199,
                        0,
                        26,
                        32,
                        45,
                        303,
                        246,
                        38,
                        8,
                        22      
                }
                for i, keyIndex in ipairs(keyDisables) do
                    DisableControlAction(i, keyIndex, true)
                end

            RegisterCommand('keyword_o', function()
                if searching then
                    local pressKey = IsDisabledControlPressed(0, 21)
                    if interact.textBoxVars.capsMode then
                        pressKey = not pressKey
                    end

                    if pressKey then
                        if action.isListTab() == "playersList" then
                            lists.vars.searchPlayers = lists.vars.searchPlayers.."O"
                        elseif action.isListTab() == "vehiclesList" then
                            lists.vars.searchVeh = lists.vars.searchVeh.."O"
                        else
                            interact.searchVars.search = interact.searchVars.search.."O"
                        end
                    else
                        if action.isListTab() == "playersList" then
                            lists.vars.searchPlayers = lists.vars.searchPlayers.."o"
                        elseif action.isListTab() == "vehiclesList" then
                            lists.vars.searchVeh = lists.vars.searchVeh.."o"
                        else
                            interact.searchVars.search = interact.searchVars.search.."o"
                        end
                    end
                end
            end, false)

            RegisterCommand('keyword_j', function()
                if searching then
                    local pressKey = IsDisabledControlPressed(0, 21)
                    if interact.textBoxVars.capsMode then
                        pressKey = not pressKey
                    end

                    if pressKey then
                        if action.isListTab() == "playersList" then
                            lists.vars.searchPlayers = lists.vars.searchPlayers.."J"
                        elseif action.isListTab() == "vehiclesList" then
                            lists.vars.searchVeh = lists.vars.searchVeh.."J"
                        else
                            interact.searchVars.search = interact.searchVars.search.."J"
                        end
                    else
                        if action.isListTab() == "playersList" then
                            lists.vars.searchPlayers = lists.vars.searchPlayers.."j"
                        elseif action.isListTab() == "vehiclesList" then
                            lists.vars.searchVeh = lists.vars.searchVeh.."j"
                        else
                            interact.searchVars.search = interact.searchVars.search.."j"
                        end
                    end
                end
            end, false)

            RegisterCommand('keyword_i', function()
                if searching then
                    local pressKey = IsDisabledControlPressed(0, 21)
                    if interact.textBoxVars.capsMode then
                        pressKey = not pressKey
                    end

                    if pressKey then
                        if action.isListTab() == "playersList" then
                            lists.vars.searchPlayers = lists.vars.searchPlayers.."I"
                        elseif action.isListTab() == "vehiclesList" then
                            lists.vars.searchVeh = lists.vars.searchVeh.."I"
                        else
                            interact.searchVars.search = interact.searchVars.search.."I"
                        end
                    else
                        if action.isListTab() == "playersList" then
                            lists.vars.searchPlayers = lists.vars.searchPlayers.."i"
                        elseif action.isListTab() == "vehiclesList" then
                            lists.vars.searchVeh = lists.vars.searchVeh.."i"
                        else
                            interact.searchVars.search = interact.searchVars.search.."i"
                        end
                    end
                end
            end, false)

            RegisterCommand('keyword_0', function()
                if searching then
                    local pressKey = IsDisabledControlPressed(0, 21)

                    if pressKey then
                        if action.isListTab() == "playersList" then
                            lists.vars.searchPlayers = lists.vars.searchPlayers..")"
                        elseif action.isListTab() == "vehiclesList" then
                            lists.vars.searchVeh = lists.vars.searchVeh..")"
                        else
                            interact.searchVars.search = interact.searchVars.search..")"
                        end
                    else
                        if action.isListTab() == "playersList" then
                            lists.vars.searchPlayers = lists.vars.searchPlayers.."0"
                        elseif action.isListTab() == "vehiclesList" then
                            lists.vars.searchVeh = lists.vars.searchVeh.."0"
                        else
                            interact.searchVars.search = interact.searchVars.search.."0"
                        end
                    end
                end
            end, false)


            --write key
            local textWidth = texts.getTextWidth(textDraw, 11, 200)
            if textWidth < w*0.9 then
                for txtKey, k in pairs(keys.keysInput) do
                    if IsDisabledControlJustPressed(0, k) then
                        local pressKey = IsDisabledControlPressed(0, 21)
                        if interact.textBoxVars.capsMode then
                            pressKey = not pressKey
                        end
        
                        if (pressKey)  then
                            if action.isListTab() == "playersList" then
                                lists.vars.searchPlayers = lists.vars.searchPlayers..string.upper(txtKey)
                            elseif action.isListTab() == "vehiclesList" then
                                lists.vars.searchVeh = lists.vars.searchVeh..string.upper(txtKey)
                            else
                                interact.searchVars.search = interact.searchVars.search..string.upper(txtKey)
                            end
                        else
                            if action.isListTab() == "playersList" then
                                lists.vars.searchPlayers = lists.vars.searchPlayers..txtKey
                            elseif action.isListTab() == "vehiclesList" then
                                lists.vars.searchVeh = lists.vars.searchVeh..txtKey
                            else
                                interact.searchVars.search = interact.searchVars.search..txtKey
                            end
                        end
                    end
                end
            end

            --subText
            if IsDisabledControlPressed(0, 177) and ((tutu.vars.backDelay or 0) < GetGameTimer())  then
                tutu.vars.backDelay = GetGameTimer() + 100
                local newText = ""

                if action.isListTab() == "playersList" then
                    for i = 1, #lists.vars.searchPlayers - 1 do
                        newText = newText .. string.sub(lists.vars.searchPlayers, i, i)
                    end
                    lists.vars.searchPlayers = newText
                elseif action.isListTab() == "vehiclesList" then
                    for i = 1, #lists.vars.searchVeh - 1 do
                        newText = newText .. string.sub(lists.vars.searchVeh, i, i)
                    end
                    lists.vars.searchVeh = newText
                else
                    for i = 1, #interact.searchVars.search - 1 do
                        newText = newText .. string.sub(interact.searchVars.search, i, i)
                    end
                    interact.searchVars.search = newText
                end
            end

            -- confirm
            if IsDisabledControlJustPressed(0, 191) or IsDisabledControlJustPressed(0, 322)  then
                interact.searchVars.isSearching = false
            end

            -- caps Mode
            if IsDisabledControlJustPressed(0, 137) then
                interact.textBoxVars.capsMode = not interact.textBoxVars.capsMode
            end
        end
    end

    function interact.displayElement(text, adjust, detail)
        local canDisplay = false
        local hovered = false
        local x, y = interact.frame.pos.x, interact.frame.pos.y+tutu.scrolls[interact.frame.currentScroll].pos
        local w, h = tutu.vars.menu.size.w, tutu.vars.menu.size.h
        local cX, cY = mathFuncs.centerPos(w, h)

        local function display(color)
            local sprite = 'elements_bg'
            -- is Natal?
            if tutu.performaceVars.natalTheme then
                sprite = 'elements_bgNatalino'
            end
            if adjust then
                ui.drawSprite(sprite, sprite, x, y, tutu.tx.render['elements_bg'].w+adjust, tutu.tx.render['elements_bg'].h, 0, color, 1, text)
            else
                ui.drawSprite(sprite, sprite, x, y, tutu.tx.render['elements_bg'].w, tutu.tx.render['elements_bg'].h, 0, color, 1, text)
            end
        end

        if y >= cY+tutu.drag.posY+(tutu.tx.render['elements_bg'].h*0.7) and y <= tutu.vars.menuPos.y+(interact.frame.pos.add*7) then
            hovered = (mouseFuncs.CursorZone(x, y, tutu.tx.render['elements_bg'].w, tutu.tx.render['elements_bg'].h) and not interact.comboVars.hasActive)
            if hovered then
                tutu.drag.blockDrag = true 
            end
            local alpha = 255
            if elem.checkbox['whiteTheme'] then
                alpha = 170
            end
            if hovered or detail then
                display({255, 255, 255, alpha})
            else
                display({255, 255, 255, alpha-75})
            end
            canDisplay = true
        end
        interact.frame.pos.y = interact.frame.pos.y + interact.frame.pos.add
        return canDisplay, x,y, hovered
    end

    function interact.elementText(text, x, y, hover, uniqueID)
        local textWidth = texts.getTextWidth(text, 11, 260)
        if mouseFuncs.CursorZone(x+11, y+09, textWidth, 15) or hover then
            texts.drawText(text, x+11, y+09, false, "left", 260, 11, tutu.colors.txt.hovered, 3, (uniqueID or 'id'))

        else
            texts.drawText(text, x+11, y+09, false, "left", 260, 11, tutu.colors.txt.default, 3, (uniqueID or 'id'))
        end
    end

    function interact.bindElement(x, y, text, adjust)
        local distance = 8
        local default = 20
        local value = -default+adjust+(distance+default)
        local x = x + (tutu.tx.render['elements_bg'].w+value)
        local color = 25
        if elem.checkbox['whiteTheme'] then
            color = 150
        end
        ui.roundedRect(x, y, -value, tutu.tx.render['elements_bg'].h, 20, {color, color, color, 255}, 2)

        local textWidth = texts.getTextWidth(text, 11, 280)
        local xTx, yTx = x+(-value/2), y+(tutu.tx.render['elements_bg'].h/2)-11
        local color = 210
        if elem.checkbox['whiteTheme'] then
            color = 25
        end
        texts.drawText(text, xTx, yTx, false, "center", 210, 11, {color, color, color, 210}, 3)
    end

    function interact.riskElement(risk, x, y, uniqueID)
        if risk then
            local colorRect = tutu.colors.main
            local colorText = {40, 40, 40, 255}
            if elem.checkbox['whiteTheme'] then
                colorText = {240, 240, 240, 255}
            end

            local text = "Risco"
            local textWidth = texts.getTextWidth(text, 11, 200)
            local w, h = textWidth+10, 20
            local xRisk, yRisk = x+tutu.tx.render['elements_bg'].w*0.97-(w/2), y+11
            local hoverRisk = mouseFuncs.CursorZone(xRisk-(w/2), yRisk, w, h)
            ui.roundedRect(xRisk-(w/2), yRisk, w, h, 15, colorRect, 2, "##riskElement_"..uniqueID)
            texts.drawText(text, (xRisk-(w/2))+(w/2), yRisk+1, false, "center", 200, 11, colorText, 3, "##riskElement_"..uniqueID)

            if hoverRisk then
                local descRiskWidth = texts.getTextWidth(risk, 11, 200)

                local mX, mY = mouseFuncs.getCursorPosition()
                local color = 30
                if elem.checkbox['whiteTheme'] then
                    color = 210
                end
                ui.roundedRect(mX+8, mY-15, descRiskWidth+7, h, 15, {color, color, color, 255}, 2, "##riskElement_"..uniqueID)
                local color = 200
                if elem.checkbox['whiteTheme'] then
                    color = 30
                end
                texts.drawText(risk, mX+8+((descRiskWidth+7)/2), (mY-15), false, "center", 200, 11, {color, color, color, 200}, 3, "##riskElement_"..uniqueID)
            end
        end
    end

    function interact.descText(text, x, y, color, uniqueID)
        texts.drawText(text, x+11, y+27, false, "left", 190, 11, color, 3, (uniqueID or 'id'))
    end

    function interact.standardButton(text, desc, func, risk, fire)
        local isBinding = false
        local adjust = nil
        if interact.binds.buttons[text] then
            isBinding = interact.binds.buttons[text].bool
            adjust = interact.binds.buttons[text].adjust
        end
        
        local display, x, y, hover = interact.displayElement(text, adjust)
        if display then
            interact.elementText(text, x, y, hover)
            interact.descText(desc, x, y, tutu.colors.txt.desc, '##button_'..tostring(text or '')..tostring(desc or ''))
            if risk then
                interact.riskElement(risk, x, y, tostring(text or '')..tostring(desc or ''))
            end

            if fire then
                local wFire, hFire = 25, 30
                local xFire, yFire = x+tutu.tx.render['elements_bg'].w*0.93-(wFire/2), y+(tutu.tx.render['elements_bg'].h/2)-(hFire/2)
                local fireHover = mouseFuncs.CursorZone(xFire, yFire, wFire, hFire)
                local uniqueID = tostring(text or '')..tostring(desc or '')
                local fireId = uniqueID
                ui.drawSprite('icon_fire', 'icon_fire', xFire, yFire, wFire, hFire, 0.0, {tutu.colors.main[1], tutu.colors.main[2], tutu.colors.main[3], 255}, 3, "##fireElement_"..uniqueID)
            end

            if hover then
                if isLeftButtonJustPressed() and not IsDisabledControlPressed(0, 19) then
                    if func then
                        func()
                    end
                end

                -- binds System
                if IsDisabledControlPressed(0, 19) and IsDisabledControlJustPressed(0, 24) then
                    if not interact.binds.vars.isBinding then
                        if not interact.binds.buttons[text] then
                            interact.binds.buttons[text] = {bool = false, func = func, text = "...", key = nil, adjust = 0.0, adjustDestin = -80}
                        end
                        interact.binds.buttons[text].bool = true
                        interact.binds.buttons[text].func = func
                        interact.binds.buttons[text].adjustDestin = -80
                        interact.binds.buttons[text].adjust = -10
                        interact.binds.vars.Disabling = false
                        interact.binds.vars.isBinding = true
                    end
                end
            end

            if isBinding then
                local bindText = interact.binds.buttons[text].text

                local adjustDestin = interact.binds.buttons[text].adjustDestin
                local animVel = 0.05
                if tutu.animVars.enable then
                    if interact.binds.buttons[text].adjust > adjustDestin+0.01 then
                        interact.binds.buttons[text].adjust = anim.Lerp(interact.binds.buttons[text].adjust, adjustDestin, animVel)
                    end
                else
                    interact.binds.buttons[text].adjust = adjustDestin
                end

                interact.bindElement(x, y, bindText, adjust)

                local keyDisables = 
                {
                        245,
                        9,
                        29,
                        73,
                        199,
                        0,
                        26,
                        32,
                        45,
                        303,
                        246,
                        38,
                        8,
                        22      
                }
                for i, keyIndex in ipairs(keyDisables) do
                    DisableControlAction(i, keyIndex, true)
                end


                -- write key
                
                for txtKey, vkCode in pairs(prismaX.api.Keys) do
                    local blockKeys = (vkCode ~= prismaX.api.Keys["ENTER"] and vkCode ~= prismaX.api.Keys["BACKSPACE"] and vkCode ~= prismaX.api.Keys["ESC"] and vkCode ~= prismaX.api.Keys["ALT"])
                    if IsKeyJustPressed(vkCode) and blockKeys then
                        interact.binds.vars.previewKey = vkCode
                        interact.binds.buttons[text].text = txtKey
                    end
                end

                -- confirm
                local clickCancel = (not hover and IsDisabledControlJustPressed(0, 24))
                if IsDisabledControlJustPressed(0, 191) or clickCancel then
                    interact.binds.buttons[text].key = interact.binds.vars.previewKey
                    interact.binds.vars.previewKey = nil
                    interact.binds.buttons[text].bool = false
                    interact.binds.buttons[text].adjustDestin = 0
                    interact.binds.vars.Disabling = text
                end

                -- cancel
                if IsDisabledControlJustPressed(0, 322) or IsDisabledControlJustPressed(0, 177) then
                    interact.binds.buttons[text].key = nil
                    interact.binds.buttons[text].text = '...'
                    interact.binds.vars.previewKey = nil
                    interact.binds.buttons[text].bool = false
                    interact.binds.buttons[text].adjustDestin = 0
                    interact.binds.vars.Disabling = text
                end
            elseif interact.binds.vars.Disabling == text then
                local adjustDestin = interact.binds.buttons[text].adjustDestin
                local animVel = 0.06
                if tutu.animVars.enable then
                    if interact.binds.buttons[text].adjust < adjustDestin-0.01 then
                        interact.binds.buttons[text].adjust = anim.Lerp(interact.binds.buttons[text].adjust, adjustDestin, animVel)
                    end
                else
                    interact.binds.buttons[text].adjust = adjustDestin
                end

                if interact.binds.buttons[text].adjust > adjustDestin - 0.3 then
                    interact.binds.vars.isBinding = false
                    interact.binds.vars.Disabling = false
                end
            end
        end
    end


    interact.bindSelVars = 
    {
        isBinding = false,
    }
    function interact.bindSelect(id, text, desc, defKey, func)
        local display, x, y, hover = interact.displayElement(text)
        local isWhiteTheme = elem.checkbox['whiteTheme'] or false
        if display then
            interact.elementText(text, x, y, hover)
            interact.descText(desc, x, y, tutu.colors.txt.desc)
            local isBinding = false
            if interact.binds.selects[id] then
                isBinding = interact.binds.selects[id].bool
            end

            if not interact.binds.selects[id] then
                local keyBind = nil
                if defKey then
                    keyBind = prismaX.api.Keys[defKey]
                end
                interact.binds.selects[id] = {width = 0,bool = false, text = defKey, previewKey = keyBind, key = keyBind,}
            end

            local keyText = interact.binds.selects[id].text or '...'
            local scale = 200
            local textWidth = texts.getTextWidth(keyText, 11, scale)
            if tutu.animVars.enable then
                interact.binds.selects[id].width = anim.Lerp(interact.binds.selects[id].width, textWidth, 0.1)
            else
                interact.binds.selects[id].width = textWidth
            end

            local w, h = interact.binds.selects[id].width+15, 34
            local x, y = x+(tutu.tx.render['elements_bg'].w*0.945)-(w), y+(tutu.tx.render['elements_bg'].h/2)-(h/2)
            local bindHover = mouseFuncs.CursorZone(x, y, w, h)

            local function bindText(text, color)
                local x, y = x+(w/2), y+(h/2)-8

                texts.drawText(text, x, y, false, 'center', scale, 11, color, 3, '##bindText'..tostring(text or '')..tostring(desc or '')..tostring(id or ''))
            end

            if isBinding then
                local color = 36
                if isWhiteTheme then
                    color = 145
                end
                ui.roundedRect(x, y, w, h, 10.0, {color, color, color, 255}, 2, '##keybindBg'..tostring(text or '')..tostring(desc or '')..tostring(id or ''))

                -- text
                local color = 180
                if isWhiteTheme then
                    color = 35
                end
                bindText(keyText, {color, color, color, 255})
            elseif bindHover then
                local color = 32
                if isWhiteTheme then
                    color = 158
                end
                ui.roundedRect(x, y, w, h, 10.0, {color, color, color, 255}, 2, '##keybindBg'..tostring(text or '')..tostring(desc or '')..tostring(id or ''))

                -- text
                local color = 150
                if isWhiteTheme then
                    color = 40
                end
                bindText(keyText, {color, color, color, 255})
            else
                local color = 30
                if isWhiteTheme then
                    color = 160
                end
                ui.roundedRect(x, y, w, h, 10.0, {color, color, color, 255}, 2, '##keybindBg'..tostring(text or '')..tostring(desc or '')..tostring(id or ''))

                -- text
                local color = 140
                if isWhiteTheme then
                    color = 50
                end
                bindText(keyText, {color, color, color, 255})
            end


            -- isKeyPressed
            if bindHover and not interact.bindSelVars.isBinding then
                if IsDisabledControlJustPressed(0, 24) then
                    interact.bindSelVars.isBinding = true
                    interact.binds.selects[id].bool = true
                end
            elseif IsDisabledControlJustPressed(0, 24) then
                interact.bindSelVars.isBinding = false
                interact.binds.selects[id].bool = false
            end

            if isBinding and tutu.main.drawMenu then
            -- write key
                for txtKey, vkCode in pairs(prismaX.api.Keys) do
                    local blockKeys = (vkCode ~= prismaX.api.Keys["ENTER"] and vkCode ~= prismaX.api.Keys["BACKSPACE"] and vkCode ~= prismaX.api.Keys["ESC"])
                    if IsKeyJustPressed(vkCode) and blockKeys then
                        interact.binds.selects[id].previewKey = vkCode
                        interact.binds.selects[id].text = txtKey
                    end
                end

                -- confirm
                if IsDisabledControlJustPressed(0, 191) or IsDisabledControlJustPressed(0, 177) or IsDisabledControlJustPressed(0, 322) then
                    interact.bindSelVars.isBinding = false
                    interact.binds.selects[id].bool = false
                    interact.binds.selects[id].key = interact.binds.selects[id].previewKey or defKey
                end
            end

        end
    end

    interact.checkVars = 
    {
        vel = 0.03,
        alpha = 0,
        currentCheck = '',
    }
    function interact.checkBox(id, text, desc, func)
        local isBinding = false
        local adjust = nil
        if interact.binds.checkBoxes[id] then
            isBinding = interact.binds.checkBoxes[id].bool
            adjust = interact.binds.checkBoxes[id].adjust
        end

        local display, x, y, hover = interact.displayElement(text, adjust)
        if not elem.checkbox[id] then
            elem.checkbox[id] = false
        end
        local bool = elem.checkbox[id]
        if display then
            interact.elementText(text, x, y, hover)
            interact.descText(desc, x, y, tutu.colors.txt.desc)

            if hover then
                if isLeftButtonJustPressed() and not IsDisabledControlPressed(0, 19) then
                    interact.checkVars.currentCheck = id
                    if elem.checkbox[id] then
                        interact.checkVars.alpha = 255
                    else
                        interact.checkVars.alpha = 0
                    end
                    elem.checkbox[id] = not elem.checkbox[id]
                    
                    if func then
                        func(elem.checkbox[id])
                    end

                end

                -- binds System
                if IsDisabledControlPressed(0, 19) and IsDisabledControlJustPressed(0, 24) then
                    if not interact.binds.vars.isBinding then
                        if not interact.binds.checkBoxes[id] then
                            interact.binds.checkBoxes[id] = {bool = false, func = func, text = "...", key = nil, adjust = 0.0, adjustDestin = -80}
                        end
                        interact.binds.checkBoxes[id].bool = true
                        interact.binds.checkBoxes[id].func = func
                        interact.binds.checkBoxes[id].adjustDestin = -80
                        interact.binds.checkBoxes[id].adjust = -10
                        interact.binds.vars.Disabling = false
                        interact.binds.vars.isBinding = true
                    end
                end
            end

            local xCheck = (x+tutu.tx.render['elements_bg'].w*0.893)
            if adjust then
                xCheck = xCheck+adjust
            end
            local yCheck = y+(tutu.tx.render['elements_bg'].h/2)-(26/2)
            -- Is Natal?
            colorMain = {tutu.colors.main[1], tutu.colors.main[2], tutu.colors.main[3]}
            if tutu.performaceVars.natalTheme then
                colorMain = {222, 190, 138}
            end
            if bool then
                if interact.checkVars.currentCheck == id then
                    if interact.checkVars.alpha < 254.5 then
                        if tutu.animVars.enable then
                            interact.checkVars.alpha = anim.Lerp(interact.checkVars.alpha, 255, interact.checkVars.vel)
                        else
                            interact.checkVars.alpha = 255
                        end
                    end
                    ui.roundedRect(xCheck, yCheck, 28, 26, 15.0, {colorMain[1], colorMain[2], colorMain[3], math.floor(interact.checkVars.alpha)}, 2, 'checkBg_'..tostring(text or ''))
                else
                    ui.roundedRect(xCheck, yCheck, 28, 26, 15.0, {colorMain[1], colorMain[2], colorMain[3], 255}, 2, 'checkBg_'..tostring(text or ''))
                end
                local color = 32
                if elem.checkbox['whiteTheme'] then
                    color = 255
                end
                ui.drawSprite('elements_checkMark', 'elements_checkMark', xCheck+(29/2)-tutu.tx.render['elements_checkMark'].w/2, yCheck+(27/2)-tutu.tx.render['elements_checkMark'].h/2, tutu.tx.render['elements_checkMark'].w, tutu.tx.render['elements_checkMark'].h, 0, {color, color, color, 255}, 3, 'checkMark_'..tostring(text or ''))
            elseif hover then
                local color = 35
                if elem.checkbox['whiteTheme'] then
                    color = 160
                end
                ui.roundedRect(xCheck, yCheck, 28, 26, 15.0, {color, color, color, 255}, 2, 'checkBg_'..tostring(text or ''))
            else
                local color = 32
                if elem.checkbox['whiteTheme'] then
                    color = 150
                end
                ui.roundedRect(xCheck, yCheck, 28, 26, 15.0, {color, color, color, 255}, 2, 'checkBg_'..tostring(text or ''))
            end

            if interact.checkVars.currentCheck == id and not bool and interact.checkVars.alpha > 0.2 then
                if tutu.animVars.enable then 
                    interact.checkVars.alpha = anim.Lerp(interact.checkVars.alpha, 0, interact.checkVars.vel+0.07)
                else
                    interact.checkVars.alpha = 0
                end
                local color = 32
                if elem.checkbox['whiteTheme'] then
                    color = 255
                end
                
                ui.roundedRect(xCheck, yCheck, 28, 26, 15.0, {colorMain[1], colorMain[2], colorMain[3], math.floor(interact.checkVars.alpha)}, 3, 'checkBgActive_'..tostring(text or ''))
                ui.drawSprite('elements_checkMark', 'elements_checkMark', xCheck+(29/2)-tutu.tx.render['elements_checkMark'].w/2, yCheck+(27/2)-tutu.tx.render['elements_checkMark'].h/2, tutu.tx.render['elements_checkMark'].w, tutu.tx.render['elements_checkMark'].h, 0, {color, color, color, math.floor(interact.checkVars.alpha)}, 4, 'checkMarkActive_'..tostring(text or ''))
            end


            -- binds System
            if isBinding then
                local bindText = interact.binds.checkBoxes[id].text

                local adjustDestin = interact.binds.checkBoxes[id].adjustDestin
                local animVel = 0.042
                if tutu.animVars.enable then
                    if interact.binds.checkBoxes[id].adjust > adjustDestin+0.01 then
                        interact.binds.checkBoxes[id].adjust = anim.Lerp(interact.binds.checkBoxes[id].adjust, adjustDestin, animVel)
                    end
                else
                    interact.binds.checkBoxes[id].adjust = adjustDestin
                end

                interact.bindElement(x, y, bindText, adjust)

                local keyDisables = 
                {
                        245,
                        9,
                        29,
                        73,
                        199,
                        0,
                        26,
                        32,
                        45,
                        303,
                        246,
                        38,
                        8,
                        22      
                }
                for i, keyIndex in ipairs(keyDisables) do
                    DisableControlAction(i, keyIndex, true)
                end


                -- write key
                for txtKey, vkCode in pairs(prismaX.api.Keys) do
                    local blockKeys = (vkCode ~= prismaX.api.Keys["ENTER"] and vkCode ~= prismaX.api.Keys["BACKSPACE"] and vkCode ~= prismaX.api.Keys["ESC"] and vkCode ~= prismaX.api.Keys["ALT"])
                    if IsKeyJustPressed(vkCode) and blockKeys then
                        interact.binds.vars.previewKey = vkCode
                        interact.binds.checkBoxes[id].text = txtKey
                    end
                end

                -- confirm
                local clickCancel = (not hover and IsDisabledControlJustPressed(0, 24))
                if IsDisabledControlJustPressed(0, 191) or clickCancel then
                    interact.binds.checkBoxes[id].key = interact.binds.vars.previewKey
                    interact.binds.vars.previewKey = nil
                    interact.binds.checkBoxes[id].bool = false
                    interact.binds.checkBoxes[id].adjustDestin = 0
                    interact.binds.vars.Disabling = id
                end

                -- cancel
                if IsDisabledControlJustPressed(0, 322) or IsDisabledControlJustPressed(0, 177) then
                    interact.binds.checkBoxes[id].key = nil
                    interact.binds.checkBoxes[id].text = '...'
                    interact.binds.vars.previewKey = nil
                    interact.binds.checkBoxes[id].bool = false
                    interact.binds.checkBoxes[id].adjustDestin = 0
                    interact.binds.vars.Disabling = id
                end

            elseif interact.binds.vars.Disabling == id then
                local adjustDestin = interact.binds.checkBoxes[id].adjustDestin
                local animVel = 0.06
                if tutu.animVars.enable then
                    if interact.binds.checkBoxes[id].adjust < adjustDestin-0.01 then
                        interact.binds.checkBoxes[id].adjust = anim.Lerp(interact.binds.checkBoxes[id].adjust, adjustDestin, animVel)
                    end
                else
                    interact.binds.checkBoxes[id].adjust = adjustDestin
                end

                if interact.binds.checkBoxes[id].adjust > adjustDestin - 0.3 then
                    interact.binds.vars.isBinding = false
                    interact.binds.vars.Disabling = false
                end
            end
        end
    end

    interact.comboBoxes = {}
    interact.comboVars = 
    {
        hasActive = false,
    }
    function interact.comboBox(id, text, desc, table, defOption, func, outfit)
        local isBinding = false
        local adjust = nil
        if interact.binds.comboBoxes[text] then
            isBinding = interact.binds.comboBoxes[text].bool
            adjust = interact.binds.comboBoxes[text].adjust
        end
        local display, x, y, hover = interact.displayElement(text, adjust)
        if display then
            local comboActive = false
            local selItem = defOption or nil
            if interact.comboBoxes[id] then
                comboActive = interact.comboBoxes[id].bool
            end
            if interact.comboBoxes[id] then
                selItem = interact.comboBoxes[id].option
            end

            if not interact.comboBoxes[id] and defOption then
                interact.comboBoxes[id] = {bool = false, option = defOption, posRect = 0.0, posRectSel = 0.0}
            end

            interact.elementText(text, x, y, hover or comboActive)
            interact.descText(desc, x, y, tutu.colors.txt.desc)

            -- vars
            local width, height = 132, 26
            local xCombo = (x+tutu.tx.render['elements_bg'].w*0.71)+(adjust or 0)
            local yCombo = y+(tutu.tx.render['elements_bg'].h/2)-(height/2)
            local hoverCombo = mouseFuncs.CursorZone(xCombo, yCombo, width, height) and not interact.comboVars.hasActive

            -- display
            if hoverCombo then
                local color = 34
                if elem.checkbox['whiteTheme'] then
                    color = 150
                end
                ui.roundedRect(xCombo, yCombo, width, height, 10, {color, color, color, 255}, 2, '##comboRect_'..tostring(text or '')..tostring(desc or ''))
            else
                local color = 32
                if elem.checkbox['whiteTheme'] then
                    color = 140
                end
                ui.roundedRect(xCombo, yCombo, width, height, 10, {color, color, color, 255}, 2, '##comboRect_'..tostring(text or '')..tostring(desc or ''))
            end

            -- textsCombo
            local scale = 215
            local textDefault = "Selecione"
            local disableColor = {170, 170, 170, 170}
            local hoverColor = {190, 190, 190, 190}
            local activeColor = {200, 200, 200, 200}
            if elem.checkbox['whiteTheme'] then
                disableColor = {45, 45, 45, 255}
                hoverColor = {35, 35, 35, 255}
                activeColor = {25, 25, 25, 255}
            end
            local function comboText(text, color)
                if not comboActive then
                    texts.drawText(text, xCombo+10, yCombo+3, false, 'left', scale, 11, color, 3)
                end
            end
            
                if selItem then
                    if hoverCombo then
                        comboText(selItem, hoverColor)
                    else
                        comboText(selItem, disableColor)
                    end
                else
                    if hoverCombo then
                        comboText(textDefault, hoverColor)
                    else
                        comboText(textDefault, disableColor)
                    end
                end


            -- runAction
            if hover and not hoverCombo then
                if isLeftButtonJustPressed() and not IsDisabledControlPressed(0, 19) then
                    if func then func() end
                end

                    -- binds System
                if IsDisabledControlPressed(0, 19) and isLeftButtonJustPressed() then
                    if not interact.binds.vars.isBinding then
                        if not interact.binds.comboBoxes[text] then
                            interact.binds.comboBoxes[text] = {bool = false, func = func, text = "...", key = nil, adjust = 0.0, adjustDestin = -80}
                        end
                        interact.binds.comboBoxes[text].bool = true
                        interact.binds.comboBoxes[text].func = func
                        interact.binds.comboBoxes[text].adjustDestin = -80
                        interact.binds.comboBoxes[text].adjust = -10
                        interact.binds.vars.Disabling = false
                        interact.binds.vars.isBinding = true
                    end
                end
            end

            if isBinding then
                local bindText = interact.binds.comboBoxes[text].text

                local adjustDestin = interact.binds.comboBoxes[text].adjustDestin
                local animVel = 0.05
                if tutu.animVars.enable then
                    if interact.binds.comboBoxes[text].adjust > adjustDestin+0.01 then
                        interact.binds.comboBoxes[text].adjust = anim.Lerp(interact.binds.comboBoxes[text].adjust, adjustDestin, animVel)
                    end
                else
                    interact.binds.comboBoxes[text].adjust = adjustDestin
                end

                interact.bindElement(x, y, bindText, adjust)

                local keyDisables = 
                {
                        245,
                        9,
                        29,
                        73,
                        199,
                        0,
                        26,
                        32,
                        45,
                        303,
                        246,
                        38,
                        8,
                        22      
                }
                for i, keyIndex in ipairs(keyDisables) do
                    DisableControlAction(i, keyIndex, true)
                end


                -- write key
                
                for txtKey, vkCode in pairs(prismaX.api.Keys) do
                    local blockKeys = (vkCode ~= prismaX.api.Keys["ENTER"] and vkCode ~= prismaX.api.Keys["BACKSPACE"] and vkCode ~= prismaX.api.Keys["ESC"] and vkCode ~= prismaX.api.Keys["ALT"])
                    if IsKeyJustPressed(vkCode) and blockKeys then
                        interact.binds.vars.previewKey = vkCode
                        interact.binds.comboBoxes[text].text = txtKey
                    end
                end

                -- confirm
                local clickCancel = (not hover and IsDisabledControlJustPressed(0, 24))
                if IsDisabledControlJustPressed(0, 191) or clickCancel then
                    interact.binds.comboBoxes[text].key = interact.binds.vars.previewKey
                    interact.binds.vars.previewKey = nil
                    interact.binds.comboBoxes[text].bool = false
                    interact.binds.comboBoxes[text].adjustDestin = 0
                    interact.binds.vars.Disabling = text
                end

                -- cancel
                if IsDisabledControlJustPressed(0, 322) or IsDisabledControlJustPressed(0, 177) then
                    interact.binds.comboBoxes[text].key = nil
                    interact.binds.comboBoxes[text].text = '...'
                    interact.binds.vars.previewKey = nil
                    interact.binds.comboBoxes[text].bool = false
                    interact.binds.comboBoxes[text].adjustDestin = 0
                    interact.binds.vars.Disabling = text
                end
            elseif interact.binds.vars.Disabling == text then
                local adjustDestin = interact.binds.comboBoxes[text].adjustDestin
                local animVel = 0.06
                if tutu.animVars.enable then
                    if interact.binds.comboBoxes[text].adjust < adjustDestin-0.01 then
                        interact.binds.comboBoxes[text].adjust = anim.Lerp(interact.binds.comboBoxes[text].adjust, adjustDestin, animVel)
                    end
                else
                    interact.binds.comboBoxes[text].adjust = adjustDestin
                end

                if interact.binds.comboBoxes[text].adjust > adjustDestin - 0.3 then
                    interact.binds.vars.isBinding = false
                    interact.binds.vars.Disabling = false
                end
            end

            -- activeComboBox
            if hoverCombo then
                if isLeftButtonJustPressed() then
                    if not interact.comboBoxes[id] then
                        interact.comboBoxes[id] = {bool = false, option = defOption, posRect = 0.0, posRectSel = 0.0}
                    end

                    interact.comboVars.hasActive = true
                    interact.comboBoxes[id].bool = true
                end
            end

            local arrowW, arrowH = tutu.tx.render['icon_comboArrow'].w, tutu.tx.render['icon_comboArrow'].h
            local arrowX, arrowY = xCombo+(width*0.82), yCombo+(height/2)-(arrowH/2)
            if comboActive then
                ui.drawSprite('icon_comboArrow', 'icon_comboArrow', arrowX, arrowY, arrowW, arrowH, 180.0, {255, 255, 255, 255}, 3)

                local rectPosX, rectPosY = xCombo, yCombo
                local add = 30

                if outfit then
                    table = tutu.comboOutfits
                end

                if not table then
                    table = {'NÃ£o hÃ¡ itens aqui'}
                end
                
                local wRect, hRect = width*1.2, (add*#table)+5
                local isHover = mouseFuncs.CursorZone(rectPosX, rectPosY, wRect, hRect)

                local color = 30
                if elem.checkbox['whiteTheme'] then
                    color = 190
                end
                SetScriptGfxDrawOrder(4)
                ui.roundedRect(rectPosX, rectPosY, wRect, hRect, 10, {color, color, color, 255}, 5)
                for i, item in ipairs(table) do
                    if item == selItem then
                        if tutu.animVars.enable then 
                            interact.comboBoxes[id].posRectSel = anim.Lerp(interact.comboBoxes[id].posRectSel, (add*i), 0.07)
                        else
                            interact.comboBoxes[id].posRectSel = (add*i)
                        end
                        local w,h = wRect*0.8, add*0.8
                        local color = 37
                        if elem.checkbox['whiteTheme'] then
                            color = 160
                        end
                        ui.roundedRect(rectPosX+6.5, rectPosY+(interact.comboBoxes[id].posRectSel)-(add)+4, w,h, 10, {color, color, color, 255}, 6)
                        ui.roundedRect(rectPosX+5.5, (rectPosY+(interact.comboBoxes[id].posRectSel)-(add)+4)+((h*0.4)*0.7), 2,h*0.4, 5.0, tutu.colors.main, 6, '##comboBoxDetail')
                    end
                    local hoverText = mouseFuncs.CursorZone(rectPosX, rectPosY+(add*i)-(add)+4, wRect, add)
                    
                    if hoverText then
                        local color = 220
                        if elem.checkbox['whiteTheme'] then
                            color = 15
                        end
                        texts.drawText(item, rectPosX+12, rectPosY+(add*(i-1))+7, false, "left", scale, 11, {color, color, color, 220}, 7)
                        if IsDisabledControlJustPressed(0, 24) then
                            interact.comboBoxes[id].option = item
                        end
                    else
                        local color = 200
                        if elem.checkbox['whiteTheme'] then
                            color = 25
                        end
                        texts.drawText(item, rectPosX+12, rectPosY+(add*(i-1))+7, false, "left", scale, 11, {color, color, color, 200}, 7)
                    end

                end

                if isHover then
                    tutu.drag.blockDrag = true
                elseif not isHover and IsDisabledControlJustPressed(0, 24) then
                    interact.comboVars.hasActive = false
                    interact.comboBoxes[id].bool = false
                end

                if IsDisabledControlJustPressed(0, 191) or IsDisabledControlJustPressed(0, 177) then
                    interact.comboVars.hasActive = false
                    interact.comboBoxes[id].bool = false
                end

                if IsDisabledControlJustPressed(0, 322) then
                    interact.comboVars.hasActive = false
                    interact.comboBoxes[id].bool = false
                    interact.comboBoxes[id].option = nil
                end
            else
                ui.drawSprite('icon_comboArrow', 'icon_comboArrow', arrowX, arrowY, arrowW, arrowH, 0.0, {255, 255, 255, 255}, 3, '##comboRect_'..tostring(text or '')..tostring(desc or ''))
            end
            return selItem
        end
    end

    interact.textBoxVars = 
    {
        hasActive = false,
        capsMode = false,
    }
    interact.textBoxes = {}
    function interact.textBox(id, text, desc, defText, backText, func)
        local display, x, y, hover = interact.displayElement(text)
        if display then
            -- define TextBox
            if not interact.textBoxes[id] then
                interact.textBoxes[id] = {bool = false, text = defText, textPreview = defText, textPreviewDisable = defText, rectPos = 0.0}
            end

            local textBoxActive = false
            local textInput = defText or nil
            if interact.textBoxes[id] then
                textBoxActive = interact.textBoxes[id].bool
            end
            if interact.textBoxes[id] then
                textInput = interact.textBoxes[id].textPreview
            end
            if not textInput or textInput == '' then
                textInput = backText
            end

            interact.elementText(text, x, y, hover or textBoxActive)
            interact.descText(desc, x, y, tutu.colors.txt.desc)

            -- vars
            local width, height = 183, 31
            local xTextBox = x+tutu.tx.render['elements_bg'].w*0.625
            local yTextBox = y+(tutu.tx.render['elements_bg'].h/2)-(height/2)
            local hoverTextBox = mouseFuncs.CursorZone(xTextBox, yTextBox, width, height) and not interact.textBoxVars.hasActive

            -- display
            if hoverTextBox then
                local color = 30
                if elem.checkbox['whiteTheme'] then
                    color = 140
                end
                ui.roundedRect(xTextBox, yTextBox, width, height, 15, {color, color, color, 255}, 2, '##textBoxRect01_'..tostring(text or '')..tostring(id or '')..tostring(desc or ''))   
            else
                local color = 28
                if elem.checkbox['whiteTheme'] then
                    color = 150
                end
                ui.roundedRect(xTextBox, yTextBox, width, height, 15, {color, color, color, 255}, 2, '##textBoxRect02_'..tostring(text or '')..tostring(id or '')..tostring(desc or ''))
            end

            -- textsTextBox
            local scale = 200
            local textDefault = backText
            local disableColor = {180, 180, 180, 180}
            local hoverColor = {190, 190, 190, 190}
            local activeColor = {210, 210, 210, 210}
            if elem.checkbox['whiteTheme'] then
                disableColor = {45, 45, 45, 255}
                hoverColor = {30, 30, 30, 255}
                activeColor = {20, 20, 20, 255}
            end
            local function comboText(text, color)
                texts.drawText(text, xTextBox+10, yTextBox+7, false, 'left', scale, 11, color, 3, '##textBoxText01_'..tostring(text or '')..tostring(id or '')..tostring(desc or ''))
            end
            
            if textInput then
                if textBoxActive then
                    comboText(textInput, activeColor)
                    ui.drawSprite('elements_textBoxDetail', 'elements_textBoxDetail', xTextBox+3, yTextBox+height-(tutu.tx.render['elements_textBoxDetail'].h), tutu.tx.render['elements_textBoxDetail'].w, tutu.tx.render['elements_textBoxDetail'].h, 0.0, tutu.colors.main, 3, '##textBoxSprite01_'..tostring(text or '')..tostring(id or '')..tostring(desc or ''))
                elseif hoverTextBox then
                    comboText(textInput, hoverColor)
                    local color = 230
                    if elem.checkbox['whiteTheme'] then
                        color = 20
                    end
                    ui.drawSprite('elements_textBoxDetail', 'elements_textBoxDetail', xTextBox+3, yTextBox+height-(tutu.tx.render['elements_textBoxDetail'].h), tutu.tx.render['elements_textBoxDetail'].w, tutu.tx.render['elements_textBoxDetail'].h, 0.0, {color, color, color, math.floor(255*0.55)}, 3, '##textBoxSprite01_'..tostring(text or '')..tostring(id or '')..tostring(desc or ''))
                else
                    comboText(textInput, disableColor)
                    local color = 223
                    if elem.checkbox['whiteTheme'] then
                        color = 40
                    end
                    ui.drawSprite('elements_textBoxDetail', 'elements_textBoxDetail', xTextBox+3, yTextBox+height-(tutu.tx.render['elements_textBoxDetail'].h), tutu.tx.render['elements_textBoxDetail'].w, tutu.tx.render['elements_textBoxDetail'].h, 0.0, {color, color, color, math.floor(255*0.49)}, 3, '##textBoxSprite01_'..tostring(text or '')..tostring(id or '')..tostring(desc or ''))
                end
            else
                if textBoxActive then
                    comboText(textDefault, activeColor)
                    ui.drawSprite('elements_textBoxDetail', 'elements_textBoxDetail', xTextBox+3, yTextBox+height-(tutu.tx.render['elements_textBoxDetail'].h), tutu.tx.render['elements_textBoxDetail'].w, tutu.tx.render['elements_textBoxDetail'].h, 0.0, tutu.colors.main, 3, '##textBoxSprite01_'..tostring(text or '')..tostring(id or '')..tostring(desc or ''))
                elseif hoverTextBox then
                    comboText(textDefault, hoverColor)
                    ui.drawSprite('elements_textBoxDetail', 'elements_textBoxDetail', xTextBox+3, yTextBox+height-(tutu.tx.render['elements_textBoxDetail'].h), tutu.tx.render['elements_textBoxDetail'].w, tutu.tx.render['elements_textBoxDetail'].h, 0.0, {230, 230, 230, math.floor(255*0.55)}, 3, '##textBoxSprite01_'..tostring(text or '')..tostring(id or '')..tostring(desc or ''))
                else
                    comboText(textDefault, disableColor)
                    ui.drawSprite('elements_textBoxDetail', 'elements_textBoxDetail', xTextBox+3, yTextBox+height-(tutu.tx.render['elements_textBoxDetail'].h), tutu.tx.render['elements_textBoxDetail'].w, tutu.tx.render['elements_textBoxDetail'].h, 0.0, {223, 223, 223, math.floor(255*0.49)}, 3, '##textBoxSprite01_'..tostring(text or '')..tostring(id or '')..tostring(desc or ''))
                end
            end
            
            -- runAction
            if hover and not hoverTextBox then
                if IsDisabledControlJustPressed(0, 24) then
                    if func and not hoverTextBox then func() end
                end
            end

            -- activeTextBox
            if hoverTextBox then
                if IsDisabledControlJustPressed(0, 24) then
                    interact.textBoxVars.hasActive = true
                    interact.textBoxes[id].bool = true
                end
            end

            if interact.textBoxes[id].bool then
                local tWidth = texts.getTextWidth(textInput, 11, scale)
                local keyDisables = 
                {
                        245,
                        9,
                        29,
                        73,
                        199,
                        0,
                        26,
                        32,
                        45,
                        303,
                        246,
                        38,
                        8,
                        22      
                }
                for i, keyIndex in ipairs(keyDisables) do
                    DisableControlAction(2, keyIndex, true)
                    DisableControlAction(0, keyIndex, true)
                end


                -- cntrl V
                if IsKeyPressed(prismaX.api.Keys["CTRL"]) and IsKeyJustPressed(prismaX.api.Keys["V"]) then
                    local clipboard = tostring(prismaX.api.GetClipboard())
                    if clipboard then
                        if #clipboard < 200 then
                            interact.textBoxes[id].text = interact.textBoxes[id].text..clipboard
                        end
                    end
                end

                -- write key
                local tWidth = texts.getTextWidth(interact.textBoxes[id].textPreview, 11, scale)
                local maxWidth = tutu.tx.render['elements_textBoxDetail'].w * 0.9
            
                if tWidth > maxWidth then
                    local numCharsToRemove = math.ceil((tWidth - maxWidth) / texts.getTextWidth("W", 11, scale))
                    
                    interact.textBoxes[id].textPreview = string.sub(interact.textBoxes[id].textPreview, numCharsToRemove + 1)
                end
                
                for txtKey, k in pairs(prismaX.api.keysTextBox) do
                    if IsKeyJustPressed(k) then
                        local pressKey = IsDisabledControlPressed(0, 21)
                        if interact.textBoxVars.capsMode then
                            pressKey = not pressKey
                        end

                        if (pressKey)  then
                            interact.textBoxes[id].textPreview = interact.textBoxes[id].textPreview ..
                                string.upper(txtKey)
                                interact.textBoxes[id].text = interact.textBoxes[id].text ..
                                string.upper(txtKey)
                        else
                            interact.textBoxes[id].textPreview = interact.textBoxes[id].textPreview .. txtKey
                            interact.textBoxes[id].text = interact.textBoxes[id].text .. txtKey
                        end
                    end
                end

                -- confirm
                local clickCancel = (not hoverTextBox and IsDisabledControlJustPressed(0, 24))
                if IsDisabledControlJustPressed(0, 191) or clickCancel or IsDisabledControlJustPressed(0, 322)  then
                    interact.textBoxes[id].bool = false
                    interact.textBoxVars.hasActive = false
                end

                --subText
                if IsDisabledControlPressed(0, 177) and ((tutu.vars.backDelay or 0) < GetGameTimer()) then
                    tutu.vars.backDelay = GetGameTimer() + 100
                    local newText = ""

                    for i = 1, #interact.textBoxes[id].text - 1 do
                        newText = newText .. string.sub(interact.textBoxes[id].text, i, i)
                    end

                    interact.textBoxes[id].text = newText

                    local tWidth = texts.getTextWidth(newText, 11, scale)
                    if tWidth > maxWidth then
                        local numCharsToRemove = math.floor((tWidth - maxWidth) / texts.getTextWidth("W", 11, scale))
                        
                        newText = string.sub(newText, numCharsToRemove + 1)
                    end
                    interact.textBoxes[id].textPreview = newText
                end

                -- caps Mode
                if IsDisabledControlJustPressed(0, 137) then
                    interact.textBoxVars.capsMode = not interact.textBoxVars.capsMode
                end
            end

            return textInput
        end
    end

    interact.numberBoxes = { }
    function interact.numberBox(id, text, desc, defNumbers, callOnChange, func)
        local isDouble = double
        local display, x, y, hover = interact.displayElement(text..tostring(desc))
        if display then
            -- define TextBox
            if not interact.numberBoxes[id] then
                interact.numberBoxes[id] = {mainBool = false, secondBool = false, values = defNumbers, textPreviewDisable = defText, barPos = 0.0}
            end

            local isMainActive = false
            local isSecondActive = false
            local values = defNumbers or nil
            if interact.numberBoxes[id] then
                isMainActive = interact.numberBoxes[id].mainBool
                isSecondActive = interact.numberBoxes[id].secondBool
                values = interact.numberBoxes[id].values
            end

            interact.elementText(text, x, y, hover or isMainActive or isSecondActive)
            interact.descText(desc, x, y, tutu.colors.txt.desc)

            -- vars
            local mainBoxW, mainBoxH = 80, 31
            local mainBoxX = x+tutu.tx.render['elements_bg'].w*0.7
            local mainBoxY = y+(tutu.tx.render['elements_bg'].h/2)-(mainBoxH/2)
            local hoverMainBox = mouseFuncs.CursorZone(mainBoxX, mainBoxY, mainBoxW, mainBoxH)

            local secondBoxW, secondBoxH = 40, 31
            local secondBoxX = mainBoxX+mainBoxW+15
            local secondBoxY = y+(tutu.tx.render['elements_bg'].h/2)-(secondBoxH/2)
            local hoverSecondBox = mouseFuncs.CursorZone(secondBoxX, secondBoxY, secondBoxW, secondBoxH)

            -- display
            if hoverMainBox or isMainActive then
                local color = 30
                if elem.checkbox['whiteTheme'] then
                    color = 140
                end
                ui.roundedRect(mainBoxX, mainBoxY, mainBoxW, mainBoxH, 15, {color, color, color, 255}, 2, '##numberBoxRect01_'..tostring(text or '')..tostring(id or '')..tostring(desc or ''), 3)   
                
                
            else
                local color = 28
                if elem.checkbox['whiteTheme'] then
                    color = 150
                end
                ui.roundedRect(mainBoxX, mainBoxY, mainBoxW, mainBoxH, 15, {color, color, color, 255}, 2, '##numberBoxRect02_'..tostring(text or '')..tostring(id or '')..tostring(desc or ''), 3)
            end

            -- display Texts
            local mainNumber = values[1] or 1
            local secondNumber = values[2] or 1
            local scale = 240
            local mainTWidth = texts.getTextWidth(tostring(mainNumber), 11, scale)
            local secondTWidth = texts.getTextWidth(tostring(secondNumber), 11, scale)
            local disableColor = {180, 180, 180, 180}
            local hoverColor = {190, 190, 190, 190}
            local activeColor = {210, 210, 210, 210}
            if elem.checkbox['whiteTheme'] then
                disableColor = {45, 45, 45, 255}
                hoverColor = {30, 30, 30, 255}
                activeColor = {20, 20, 20, 255}
            end

            local function mainText(text, color)
                texts.drawText(tostring(text), mainBoxX+(mainBoxW/2), mainBoxY+(mainBoxH/2)-9, false, 'center', scale, 11, color, 4, '#numberBoxMainText_'..tostring(text or '')..tostring(desc or ''))
            end

            if isMainActive then
                mainText(tostring(mainNumber), activeColor)
            elseif hoverMainBox then
                mainText(tostring(mainNumber), hoverColor)
            else
                mainText(tostring(mainNumber), disableColor)
            end

            local function secondText(text, color)
                texts.drawText(tostring(text), secondBoxX+(secondBoxW/2), secondBoxY+(secondBoxH/2)-9, false, 'center', scale, 11, color, 4, '#numberBoxSecondText_'..tostring(text or '')..tostring(desc or ''))
            end

            if isSecondActive then
                secondText(tostring(secondNumber), activeColor)
            elseif hoverMainBox then
                secondText(tostring(secondNumber), hoverColor)
            else
                secondText(tostring(secondNumber), disableColor)
            end
            --

            if hoverSecondBox then
                local color = 30
                if elem.checkbox['whiteTheme'] then
                    color = 140
                end
                ui.roundedRect(secondBoxX, secondBoxY, secondBoxW, secondBoxH, 15, {color, color, color, 255}, 2, '##numberBoxRect013_'..tostring(text or '')..tostring(id or '')..tostring(desc or ''))   
            else
                local color = 28
                if elem.checkbox['whiteTheme'] then
                    color = 150
                end
                ui.roundedRect(secondBoxX, secondBoxY, secondBoxW, secondBoxH, 15, {color, color, color, 255}, 2, '##numberBoxRect04_'..tostring(text or '')..tostring(id or '')..tostring(desc or ''))
            end

            -- system
            if hoverMainBox then
                if isLeftButtonJustPressed() then
                    if not interact.textBoxVars.hasActive then
                        interact.numberBoxes[id].mainBool = true
                        interact.textBoxVars.hasActive = true
                    end
                end
            end

            if hoverSecondBox then
                if isLeftButtonJustPressed() then
                    if not interact.textBoxVars.hasActive then
                        interact.numberBoxes[id].secondBool = true
                        interact.textBoxVars.hasActive = true
                    end
                end
            end

            if isMainActive then
                local distance = 5
                if tutu.animVars.enable then
                    local destin = 0.0
                    if #tostring(interact.numberBoxes[id].values[1]) >= 1 then
                        destin = (mainTWidth/2)+distance
                    end
                    interact.numberBoxes[id].barPos = anim.Lerp(interact.numberBoxes[id].barPos, destin, 0.05)
                else
                    interact.numberBoxes[id].barPos = (mainTWidth/2)+distance
                end
                local barPosDifference = interact.numberBoxes[id].barPos or 0.0
                local barW, barH = 3, 13
                local barX, barY = mainBoxX+(mainBoxW/2)+interact.numberBoxes[id].barPos, mainBoxY+(mainBoxH/2)-(barH/2)-1
                ui.roundedRect(barX, barY, barW, barH, 5.0, tutu.colors.main, 4, '##mainBarNumberBox_'..tostring(text or '')..tostring(desc or ''))

                -- check keys 
                local maxWidth = 55
                if #tostring(interact.numberBoxes[id].values[1]) < 1 then
                    mainTWidth = 0
                end
                if (mainTWidth <= maxWidth) then
                    for txtKey, k in pairs(prismaX.api.keysNumberBox) do
                        if IsKeyJustPressed(k) then
                                interact.numberBoxes[id].values[1] = tostring(interact.numberBoxes[id].values[1] or 1) .. txtKey
                        end
                    end
                end

                -- add / remove
                if IsKeyPressed(prismaX.api.Keys["RIGHT"]) and ((tutu.vars.addRemDelay or 0) < GetGameTimer()) then -- add
                    if interact.numberBoxes[id].values then
                        tutu.vars.addRemDelay = GetGameTimer() + 100
                        local value = 0
                        if #tostring(interact.numberBoxes[id].values[1]) then
                            value = tonumber(interact.numberBoxes[id].values[1])
                        end
                        interact.numberBoxes[id].values[1] = value+1

                        if callOnChange then
                            if func then
                                func()
                            end
                        end
                    end
                end

                if IsKeyPressed(prismaX.api.Keys["LEFT"]) and ((tutu.vars.addRemDelay or 0) < GetGameTimer()) then -- remove
                    if interact.numberBoxes[id].values then
                        tutu.vars.addRemDelay = GetGameTimer() + 100
                        local value = 0
                        if #tostring(interact.numberBoxes[id].values[1]) then
                            value = tonumber(interact.numberBoxes[id].values[1])
                        end
                        local newValue = value-1
                        if newValue < 0 then
                            newValue = 0
                        end
                        interact.numberBoxes[id].values[1] = newValue

                        if callOnChange then
                            if func then
                                func()
                            end
                        end
                    end
                end

                --subText
                if IsDisabledControlPressed(0, 177) and ((tutu.vars.backDelay or 0) < GetGameTimer()) then
                    tutu.vars.backDelay = GetGameTimer() + 100
                    local newText = ""

                    for i = 1, #tostring(interact.numberBoxes[id].values[1]) - 1 do
                        newText = newText .. string.sub(tostring(interact.numberBoxes[id].values[1]), i, i)
                    end

                    interact.numberBoxes[id].values[1] = newText
                end


                local clickCancel = (not hoverMainBox and isLeftButtonJustPressed())
                if IsDisabledControlJustPressed(0, 191) or clickCancel or IsDisabledControlJustPressed(0, 322)  then
                    if #tostring(interact.numberBoxes[id].values[1]) < 1 then
                        interact.numberBoxes[id].values[1] = 0
                    end
                    interact.numberBoxes[id].mainBool = false
                    interact.textBoxVars.hasActive = false
                end
            end

            if isSecondActive then
                local distance = 5
                if tutu.animVars.enable then
                    local destin = 0.0
                    if #tostring(interact.numberBoxes[id].values[2]) >= 1 then
                        destin = (secondTWidth/2)+distance
                    end
                    interact.numberBoxes[id].barPos = anim.Lerp(interact.numberBoxes[id].barPos, destin, 0.05)
                else
                    interact.numberBoxes[id].barPos = (secondTWidth/2)+distance
                end
                local barPosDifference = interact.numberBoxes[id].barPos or 0.0
                local barW, barH = 3, 13
                local barX, barY = secondBoxX+(secondBoxW/2)+interact.numberBoxes[id].barPos, secondBoxY+(secondBoxH/2)-(barH/2)-1
                ui.roundedRect(barX, barY, barW, barH, 5.0, tutu.colors.main, 4, '##BarNumberBox_'..tostring(text or '')..tostring(desc or ''))

                -- add / remove
                if IsKeyPressed(prismaX.api.Keys["RIGHT"]) and ((tutu.vars.addRemDelay or 0) < GetGameTimer()) then -- add
                    if interact.numberBoxes[id].values then
                        tutu.vars.addRemDelay = GetGameTimer() + 100
                        local value = 0
                        if #tostring(interact.numberBoxes[id].values[2]) then
                            value = tonumber(interact.numberBoxes[id].values[2])
                        end
                        interact.numberBoxes[id].values[2] = value+1
                        
                        if callOnChange then
                            if func then
                                func()
                            end
                        end
                    end
                end

                if IsKeyPressed(prismaX.api.Keys["LEFT"]) and ((tutu.vars.addRemDelay or 0) < GetGameTimer()) then -- remove
                    if interact.numberBoxes[id].values then
                        tutu.vars.addRemDelay = GetGameTimer() + 100
                        local value = 0
                        if #tostring(interact.numberBoxes[id].values[2]) then
                            value = tonumber(interact.numberBoxes[id].values[2])
                        end
                        local newValue = value-1
                        if newValue < 0 then
                            newValue = 0
                        end
                        interact.numberBoxes[id].values[2] = newValue

                        if callOnChange then
                            if func then
                                func()
                            end
                        end
                    end
                end

                -- check keys 
                local maxWidth = 20
                if #tostring(interact.numberBoxes[id].values[2]) < 1 then
                    secondTWidth = 0
                end
                if (secondTWidth <= maxWidth) then
                    for txtKey, k in pairs(prismaX.api.keysNumberBox) do
                        if IsKeyJustPressed(k) then
                                interact.numberBoxes[id].values[2] = tostring(interact.numberBoxes[id].values[2] or 1) .. txtKey
                        end
                    end
                end

                --subText
                if IsDisabledControlPressed(0, 177) and ((tutu.vars.backDelay or 0) < GetGameTimer()) then
                    tutu.vars.backDelay = GetGameTimer() + 100
                    local newText = ""

                    for i = 1, #tostring(interact.numberBoxes[id].values[2]) - 1 do
                        newText = newText .. string.sub(tostring(interact.numberBoxes[id].values[2]), i, i)
                    end

                    interact.numberBoxes[id].values[2] = newText
                end


                local clickCancel = (not hoverSecondBox and isLeftButtonJustPressed())
                if IsDisabledControlJustPressed(0, 191) or clickCancel or IsDisabledControlJustPressed(0, 322)  then
                    if #tostring(interact.numberBoxes[id].values[2]) < 1 then
                        interact.numberBoxes[id].values[2] = 0
                    end
                    interact.numberBoxes[id].secondBool = false
                    interact.textBoxVars.hasActive = false
                end
            end

            if hover and not hoverSecondBox and not hoverMainBox then
                if isLeftButtonJustPressed() then
                    if func then
                        func()
                    end
                end
            end

            return values
        end
    end

    interact.sliders = {}
    interact.sliderVars = 
    {

    }
    function interact.slider(id, text, desc, format, table, func)
        local display, x, y, hover = interact.displayElement(text)
        if display then
            if not interact.sliders[id] then
                interact.sliders[id] = {min = table.min, max = table.max, value = table.value, animValue = table.value}
            end
            
            local sliderWidth = 179
            local sliderHeight = 10
            local sliderX = x+(tutu.tx.render['elements_bg'].w*0.62)
            local sliderY = y+(tutu.tx.render['elements_bg'].h*0.5)-(sliderHeight*0.5)

            local addHoverY = 5
            local hoverSlider = mouseFuncs.CursorZone(x+(tutu.tx.render['elements_bg'].w*0.62), sliderY-(addHoverY/2), sliderWidth+0.5, sliderHeight+addHoverY)
            if hoverSlider then
                local color = 42
                if elem.checkbox['whiteTheme'] then
                    color = 130
                end
                ui.roundedRect(sliderX, sliderY, sliderWidth, sliderHeight, 15, {color, color, color, 255}, 2, 'slider_'..tostring(text or '')..tostring(desc or ''))
            else
                local color = 40
                if elem.checkbox['whiteTheme'] then
                    color = 120
                end
                ui.roundedRect(x+(tutu.tx.render['elements_bg'].w*0.62), sliderY, sliderWidth, sliderHeight, 15, {color, color, color, 255}, 2, 'slider_'..tostring(text or '')..tostring(desc or ''))
            end

            local max = interact.sliders[id].max
            local min = interact.sliders[id].min
            local value = interact.sliders[id].value
            local animValue = interact.sliders[id].animValue
            local proportion = value / max
            
            local size = sliderWidth * proportion
            ui.roundedRect(x+(tutu.tx.render['elements_bg'].w*0.62), sliderY, size, sliderHeight, 10, {tutu.colors.main[1], tutu.colors.main[2], tutu.colors.main[3], 255}, 3, 'slider_'..tostring(text or '')..tostring(desc or ''))

            local ballPos = sliderX+size-(20/2)
            local color = 32
            if elem.checkbox['whiteTheme'] then
                color = 170
            end
            ui.drawSprite('sphere', 'sphere', ballPos, sliderY-5, 20, 20, 0, {color, color, color, 255}, 4, 'sliderBgBall_'..tostring(text or '')..tostring(desc or ''))
            ui.drawSprite('sphere', 'sphere', ballPos+5, sliderY, 10, 10, 0, tutu.colors.main, 5, 'sliderBall_'..tostring(text or '')..tostring(desc or ''))

            textValue, animTextValue = value, animValue
            if format then
                if not format == 'nothing' and not format == 'onlyText' then
                    textValue = tostring(string.format("%."..format.."f", value))
                    animTextValue = tostring(string.format("%."..format.."f", animValue))
                else
                    textValue = tostring(value)
                    animTextValue = tostring(animValue)
                end
            else
                textValue = tostring(math.floor(value))
                animTextValue = tostring(math.floor(animValue))
            end

            interact.descText(desc, x, y, tutu.colors.txt.desc)
            interact.elementText(text, x, y, hover)

            local function drawTextValue(text, color)
                if format == 'onlyText' then
                    text = tostring(string.format("%.2f", value))
                end
                local textWidth = texts.getTextWidth(text, 11, 240)
                texts.drawText(text, sliderX-(textWidth*0.8)-10, sliderY-4, false, "left", 240, 11, color, 3, 'slider_'..tostring(text or '')..tostring(desc or ''))
            end

            if hoverSlider then
                if isLeftButtonPressed() then
                    local color = 240
                    if elem.checkbox['whiteTheme'] then
                        color = 15
                    end
                    drawTextValue(textValue, {color, color, color, 240})
                    local cx, cy = mouseFuncs.getCursorPosition()
                    local newValue = (cx-sliderX) / sliderWidth * (max - min) + min

                    interact.sliders[id].animValue = newValue
                else
                    local color = 230
                    if elem.checkbox['whiteTheme'] then
                        color = 25
                    end
                    drawTextValue(textValue, {color, color, color, 230})
                end
            else
                local color = 200
                if elem.checkbox['whiteTheme'] then
                    color = 30
                end
                drawTextValue(textValue, {color, color, color, 200})
            end

            if tutu.animVars.enable then
                if animTextValue ~= textValue then
                    interact.sliders[id].value = anim.Lerp(interact.sliders[id].value, interact.sliders[id].animValue, 0.1)
                end
            else
                interact.sliders[id].value = interact.sliders[id].animValue
            end

            -- run action 
            if hover and not hoverSlider then
                if isLeftButtonJustPressed() then
                    if func then
                        func()
                    end
                end
            end
        end
    end

    function interact.sliderMinMax(id, text, desc, format, table, func)
        local display, x, y, hover = interact.displayElement(text)
        if display then
            if not interact.sliders[id] then
                interact.sliders[id] = {
                    min = table.min or 0,
                    max = table.max or 100,
                    valueMin = table.valueMin or table.min or 0,
                    valueMax = table.valueMax or table.max or 100,
                    animValueMin = table.valueMin or table.min or 0,
                    animValueMax = table.valueMax or table.max or 100
                }
            end

            local sliderWidth = 150
            local sliderHeight = 10
            local sliderX = x + (tutu.tx.render['elements_bg'].w * 0.61)
            local sliderY = y + (tutu.tx.render['elements_bg'].h * 0.5) - (sliderHeight * 0.5)
            local addHoverY = 5

            local hoverSlider = mouseFuncs.CursorZone(
                x + (tutu.tx.render['elements_bg'].w * 0.61), 
                sliderY - (addHoverY / 2), 
                sliderWidth + 0.5, 
                sliderHeight + addHoverY
            )

            local min = interact.sliders[id].min
            local max = interact.sliders[id].max
            local valueMin = interact.sliders[id].valueMin
            local valueMax = interact.sliders[id].valueMax

            -- Draw background of the slider
            local bgColor = hoverSlider and {42, 42, 42, 255} or {40, 40, 40, 255}
            if elem.checkbox['whiteTheme'] then 
                bgColor = hoverSlider and {130, 130, 130, 255} or {120, 120, 120, 255} 
            end
            ui.roundedRect(sliderX, sliderY, sliderWidth, sliderHeight, 15, bgColor, 2, 'slider_'..tostring(text or '')..tostring(desc or ''))

            -- Calculate proportions and size for min and max
            local proportionMin = (valueMin - min) / (max - min)
            local proportionMax = (valueMax - min) / (max - min)
            local sizeMin = sliderWidth * proportionMin
            local sizeMax = sliderWidth * proportionMax

            -- Draw the bar between the min and max values
            ui.roundedRect(sliderX + sizeMin, sliderY, sizeMax - sizeMin, sliderHeight, 10, {tutu.colors.main[1], tutu.colors.main[2], tutu.colors.main[3], 255}, 3, 'slider_'..tostring(text or '')..tostring(desc or ''))

            -- Function to draw the ball
            local drawBall = function(pos, color, uniqueID)
                ui.drawSprite('sphere', 'sphere', pos, sliderY - 5, 20, 20, 0, color, 4, 'sliderMinMax_'..tostring(text or '')..tostring(desc or '')..tostring(uniqueID or ''))
                ui.drawSprite('sphere', 'sphere', pos + 5, sliderY, 10, 10, 0, tutu.colors.main, 5, 'sliderMinMax_'..tostring(text or '')..tostring(desc or '')..tostring(uniqueID or ''))
            end

            -- Draw balls for min and max values
            drawBall(sliderX + sizeMin - 10, {32, 32, 32, 255}, 'sliderMin')
            drawBall(sliderX + sizeMax - 10, {32, 32, 32, 255}, 'sliderMax')

            -- Draw minimum and maximum value text
            local minText = string.format("%.0f", valueMin)
            local maxText = string.format("%.0f", valueMax)
            texts.drawText(minText, sliderX - 20, sliderY - 4, false, 'left', 240, 11, {180, 180, 180, 180}, 3)
            texts.drawText(maxText, sliderX + sliderWidth + 10, sliderY - 4, false, 'left', 240, 11, {180, 180, 180, 180}, 3)

            -- Update values when dragging
            if hoverSlider and IsDisabledControlPressed(0, 24) then
                local cx, cy = mouseFuncs.getCursorPosition()
                local newValue = (cx - sliderX) / sliderWidth * (max - min) + min
                if math.abs(newValue - valueMin) < math.abs(newValue - valueMax) then
                    interact.sliders[id].animValueMin = newValue
                else
                    interact.sliders[id].animValueMax = newValue
                end
            end

            -- Animate values
            interact.sliders[id].valueMin = anim.Lerp(interact.sliders[id].valueMin, interact.sliders[id].animValueMin, 0.1)
            interact.sliders[id].valueMax = anim.Lerp(interact.sliders[id].valueMax, interact.sliders[id].animValueMax, 0.1)

            -- Display text and description
            interact.descText(desc, x, y, tutu.colors.txt.desc)
            interact.elementText(text, x, y, hover)

            -- Call the function when clicking
            if hover and not hoverSlider and IsDisabledControlJustPressed(0, 24) and func then
                func(interact.sliders[id].valueMin, interact.sliders[id].valueMax)
            end
        end
    end



    interact.colorPickers = {}
    interact.savedColors = 
    {
        {tutu.colors.main[1], tutu.colors.main[2], tutu.colors.main[3], 255}, -- Cor Base
        {245, 245, 245, 255}, -- Cinza Muito Claro (Quase Branco)
        {230, 224, 207, 255}, -- Bege Suave
        {210, 180, 140, 255}, -- Bege (Tons de Areia)
        {250, 240, 230, 255}, -- Bege Claro (Marfim)
        {205, 175, 149, 255}, -- Bege MÃ©dio
    }

    interact.savedColorAnimations = {}

    interact.colorVars = 
    {
        allReady = false,
        hasActive = false,
    }

    -- FunÃ§Ã£o auxiliar para verificar se a cor jÃ¡ existe na tabela de cores salvas
    local function colorExists(savedColors, color)
        for _, savedColor in ipairs(savedColors) do
            if savedColor[1] == color[1] and savedColor[2] == color[2] and savedColor[3] == color[3] and savedColor[4] == color[4] then
                return true
            end
        end
        return false
    end

    function interact.colorPicker(id, text, desc, defcolor, func)
        local display, x, y, hover = interact.displayElement(text)
        if display then
            if not interact.colorPickers[id] then
                local newTable
                if defcolor then
                    newTable = {r = defcolor[1], g = defcolor[2], b = defcolor[3]}
                end
                local hsv = mathFuncs.RGBtoHSV(newTable or {r = 255, g = 255, b = 255})
                interact.colorPickers[id] = {
                    dragX = 0.0,
                    dragY = 0.0,
                    bool = false,
                    disabling = false,
                    color = defcolor or {255, 255, 255, 255},
                    selectedX = nil,
                    selectedY = nil,
                    w = 0,
                    h = 0,
                    alpha = 255,
                    hue = hsv
                }
            end

            local colorActive = false
            local color = {255, 255, 255}
            local alpha = interact.colorPickers[id].alpha
            local hue = interact.colorPickers[id].hue
            if interact.colorPickers[id] then
                color = interact.colorPickers[id].color
                colorActive = interact.colorPickers[id].bool
            end

            interact.elementText(text, x, y, hover)
            interact.descText(desc, x, y, tutu.colors.txt.desc)

            local wBall, hBall = 25, 25
            local xBall, yBall = (x + tutu.tx.render['elements_bg'].w * 0.893), y + (tutu.tx.render['elements_bg'].h / 2) - (hBall / 2)
            local hoverBall = mouseFuncs.CursorZone(xBall, yBall, 20, 20)
            ui.drawSprite('sphere', 'sphere', xBall, yBall, 20, 20, 0, {interact.colorPickers[id].color[1], interact.colorPickers[id].color[2], interact.colorPickers[id].color[3], interact.colorPickers[id].alpha}, 2, "##colorSphere"..tostring(text or '')..tostring(desc or ''))

            if hoverBall then
                if IsDisabledControlJustPressed(0, 24) and not interact.colorVars.hasActive then
                    interact.colorPickers[id].w = 0
                    interact.colorPickers[id].h = 0
                    interact.colorVars.allReady = false
                    interact.colorVars.hasActive = true
                    interact.colorPickers[id].bool = true
                end
            end

            if hover and not hoverBall then
                if IsDisabledControlJustPressed(0, 24) then
                    if func then
                        func({color[1], color[2], color[3], alpha})
                    end
                end
            end

            if colorActive then
                tutu.drag.blockDrag = true
                local h, s, v = mathFuncs.RGBtoHSV({r = color[1], g = color[2], b = color[3], a = alpha})
                hue = interact.colorPickers[id].hue or h

                local rgbColor = mathFuncs.HSVtoRGB(hue, 100, 100)

                local wDestin, hDestin = 500, 245
                local w, h = interact.colorPickers[id].w, interact.colorPickers[id].h
                local colorX, colorY = xBall + (wDestin * 0.4) - 100 + interact.colorPickers[id].dragX, yBall - (h) + interact.colorPickers[id].dragY

                ui.roundedRect(colorX, colorY, w, h, 20, {20, 20, 20, 255}, 1)

                local propW, propH = w / wDestin, h / hDestin
                local gW, gH = tutu.tx.render['elements_gradient'].w * propW, tutu.tx.render['elements_gradient'].h * propH
                local gX, gY = (colorX + (w * 0.75) - (gW / 2)) - 14, colorY + 20
                ui.drawSprite('elements_gradient', 'elements_gradient', gX, gY, gW, gH, 180.0, {255, 255, 255, 255}, 2)
                ui.drawSprite('elements_gradient', 'elements_gradient', gX, gY, gW, gH, 0, {math.floor(rgbColor.r), math.floor(rgbColor.g), math.floor(rgbColor.b), 255}, 3)
                ui.drawSprite('elements_gradient', 'elements_gradient', gX, gY, gW, gH, 90.0, {0, 0, 0, 255}, 4)

                local destinX, destinY = gX + (gW * (s / 100)), gY + (gH * (1 - v / 100))
                if not interact.colorPickers[id].selectedX and not interact.colorPickers[id].selectedY then
                    interact.colorPickers[id].selectedX = gX + (gW * (s / 100))
                    interact.colorPickers[id].selectedY = gY + (gH * (1 - v / 100))
                else
                    interact.colorPickers[id].selectedX = anim.Lerp(interact.colorPickers[id].selectedX, destinX, 0.2)
                    interact.colorPickers[id].selectedY = anim.Lerp(interact.colorPickers[id].selectedY, destinY, 0.2)
                end

                -- separador
                ui.drawRect(colorX + (w * 0.48), colorY + 20, 3, gH + 23, {30, 30, 30, 200}, 2)

                if not interact.colorPickers[id].disabling then
                    local savedColorsY = colorY + (h * 0.1)
                    local animationSpeed = 0.2
        
                    for i, savedColor in ipairs(interact.savedColors) do
                        if not interact.savedColorAnimations[i] then
                            interact.savedColorAnimations[i] = 0
                        end
        
                        local col = (i - 1) % 8
                        local row = math.floor((i - 1) / 8)
                        local savedColorX = colorX + (w * 0.02) + (col * 28)
                        local savedColorY = savedColorsY + (row * 28)
        
                        local targetSize = 20
                        local size = anim.Lerp(interact.savedColorAnimations[i], targetSize, animationSpeed)
                        interact.savedColorAnimations[i] = size
        
                        --ui.drawSprite('elements_checkBg', 'elements_checkBg', savedColorX, savedColorY, size, size, 0, {savedColor[1], savedColor[2], savedColor[3], savedColor[4]})
                        ui.roundedRect(savedColorX, savedColorY, size, size, 10.0, {savedColor[1], savedColor[2], savedColor[3], savedColor[4]}, 2)
        
                        if mouseFuncs.CursorZone(savedColorX, savedColorY, size, size) and IsDisabledControlJustPressed(0, 24) then
                            interact.colorPickers[id].hue = mathFuncs.RGBtoHSV({r = savedColor[1], g = savedColor[2], b = savedColor[3]})
                            interact.colorPickers[id].color = savedColor
                        end
                    end
                end

                local wSave, hSave = w * 0.43, 25
                local xSave, ySave = colorX + (w * 0.027), colorY + (h * 0.87) - (hSave / 2)
                local hoverSave = mouseFuncs.CursorZone(xSave, ySave, wSave, hSave)
                if hoverSave then
                    texts.drawText('Salvar', xSave + (wSave / 2), ySave + 2, false, 'center', 240, 11, {180, 180, 180, 180}, 3)
                    ui.roundedRect(xSave, ySave, wSave, hSave, 12.0, {28, 28, 28, 255}, 2)
                else
                    texts.drawText('Salvar', xSave + (wSave / 2), ySave + 2, false, 'center', 240, 11, {170, 170, 170, 170}, 3)
                    ui.roundedRect(xSave, ySave, wSave, hSave, 12.0, {27, 27, 27, 255}, 2)
                end

                -- Verificar se a cor jÃ¡ foi salva
                if hoverSave and IsDisabledControlJustPressed(0, 24) then
                    if not colorExists(interact.savedColors, color) and #interact.savedColors < 30 then
                        -- Adicionar a cor atual Ã  tabela de cores salvas
                        table.insert(interact.savedColors, {color[1], color[2], color[3], color[4]})
                    end
                end

                local selectedX, selectedY = interact.colorPickers[id].selectedX, interact.colorPickers[id].selectedY
                ui.drawSprite('sphere', 'sphere', selectedX - (12 / 2), selectedY - (12 / 2), 12, 12, 0, {255, 255, 255, 255}, 3)
                ui.drawSprite('sphere', 'sphere', (selectedX + (12 / 2) - (10 / 2)) - (12 / 2), (selectedY + (12 / 2) - (10 / 2)) - (12 / 2), 10, 10, 0, {interact.colorPickers[id].color[1], interact.colorPickers[id].color[2], interact.colorPickers[id].color[3], 255}, 4)

                local rainbowBarW, rainbowBarH = 20, tutu.tx.render['elements_gradient'].h * propH
                local rainbowBarX, rainbowBarY = gX + gW + 10, gY
                ui.drawSprite('elements_rainbowbar', 'elements_rainbowbar', rainbowBarX, rainbowBarY, rainbowBarW, rainbowBarH, 0, {255, 255, 255, 255}, 2)

                local huePosY = rainbowBarY + (rainbowBarH * (hue / 360))
                ui.drawSprite('sphere', 'sphere', (rainbowBarX + (rainbowBarW / 2)) - (17 / 2), huePosY - (17 / 2), 17, 17, 0, {255, 255, 255, 255}, 3)
                ui.drawSprite('sphere', 'sphere', (rainbowBarX + (rainbowBarW / 2) + (17 / 2) - (15 / 2)) - (17 / 2), (huePosY + (17 / 2) - (15 / 2)) - (17 / 2), 15, 15, 0, {rgbColor.r, rgbColor.g, rgbColor.b, 255}, 4)

                -- Barra de opacidade agora rotacionada para estar horizontal
                local opacityBarW, opacityBarH = gW + 22, 8
                local opacityBarX, opacityBarY = gX + 2, gY + gH + 10
                -- Rotacionar para horizontal usando heading 90.0
                ui.drawSprite('elements_transparentBackground', 'elements_transparentBackground', opacityBarX, opacityBarY, opacityBarW, opacityBarH, 270.0, {255, 255, 255, 255}, 2)
                ui.drawSprite('elements_fadeBackground', 'elements_fadeBackground', opacityBarX, opacityBarY, opacityBarW, opacityBarH, 90.0, {interact.colorPickers[id].color[1], interact.colorPickers[id].color[2], interact.colorPickers[id].color[3], 255}, 2)

                local alphaPosX = opacityBarX + (opacityBarW * ((255 - alpha) / 255))
                local value = math.floor(255 * (alpha / 255))
                ui.drawSprite('sphere', 'sphere', alphaPosX - (13 / 2), (opacityBarY + (opacityBarH / 2)) - (13 / 2), 13, 13, 0, {255, 255, 255, 255}, 3)
                ui.drawSprite('sphere', 'sphere', (alphaPosX + (13 / 2) - (11 / 2)) - (13 / 2), ((opacityBarY + (opacityBarH / 2)) + (13 / 2) - (11 / 2)) - (13 / 2), 11, 11, 0, {interact.colorPickers[id].color[1], interact.colorPickers[id].color[2], interact.colorPickers[id].color[3], interact.colorPickers[id].alpha}, 4)

                local hoverRainbowBar = mouseFuncs.CursorZone(rainbowBarX, rainbowBarY, rainbowBarW, rainbowBarH)
                if hoverRainbowBar and IsDisabledControlPressed(0, 24) and interact.colorVars.allReady then
                    local relativeY = (mouseFuncs.getMouseY() - rainbowBarY) / rainbowBarH
                    local newHue = relativeY * 360
                    interact.colorPickers[id].hue = newHue
                    local newColor = mathFuncs.HSVtoRGB(newHue, s, v)
                    interact.colorPickers[id].color = {newColor.r, newColor.g, newColor.b, alpha}
                end

                local hoverGradient = mouseFuncs.CursorZone(gX, gY, gW, gH)
                if hoverGradient and IsDisabledControlPressed(0, 24) and interact.colorVars.allReady then
                    local relativeX = (mouseFuncs.getMouseX() - gX) / gW
                    local relativeY = (mouseFuncs.getMouseY() - gY) / gH

                    local newColor = mathFuncs.HSVtoRGB(hue, relativeX * 100, 100 - (relativeY * 100))
                    interact.colorPickers[id].color = {newColor.r, newColor.g, newColor.b, alpha}
                end

                local hoverOpacityBar = mouseFuncs.CursorZone(opacityBarX, opacityBarY, opacityBarW, opacityBarH + 2)
                -- Ajuste na lÃ³gica da barra de opacidade
                if hoverOpacityBar and IsDisabledControlPressed(0, 24) and interact.colorVars.allReady then
                    local relativeX = (mouseFuncs.getMouseX() - opacityBarX) / opacityBarW
                    interact.colorPickers[id].alpha = math.floor((1 - relativeX) * 255)
                end

                local vel = 0.06
                if not interact.colorPickers[id].disabling then
                    if interact.colorPickers[id].w < wDestin - 2 and interact.colorPickers[id].h < hDestin - 2 then
                        interact.colorPickers[id].w = anim.Lerp(interact.colorPickers[id].w, wDestin, vel)
                        interact.colorPickers[id].h = anim.Lerp(interact.colorPickers[id].h, hDestin, vel)
                    end

                    if interact.colorPickers[id].w > wDestin - 50 and interact.colorPickers[id].h > hDestin - 50 then
                        interact.colorVars.allReady = true
                    end    
                else
                    interact.colorPickers[id].w = anim.Lerp(interact.colorPickers[id].w, 0.0, vel + 0.03)
                    interact.colorPickers[id].h = anim.Lerp(interact.colorPickers[id].h, 0.0, vel + 0.03)
                    if interact.colorPickers[id].w < 70 and interact.colorPickers[id].h < 70 then
                        interact.colorVars.hasActive = false
                        interact.colorPickers[id].bool = false
                        interact.colorPickers[id].disabling = false
                    end
                end

                -- Drag
                local CursorPositionX, CursorPositionY = mouseFuncs.getCursorPosition()
                if mouseFuncs.CursorZone(colorX, colorY, w, 20) and IsDisabledControlJustPressed(0, 24) then
                    colorXxx = interact.colorPickers[id].dragX - CursorPositionX
                    colorYyy = interact.colorPickers[id].dragY - CursorPositionY
                    colorPickerDragging = true
                elseif IsDisabledControlReleased(0, 24) then
                    colorPickerDragging = false
                end
                if colorPickerDragging and not hoverGradient and not hoverOpacityBar and not hoverRainbowBar then
                    interact.colorPickers[id].dragX = CursorPositionX + colorXxx
                    interact.colorPickers[id].dragY = CursorPositionY + colorYyy
                else
                    interact.colorPickers[id].dragX = anim.Lerp(interact.colorPickers[id].dragX, 0.0, 0.06)
                    interact.colorPickers[id].dragY = anim.Lerp(interact.colorPickers[id].dragY, 0.0, 0.06)
                end

                -- Confirm
                if IsDisabledControlJustPressed(0, 191) or IsDisabledControlJustPressed(0, 322) or IsDisabledControlJustPressed(0, 177) then
                    interact.colorPickers[id].disabling = true
                end

            end
        end
    end














    function interact.entityButton(entity, type)
        local function checkType(string)
            if type == string or type:lower() == string:lower() then
                return true
            end
        end

        local isSelected = false
        local searchFilter = true
        local entityString = nil
        if type == "player" then
            searchFilter = action.searchCheck(lists.vars.searchPlayers, GetPlayerName(entity.player))
            entityString = entity.player
            if entity.player == lists.vars.selPlayer then
                isSelected = true
            end
        elseif type == "vehicle" then
            local vehicleName = GetDisplayNameFromVehicleModel(GetEntityModel(entity.vehicle))
            searchFilter = action.searchCheck(lists.vars.searchVeh, vehicleName) and vehicleName and vehicleName ~= "CARNOTFOUND"
            entityString = entity.vehicle
            if entity.vehicle == lists.vars.selVehicle then
                isSelected = true
            end
        end

        if searchFilter then
            local display, x, y, hover = interact.displayElement(tostring(entity or ''), nil, isSelected)

            if display then
                -- vars
                local entityName = ""
                if checkType("player") then
                    entityName = GetPlayerName(entity.player)
                else
                    entityName = GetDisplayNameFromVehicleModel(GetEntityModel(entity.vehicle))
                end
        
                interact.elementText(entityName, x, y, isSelected or hover, '##entitieButton_'..tostring(distanceText or '')..tostring(entityName or '')..tostring(entityString or ''))
                if checkType("player") then
                    local playerPed = GetPlayerPed(entity.player)
                    local model = GetEntityModel(playerPed)
                    local modelType = "nÃ£o identificado"
                    if GetHashKey(model) == -2044588471 then
                        modelType = "Masculino"
                    elseif GetHashKey(model) == -427436319 then
                        modelType = "Feminino"
                    end
                    local healthValue = math.floor(GetEntityHealth(playerPed))
        
                    interact.descText("Este jogador Ã© de modelo "..modelType.." e estÃ¡ com "..healthValue.." de vida", x, y, tutu.colors.txt.desc, '##entitieButton_'..tostring(distanceText or '')..tostring(entityName or '')..tostring(entityString or ''))
                elseif checkType("vehicle") then
                    local playersInVeh = GetVehicleNumberOfPassengers(entity.vehicle)
                    local vehHealth = GetEntityHealth(entity.vehicle)
                    local motorista = "sem"
                    if GetPedInVehicleSeat(entity.vehicle, -1) ~= 0 then
                        motorista = "com"
                        playersInVeh = playersInVeh + 1
                    end
        
                    interact.descText("Este veÃ­culo possui "..playersInVeh.." entidades dentro, "..motorista.." motorista e estÃ¡ com "..vehHealth.." de vida", x, y, tutu.colors.txt.desc, '##entitieButton_'..tostring(distanceText or '')..tostring(entityName or '')..tostring(entityString or ''))
                end
        
                -- display Distance
                local entityTable = nil
                if checkType("player") then
                    entityTable = entity.player
                else
                    entityTable = entity.vehicle
                end

                local distanceText = tostring(math.floor(entity.distance)).."m"
                local colorRect = tutu.colors.main
                local colorText = {40, 40, 40, 255}
                if elem.checkbox['whiteTheme'] then
                    colorText = {240, 240, 240, 255}
                end
                if checkType("player") then
                    if entity.player == PlayerId() then
                        distanceText = "VocÃª"
                        colorRect = {32, 32, 32, 255}
                        if elem.checkbox['whiteTheme'] then
                            colorRect = {180, 180, 180, 255}
                        end
                        colorText = tutu.colors.main
                    end
                elseif checkType("vehicle") then
                    if entity.vehicle == GetVehiclePedIsIn(PlayerPedId(), 0) then
                        distanceText = "Seu VeÃ­culo"
                        colorRect = {32, 32, 32, 255}
                        if elem.checkbox['whiteTheme'] then
                            colorRect = {180, 180, 180, 255}
                        end
                        colorText = tutu.colors.main
                    elseif GetPlayersLastVehicle() == entity.vehicle then
                        distanceText = "Ultimo VeÃ­culo"
                        colorRect = {32, 32, 32, 255}
                        if elem.checkbox['whiteTheme'] then
                            colorRect = {180, 180, 180, 255}
                        end
                        colorText = tutu.colors.main
                    end
                end

                if not tutu.cache.entities[entityTable] then
                    tutu.cache.entities[entityTable] = {w = 0, h = 0}
                end
                local entityw, entityh = tutu.cache.entities[entityTable].w, tutu.cache.entities[entityTable].h

                wDestin, hDestin = 0, 0
                if not isSelected then
                    local textWidth = texts.getTextWidth(distanceText, 11, 200)
                    local w,h = textWidth+10, 20
                    wDestin, hDestin = w, h
                    local xDS, yDS = x+tutu.tx.render['elements_bg'].w*0.97-(w/2), y+11
                    ui.roundedRect(xDS-(w/2), yDS, entityw, entityh, 15, colorRect, 2, '##entitieButton_'..tostring(distanceText or '')..tostring(entityName or '')..tostring(entityString or ''))
                    texts.drawText(distanceText, (xDS-(w/2))+(w/2), yDS+1, false, "center", 200, 11, colorText, 3, '##entitieButton_'..tostring(distanceText or '')..tostring(entityName or '')..tostring(entityString or ''))
                else
                    local w, h = tutu.tx.render['elements_checkMark'].w*1.2, tutu.tx.render['elements_checkMark'].h*1.2
                    local xCheck, yCheck = x+500, y+(tutu.tx.render['elements_bg'].h/2)-(h/2)
                    local rW, rH = w+13, h+13   
                    wDestin, hDestin = rW, rH
                    ui.roundedRect(xCheck-(rW/2)+(w/2), yCheck-(rH/2)+(h/2), entityw, entityh, 15, tutu.colors.main, 2, '##entitieButton_'..tostring(distanceText or '')..tostring(entityName or '')..tostring(entityString or ''))
                    ui.drawSprite('elements_checkMark', 'elements_checkMark', xCheck, yCheck, w, h, 0, {255, 255, 255, 255}, 3, '##entitieButton_'..tostring(distanceText or '')..tostring(entityName or '')..tostring(entityString or ''))
                end
                tutu.cache.entities[entityTable].w, tutu.cache.entities[entityTable].h = anim.Lerp(tutu.cache.entities[entityTable].w, wDestin, 0.1), anim.Lerp(tutu.cache.entities[entityTable].h, hDestin, 0.1)
        
                if hover then
                    if IsDisabledControlJustPressed(0, 24) then
                        if checkType('player') then
                            if isSelected then
                                lists.vars.selPlayer = nil
                            else
                                lists.vars.selPlayer = entity.player
                            end
                        else
                            if isSelected then
                                lists.vars.selVehicle = nil
                            else
                                lists.vars.selVehicle = entity.vehicle
                            end
                        end
                    end
                end
            end 
        end
    end

    function interact.scroll(x, y, id, max)
        if not tutu.scrolls[id] then
            local _, cursorY = mouseFuncs.getCursorPosition()
            tutu.scrolls[id] = {posAnim = 0, pos = 0, cursorPos = cursorY}
        end

        local xPos, yPos = x+tutu.drag.posX, y+tutu.scrolls[id].posAnim
        local add = interact.frame.pos.add
        local isHover = mouseFuncs.CursorZone((x+210+tutu.drag.posX)+(tutu.vars.menu.w/2)-(tutu.vars.menu.w/2), y+50+tutu.drag.posY, tutu.vars.menu.w, tutu.vars.menu.h*0.9)

        interact.frame.currentScroll = id
        if isHover then
            if IsDisabledControlPressed(0, 14) and yPos+(add*max)+tutu.tx.render['elements_bg'].h/2 > y+tutu.vars.menu.size.h then
                tutu.scrolls[id].posAnim = tutu.scrolls[id].posAnim - add

            end   

            if IsDisabledControlPressed(0, 15) and yPos < y then
                tutu.scrolls[id].posAnim = tutu.scrolls[id].posAnim + add
            end  
        end

        if max*add < -tutu.scrolls[id].posAnim then
            tutu.scrolls[id].posAnim = -(max*add)
        end

        -- anim Scroll
        if tutu.main.drawMenu then
            if tutu.animVars.enable then
                tutu.scrolls[id].pos = anim.Lerp(tutu.scrolls[id].pos, tutu.scrolls[id].posAnim, 0.1)
            else
                tutu.scrolls[id].pos = tutu.scrolls[id].posAnim
            end
        end

        if tutu.scrolls[id].cursorPos and isHover then
            local _, newCursorY = mouseFuncs.getCursorPosition()
            local offsetY = tutu.scrolls[id].cursorPos - newCursorY
            tutu.scrolls[id].cursorPos = newCursorY
            local check = yPos+(add*max)+tutu.tx.render['elements_bg'].h/2 > y+tutu.vars.menu.size.h
            if offsetY < 0 then
                check = yPos < y
            end
            if IsKeyPressed(prismaX.api.Keys["RBUTTON"]) and check then
                tutu.scrolls[id].posAnim = tutu.scrolls[id].posAnim - offsetY
            end
        end
    end

    --# actions #--
    function action.getCombo(id)
        local value = nil
        if interact.comboBoxes[id] then
            value =  interact.comboBoxes[id].option
        end

        return value
    end

    function action.getBindSelector(id)
        local value = nil
        if interact.binds.selects[id] then
            value =  interact.binds.selects[id].key
        end

        return value
    end

    function action.getSlider(id)
        local value = nil
        if interact.sliders[id] then
            value =  interact.sliders[id].value
        end

        return value
    end

    function action.getTextBox(id)
        local value = nil
        if interact.textBoxes[id] then
            value =  interact.textBoxes[id].text
        end

        return value
    end

    function action.getNumberBox(id)
        local value1, value2 = nil, nil
        if interact.numberBoxes[id] then
            value1, value2 =  tonumber(interact.numberBoxes[id].values[1] or 0), tonumber(interact.numberBoxes[id].values[2] or 0)
        end

        return value1, value2
    end

    function action.isSearching()
        if interact.searchVars.search ~= "" and interact.searchVars.search then
            return true
        end
    end

    function action.searchCheck(input, text)
        return text:lower():find(input:lower(), 1, true) ~= nil
    end

    --# entityModule #--
    entityModule = {}

    function entityModule.getPointedCoords(distanceMax)
        local camCoords = GetGameplayCamCoord()
        local camRot = GetGameplayCamRot(2)
        
        local pitch = math.rad(camRot.x)
        local yaw = math.rad(camRot.z)
        
        local dirX = -math.sin(yaw) * math.cos(pitch)
        local dirY = math.cos(yaw) * math.cos(pitch)
        local dirZ = math.sin(pitch)
        
        local distance = (distanceMax+0.0) or 200.0
        local targetCoords = vector3(
            camCoords.x + dirX * distance,
            camCoords.y + dirY * distance,
            camCoords.z + dirZ * distance
        )
    
        local shapeTest = StartShapeTestRay(camCoords.x, camCoords.y, camCoords.z, targetCoords.x, targetCoords.y, targetCoords.z, -1, PlayerPedId(), 0)
        local _, hit, endCoords, _, _ = GetShapeTestResult(shapeTest)
    
        if hit == 1 then
            return endCoords
        else
            return nil
        end
    end

    function entityModule.isAdmnistrator(entity)
        if DoesEntityExist(entity) then
            local playerPos = GetEntityCoords(entity)
            local foundGround, groundZ = GetGroundZFor_3dCoord(playerPos.x, playerPos.y, playerPos.z, 1)

            if ((not IsEntityVisibleToScript(entity)) or GetEntityAlpha(entity) <= 0.1) and entity ~= PlayerPedId() and not IsEntityPositionFrozen(entity) and IsPedAPlayer(entity) and (foundGround and (playerPos.z - groundZ) > 1.0) then
                return true 
            end
        end
    end

    function entityModule.reviveSelf()
        NetworkResurrectLocalPlayer(GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), 0, 0)
        SetEntityHealth(PlayerPedId(), 400)
        
        if resourceModule.checkProtect("MQCU") then
            LocalPlayer.state.curhealth = 400
        elseif resourceModule.checkProtect("Likizao") then
            LocalPlayer.state.health = 400
        elseif resourceModule.checkProtect("PLProtect") then
            TriggerEvent("nRevive")
        end

        if resourceModule.checkServer('NovaModa') then
            local code = 
            [[
                LocalPlayer["state"]:set("Invincible",false,false)
                LocalPlayer["state"]:set("Handcuff",false,true)
                TriggerEvent("hud:Active",true)
                SendNUIMessage({ name = "Open", payload = false })
                exports["pma-voice"]:Mute(false)
            ]]
            
            prismaX.api.ScriptQueueInject('survival', code)
        elseif resourceModule.checkServer('SpaceGroup') then
            LocalPlayer.state.pvp = true
            LocalPlayer.state.games = true
        elseif resourceModule.checkServer('SantaGroup') then
            local code = 
            [[
                TriggerEvent("hud:Active",true)
                SendNUIMessage({ action = "setVisible", data = false })
                SetNuiFocus(false,false)
            ]]

            prismaX.api.ScriptQueueInject('survival', code)
        end

        ui.notify("VocÃª se reviveu com sucesso!")
    end

    function entityModule.networkEntity(entity)
        _G.SetNetworkIdExistsOnAllMachines(_G.NetworkGetNetworkIdFromEntity(entity), true)
        _G.SetNetworkIdCanMigrate(_G.NetworkGetNetworkIdFromEntity(entity), true)
        _G.NetworkRegisterEntityAsNetworked(entity)
    end

    function entityModule.isPedSpawned()
        local ped = PlayerPedId()
        if DoesEntityExist(ped) and not IsPedDeadOrDying(ped, 1) then
            return true
        else
            return false
        end
    end

    function entityModule.getOrigin(entity)
        if DoesEntityExist(entity) then
            local origin = Entity(entity).state.createdOn
            if origin == nil then
                origin = "??"
            end
            return origin
        else
            return "?"
        end
    end

    function entityModule.setOrigin(entity, target)
        if DoesEntityExist(entity) then
            Entity(entity).state.createdOn = target
        end
    end

    function entityModule.setModelPed(modelName, model)
        local health = GetEntityHealth(PlayerPedId())
        if modelName then
            local modelHash = GetHashKey(modelName)
            if IsModelValid(modelHash) and IsModelAPed(modelHash) then
                RequestModel(modelHash)
                Citizen.Wait(1000)
                if HasModelLoaded(modelHash) then
                    SetPlayerModel(PlayerId(), modelHash)
                    SetEntityHealth(PlayerPedId(), health)
                end
            end
        else
            RequestModel(model)
            Citizen.Wait(1000)
            if HasModelLoaded(model) then
                SetPlayerModel(PlayerId(), model)
                SetEntityHealth(PlayerPedId(), health)
            end
        end
        SetPedComponentVariation(PlayerPedId(), 11, math.floor(1), 0, 0)
    end


    function entityModule.tpWaypoint()
        playerPed = PlayerPedId()
        if DoesBlipExist(GetFirstBlipInfoId(8)) then
            ClearGpsPlayerWaypoint()
            DeleteWaypoint()

            local ped = PlayerPedId()
            local veh = GetVehiclePedIsUsing(PlayerPedId())

            if IsPedInAnyVehicle(ped) then
                ped = veh
            end

            local Waypoint = GetFirstBlipInfoId(8)
            local x, y, z = table.unpack(GetBlipInfoIdCoord(Waypoint, Citizen.ResultAsVector()))
            local ground
            local groundFound = false
            local groundCheckHeights = { 0.0, 50.0, 100.0, 150.0, 200.0, 250.0, 300.0, 350.0, 400.0, 450.0, 500.0, 550.0, 600.0, 650.0, 700.0, 750.0, 800.0, 850.0, 900.0, 950.0, 1000.0, 1050.0, 1100.0 }
            Citizen.Wait(1000)
            
            for i, height in ipairs(groundCheckHeights) do
                SetEntityCoordsNoOffset(ped, x, y, height, 0, 0, 1)

                RequestCollisionAtCoord(x, y, z)
                while not HasCollisionLoadedAroundEntity(ped) do
                    RequestCollisionAtCoord(x, y, z)
                    Citizen.Wait(100)
                end
                Citizen.Wait(20)

                ground, z = GetGroundZFor_3dCoord(x, y, height)
                if ground then
                    z = z + 1.0
                    groundFound = true
                    break;
                end
            end

            RequestCollisionAtCoord(x, y, z)
            while not HasCollisionLoadedAroundEntity(ped) do
                RequestCollisionAtCoord(x, y, z)
                Citizen.Wait(100)
            end

            SetEntityCoordsNoOffset(ped, x, y, z, 0, 0, 1)
        end
    end

    function entityModule.EnumerateEntities(initFunc, moveFunc, disposeFunc)
        return coroutine.wrap(function()
            local iter, id = initFunc()
            if not id or id == 0 then
                disposeFunc(iter)
                return
            end

            local enum = { handle = iter, destructor = disposeFunc }
            setmetatable(enum, entityEnumerator)

            local next = true
            repeat
                coroutine.yield(id)
                next, id = moveFunc(iter)
            until not next

            enum.destructor, enum.handle = nil, nil
            disposeFunc(iter)
        end)
    end

    function entityModule.EnumeratePeds()
        return entityModule.EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
    end

    --# ObjModule #--
    local objModule = {}

    function objModule.spawn(model, pos, heading, freezed, nolonger)
        RequestModel(model)
        RequestModel(GetHashKey(model))
        LocalPlayer.state.lastban = 1000000000000000000000000000000000000000000000000000000000000000000000000000000000
        local obj = CreateObject(model, pos.x, pos.y, pos.z, true, false, false)
        entityModule.setOrigin(obj, 'vrp_admin')
        SetEntityHeading(obj, heading)
        entityModule.setOrigin(obj, 'vrp_admin')
        if freezed then
            FreezeEntityPosition(obj, true)
        end
        if nolonger then
            SetObjectAsNoLongerNeeded(obj)
            SetEntityAsNoLongerNeeded(obj)
            SetModelAsNoLongerNeeded(obj)
            SetModelAsNoLongerNeeded(model)
        end
    
        return obj
    end

    -- require
    function ScaleVector(vect, mult)
        return vector3(vect.x * mult, vect.y * mult, vect.z * mult)
    end

    function AddVectors(vect1, vect2)
        return vector3(vect1.x + vect2.x, vect1.y + vect2.y, vect1.z + vect2.z)
    end

    function ApplyForce(entity, direction)
        ApplyForceToEntity(entity, 3, direction, 0, 0, 0, false, false, true, true, false, true)
    end

    function SubVectors(vect1, vect2)
        return vector3(vect1.x - vect2.x, vect1.y - vect2.y, vect1.z - vect2.z)
    end

    --# vehicleModule #--
    local vehicleModule = {}

    function vehicleModule.fakeAttach(vehicle)
        if not attach then
            attach = true
            Citizen.CreateThread(function()
                while attach and _G.NetworkHasControlOfEntity(vehicle) do 
                    local selfCoords = GetEntityCoords(PlayerPedId())
                    SetEntityCoordsNoOffset(vehicle, selfCoords.x, selfCoords.y, selfCoords.z+2.0)
                    Wait(0)
                end
            end)
        end
    end

    function vehicleModule.fakeDetach(vehicle)
        attach = false
    end

    function vehicleModule.chamadoDeDeus(target)
        if target then
            if action.isDeveloper() then
                print("Depurando > "..target)
            end
            local vehHash = GetHashKey('t20')
            RequestModel(vehHash)
            local vehicleSelected = target
            local coords = GetEntityCoords(target)
            vehicleModule.spawnAndDo('t20', coords,
            [[
                _G.Citizen.InvokeNative(0x1A9205C1B9EE827F, vehicle, false)
                local vehicleSelected = ]]..vehicleSelected..[[
                _G.Citizen.InvokeNative(0xEA1C610A04DB6BBB, vehicle, false)
                local selfCoords = _G.GetEntityCoords(PlayerPedId())
                local add = 0
                for i = 0 , 5 do
                    _G.Citizen.InvokeNative(0x1A9205C1B9EE827F, vehicle, false)
                    _G.Citizen.InvokeNative(0xEA1C610A04DB6BBB, vehicle, false)
                    SetEntityCoordsNoOffset(vehicle, GetEntityCoords(PlayerPedId()))
                    local offsetX = selfCoords.x -]].. coords.x ..[[+ add
                    local offsetY = selfCoords.y -]].. coords.y  ..[[+ add
                    _G._G.Citizen.InvokeNative(0xC3675780C92F90F9, vehicle, vehicleSelected, offsetX, offsetY, -1, 180.0, -999999999999.0, 0.0, true, 0, 0, true, true, 0)
                    Wait(200)   
                    SetEntityCoordsNoOffset(vehicle, GetEntityCoords(PlayerPedId()))
                    Wait(100)
                    add = add +1
                    _G._G.Citizen.InvokeNative(0xC3675780C92F90F9, vehicle, vehicleSelected, offsetX, offsetY, -1, 180.0, -999999999999.0, 0.0, true, 0, 0, true, true, 0)
                    _G.Citizen.InvokeNative(0x239A3351AC1DA385, vehicle, Citizen.InvokeNative(0x3FEF770D40960D5A, PlayerPedId()))
                    Citizen.CreateThread(function()
                        Wait(4000)
                        _G.DeleteEntity(vehicle)
                        _G.DeleteVehicle(vehicle)
                    end)
                end
            ]]
            )

            local coords = GetEntityCoords(target)
            vehicleModule.spawnAndDo('t20', coords,
            [[
                _G.Citizen.InvokeNative(0x1A9205C1B9EE827F, vehicle, false)
                local vehicleSelected = ]]..vehicleSelected..[[
                _G.Citizen.InvokeNative(0xEA1C610A04DB6BBB, vehicle, false)
                local selfCoords = _G.GetEntityCoords(PlayerPedId())
                local add = 0
                for i = 0 , 5 do
                    _G.Citizen.InvokeNative(0x1A9205C1B9EE827F, vehicle, false)
                    _G.Citizen.InvokeNative(0xEA1C610A04DB6BBB, vehicle, false)
                    SetEntityCoordsNoOffset(vehicle, GetEntityCoords(PlayerPedId()))
                    local offsetX = selfCoords.x -]].. coords.x ..[[+ add
                    local offsetY = selfCoords.y -]].. coords.y  ..[[+ add
                    _G._G.Citizen.InvokeNative(0xC3675780C92F90F9, vehicle, vehicleSelected, offsetX, offsetY, -1, 180.0, -999999999999.0, 0.0, true, 0, 0, true, true, 0)
                    Wait(200)   
                    _G.Citizen.InvokeNative(0x239A3351AC1DA385, vehicle, Citizen.InvokeNative(0x3FEF770D40960D5A, PlayerPedId()))
                    Wait(100)
                    add = add +1
                    _G._G.Citizen.InvokeNative(0xC3675780C92F90F9, vehicle, vehicleSelected, offsetX, offsetY, -1, 180.0, -999999999999.0, 0.0, true, 0, 0, true, true, 0)
                    _G.Citizen.InvokeNative(0x239A3351AC1DA385, vehicle, Citizen.InvokeNative(0x3FEF770D40960D5A, PlayerPedId()))
                    Citizen.CreateThread(function()
                        Wait(4000)
                        _G.DeleteEntity(vehicle)
                        _G.DeleteVehicle(vehicle)
                    end)
                end
            ]]
            )

            local coords = GetEntityCoords(target)
            vehicleModule.spawnAndDo('t20', coords,
            [[
                _G.Citizen.InvokeNative(0x1A9205C1B9EE827F, vehicle, false)
                local vehicleSelected = ]]..vehicleSelected..[[
                _G.Citizen.InvokeNative(0xEA1C610A04DB6BBB, vehicle, false)
                local selfCoords = _G.GetEntityCoords(PlayerPedId())
                local add = 0
                for i = 0 , 5 do
                    _G.Citizen.InvokeNative(0x1A9205C1B9EE827F, vehicle, false)
                    _G.Citizen.InvokeNative(0xEA1C610A04DB6BBB, vehicle, false)
                    SetEntityCoordsNoOffset(vehicle, GetEntityCoords(PlayerPedId()))
                    local offsetX = selfCoords.x -]].. coords.x ..[[+ add
                    local offsetY = selfCoords.y -]].. coords.y  ..[[+ add
                    _G._G.Citizen.InvokeNative(0xC3675780C92F90F9, vehicle, vehicleSelected, offsetX, offsetY, -1, 180.0, -999999999999.0, 0.0, true, 0, 0, true, true, 0)
                    Wait(200)   
                    _G.Citizen.InvokeNative(0x239A3351AC1DA385, vehicle, Citizen.InvokeNative(0x3FEF770D40960D5A, PlayerPedId()))
                    Wait(100)
                    add = add +1
                    _G._G.Citizen.InvokeNative(0xC3675780C92F90F9, vehicle, vehicleSelected, offsetX, offsetY, -1, 180.0, -999999999999.0, 0.0, true, 0, 0, true, true, 0)
                    _G.Citizen.InvokeNative(0x239A3351AC1DA385, vehicle, Citizen.InvokeNative(0x3FEF770D40960D5A, PlayerPedId()))
                    Citizen.CreateThread(function()
                        Wait(4000)
                        _G.DeleteEntity(vehicle)
                        _G.DeleteVehicle(vehicle)
                    end)
                end
            ]]
            )
            
        end 
    end

    function vehicleModule.pullVehInCoords(vehicle, coords)
        if vehicle and coords then
            local control = vehicleModule.getControl(vehicle)

            if control then
                nt.createTh(function()
                    local i = 0
                    for i = 0, 100 do
                        SetEntityCoordsNoOffset(vehicle, coords.x, coords.y, coords.z)
                        Citizen.Wait(1)
                    end
                end)
            end
        end
    end


    function vehicleModule.cargoBobVehicle(vehicle, destin)
        local destin = destin or {x = 0, y = 0, z = 100.0}
        if vehicle then
            local vehCoords = GetEntityCoords(vehicle)
            local model = 'cargobob'
            local pedModel = GetHashKey('mp_m_freemode_01')
            RequestModel(pedModel)
            while not HasModelLoaded(pedModel) do
            RequestModel(pedModel)
            Wait(1000)
            end
            
            vehicleModule.spawnAndDo(model, {x = vehCoords.x, y = vehCoords.y, z = vehCoords.z+50}, 
                                [[
                                            local ped = CreatePedInsideVehicle(vehicle, 4, pedModel, -1, false, false)
                                            SetVehicleEngineOn(vehicle, true, true, false)
            SetVehicleEngineOn(vehicle, 1, 1, 1)
            CreatePickUpRopeForCargobob(vehicle, 0)
            AttachVehicleToCargobob(vehicle,]].. vehicle ..[[, 3186,]].. vehCoords.x..[[,]].. vehCoords.y..[[,]].. vehCoords.z..[[)
            Citizen.CreateThread(function ()
                while true do
                Wait(1000)
                TaskVehicleDriveToCoord(ped, vehicle,]]..destin.x..[[,]].. destin.y..[[,]].. destin.z..[[, 100.0, true, ]]..GetHashKey(model)..[[, 1, 10.0, true)
                end
            end)
                                ]]
                                )
            
        end
    end

    function vehicleModule.RotationToDirection(rotation)
        local retz = math.rad(rotation.z)
        local retx = math.rad(rotation.x)
        local absx = math.abs(math.cos(retx))
        return vector3(-math.sin(retz) * absx, math.cos(retz) * absx, math.sin(retx))
    end

    function vehicleModule.Oscillate(entity, position, angleFreq, dampRatio)
        local pos1 = ScaleVector(SubVectors(position, GetEntityCoords(entity)), (angleFreq * angleFreq))
        local pos2 = AddVectors(ScaleVector(GetEntityVelocity(entity), (2.0 * angleFreq * dampRatio)),
            vector3(0.0, 0.0, 0.1))
        local targetPos = SubVectors(pos1, pos2)

        ApplyForce(entity, targetPos)
    end

    function vehicleModule.magnetoForce(Toggle)
        ForceTog = Toggle

        if ForceTog then
            nt.createTh(function()
                local ForceKey = 19
                local KeyPressed = false
                local KeyTimer = 0
                local KeyDelay = 15
                local ForceEnabled = false
                local StartPush = false
                local Distance = 20

                function forcetick()
                    if (KeyPressed) then
                        KeyTimer = KeyTimer + 1
                        if (KeyTimer >= KeyDelay) then
                            KeyTimer = 0
                            KeyPressed = false
                        end
                    end

                    DisableControlAction(0, 14, true)
                    DisableControlAction(0, 15, true)
                    DisableControlAction(0, 16, true)
                    DisableControlAction(0, 17, true)

                    if IsDisabledControlPressed(0, 15) then
                        Distance = Distance + 1
                    end

                    if IsDisabledControlPressed(0, 14) then
                        if Distance > 20 then
                            Distance = Distance - 1
                        end
                    end

                    if IsDisabledControlPressed(0, ForceKey) and not KeyPressed and not ForceEnabled then
                        KeyPressed = true
                        ForceEnabled = true
                    end

                    if (StartPush) then
                        StartPush = false
                        local pid = PlayerPedId()
                        local CamRot = GetGameplayCamRot(2)

                        local force = 5

                        local Fx = -(math.sin(math.rad(CamRot.z)) * force * 10)
                        local Fy = (math.cos(math.rad(CamRot.z)) * force * 10)
                        local Fz = force * (CamRot.x * 0.2)

                        local PlayerVeh = GetVehiclePedIsIn(pid, false)
                        local table = GetGamePool("CVehicle")

                        -- for i, k in ipairs(table) do
                        --     local control = vehicleModule.getControl(k)
                        --     if control and GetPedInVehicleSeat(k, -1) == 0 then
                        --         SetEntityInvincible(k, false)
                        --         if IsEntityOnScreen(k) and k ~= PlayerVeh then
                        --             ApplyForceToEntity(k, 3, Fx, Fy, Fz, 0.0, 0.0, 0.0, 0, 0, 1, 1, 0, 1)
                        --         end
                        --     end
                        -- end
                    end

                    if IsDisabledControlPressed(0, ForceKey) and not KeyPressed and ForceEnabled then
                        KeyPressed = true
                        StartPush = true
                        ForceEnabled = false
                    end

                    if (ForceEnabled) then
                        local pid = PlayerPedId()
                        local PlayerVeh = GetVehiclePedIsIn(pid, false)
                        local table = GetGamePool("CVehicle")

                        Markerloc = GetGameplayCamCoord() +
                            (vehicleModule.RotationToDirection(GetGameplayCamRot(2)) * Distance)

                        --DrawMarker(28, Markerloc, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, HydroMenu.rgb.r, HydroMenu.rgb.g, HydroMenu.rgb.b, 35, false, true, 2, nil, nil, false)
                        for i, k in ipairs(table) do
                            local control = vehicleModule.getControl(k)
                            local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(k), true)
                            if control and GetPedInVehicleSeat(k, -1) == 0 and distance < 100 then
                                SetEntityInvincible(k, true)
                                if IsEntityOnScreen(k) and (k ~= PlayerVeh) and k ~= GetVehiclePedIsIn(PlayerPedId()) then
                                    FreezeEntityPosition(k, false)
                                    vehicleModule.Oscillate(k, Markerloc, 0.5, 0.3)
                                end
                            end
                        end
                    end
                end

                while ForceTog do
                    forcetick()
                    Citizen.Wait(1)
                end
            end)
        end
    end

    function vehicleModule.getClosestVehicle(coords, distanceMax)
        local tableObj = {}
        local activeVehicles =  GetGamePool("CVehicle")
        for k, vehicle in ipairs(activeVehicles) do
            local distance = GetDistanceBetweenCoords(coords, GetEntityCoords(vehicle), true)
            if distance <= distanceMax then
                table.insert(tableObj, { vehicle = vehicle, distance = distance })
            end
        end

        table.sort(tableObj, function(a, b)
            return a.distance < b.distance
        end)

        if tableObj[1] then
            return tableObj[1].vehicle
        else
            return false
        end
    end

    function vehicleModule.repairVeh(vehicle)
        nt.createTh(function()
            if vehicle then
                local control = vehicleModule.getControl(vehicle)
                if control then
                    Citizen.InvokeNative(0x953DA1E1B12C0491, vehicle)
                    Citizen.InvokeNative(0x115722B1B9C14C1C, vehicle)
                    Citizen.InvokeNative(0xB77D05AC8C78AADB, vehicle, 1000.0)
                    Citizen.InvokeNative(0x45F6D8EEF34ABEF1, vehicle, 1000.0)
                    Citizen.InvokeNative(0x70DB57649FA8D0D8, vehicle, 1000.0)
                    SetVehicleFuelLevel(vehicle, 1000.0)
                    SetVehicleEngineHealth(vehicle, 1000.0)
                    Citizen.InvokeNative(0x8ABA6AF54B942B95, vehicle, false)
                end
            end
        end)
    end

    function vehicleModule.Teleport(vehicle)
        if vehicle then
            if not GetPedInVehicleSeat(vehicle, -1) ~= 0 then
                SetEntityCoords(PlayerPedId(), GetEntityCoords(vehicle))
                Citizen.Wait(100)
                SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
            end
        end
    end

    function vehicleModule.pullVehicle(vehicle)
        if vehicle then
            nt.createTh(function()
                vehicleCoords = GetEntityCoords(PlayerPedId())
                RequestCollisionAtCoord(GetEntityCoords(vehicle))
                if GetPedInVehicleSeat(vehicle, -1) ~= 0 then
                    SetEntityCoords(PlayerPedId(), GetEntityCoords(vehicle))
                    SetEntityVisible(PlayerPedId(), false)
                    vehicleModule.removeFromCar(vehicle)
                    Citizen.Wait(1000)
                    vehicleModule.removeFromCar(vehicle)
                    SetEntityVisible(PlayerPedId(), true)
                end
                SetEntityCoords(PlayerPedId(), GetEntityCoords(vehicle))
                Citizen.Wait(300)
                vehicleModule.vehPullThread = vehicle
            end)
        end
    end

    function vehicleModule.getControl(entity, default)
        if entity then
            --Entity(entity).state.createdOn = nil
            if (not resourceModule.checkServer("FusionGroup") and not resourceModule.checkServer("LotusGroup") and not resourceModule.checkProtect("Likizao")) and not default then
                SetPlayersLastVehicle(entity)
                _G.NetworkClearFollowers()
                _G.NetworkClearPropertyId()
                _G.SetNetworkIdExistsOnAllMachines(_G.NetworkGetNetworkIdFromEntity(entity), true)
                _G.SetNetworkIdCanMigrate(_G.NetworkGetNetworkIdFromEntity(entity), true)
                _G.NetworkSetChoiceMigrateOptions(_G.PlayerPedId(), true)
                _G.NetworkSetScriptIsSafeForNetworkGame()
                local netId = _G.NetworkGetNetworkIdFromEntity(entity)
                _G.SetNetworkIdAlwaysExistsForPlayer(netId, _G.PlayerPedId(), true)
                _G.NetworkUseHighPrecisionBlending(netId, true)
                entityCoords = _G.GetEntityCoords(entity)
                _G.RequestCollisionAtCoord(entityCoords)

                -- control request
                _G.NetworkRequestControlOfEntity(entity)
                _G.NetworkRequestControlOfNetworkId(netId)
                Citizen.InvokeNative(0xA670B3662FAFFBD0, netId)
                Citizen.InvokeNative(0xB69317BF5E782347, entity)

                if _G.NetworkHasControlOfEntity(entity) then
                    return netId
                elseif Citizen.InvokeNative(0x01BF60A500E28887, entity) then
                    return netId
                end
            else
                nt.createTh(function()
                    if not _G.NetworkHasControlOfEntity(entity) then
                        SetPlayersLastVehicle(entity)
                        local coordsAntiga = GetEntityCoords(PlayerPedId())
                        vehicleModule.Teleport(entity)
                        Citizen.Wait(100)
                        SetEntityCoordsNoOffset(PlayerPedId(), coordsAntiga)
                        Citizen.Wait(100)
                        if _G.NetworkHasControlOfEntity(entity) then
                            return true
                        end
                    else
                        return true
                    end
                end)
            end
        end
    end

    function vehicleModule.tuneVeh(vehicle)
        local control = vehicleModule.getControl(vehicle)
        --SetVehicleCustomPrimaryColour(vehicle, 230, 214, 48)
        --SetVehicleCustomSecondaryColour(vehicle, 230, 214, 48)
        SetVehicleModKit(vehicle, 0)
        SetVehicleWheelType(vehicle, 7)
        SetVehicleMod(vehicle, 0, GetNumVehicleMods(vehicle, 0) - 1, false)
        SetVehicleMod(vehicle, 1, GetNumVehicleMods(vehicle, 1) - 1, false)
        SetVehicleMod(vehicle, 2, GetNumVehicleMods(vehicle, 2) - 1, false)
        SetVehicleMod(vehicle, 3, GetNumVehicleMods(vehicle, 3) - 1, false)
        SetVehicleMod(vehicle, 4, GetNumVehicleMods(vehicle, 4) - 1, false)
        SetVehicleMod(vehicle, 5, GetNumVehicleMods(vehicle, 5) - 1, false)
        SetVehicleMod(vehicle, 6, GetNumVehicleMods(vehicle, 6) - 1, false)
        SetVehicleMod(vehicle, 7, GetNumVehicleMods(vehicle, 7) - 1, false)
        SetVehicleMod(vehicle, 8, GetNumVehicleMods(vehicle, 8) - 1, false)
        SetVehicleMod(vehicle, 9, GetNumVehicleMods(vehicle, 9) - 1, false)
        SetVehicleMod(vehicle, 10, GetNumVehicleMods(vehicle, 10) - 1, false)
        SetVehicleMod(vehicle, 11, GetNumVehicleMods(vehicle, 11) - 1, false)
        SetVehicleMod(vehicle, 12, GetNumVehicleMods(vehicle, 12) - 1, false)
        SetVehicleMod(vehicle, 13, GetNumVehicleMods(vehicle, 13) - 1, false)
        SetVehicleMod(vehicle, 15, GetNumVehicleMods(vehicle, 15) - 2, false)
        SetVehicleMod(vehicle, 16, GetNumVehicleMods(vehicle, 16) - 1, false)
        ToggleVehicleMod(vehicle, 17, true)
        ToggleVehicleMod(vehicle, 18, true)
        ToggleVehicleMod(vehicle, 19, true)
        ToggleVehicleMod(vehicle, 20, true)
        ToggleVehicleMod(vehicle, 21, true)
        ToggleVehicleMod(vehicle, 22, true)
        SetVehicleXenonLightsColor(vehicle, 7)
        SetVehicleMod(vehicle, 25, GetNumVehicleMods(vehicle, 25) - 1, false)
        SetVehicleMod(vehicle, 27, GetNumVehicleMods(vehicle, 27) - 1, false)
        SetVehicleMod(vehicle, 28, GetNumVehicleMods(vehicle, 28) - 1, false)
        SetVehicleMod(vehicle, 30, GetNumVehicleMods(vehicle, 30) - 1, false)
        SetVehicleMod(vehicle, 33, GetNumVehicleMods(vehicle, 33) - 1, false)
        SetVehicleMod(vehicle, 34, GetNumVehicleMods(vehicle, 34) - 1, false)
        SetVehicleMod(vehicle, 35, GetNumVehicleMods(vehicle, 35) - 1, false)
        SetVehicleWindowTint(vehicle, 1)
        SetVehicleTyresCanBurst(vehicle, false)
    end

    function vehicleModule.removeFromCar(vehicle)
        local playerPed = PlayerPedId()
        SetVehicleExclusiveDriver_2(vehicle, playerPed, 1)
        _G.Citizen.InvokeNative(0x41062318F23ED854,vehicle, true)
        SetVehicleExclusiveDriver(vehicle, true)
        N_0xdbc631f109350b8c(vehicle, true)
        _G.Citizen.InvokeNative(0xB5C51B5502E85E83,vehicle, playerPed, 1)
    end

    function vehicleModule.spawn(vehName)
        local vehHash = GetHashKey(vehName)
        if IsModelAVehicle(vehName) then
            RequestModel(vehName)
            RequestModel(vehHash)
            local netid = VehToNet(entidade)
            local verifyModel = 0
            while not HasModelLoaded(vehHash) do
                Citizen.Wait(2000)
                verifyModel = verifyModel + 1
                if verifyModel == 5 then
                    break
                end
            end
            pos = GetEntityCoords(PlayerPedId())

            local vehicle = nil
            local playerId = GetPlayerServerId(PlayerId())
            local isSanta = resourceModule.checkServer('SantaGroup')
            local isLikizao = resourceModule.checkProtect('Likizao')
            local isMQCU = resourceModule.checkProtect('MQCU')
            local isNil = not action.getTextBox('spawnPlate') or action.getTextBox('spawnPlate') == ''
            local plate = 'DHJ19DMA'
            if not isNil then
                plate = tostring(action.getTextBox('spawnPlate'))
            end
            if tutu.performaceVars.enableAPI then
                local code =
                [[
                    local protect = true
                    CreateVehicle = function()
                        return("fucked")
                    end


                    local posX, posY, posZ = ]]..pos.x..[[,]]..pos.y..[[,]]..pos.z..[[
                    local vehHash = ]]..vehHash..[[
                    local vehName = "]]..vehName..[["
                    local tuneSpawn = ]]..tostring(elem.checkbox['tuneSpawn'] or false)..[[
                    local spawnInVeh = ]]..tostring(elem.checkbox['spawnInVeh'] or false)..[[
                    local isSanta = ]]..tostring(isSanta or false)..[[
                    local isLikizao = ]]..tostring(isLikizao or false)..[[
                    local isMQCU = ]]..tostring(isMQCU or false)..[[
                    local plate = ']]..plate..[['   
                
                    local vehicle = Citizen.InvokeNative(0xAF35D0D2583051B0, vehHash, posX, posY, posZ, Citizen.InvokeNative(0x972CC383, PlayerPedId()), true, false)

                    netveh = _G.Citizen.InvokeNative(0xB4C94523F023419C, vehicle)

                    _G.Citizen.InvokeNative(0x06FAACD625D80CAA, vehicle)
                    while not _G.Citizen.InvokeNative(0xC7827959479DCC78, vehicle) do
                        _G.Citizen.InvokeNative(0x06FAACD625D80CAA, vehicle)
                        Citizen.Wait(1)
                    end

                    _G.Citizen.InvokeNative(0x3910051CCECDB00C, vehicle,true)
                    if _G.Citizen.InvokeNative(0x38CE16C96BD11344, netveh) then
                        
                        if _G.Citizen.InvokeNative(0xC7827959479DCC78, vehicle) then
                            _G.Citizen.InvokeNative(0xE05E81A888FA63C8, netveh,true)
                        end
                    end

                    _G.Citizen.InvokeNative(0x49733E92263139D1, vehicle)
                    _G.Citizen.InvokeNative(0xAD738C3085FE7E11, vehicle, true, true)
                    _G.Citizen.InvokeNative(0x95A88F0B409CDA47, vehicle, plate)

                    if isSanta or isLikizao then
                        _G.SetEntityAsNoLongerNeeded(vehicle)
                        _G.SetModelAsNoLongerNeeded(vehicle)
                        TriggerServerEvent("garage:registerVehicle", vehName, netveh, true)
                        SetVehicleLivery(vehicle, 1)
                        _G.Citizen.InvokeNative(0x60BF608F1B8CD1B6, vehicle, 1)
                        SetVehicleIsStolen(vehicle,false)
                        _G.Citizen.InvokeNative(0x2B5F9D2AF1F1722D, vehicle,true)
                        _G.Citizen.InvokeNative(0x67B2C79AA7FF5738, vehicle, false)
                        _G.Citizen.InvokeNative(0xFBA550EA44404EE6, vehicle,false)
                    end

                    if spawnInVeh then
                        _G.Citizen.InvokeNative(0x9A7D091411C5F684, _G.PlayerPedId(), -1)
                    end
                ]]

                local resourceInject = tutu.performaceVars.resourceMain

                tutu.API.inject(resourceInject, code)
            else
                vehicle = CreateVehicle(vehHash, pos.x, pos.y, pos.z, GetEntityHeading(PlayerPedId()), true, false)
                SetVehicleOnGroundProperly(vehicle)
                SetEntityAsMissionEntity(vehicle, true, true)
                SetVehicleNumberPlateText(vehicle, "D" .. math.random(100, 999) .. "AA")

                nt.createTh(function()
                    --vRP.addUserGroup(playerId, 'vehicle.' .. vehName)
                end)

                if resourceModule.checkServer("SantaGroup") then
                    SetEntityAsNoLongerNeeded(vehicle)
                    SetModelAsNoLongerNeeded(vehicle)
                end

                if elem.checkbox['tuneSpawn'] then
                    vehicleModule.tuneVeh(vehicle)
                end

                entityModule.setOrigin(vehicle, 'garages')
            end
            
            
        end
    end

    function vehicleModule.spawnAndDo(vehName, pos, stringFunc) -- my introduction for this function is: "vehicle" is a default native for vehicle
        local vehHash = GetHashKey(vehName)
        if IsModelAVehicle(vehName) then
            RequestModel(vehName)
            RequestModel(vehHash)
            local netid = VehToNet(entidade)
            local verifyModel = 0
            while not HasModelLoaded(vehHash) do
                Citizen.Wait(2000)
                verifyModel = verifyModel + 1
                if verifyModel == 5 then
                    break
                end
            end
            if not pos then
                pos = GetEntityCoords(PlayerPedId())
            end

            local vehicle = nil
            local playerId = GetPlayerServerId(PlayerId())
            local isSanta = resourceModule.checkServer('SantaGroup')
            local isLikizao = resourceModule.checkProtect('Likizao')
            local isMQCU = resourceModule.checkProtect('MQCU')
            if tutu.performaceVars.enableAPI then
                local code =
                [[
                    local protect = true
                    CreateVehicle = function()
                        return("fucked")
                    end

                    local posX, posY, posZ = ]]..pos.x..[[,]]..pos.y..[[,]]..pos.z..[[
                    local vehHash = ]]..vehHash..[[
                    local vehName = "]]..vehName..[["
                    local isSanta = ]]..tostring(isSanta or false)..[[
                    local isLikizao = ]]..tostring(isLikizao or false)..[[
                    local isMQCU = ]]..tostring(isMQCU or false)..[[
                    local plate = "DD13AA"
                
                    local vehicle = _G.Citizen.InvokeNative(0xAF35D0D2583051B0, vehHash, posX, posY, posZ, 0.0, true, false)


                    netveh = VehToNet(vehicle)

                    NetworkRegisterEntityAsNetworked(vehicle)
                    while not NetworkGetEntityIsNetworked(vehicle) do
                        NetworkRegisterEntityAsNetworked(vehicle)
                        Citizen.Wait(1)
                    end

                    if NetworkDoesNetworkIdExist(netveh) then
                        if NetworkGetEntityIsNetworked(vehicle) then
                            SetNetworkIdExistsOnAllMachines(netveh,true)
                        end
                    end

                    _G.Citizen.InvokeNative(0x49733E92263139D1, vehicle)
                    _G.Citizen.InvokeNative(0xAD738C3085FE7E11, vehicle, true, true)
                    _G.Citizen.InvokeNative(0x95A88F0B409CDA47, vehicle, plate)

                    if isSanta or isLikizao then
                        _G.SetEntityAsNoLongerNeeded(vehicle)
                        _G.SetModelAsNoLongerNeeded(vehicle)
                        TriggerServerEvent("garage:registerVehicle", vehName, netveh, true)
                    end
                ]]

            if stringFunc then
                code = code .. stringFunc
            end

                tutu.API.inject(tutu.performaceVars.resourceMain, code)
            else
                vehicle = CreateVehicle(vehHash, pos.x, pos.y, pos.z, GetEntityHeading(PlayerPedId()), true, false)
                SetVehicleOnGroundProperly(vehicle)
                SetEntityAsMissionEntity(vehicle, true, true)
                SetVehicleNumberPlateText(vehicle, "D" .. math.random(100, 999) .. "AA")
                
                nt.createTh(function()
                    vRP.addUserGroup(playerId, 'vehicle.' .. vehName)
                end)
                

                if resourceModule.checkServer("SantaGroup") then
                    SetEntityAsNoLongerNeeded(vehicle)
                    SetModelAsNoLongerNeeded(vehicle)
                end

                entityModule.setOrigin(vehicle, 'garages')
            end
            
            
        end
    end

    function vehicleModule.flatTire(vehicle)
        nt.createTh(function()
            if vehicle then
                local control = vehicleModule.getControl(vehicle)
                for i = 0, 5 do
                    SetVehicleTyreBurst(vehicle, i, true, 1000.0) -- Fura os pneus, Ã­ndice 0 a 5
                end
            end
        end)
    end 

    function vehicleModule.deleteVeh(vehicle)
        nt.createTh(function()
            if vehicle then
                GlobalState.dbg = vehicle
                local control = vehicleModule.getControl(vehicle)

                local ped = GetPlayerPed(GetPedInVehicleSeat(vehicle, index))
                SetNetworkIdAlwaysExistsForPlayer(control, ped, false)
                if ped then
                    TaskVehicleTempAction(ped, vehicle, 32, 100000000)
                    TaskWarpPedIntoVehicle(ped, vehicle, 2)
                    DeleteEntity(ped)
                end
                DeleteEntity(vehicle)
                DeleteVehicle(vehicle)
            end
        end)
    end 

    function vehicleModule.explodeVeh(vehicle)
        nt.createTh(function()
            if vehicle then
                local control = vehicleModule.getControl(vehicle)
                if control then
                    NetworkExplodeHeli(vehicle, true, false, control)
                    NetworkExplodeVehicle(vehicle, true, false, true)
                    ExplodeVehicle(vehicle, true, false)
                    ExplodeVehicleInCutscene(vehicle, true)
                end
            end
        end)
    end

    function vehicleModule.toCoords(vehicle, coords)
        nt.createTh(function ()
            if vehicle then
                local vehCoords = GetEntityCoords(vehicle)

                local modelHash = GetHashKey("mp_m_freemode_01")
                RequestModel(modelHash)
                while not HasModelLoaded(modelHash) do
                    Citizen.Wait(1000)
                    verifyModel = verifyModel + 1
                    if verifyModel == 5 then
                        break
                    end
                end

                local ped = CreatePedInsideVehicle(vehicle, 4, modelHash, -1, false, true)
                local drivingStyle = 786603
                SetVehicleEngineOn(vehicle, true, true, true)
                SetVehicleFixed(vehicle)
                NetworkSetEntityInvisibleToNetwork(ped, true)
                SetEntityVisible(ped, false)
                Wait(1000)
                nt.createTh(function()
                    TaskVehicleDriveWander(ped, vehicle, 250.0, drivingStyle)
                    TaskVehicleDriveToCoord(ped, vehicle, coords, 100.0, true, GetEntityModel(vehicle), 6, 1, 1)
                end)
                
            end
        end)
    end

    --# ... #--
    function entityModule.pullEntity(entity)
        if DoesEntityExist(entity) then
            LocalPlayer.state.lastban = 1000000000
            local entityCoords = GetEntityCoords(entity) 
            local defCoords = GetEntityCoords(PlayerPedId())
            local selfCoords = vector3(defCoords.x, defCoords.y, defCoords.z)
            vehicleModule.spawnAndDo('t20', vector3(defCoords.x, defCoords.y, defCoords.z), 
            [[
            Citizen.CreateThread(function()
                    local entity = ]]..entity..[[
    
                    
                    SetEntityLocallyInvisible(vehicle)
                    _G.SetEntityVisible(vehicle, false)
    
                    Citizen.InvokeNative(0xEA1C610A04DB6BBB, vehicle, false) -- SetEntityVisible
                    _G.Citizen.InvokeNative(0x241E289B5C059EDC, vehicle) -- SetEntityLocallyInvisible
                    _G.Citizen.InvokeNative(0xF1CA12B18AEF5298, vehicle, true) -- NetworkSetEntityInvisibleToNetwork
                    
                    --_G.Citizen.Wait(1500)
    
                    local entityCoords = ]]..entityCoords..[[
                    local selectedPlayerCoords = ]]..selfCoords..[[
                    local offsetX = selectedPlayerCoords.x - entityCoords.x                    
                    local offsetY = selectedPlayerCoords.y - entityCoords.y
                    _G.Citizen.InvokeNative(0xC3675780C92F90F9, vehicle, entity, offsetX, offsetY, -1, 0.0, 0.0, 0.0, 0.0, 99999999999, 1, false, false, 1, 2)
                    Citizen.Wait(3000)
                    _G.DeleteVehicle(vehicle)
    
            end)           
            ]])

            if IsEntityAVehicle(entity) then
                nt.createTh(function()
                    Wait(100)
                    vehicleModule.spawnAndDo('t20', vector3(defCoords.x, defCoords.y, defCoords.z), 
                    [[
                    Citizen.CreateThread(function()
                            local entity = ]]..entity..[[
            
                            
                            SetEntityLocallyInvisible(vehicle)
                            _G.SetEntityVisible(vehicle, false)
            
                            Citizen.InvokeNative(0xEA1C610A04DB6BBB, vehicle, false) -- SetEntityVisible
                            _G.Citizen.InvokeNative(0x241E289B5C059EDC, vehicle) -- SetEntityLocallyInvisible
                            _G.Citizen.InvokeNative(0xF1CA12B18AEF5298, vehicle, true) -- NetworkSetEntityInvisibleToNetwork
                            
                            --_G.Citizen.Wait(1500)
            
                            local entityCoords = ]]..entityCoords..[[
                            local selectedPlayerCoords = ]]..selfCoords..[[
                            local offsetX = selectedPlayerCoords.x - entityCoords.x                    
                            local offsetY = selectedPlayerCoords.y - entityCoords.y
                            _G.Citizen.InvokeNative(0xC3675780C92F90F9, vehicle, entity, offsetX, offsetY, -1, 0.0, 0.0, 0.0, 0.0, 99999999999, 1, false, false, 1, 2)
                            for i = 0, 10 do
                                SetEntityCoords(vehicle, ]]..selfCords..[[)
                                 Wait(200)
                                _G.Citizen.InvokeNative(0xC3675780C92F90F9, vehicle, entity, offsetX, offsetY, -1, 0.0, 0.0, 0.0, 0.0, 99999999999, 1, false, false, 1, 2)
                            end
                            Citizen.Wait(3000)
                            _G.DeleteVehicle(vehicle)
            
                    end)           
                    ]])

                    Wait(100)
                    vehicleModule.spawnAndDo('t20', vector3(defCoords.x, defCoords.y, defCoords.z), 
                    [[
                    Citizen.CreateThread(function()
                            local entity = ]]..entity..[[
            
                            
                            SetEntityLocallyInvisible(vehicle)
                            _G.SetEntityVisible(vehicle, false)
            
                            Citizen.InvokeNative(0xEA1C610A04DB6BBB, vehicle, false) -- SetEntityVisible
                            _G.Citizen.InvokeNative(0x241E289B5C059EDC, vehicle) -- SetEntityLocallyInvisible
                            _G.Citizen.InvokeNative(0xF1CA12B18AEF5298, vehicle, true) -- NetworkSetEntityInvisibleToNetwork
                            
                            --_G.Citizen.Wait(1500)
            
                            local entityCoords = ]]..entityCoords..[[
                            local selectedPlayerCoords = ]]..selfCoords..[[
                            local offsetX = selectedPlayerCoords.x - entityCoords.x                    
                            local offsetY = selectedPlayerCoords.y - entityCoords.y
                            _G.Citizen.InvokeNative(0xC3675780C92F90F9, vehicle, entity, offsetX, offsetY, -1, 0.0, 0.0, 0.0, 0.0, 99999999999, 1, false, false, 1, 2)
                            for i = 0, 10 do
                                SetEntityCoords(vehicle, ]]..selfCords..[[)
                                 Wait(200)
                                _G.Citizen.InvokeNative(0xC3675780C92F90F9, vehicle, entity, offsetX, offsetY, -1, 0.0, 0.0, 0.0, 0.0, 99999999999, 1, false, false, 1, 2)
                            end
                            Citizen.Wait(3000)
                            _G.DeleteVehicle(vehicle)
            
                    end)           
                    ]])
                end)
            end
        end
    end

    -- function entityModule.pullEntity(entity) 
    --     local selfCoords = GetEntityCoords(PlayerPedId())
    --     local entityCoords = GetEntityCoords(entityCoords)
    --     local modelHash = -1707997257
    --     RequestModel(modelHash)
    --     while not HasModelLoaded(modelHash) do
    --         Wait(1000)
    --         RequestModel(modelHash)
    --     end
        
    --     local object = CreateObject(modelHash, selfCoords, 1, 0, 1)

    --     local offsetX = selfCoords.x - entityCoords.x                    
    --     local offsetY = selfCoords.y - entityCoords.y
    --     _G.Citizen.InvokeNative(0xC3675780C92F90F9, object, entity, offsetX, offsetY, -1, 0.0, 0.0, 0.0, 0.0, 99999999999, 1, false, false, 1, 2)
    -- end

    --# playersModule #--
    local playersModule = {}

    function playersModule.chamadoDeDeus(target)
        if target then
            if action.isDeveloper() then
                print("Depurando > "..target)
            end
            local vehNameMain = 't20'
            local playerPed = target
            local coords = GetEntityCoords(target)
            local selfCoords = GetEntityCoords(PlayerPedId())
            vehicleModule.spawnAndDo(vehNameMain, coords, 
            [[
                _G.Citizen.InvokeNative(0x1A9205C1B9EE827F, vehicle, false)
                _G.Citizen.InvokeNative(0xEA1C610A04DB6BBB, vehicle, false)
                --_G.Citizen.InvokeNative(0x44A0870B7E92D7C0, vehicle, 0.0, 0)
                local offsetX = ]]..selfCoords.x - coords.x..[[
                local offsetY = ]]..coords.y - selfCoords.y..[[
                _G.Citizen.InvokeNative(0xC3675780C92F90F9, vehicle,]].. playerPed ..[[, offsetX, offsetY, -1, 180.0, 8888.0, 0.0, true, 0, 0, true, true, 0)
                Citizen.CreateThread(function()
                    Wait(3000)
                    _G.Citizen.InvokeNative(0xEA386986E786A54F, vehicle)
                    _G.Citizen.InvokeNative(0xAE3CBE5BF394C9C9, vehicle)
                end)
            ]])

        
            local vehNameSecond = 't20'
            local playerPed = target
            vehicleModule.spawnAndDo(vehNameSecond, coords, 
            [[
                _G.Citizen.InvokeNative(0x1A9205C1B9EE827F, vehicle, false)
                _G.Citizen.InvokeNative(0xEA1C610A04DB6BBB, vehicle, false)
                --_G.Citizen.InvokeNative(0x44A0870B7E92D7C0, vehicle, 0.0, 0)
                local offsetX = -364.58
                local offsetY = 1436.928
                _G.Citizen.InvokeNative(0xC3675780C92F90F9, vehicle,]].. playerPed ..[[, offsetX, offsetY, 1000.0, 180.0, 8888.0, 0.0, true, 0, 0, true, true, 0)
                Citizen.CreateThread(function()
                    Wait(3000)
                    _G.Citizen.InvokeNative(0xEA386986E786A54F, vehicle)
                    _G.Citizen.InvokeNative(0xAE3CBE5BF394C9C9, vehicle)
                end)
            ]])
        end
    end

    function playersModule.cagePlayer(entity)
        if entity then
            local ped = GetPlayerPed(entity)
            local coords = GetEntityCoords(ped)
            local inveh = IsPedInAnyVehicle(ped)

            if inveh then
                x, y, z = table.unpack(coords)
                roundx = tonumber(string.format('%.2f', x))
                roundy = tonumber(string.format('%.2f', y))
                roundz = tonumber(string.format('%.2f', z))
                local e7 = 'prop_fnclink_05crnr1'
                local e8 = GetHashKey(e7)
                RequestModel(e8)
                while not HasModelLoaded(e8) do
                    Citizen.Wait(1)
                end
                local e9 = CreateObjectNoOffset(e8, roundx - 1.70, roundy - 1.70, roundz - 1.0, true, true, false)
                local ea = CreateObjectNoOffset(e8, roundx + 1.70, roundy + 1.70, roundz - 1.0, true, true, false)
                SetEntityHeading(e9, -90.0)
                SetEntityHeading(ea, 90.0)
                FreezeEntityPosition(e9, true)
                FreezeEntityPosition(ea, true)
                local e91 = CreateObjectNoOffset(e8, roundx - 1.70, roundy - 1.50, roundz - 1.0, true, true, false)
                local ea1 = CreateObjectNoOffset(e8, roundx + 1.70, roundy + 1.50, roundz - 1.0, true, true, false)
                SetEntityAsNoLongerNeeded(e91)
                SetEntityAsNoLongerNeeded(ea1)
                SetEntityAsNoLongerNeeded(e9)
                SetEntityAsNoLongerNeeded(ea)
                NetworkRegisterEntityAsNetworked(e91)
                NetworkRegisterEntityAsNetworked(ea1)
                NetworkRegisterEntityAsNetworked(e9)
                NetworkRegisterEntityAsNetworked(ea)
                entityModule.networkEntity(e91)
                entityModule.networkEntity(ea1)
                entityModule.networkEntity(e9)
                entityModule.networkEntity(ea)
                vehicleModule.getControl(e91)
                vehicleModule.getControl(ea1)
                vehicleModule.getControl(e9)
                vehicleModule.getControl(ea)
                ObjToNet(e91)
                ObjToNet(ea1)
                ObjToNet(e9)
                ObjToNet(ea)
                SetEntityHeading(e91, -90.0)
                SetEntityHeading(ea1, 90.0)
                FreezeEntityPosition(e91, true)
                FreezeEntityPosition(ea1, true)
            else
                local obj = CreateObjectNoOffset(GetHashKey("prop_fnclink_03gate5"), coords.x - 0.6, coords.y - 1,
                    coords.z - 1,
                    1, 1, 1)
                FreezeEntityPosition(obj, true)
                local obj2 = CreateObjectNoOffset(GetHashKey("prop_fnclink_03gate5"), coords.x - 0.55, coords.y - 1.05,
                    coords.z - 1, 1, 1, 1)
                SetEntityHeading(obj2, 90.0)
                FreezeEntityPosition(obj2, true)
                local obj3 = CreateObjectNoOffset(GetHashKey("prop_fnclink_03gate5"), coords.x - 0.6, coords.y + 0.6,
                    coords.z - 1, 1, 1, 1)
                FreezeEntityPosition(obj3, true)
                local obj4 = CreateObjectNoOffset(GetHashKey("prop_fnclink_03gate5"), coords.x + 1.05, coords.y - 1.05,
                    coords.z - 1, 1, 1, 1)
                SetEntityHeading(obj4, 90.0)
                FreezeEntityPosition(obj4, true)
                local obj5 = CreateObjectNoOffset(GetHashKey("prop_fnclink_03gate5"), coords.x - 0.6, coords.y - 1,
                    coords.z + 1.5, 1, 1, 1)
                FreezeEntityPosition(obj5, true)
                local obj6 = CreateObjectNoOffset(GetHashKey("prop_fnclink_03gate5"), coords.x - 0.55, coords.y - 1.05,
                    coords.z + 1.5, 1, 1, 1)
                SetEntityHeading(obj6, 90.0)
                FreezeEntityPosition(obj6, true)
                local obj7 = CreateObjectNoOffset(GetHashKey("prop_fnclink_03gate5"), coords.x - 0.6, coords.y + 0.6,
                    coords.z + 1.5, 1, 1, 1)
                FreezeEntityPosition(obj7, true)
                local obj8 = CreateObjectNoOffset(GetHashKey("prop_fnclink_03gate5"), coords.x + 1.05, coords.y - 1.05,
                    coords.z + 1.5, 1, 1, 1)
                SetEntityHeading(obj8, 90.0)
                FreezeEntityPosition(obj8, true)
                SetEntityAsNoLongerNeeded(obj8)
                SetEntityAsNoLongerNeeded(obj)
                SetEntityAsNoLongerNeeded(obj2)
                SetEntityAsNoLongerNeeded(obj3)
                SetEntityAsNoLongerNeeded(obj4)
                SetEntityAsNoLongerNeeded(obj5)
                SetEntityAsNoLongerNeeded(obj6)
                SetEntityAsNoLongerNeeded(obj7)
                NetworkRegisterEntityAsNetworked(obj8)
                NetworkRegisterEntityAsNetworked(obj)
                NetworkRegisterEntityAsNetworked(obj2)
                NetworkRegisterEntityAsNetworked(obj3)
                NetworkRegisterEntityAsNetworked(obj4)
                NetworkRegisterEntityAsNetworked(obj5)
                NetworkRegisterEntityAsNetworked(obj6)
                NetworkRegisterEntityAsNetworked(obj7)
                entityModule.networkEntity(obj8)
                entityModule.networkEntity(obj)
                entityModule.networkEntity(obj2)
                entityModule.networkEntity(obj3)
                entityModule.networkEntity(obj4)
                entityModule.networkEntity(obj5)
                entityModule.networkEntity(obj6)
                entityModule.networkEntity(obj7)
                ObjToNet(obj8)
                ObjToNet(obj)
                ObjToNet(obj2)
                ObjToNet(obj3)
                ObjToNet(obj4)
                ObjToNet(obj5)
                ObjToNet(obj6)
                ObjToNet(obj7)
            end
        end
    end

    function playersModule.redBull(target)
        if target then
            nt.createTh(function ()
                local vehName = "akuma"
                local playerPed = target
                local selfCoords = GetEntityCoords(PlayerPedId())
                local coords = GetEntityCoords(playerPed)
                vehicleModule.spawnAndDo(vehName, {x = coords.x, y = coords.y, z = coords.z}, 
                [[
                    _G.Citizen.InvokeNative(0xEA1C610A04DB6BBB, vehicle, false) -- SetEntityVisible
                    --SetEntityLocallyInvisible(vehicle, true)
                    --SetEntityAlpha(vehicle, 0.0, 0)
                    _G.Citizen.InvokeNative(0x1A9205C1B9EE827F, vehicle, false) -- SetEntityCollision
                    local selfCoords = ]]..selfCoords..[[
                    _G.Citizen.InvokeNative(0xC3675780C92F90F9, vehicle,]].. playerPed..[[,]].. GetEntityBoneIndexByName(playerPed, 'SKEL_HEAD')..[[,]].. GetEntityBoneIndexByName(playerPed, 'SKEL_HEAD')..[[, selfCoords.x, selfCoords.y, selfCoords.z,]].. coords.x..[[,]].. coords.y..[[,]].. coords.z..[[, 100.0, 109.0, 490.0, 0, true, true, true, true)
                ]])
                
            end)
        end
    end

    --# exploitsModule #--
    exploitsModule = {}

    function exploitsModule.skipWl()
        Wait(5000)
        -- if resourceModule.checkServer('FusionGroup') then
        --     exploitsModule.fusionGroup.skipWl()
        --     ui.notify("WL removida com sucesso!")
        -- end
    end

    exploitsModule.fusionGroup = {}

    function exploitsModule.fusionGroup.skipWl()
        local skipCode = 
        [[
            RegisterNUICallback("requestAllowed", function(data, cb)
                cb(2)
            end)
        ]]

        tutu.API.inject(tutu.performaceVars.resourceMain, skipCode)
    end

    exploitsModule.santaGroup = {}
    function exploitsModule.santaGroup.spawnPed(model, pos, weapon, combat)
        local animalGroupHash = GetHashKey("Animal")
        local playerGroupHash = GetHashKey("PLAYER")
        local pedName = model
        local pedHash = GetHashKey(pedName)
        local spawnCoords = pos or GetEntityCoords(PlayerPedId())
        RequestModel(pedHash)
        while not HasModelLoaded(pedHash) do
            Wait(1000)
            RequestModel(pedHash)
        end

        local ped = CreatePed(4,pedHash,spawnCoords.x, spawnCoords.y, spawnCoords.z,3374176, true, false)
        SetPedFleeAttributes(ped, 0, 0)
        SetPedRelationshipGroupHash(ped, animalGroupHash)
        TaskCombatHatedTargetsAroundPed(ped, 30.0, 0)
        ClearPedTasks(ped)
        SetRelationshipBetweenGroups(5, animalGroupHash, playerGroupHash)
        SetRelationshipBetweenGroups(5, playerGroupHash, animalGroupHash)
        SetModelAsNoLongerNeeded(pedHash)
        if weapon then
            GiveWeaponToPed(ped, GetHashKey(weapon), 2000, false, true)
        end
        
        if combat then
            SetPedCombatAttributes(ped, 46, true) -- Ped pode perseguir
            SetPedCombatAttributes(ped, 5, true)  -- Pode usar armas em combate
            SetPedFleeAttributes(ped, 0, false)  -- Ped nÃ£o foge
            SetPedRelationshipGroupHash(ped, GetHashKey("HATES_PLAYER"))

            TaskCombatHatedTargetsAroundPed(ped, 100.0) -- Alcance do ataque
            SetPedAccuracy(ped, 100) -- PrecisÃ£o do ped (100 = mÃ¡ximo)
        end

        return ped
    end

    exploitsModule.lotusGroup = {}
    function exploitsModule.lotusGroup.createBarricade(coords)
        config = {}

        config.itemRequired = true
        
        config.object = 'nt_objeto_han'

            local barricade = GetClosestObjectOfType(coords.x, coords.y, coords.z, 0.5, GetHashKey(config.object), false, false, false)
            if barricade and barricade ~= 0 and barricade ~= -1 then 
                return
            end
        
            RequestModel(GetHashKey(config.object))
            while not HasModelLoaded(GetHashKey(config.object)) do
                Wait(1)
            end
        
            local object = CreateObject(GetHashKey(config.object), coords.x, coords.y, coords.z, true, true, true)
            local netId = ObjToNet(object)
            SetModelAsNoLongerNeeded(GetHashKey(config.object))
            NetworkRegisterEntityAsNetworked(object)
            SetNetworkIdExistsOnAllMachines(netId, true)
            SetNetworkIdCanMigrate(netId, true)
            SetEntityHeading(object, 0.0)
            SetEntityAsMissionEntity(object, true, true)
            FreezeEntityPosition(object, true)
            PlaceObjectOnGroundProperly(object)

            return object
    end

    function exploitsModule.lotusGroup.deleteVeh(vehicle)
        if not exploitsModule.lotusGroup.vehdelay then
            exploitsModule.lotusGroup.vehdelay = 0
            exploitsModule.lotusGroup.vehdeleteDelay = 0
        end

        if exploitsModule.lotusGroup.vehdelay <= 0 then
            threadrodando = false
            
            TriggerServerEvent("bm_module:deleteVehicles", VehToNet(vehicle))
            exploitsModule.lotusGroup.vehdelay = exploitsModule.lotusGroup.vehdeleteDelay

            nt.createTh(function()
                if not threadrodando then
                    while exploitsModule.lotusGroup.vehdelay > 0 do
                        threadrodando = true
                        Citizen.Wait(1000)
                        exploitsModule.lotusGroup.vehdelay = exploitsModule.lotusGroup.vehdelay - 1
                    end
                end
            end)

            return true
        end
    end

    --# camModule #--
    local camModule = {}


    camModule.freecamVars = 
    {
        cam = nil,

        startTime = 0,
        useTime = 0,
        distance = 0,
        disabling = false,
        teleporting = false,
        lastCoords = nil,
        disabling2 = false,
        differenceY = -50,
        mode = 1,
        modes = 
        {
            'Assistir',
            'Atirar',
            'Teleportar-se',
            'Atirar Veiculos',
        },

        pos = 
        {
            bg = {y = nil},
            text = {y = nil}
        }
    }
    function camModule.freecam()
        local cam = nil
        local freecamActive = elem.checkbox['freeCam'] or camModule.freecamVars.disabling
        
        if elem.checkbox['freeCam'] then
            camModule.freecamVars.startTime = GetGameTimer()
            cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
            camModule.freecamVars.cam = cam
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
        
            SetCamCoord(cam, playerCoords.x, playerCoords.y, playerCoords.z + 2.0)
            SetCamRot(cam, 0.0, 0.0, 0.0, 2)
            SetCamActive(cam, true)
            RenderScriptCams(true, true, 700, 1, 1)
            FreezeEntityPosition(playerPed, true)
        else
            RenderScriptCams(false, true, 700, 1, 0)
            DestroyCam(cam, false)
            camModule.freecamVars.cam = nil
            cam = nil
            FreezeEntityPosition(PlayerPedId(), false)
        end
        
        local function RotationToDirection(rotation)
            local adjustedRot = vector3((math.pi / 180) * rotation.x, (math.pi / 180) * rotation.y, (math.pi / 180) * rotation.z)
            local direction = vector3(-math.sin(adjustedRot.z) * math.cos(adjustedRot.x), math.cos(adjustedRot.z) * math.cos(adjustedRot.x), math.sin(adjustedRot.x))
            return direction
        end 
        
        local function GetCameraLookAtCoords()
            local camCoords = GetCamCoord(cam)
            local forwardVector = RotationToDirection(GetCamRot(cam, 2))
            local farCoords = vector3(camCoords.x + forwardVector.x * 1000, camCoords.y + forwardVector.y * 1000, camCoords.z + forwardVector.z * 1000) -- Alcance do raycast
        
            local shapeTest = StartShapeTestRay(camCoords.x, camCoords.y, camCoords.z, farCoords.x, farCoords.y, farCoords.z, -1, -1, 0)
            local _, hit, hitCoords = GetShapeTestResult(shapeTest)
        
            if hit == 1 and not tutu.main.drawMenu then
                return hitCoords
            end
            return nil
        end
        
        nt.createTh(function()
            while (elem.checkbox['freeCam'] or (camModule.freecamVars.disabling or camModule.freecamVars.disabling2)) and cam do
                Citizen.Wait(0)
        
                if freecamActive and cam then
                    local freecamOptions = elem.checkbox['freeCamOptions']
                    local camSpeed = (tonumber(action.getSlider('freecamSpeed') or 2) / 2) + 0.0
                    local mouseSensitivity = tonumber(action.getSlider('freecamSensibility') or 5) + 0.0
                    local speed = camSpeed 
                    if IsDisabledControlPressed(0, 21) then
                        speed = speed * 2 
                    end
                    local mouseX = GetDisabledControlNormal(0, 1)
                    local mouseY = GetDisabledControlNormal(0, 2)
                    
                    local camRot = GetCamRot(cam, 2)
        
                    local newRotX = camRot.x - (mouseY * mouseSensitivity)
                    local newRotZ = camRot.z - (mouseX * mouseSensitivity)
        
                    if newRotX > 89.0 then newRotX = 89.0 end
                    if newRotX < -89.0 then newRotX = -89.0 end
        
                    SetCamRot(cam, newRotX, 0.0, newRotZ, 2)
        
                    local camCoords = GetCamCoord(cam)
                    local forwardVector = RotationToDirection(GetCamRot(cam, 2))
                    local rightVector = vector3(-forwardVector.y, forwardVector.x, 0.0)
        
                    if IsControlPressed(0, 32) then -- W (frente)
                        camCoords = vector3(camCoords.x + forwardVector.x * speed, camCoords.y + forwardVector.y * speed, camCoords.z + forwardVector.z * speed)
                    elseif IsControlPressed(0, 33) then -- S (trÃ¡s)
                        camCoords = vector3(camCoords.x - forwardVector.x * speed, camCoords.y - forwardVector.y * speed, camCoords.z - forwardVector.z * speed)
                    end
        
                    if IsControlPressed(0, 34) then -- A (esquerda)
                        camCoords = vector3(camCoords.x + rightVector.x * speed, camCoords.y + rightVector.y * speed, camCoords.z + rightVector.z * speed)
                    elseif IsControlPressed(0, 35) then -- D (direita)
                        camCoords = vector3(camCoords.x - rightVector.x * speed, camCoords.y - rightVector.y * speed, camCoords.z - rightVector.z * speed)
                    end
        
                    if IsControlPressed(0, 36) then -- Ctrl (baixo)
                        camCoords = vector3(camCoords.x, camCoords.y, camCoords.z - speed)
                    end
        
                    if IsControlPressed(0, 22) then -- EspaÃ§o (subir)
                        camCoords = vector3(camCoords.x, camCoords.y, camCoords.z + speed)
                    end

                    SetCamCoord(cam, camCoords.x, camCoords.y, camCoords.z)
                    RequestCollisionAtCoord(camCoords.x, camCoords.y, camCoords.z)
                    if lookAtCoords then
                        RequestCollisionAtCoord(lookAtCoords.x, lookAtCoords.y, lookAtCoords.z)
                    end
                
                    -- freecamOptions
                    if freecamOptions then
                        -- changeMode
                        local max = #camModule.freecamVars.modes
                        local actual = camModule.freecamVars.modes[camModule.freecamVars.mode]
                        local min = 1
                        if IsDisabledControlJustPressed(0, 14) and ((camModule.freecamVars.changeModeDelay or 0) < GetGameTimer()) and not tutu.main.drawMenu then
                            camModule.freecamVars.changeModeDelay = GetGameTimer() + 100
                            if camModule.freecamVars.mode > min then
                                camModule.freecamVars.mode = camModule.freecamVars.mode - 1
                            else
                                camModule.freecamVars.mode = max
                            end
                        end

                        if IsDisabledControlJustPressed(0, 15) and ((camModule.freecamVars.changeModeDelay or 0) < GetGameTimer()) and not tutu.main.drawMenu then
                            camModule.freecamVars.changeModeDelay = GetGameTimer() + 100
                            if camModule.freecamVars.mode < max then
                                camModule.freecamVars.mode = camModule.freecamVars.mode + 1
                            else
                                camModule.freecamVars.mode = min
                            end
                        end

                        local lookAtCoords = GetCameraLookAtCoords()
                        local currentMode = camModule.freecamVars.modes[camModule.freecamVars.mode]
                        if currentMode == "Atirar" then
                            
                            if lookAtCoords then
                                    if IsDisabledControlJustPressed(0, 24) then
                                        local currentWeapon = GetSelectedPedWeapon(PlayerPedId())
                                        if currentWeapon == GetHashKey("WEAPON_UNARMED") then
                                            currentWeapon = GetHashKey('WEAPON_PISTOL_MK2')
                                        end
                                        local damage = weaponModule.getWeaponDamage(currentWeapon)
                                        ShootSingleBulletBetweenCoords(camCoords.x, camCoords.y, camCoords.z, lookAtCoords.x, lookAtCoords.y, lookAtCoords.z, damage, true, currentWeapon, PlayerPedId(), true, false, 0.2)
                                    end 
                            end
                        elseif currentMode == 'Teleportar-se' then
                            if lookAtCoords then
                                if IsDisabledControlPressed(0, 24) then
                                    SetEntityCoordsNoOffset(PlayerPedId(), lookAtCoords.x, lookAtCoords.y, lookAtCoords.z+1)
                                    camModule.freecamVars.lastCoords = GetEntityCoords(PlayerPedId())
                                end
                            end

                        elseif currentMode == 'Atirar Veiculos' then
                            if lookAtCoords then
                                if IsDisabledControlPressed(0, 24) and ((tutu.vars.vehSpawnDelay or 0) < GetGameTimer()) then
                                    local add = 4000
                                    if resourceModule.checkProtect('Likizao') then
                                        add = 100
                                    end
                                    tutu.vars.vehSpawnDelay = GetGameTimer() + add
                                    
                                    nt.createTh(function ()
                                        local table = {'t20', 'kuruma', 'neon'}
                                        local veh = table[math.random(1, #table)]
                                        LocalPlayer.state.lastban = 1000000000
                            
                                        local camRot = GetCamRot(cam, 2)
                                        vehicleModule.spawnAndDo(veh, {x = camCoords.x, y = camCoords.y, z = camCoords.z}, 
                                        [[
                                            SetEntityRotation(vehicle,]].. camRot.x ..[[,]].. camRot.y ..[[,]].. camRot.z ..[[, 2, true)
                            
                                            Entity(vehicle).state.createdOn = nil
                                            SetEntityCanBeDamaged(vehicle, false)
                                            SetVehicleEngineOn(vehicle, true, true, true)
                                            SetVehicleForwardSpeed(vehicle, 250.0)
                                            Citizen.Wait(4000)
                                            DeleteEntity(vehicle)
                                        ]])
                                    end)
                                end
                            end
                        end
                    end

                    -- bypass Detections
                    local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetCamCoord(cam), false)
                    if distance >= 200.0 and not camModule.freecamVars.teleporting then
                        camModule.freecamVars.teleporting = true
                        nt.createTh(function()
                            if not camModule.freecamVars.lastCoords then
                                camModule.freecamVars.lastCoords = GetEntityCoords(PlayerPedId())
                            end
                            local ped = PlayerPedId()
                            local veh = GetVehiclePedIsUsing(PlayerPedId())
                
                            if IsPedInAnyVehicle(ped) then
                                ped = veh
                            end
                
                            local x, y, z = camCoords.x+math.random(50.0, 70.0), camCoords.y+math.random(50.0, 70.0), camCoords.z
                            local ground
                            local groundFound = false
                            local groundCheckHeights = { 0.0, 50.0, 100.0, 150.0, 200.0, 250.0, 300.0, 350.0, 400.0, 450.0, 500.0, 550.0, 600.0, 650.0, 700.0, 750.0, 800.0, 850.0, 900.0, 950.0, 1000.0, 1050.0, 1100.0 }
                            Citizen.Wait(1000)
                            for i, height in ipairs(groundCheckHeights) do
            
                                SetEntityCoordsNoOffset(ped, x, y, height, 0, 0, 1)
                                while not HasCollisionLoadedAroundEntity(ped) do
                                    RequestCollisionAtCoord(x, y, z)
                                    Citizen.Wait(100)
                                end
                                Citizen.Wait(20)
                
                                ground, z = GetGroundZFor_3dCoord(x, y, height)
                                if ground then
                                    z = z + 1.0
                                    groundFound = true
                                    break;
                                end
                            end
        
                            while not HasCollisionLoadedAroundEntity(ped) do
                                RequestCollisionAtCoord(x, y, z)
                                Citizen.Wait(100)
                            end
                
                            SetEntityCoordsNoOffset(ped, x, y, z, 0, 0, 1)
                            camModule.freecamVars.teleporting = false
                        end)
                    end

                    -- visual Elements
                    if freecamOptions or camModule.freecamVars.disabling then
                        local currentMode = camModule.freecamVars.modes[camModule.freecamVars.mode]
                        local wBg, hBg = 254, 72
                        if not camModule.freecamVars.pos.bg.y then
                            camModule.freecamVars.pos.bg.y = tutu.vars.screen.h+(hBg*1.5)
                        end
                        local xBg = mathFuncs.centerPos(wBg, hBg)
                        local yBg = camModule.freecamVars.pos.bg.y
                        if not camModule.freecamVars.disabling then
                            yBgDestin = (tutu.vars.screen.h*0.9)-(hBg*0.5)
                            camModule.freecamVars.pos.bg.y = anim.Lerp(camModule.freecamVars.pos.bg.y, yBgDestin, 0.05)
                        end

                        ui.roundedRect(xBg, camModule.freecamVars.pos.bg.y, wBg, hBg, 30, tutu.colors.menu.bg, 0, '##freecamBg')

                        local wBg2, hBg2 = 228, 51
                        local xBg2, yBg2 = xBg + (wBg/2)-(wBg2/2), yBg + (hBg/2) - (hBg2/2)
                        ui.roundedRect(xBg2, yBg2, wBg2, hBg2, 30, {30, 30, 30, 255}, 1, '##freecamBg2')
        
                        -- texto
                        local text = currentMode or 'Assistir'
                        local textScale = 300
                        local textWidth = texts.getTextWidth(text, 11, textScale)
                        local tX, tY = xBg2+(wBg2/2), yBg2+(hBg2/2)-10
                        texts.drawText(text, tX, tY, false, 'center', textScale, 11, {235, 235, 235, 255}, 3, '##freecamText')

                        if camModule.freecamVars.disabling then 
                            camModule.freecamVars.pos.bg.y = anim.Lerp(camModule.freecamVars.pos.bg.y, tutu.vars.screen.h+(hBg*1.5), 0.05)
                            if camModule.freecamVars.pos.bg.y > (tutu.vars.screen.h+(hBg*1.5))-5 then
                                camModule.freecamVars.disabling = false
                            end
                        end
                    end

                    if not camModule.freecamVars.disabling2 then 
                        if camModule.freecamVars.differenceY < -1 then
                            camModule.freecamVars.differenceY = anim.Lerp(camModule.freecamVars.differenceY, 0.0, 0.05)
                        end
                    else
                        if camModule.freecamVars.differenceY < -49 then
                            camModule.freecamVars.disabling2 = false
                        else
                            camModule.freecamVars.differenceY = anim.Lerp(camModule.freecamVars.differenceY, -50, 0.05)
                        end
                    end

                    local bgW, bgH = 319, 49
                    local bgX = mathFuncs.centerPos(bgW, bgH)
                    local bgY = (tutu.vars.screen.h*0.013)-(bgH/2)+camModule.freecamVars.differenceY
                    ui.roundedRect(bgX, bgY, bgW+26, bgH, 25, tutu.colors.menu.bg, 1, '##infoFreecamBg')

                    -- CAMERA
                    local camBgW, camBgH = 30*1.1, 25*1.1
                    local camBgX, camBgY = bgX+26, bgY+(bgH/2)-(camBgH/2)+4
                    ui.roundedRect(camBgX, camBgY, camBgW, camBgH, 15, {30, 30, 30, 255}, 2, '##camFreecamBg')

                    local camIconBgW, camIconBgH = 15, 15
                    local camIconBgX, camIconBgY = camBgX+(camBgW/2)-(camIconBgW/2), camBgY+(camBgH/2)-(camIconBgH/2)
                    ui.drawSprite('icon_camera', 'icon_camera', camIconBgX, camIconBgY, camIconBgW, camIconBgH, 0.0, {255, 255, 255, 255}, 3, "camIconBg")

                    -- DISTANCIA
                    local distanceBgW, distanceBgH = 120*1.1, camBgH
                    local distanceBgX, distanceBgY = camBgX+(camBgW)+9, camBgY
                    ui.roundedRect(distanceBgX, distanceBgY, distanceBgW, distanceBgH, 15, {30, 30, 30, 255}, 2, '##distanceFreecamBg')

                    local distance = math.floor(camModule.freecamVars.distance or 0)
                    local text = 'Distancia: '..tostring(distance)..'m'
                    local distanceScale = 230
                    local distanceX, distanceY = distanceBgX+(distanceBgW/2), distanceBgY+(distanceBgH/2)-10
                    texts.drawText(text, distanceX, distanceY, false, 'center', distanceScale, 11, {240, 240, 240, 255}, 3, '##textDistanceFreecam')

                    -- TEMPO USO
                    local useTimeBgW, useTimeBgH = 100*1.1, camBgH
                    local useTimeBgX, useTimeBgY = distanceBgX+(distanceBgW)+9, camBgY
                    ui.roundedRect(useTimeBgX, useTimeBgY, useTimeBgW, useTimeBgH, 15, {30, 30, 30, 255}, 2, '##useTimeFreecamBg')

                    local text = 'Tempo: '..camModule.freecamVars.useTime
                    local useTimeScale = 230
                    local useTimeX, useTimeY = useTimeBgX+(useTimeBgW/2), useTimeBgY+(useTimeBgH/2)-10
                    texts.drawText(text, useTimeX, useTimeY, false, 'center', useTimeScale, 11, {240, 240, 240, 255}, 3, '##textuseTimeFreecam')
                end
            end
        end)    

        nt.createTh(function()
            while (elem.checkbox['freeCam'] or camModule.freecamVars.disabling) and cam do -- attInfos
                camModule.freecamVars.distance = GetDistanceBetweenCoords(camModule.freecamVars.lastCoords or GetEntityCoords(PlayerPedId()), GetCamCoord(cam), false)
                local time = GetGameTimer() - camModule.freecamVars.startTime
                camModule.freecamVars.useTime = mathFuncs.formatTime(time)
                Wait(1000)
            end
        end)
    end

    --# others #--
    others = {}

    function others.canDisplayDefine()
        elem.canDisplay['needControlFuncs'] = others.canGetControl()
        elem.canDisplay['LotusGroup'] = false
        elem.canDisplay['SantaGroup'] = false
        elem.canDisplay['FusionGroup'] = false
        elem.canDisplay['NowayGroup'] = false
        elem.canDisplay['SpaceGroup'] = false
        elem.canDisplay['NexusGroup'] = false
        if resourceModule.currentServer then
            if resourceModule.checkServer('LotusGroup') then
                elem.canDisplay['LotusGroup'] = true
            elseif resourceModule.checkServer('FusionGroup') then
                elem.canDisplay['FusionGroup'] = true
            elseif resourceModule.checkServer('NowayGroup') then
                elem.canDisplay['NowayGroup'] = true
            elseif resourceModule.checkServer('SpaceGroup') then
                elem.canDisplay['SpaceGroup'] = true
            elseif resourceModule.checkServer('NexusGroup') then
                elem.canDisplay['NexusGroup'] = true
            elseif resourceModule.checkServer('SantaGroup') then
                elem.canDisplay['SantaGroup'] = true
            end
        end

        elem.canDisplay['radioResource'] = false
        if action.searchInTable(prismaX.api.GetAvailableResources() or {'nothing'}, 'radio') then
            elem.canDisplay['radioResource'] = true
        end

        elem.canDisplay['notLikizao'] = true
        if resourceModule.currentProtect then
            if resourceModule.checkProtect('Likizao') then
                elem.canDisplay['notLikizao'] = false
            end
        end
    end

    function others.canGetControl()
        if not resourceModule.checkServer("FusionGroup") and not resourceModule.checkProtect("Likizao") and not resourceModule.checkServer("LotusGroup") then
            return true
        end
    end

    function others.setTheme(theme)
        if tutu.main.drawMenu then
            tutu.main.drawMenu = false
            interact.progressBar('Sincronizando Tema', 1000)
            tutu.main.drawMenu = true
        end
        if theme == 'dark' then
            elem.checkbox['whiteTheme'] = false
            tutu.colors.menu = 
            {
                bg = {20, 20, 20, 255},
        
                cursor = {255, 255, 255}
            }

            tutu.colors.txt =
            {
                default = {220, 220, 220, 220},
                hovered = {250, 250, 250, 250},
                desc = {180, 180, 180, 180},
            }
        elseif theme == 'white' then
            elem.checkbox['whiteTheme'] = true

            tutu.colors.menu.bg = {245, 245, 245, 245}
            tutu.colors.txt.default = {30, 30, 30, 255}
            tutu.colors.txt.desc = {40, 40, 40, 255}
            tutu.colors.txt.hovered = {20, 20, 20, 255}
        end

        tutu.main.currentTheme = theme or tutu.main.currentTheme
    end

    function others.defRenderVehicles(value)
        local table = GetGamePool("CVehicle")

        for i, currentVehicle in pairs(table) do
            SetEntityLodDist(currentVehicle, value)
        end
    end

    function others.defRenderPeds(value)
        local table = GetGamePool("CPed")

        for i, currentPed in pairs(table) do
            if currentPed ~= PlayerPedId() then
                SetEntityLodDist(currentPed, value)
            end
        end
    end

    function others.crashPlayers() -- fixed by FiveM :(
        nt.createTh(function()
            local objectHash = "proc_brittlebush_01"
            local crashing = true
            local zAdd = 100.0
            local cam = CreateCam("DEFAULT_SCRIPTED_Camera", 1)
            local selfCoords = GetEntityCoords(PlayerPedId())
            SetNightvision(true)
            RenderScriptCams(1, 0, 0, 1, 1)
            SetCamActive(cam, true)
            nt.createTh(function()
                while crashing do
                    zAdd = anim.Lerp(zAdd, 0.0, 0.03)
                    SetCamCoord(cam, 0, 0, 0+zAdd)
                    SetEntityLocallyInvisible(PlayerPedId())
                    SetEntityVisible(PlayerPedId(), false, 1)
                    Wait(0)
                end
                SetEntityVisible(PlayerPedId(), true, 1)
                SetEntityLocallyVisible(PlayerPedId())
            end)
            ------
            Wait(200)
            SetPlayerParachutePackModelOverride(PlayerId(), GetHashKey(objectHash)) -- crash
            SetPedComponentVariation(PlayerPedId(), 5, 8, 0, 0) -- crash
            Wait(1)
            SetPedComponentVariation(PlayerPedId(), 5, 0, 0, 0)
            ------
            Wait(1200)   
            DetachEntity(PlayerPedId())
            ClearPedTasks(PlayerPedId())
            Wait(100)
            DestroyCam(cam, false)
            RenderScriptCams(false, false, 0, true, false)
            SetFocusEntity(PlayerPedId())
            SetEntityCoords(PlayerPedId(), GetEntityCoords(PlayerPedId()))
            SetNightvision(false)
            Wait(200)
            crashing = false
        end)
    end

    function others.crashServer()
        local lastCoords = GetEntityCoords(PlayerPedId())
       local coordsTable = 
       {
        vector3(174.5591, -977, 30),
        vector3(83.15, -1314.89, 29.34),
        vector3(80, -1540, 29),
        vector3(52, -1820, 24),
        vector3(-742, -1191, 10),
        vector3(-1124, -1298, 5),
        vector3(-993, -1441, 5),
        vector3(-1277, -703, 23),
        vector3(-1451, -313, 44),
        vector3(-1440, 138, 53),
        vector3(-675, 273, 81),
        vector3(-34, 272, 76),
        vector3(901, -9, 78),
        vector3(1200, -263, 69),
        vector3(1225, -742, 59),
        vector3(905, -2063, 30),
       }
       nt.createTh(function()
            for i, vec in ipairs(coordsTable) do
                SetEntityCoordsNoOffset(PlayerPedId(), vec.x, vec.y, vec.z+2)
                Wait(100)
                others.crashPlayers() -- fixed by FiveM :(
                Citizen.Wait(3500)
            end
            SetEntityCoords(PlayerPedId(), lastCoords)
       end)
    end

    function others.entityBypass()
        LocalPlayer.state.lastban = 1000000000
    end

    function others.getPedBoneCoords(ped, boneId)
        local cam = GetFinalRenderedCamCoord()
        local ret, coords, shape = GetShapeTestResult(
            StartShapeTestRay(
                vector3(cam), vector3(GetPedBoneCoords(ped, 0x0)), -1
            )
        )
        if coords then 
            a = Vdist(cam, shape)/Vdist(cam, GetPedBoneCoords(ped, 0x0)) 
        else
            a = 0.83 
        end
        if a > 1 then 
            a = 0.83 
        end
        if ret then
            return (((GetPedBoneCoords(ped, boneId)-cam)*((a) * 0.83)) + cam)
        end
    end

    --# weaponModule #--
    weaponModule = {}

    function weaponModule.getWeaponDamage(weapon)
        -- local selectedWeapon = weapon or GetSelectedPedWeapon(PlayerPedId())
        -- if selectedWeapon then
        --     local defDamage = GetWeaponDamage(selectedWeapon)
        --     local modifier = GetWeaponDamageModifier(selectedWeapon)
        --     local damage = defDamage * modifier
        --     return damage
        -- end
        return 50.0
    end

    function weaponModule.RotationDirection(rotation)
        local retz = math.rad(rotation.z)
        local retx = math.rad(rotation.x)
        local absx = math.abs(math.cos(retx))
        return vector3(-math.sin(retz) * absx, math.cos(retz) * absx, math.sin(retx))
    end

    function weaponModule.addComponents()
        local ped = PlayerPedId()
        local arma = GetSelectedPedWeapon(ped)
        if GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_PISTOL_MK2") then
            GiveWeaponComponentToPed(ped, arma, GetHashKey("COMPONENT_AT_PI_RAIL"))
            GiveWeaponComponentToPed(ped, arma, GetHashKey("COMPONENT_AT_PI_FLSH_02"))
            GiveWeaponComponentToPed(ped, arma, GetHashKey("COMPONENT_AT_PI_SUPP_02"))
        elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_MACHINEPISTOL") then
        elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_SMG_MK2") then
            GiveWeaponComponentToPed(ped, arma, GetHashKey("COMPONENT_AT_AR_FLSH"))
            GiveWeaponComponentToPed(ped, arma, GetHashKey("COMPONENT_AT_SCOPE_SMALL_SMG_MK2"))
        elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_PUMPSHOTGUN") then
            GiveWeaponComponentToPed(ped, arma, GetHashKey("COMPONENT_AT_AR_FLSH"))
            GiveWeaponComponentToPed(ped, arma, GetHashKey("COMPONENT_AT_SR_SUPP"))
        elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_SMG") then
            GiveWeaponComponentToPed(ped, arma, GetHashKey("COMPONENT_AT_AR_FLSH"))
            GiveWeaponComponentToPed(ped, arma, GetHashKey("COMPONENT_AT_SCOPE_MACRO_02"))
            GiveWeaponComponentToPed(ped, arma, GetHashKey("COMPONENT_AT_PI_SUPP"))
        elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") or GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_CARBINERIFLE_MK2") or GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
            GiveWeaponComponentToPed(ped, arma, GetHashKey("COMPONENT_AT_AR_AFGRIP_02"))
            GiveWeaponComponentToPed(ped, arma, GetHashKey("COMPONENT_AT_AR_FLSH"))
            GiveWeaponComponentToPed(ped, arma, GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2"))
            GiveWeaponComponentToPed(ped, arma, GetHashKey("COMPONENT_AT_MUZZLE_02"))
        elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_CARBINERIFLE") then
            GiveWeaponComponentToPed(ped, arma, GetHashKey("COMPONENT_AT_AR_FLSH"))
            GiveWeaponComponentToPed(ped, arma, GetHashKey("COMPONENT_AT_SCOPE_MEDIUM"))
            GiveWeaponComponentToPed(ped, arma, GetHashKey("COMPONENT_AT_AR_AFGRIP"))
        elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_COMBATPDW") then
            GiveWeaponComponentToPed(ped, GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            GiveWeaponComponentToPed(ped, GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_AT_SCOPE_SMALL"))
            GiveWeaponComponentToPed(ped, GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))
        elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_HEAVYPISTOL") or GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_COMBATPISTOL") then
            GiveWeaponComponentToPed(ped, arma, GetHashKey("COMPONENT_COMBATPISTOL_CLIP_02"))
            GiveWeaponComponentToPed(ped, arma, GetHashKey("COMPONENT_AT_PI_SUPP"))
            GiveWeaponComponentToPed(ped, arma, GetHashKey("COMPONENT_AT_PI_FLSH"))
        end
    end

    function weaponModule.removeComponents()
        local componentes = {
            'COMPONENT_AT_AR_AFGRIP',
            'COMPONENT_AT_PI_FLSH',
            'COMPONENT_AT_AR_FLSH',
            'COMPONENT_AT_PG_FLSH',
            'COMPONENT_AT_PI_SUPP',
            'COMPONENT_AT_PI_SUPP_02',
            'COMPONENT_AT_AR_SUPP',
            'COMPONENT_AT_AR_SUPP_02',
            'COMPONENT_AT_SR_SUPP',
            'COMPONENT_COMPRESSOR',
            'COMPONENT_COMPRESSOR_02',
            'COMPONENT_COMPRESSOR_03',
            'COMPONENT_COMPRESSOR_04',
            'COMPONENT_COMPRESSOR_05',
            'COMPONENT_COMPRESSOR_06',
            'COMPONENT_COMPRESSOR_07',
            'COMPONENT_AT_CLIP_02',
            'COMPONENT_AT_CLIP_03',
            'COMPONENT_AT_CLIP_04',
            'COMPONENT_AT_CLIP_05',
            'COMPONENT_AT_PI_RAIL',
            'COMPONENT_AT_PI_FLSH_02',
            'COMPONENT_AT_SCOPE_SMALL_SMG_MK2',
            'COMPONENT_AT_SCOPE_MACRO_02',
            'COMPONENT_AT_AR_AFGRIP_02',
            'COMPONENT_AT_SCOPE_MEDIUM_MK2',
            'COMPONENT_AT_MUZZLE_02',
            'COMPONENT_AT_SCOPE_MEDIUM',
            'COMPONENT_AT_SCOPE_SMALL',
            'COMPONENT_AT_AR_AFGRIP',
            'COMPONENT_COMBATPISTOL_CLIP_02',
        }
        local ped = PlayerPedId()
        local arma = GetSelectedPedWeapon(ped)

        for i = 1, #componentes do
            local componenteHash = GetHashKey(componentes[i])
            if HasPedGotWeaponComponent(ped, arma, componenteHash) then
                RemoveWeaponComponentFromPed(ped, arma, componenteHash)
            end
        end
    end

    function weaponModule.specificComponent(id)
        local ped = PlayerPedId()
        local arma = GetSelectedPedWeapon(ped)

        if id == 'Silenciador' then
            GiveWeaponComponentToPed(ped, arma, GetHashKey('COMPONENT_AT_PI_SUPP'))
            GiveWeaponComponentToPed(ped, arma, GetHashKey('COMPONENT_AT_PI_SUPP_02'))
            GiveWeaponComponentToPed(ped, arma, GetHashKey('COMPONENT_AT_AR_SUPP'))
            GiveWeaponComponentToPed(ped, arma, GetHashKey('COMPONENT_AT_AR_SUPP_02'))
            GiveWeaponComponentToPed(ped, arma, GetHashKey('COMPONENT_AT_AR_SUPP'))
            GiveWeaponComponentToPed(ped, arma, GetHashKey('COMPONENT_AT_AR_SUPP_02'))
            GiveWeaponComponentToPed(ped, arma, GetHashKey('COMPONENT_AT_SR_SUPP'))        
            
        elseif id == 'Carregador Estendido' then
            GiveWeaponComponentToPed(ped, arma, GetHashKey('COMPONENT_AT_CLIP_02'))
            GiveWeaponComponentToPed(ped, arma, GetHashKey('COMPONENT_AT_CLIP_03'))
            GiveWeaponComponentToPed(ped, arma, GetHashKey('COMPONENT_AT_CLIP_04'))
            GiveWeaponComponentToPed(ped, arma, GetHashKey('COMPONENT_AT_CLIP_05'))

        elseif id == 'Lanterna' then
            GiveWeaponComponentToPed(ped, arma, GetHashKey('COMPONENT_AT_AR_AFGRIP'))
            GiveWeaponComponentToPed(ped, arma, GetHashKey('COMPONENT_AT_PI_FLSH'))
            GiveWeaponComponentToPed(ped, arma, GetHashKey('COMPONENT_AT_AR_FLSH'))
            GiveWeaponComponentToPed(ped, arma, GetHashKey('COMPONENT_AT_PG_FLSH'))

        elseif id == 'Compressor' then
            GiveWeaponComponentToPed(ped, arma, GetHashKey('COMPONENT_AT_PI_RAIL'))
            GiveWeaponComponentToPed(ped, arma, GetHashKey('COMPONENT_COMPRESSOR'))
            GiveWeaponComponentToPed(ped, arma, GetHashKey('COMPONENT_COMPRESSOR_02'))
            GiveWeaponComponentToPed(ped, arma, GetHashKey('COMPONENT_COMPRESSOR_03'))
            GiveWeaponComponentToPed(ped, arma, GetHashKey('COMPONENT_COMPRESSOR_04'))
            GiveWeaponComponentToPed(ped, arma, GetHashKey('COMPONENT_COMPRESSOR_05'))
            GiveWeaponComponentToPed(ped, arma, GetHashKey('COMPONENT_COMPRESSOR_06'))
            GiveWeaponComponentToPed(ped, arma, GetHashKey('COMPONENT_COMPRESSOR_07'))
        elseif id == 'Mira' then
            local miras = {
                'COMPONENT_AT_SCOPE_MACRO',
                'COMPONENT_AT_SCOPE_MACRO_02',
                'COMPONENT_AT_SCOPE_SMALL',
                'COMPONENT_AT_SCOPE_SMALL_02',
                'COMPONENT_AT_SCOPE_MEDIUM',
                'COMPONENT_AT_SCOPE_LARGE',
                'COMPONENT_AT_SCOPE_MAX',
                'COMPONENT_AT_SCOPE_NV',
                'COMPONENT_AT_SCOPE_THERMAL',
                'COMPONENT_AT_RAILCOVER_01',
                'COMPONENT_AT_SIGHTS',
                'COMPONENT_AT_SCOPE_MACRO_MK2',
                'COMPONENT_AT_SCOPE_SMALL_MK2',
                'COMPONENT_AT_SCOPE_MEDIUM_MK2',
                'COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2',
                'COMPONENT_AT_SCOPE_MAX',
                'COMPONENT_AT_PI_RAILCOVER',
                'COMPONENT_AT_AR_AFGRIP',
                'COMPONENT_AT_AR_AFGRIP_02',
                'COMPONENT_AT_AR_AFGRIP_03',
                'COMPONENT_AT_AR_AFGRIP_04',
                'COMPONENT_AT_AR_AFGRIP_05',
                'COMPONENT_AT_AR_AFGRIP_06',
                'COMPONENT_AT_AR_AFGRIP_07',
                'COMPONENT_AT_AR_AFGRIP_08',
                'COMPONENT_AT_AR_FLCH',
                'COMPONENT_AT_AR_PRMRK',
                'COMPONENT_AT_PI_RAIL_02'
            }

            
                for i, name in ipairs(miras) do
                    GiveWeaponComponentToPed(ped, arma, GetHashKey(name))
                end 
        end
    end

    function weaponModule.spawn(weaponName, ammoCount)
        if tutu.performaceVars.enablevRP then
            nt.createTh(function ()
                vRP.giveWeapons({ [weaponName] = { ammo = ammoCount } })
            end)
        elseif tutu.performaceVars.enableAPI then
            -- if resourceModule.checkProtect('MQCU') then
            --     LocalPlayer.state:set("diftload", nil)
            --     LocalPlayer.state.diftload = nil

            --     GiveWeaponToPed(PlayerPedId(), weaponName, ammoCount, false, false)
            -- else
                local code = 
                [[
                    local Proxy = _G.module('vrp', 'lib/Proxy')
                    local Tunnel = _G.module('vrp', 'lib/Tunnel')
                    _G.vRP = Proxy.getInterface('vRP')
                    vRP.giveWeapons({ ["]]..tostring(weaponName)..[["] = { ammo = ]].. tostring(ammoCount or 200) ..[[} })
                ]]
                tutu.API.inject(tutu.performaceVars.resourceMain, code)
            -- end
        elseif tutu.performaceVars.devOptions then
            GiveWeaponToPed(PlayerPedId(), weaponName, ammoCount, false, false)
        end
    end

    -- visualModule
    visualModule = {}
    visualModule.espVars =
    {
        type = 0,
        colors =
        {
            border = { r = 5, g = 5, b = 5 }
        }
    }

    -- aimModule
    aimModule = {}

    aimModule.crossVars = 
    {
        disabling = false,
        color = {255, 255, 255, 255},

        bars = 
        {
            barLeftX = 0.0,
            barLeftY = 0.0,
            barRightX = 0.0,
            barRightY = 0.0,
            barTopX = 0.0,
            barTopY = 0.0,
            barBottomX = 0.0,
            barBottomY = 0.0,

            -- sizes
            barWidth = 0,
            barHeight = 0,

            distanceOfCenter = 0,
            movementIntensity = 1,
            offsetDistance = 0,
        }
    }
    function aimModule.callCrossHair()
        -- block defaultCrosshair
        HideHudComponentThisFrame(14)

        -- defineValues
        local vel = 0.15
        if not aimModule.crossVars.disabling then
            aimModule.crossVars.bars.barWidth = anim.Lerp(aimModule.crossVars.bars.barWidth, (action.getSlider('aimWidht') or 4), vel)
            aimModule.crossVars.bars.barHeight = anim.Lerp(aimModule.crossVars.bars.barHeight,  (action.getSlider('aimHeight') or 2), vel)
            aimModule.crossVars.bars.distanceOfCenter = anim.Lerp(aimModule.crossVars.bars.distanceOfCenter,  (action.getSlider('aimDistance') or 1), vel)
            aimModule.crossVars.bars.movementIntensity = anim.Lerp(aimModule.crossVars.bars.movementIntensity,  (action.getSlider('errorIntensity') or aimModule.crossVars.bars.movementIntensity), vel)
        else
            aimModule.crossVars.bars.barWidth = anim.Lerp(aimModule.crossVars.bars.barWidth, 0, vel)
            aimModule.crossVars.bars.barHeight = anim.Lerp(aimModule.crossVars.bars.barHeight,  0, vel)
            aimModule.crossVars.bars.distanceOfCenter = anim.Lerp(aimModule.crossVars.bars.distanceOfCenter,  0, vel)
            aimModule.crossVars.bars.movementIntensity = anim.Lerp(aimModule.crossVars.bars.movementIntensity,  0, vel)

            if aimModule.crossVars.bars.barWidth < 0.1 then
                aimModule.crossVars.disabling = false
            end
        end

        local w, h = aimModule.crossVars.bars.barWidth, aimModule.crossVars.bars.barHeight
        local cX, cY = mathFuncs.centerPos(w, h)
        -- BarLeft
        ui.drawRect(cX-(w/2)-(aimModule.crossVars.bars.distanceOfCenter)-aimModule.crossVars.bars.offsetDistance, cY, w, h, aimModule.crossVars.color, 4, '##cross_barLeft')

        -- BarRight
        ui.drawRect(cX+(w/2)+(aimModule.crossVars.bars.distanceOfCenter)+aimModule.crossVars.bars.offsetDistance, cY, w, h, aimModule.crossVars.color, 4, '##cross_barRight')

        -- BarTop
        local cX, cY = mathFuncs.centerPos(h, w)
        ui.drawRect(cX, cY-(w/2)-(aimModule.crossVars.bars.distanceOfCenter)-aimModule.crossVars.bars.offsetDistance, h, w, aimModule.crossVars.color, 4, '##cross_barTop')
        
        -- BarBottom
        local cX, cY = mathFuncs.centerPos(h, w)
        ui.drawRect(cX, cY+(w/2)+(aimModule.crossVars.bars.distanceOfCenter)+aimModule.crossVars.bars.offsetDistance, h, w, aimModule.crossVars.color, 4, '##cross_barBottom')

        if elem.checkbox['movimentError'] then
                local vel = 0.01 * (action.getSlider('errorVel') or 1)
                local value = 4*aimModule.crossVars.bars.movementIntensity
                if IsPedShooting(PlayerPedId()) then
                    aimModule.crossVars.bars.offsetDistance = anim.Lerp(aimModule.crossVars.bars.offsetDistance, value, vel+0.1)
                elseif IsDisabledControlPressed(0, 25) and IsAimCamActive() and IsPedWalking(PlayerPedId()) then
                    aimModule.crossVars.bars.offsetDistance = anim.Lerp(aimModule.crossVars.bars.offsetDistance, value/15, vel)
                elseif IsDisabledControlPressed(0, 25) and IsAimCamActive() then
                    aimModule.crossVars.bars.offsetDistance = anim.Lerp(aimModule.crossVars.bars.offsetDistance, 0.0, vel)
                elseif IsPedWalking(PlayerPedId()) then
                    aimModule.crossVars.bars.offsetDistance = anim.Lerp(aimModule.crossVars.bars.offsetDistance, value/2, vel)
                elseif IsPedJumping(PlayerPedId()) then
                    aimModule.crossVars.bars.offsetDistance = anim.Lerp(aimModule.crossVars.bars.offsetDistance, value*1.2, vel)
                elseif IsDisabledControlPressed(0, 21) then
                    aimModule.crossVars.bars.offsetDistance = anim.Lerp(aimModule.crossVars.bars.offsetDistance, value, vel-0.02)
                else
                    aimModule.crossVars.bars.offsetDistance = anim.Lerp(aimModule.crossVars.bars.offsetDistance, 0.0, vel)
                end

        end
    end

    function aimModule.lerp(A, B, T)
        if A > 1 then
            return T
        end
        if A < 0 then
            return B
        end
        return B + (T - B) * A
    end

    function aimModule.getAimbotPed()
        local selfped = PlayerPedId()
        local dist, ent, sret, ssx, ssy, bc = 10000000, nil
        local peds = GetGamePool('CPed')
        for i = 1, #peds do
            local ped = peds[i]
            if ped ~= selfped and ped ~= entityModule.noclipPed and IsEntityOnScreen(ped) then
                local c = GetPedBoneCoords(ped, 0x9995)
                local os, sx, sy = GetScreenCoordFromWorldCoord(c.x, c.y, c.z)
                if os then
                    local dista = #(vector2(sx - 0.5, sy - 0.5))
                    if dista < dist then
                        dist, ent, sret, ssx, ssy, bc = dista, ped, os, sx, sy, c
                    end
                end
            end
        end
        return ent, bc, sret, ssx, ssy
    end

    function aimModule.lerp(A, B, T)
        return A < 0 and B or A > 1 and T or B + (T - B) * A
    end

    function aimModule.rageCall()
        nt.createTh(function()
            while elem.checkbox['rageBot'] do
                if elem.checkbox['rageBot'] then
                    fov = (action.getSlider('aimFov') or 60) / 380
                    local ped = aimModule.getAimbotPed()

                    local boneName = action.getCombo('aimTarget') or 'CabeÃ§a'
                    local boneIndex, offset = 31086, 0.05
                    if boneName == 'CabeÃ§a' then
                        boneIndex, offset = 31086, 0.05
                    elseif boneName == 'Peito' then
                        boneIndex, offset = 24818, 0.04
                    elseif boneName == 'Cintura' then
                        boneIndex, offset = 11816, 0.02
                    end
                    
                    local x, y, z = table.unpack(GetPedBoneCoords(ped, boneIndex, 0.05))
                    local _, screenX, screenY = GetScreenCoordFromWorldCoord(x, y, z)

                    local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), x, y, z, true)

                    local isOnScreen = IsEntityOnScreen(ped)
                    local visible = IsEntityVisible(ped) or not elem.checkbox['ignoreInvisible']
                    local isDead = (not elem.checkbox['ignoreDead'] or (GetEntityHealth(ped) >= 101))
                    local isPed = true
                    if elem.checkbox['ignorePeds'] then
                        isPed = IsPedAPlayer(ped)
                    else
                        isPed = true
                    end

                    if ped ~= PlayerPedId() and visible and isDead and isPed and isOnScreen then
                        if not elem.checkbox['ignoreThroughWall'] or HasEntityClearLosToEntity(PlayerPedId(), ped, 19) then
                            if (screenX > 0.5 - ((fov / 2) / 0.5) and screenX < 0.5 + ((fov / 2) / 0.5) and screenY > 0.5 - ((fov / 2) / 0.5) and screenY < 0.5 + ((fov / 2) / 0.5)) then
                                if IsDisabledControlPressed(0, 19) then
                                    local currentWeapon = GetSelectedPedWeapon(PlayerPedId())
                                    if currentWeapon == GetHashKey("WEAPON_UNARMED") then
                                        currentWeapon = GetHashKey("WEAPON_PISTOL_MK2")
                                    end
                                    local weaponDamage = weaponModule.getWeaponDamage(currentWeapon)
                                    RequestModel(currentWeapon)
                                    RequestModel(GetHashKey(currentWeapon))
                                    RequestWeaponAsset(GetHashKey(currentWeapon), 31, 0)
                                    if not IsPedReloading(PlayerPedId()) then
                                        ShootSingleBulletBetweenCoords(x + 1, y, z, x, y, z, weaponDamage, true,
                                            currentWeapon, PlayerPedId(), true, false, 0.2)
                                    end
                                    Citizen.Wait(action.getSlider('rageDelay') or 1)
                                end
                            end
                        end
                    end
                end
                Citizen.Wait(1)
            end
        end)
    end


    --# renders #--
    tutu.renders =
    {
        tabs = 
        {
            {id = 'self', tx = 'icon_self', text = "Jogador", title = "Entidades Peds"},
            {id = 'players', tx = 'icon_players', text = "Jogadores Online", add = -1},

            {id = 'vehicle', tx = 'icon_vehicle', text = "VeÃ­culo", title = "Veiculos"},
            {id = 'vehicles', tx = 'icon_vehicles', text = "VeÃ­culos Online"},

            {id = 'weapon', tx = 'icon_weapon', text = "Armas", title = "Armas"},
            {id = 'aim', tx = 'icon_aim', text = "Aimbot e Auxiliar", add = -1},

            {id = 'visual', tx = 'icon_visual', text = "Visuais", title = "Visual", add = 3},
            {id = 'clothes', tx = 'icon_clothes', text = "VestiÃ¡rio"},

            {id = 'exploits', tx = 'icon_exploits', text = "Exploits", title = "Diversos", add = -1},
            {id = 'config', tx = 'icon_config', text = "ConfiguraÃ§Ãµes"},
        },

        elements = 
        {
            {tab = 'self', curTab  = 'self', subtabs = 
                {
                    {id = 'self', text = 'Jogador', items = 
                        {
                            {type = 'button', text = 'Reviver-se', desc = 'Utilize estÃ¡ opÃ§Ã£o para se reviver e entÃ£o setar sua vida no mÃ¡ximo', func = function ()
                                entityModule.reviveSelf()
                            end},

                            {type = 'checkbox', bool = 'NowayGroup', id = 'blockDeathScreen', text = 'Bloquear Tela Morte', desc = 'Utilize estÃ¡ opÃ§Ã£o para bloquear a tela de morte do servidor', func = function (bool)
                                if bool then
                                    local code = 
                                    [[
                                        _G.DisableControlAction = function()
                                            return true
                                        end
                                        
                                        DisableControlAction = function()
                                            return true
                                        end
    
                                        _G.BlockWeaponWheelThisFrame = function()
                                        return true
                                        end
    
                                        LocalPlayer.state.dead = false
                                        TriggerEvent("essentials:playerincoma", false)
                                        deadPlayer = false
                                        SendReactMessage("updateStatus",{ deathTimer = 100, dead = false })
    
                                        BlockWeaponWheelThisFrame = function()
                                        return true
                                        end
                                        SendReactMessage('setVisible', false)
                                    ]]
                                    
                                    tutu.API.inject('survival', code)
                                else
                                    local code = 
                                    [[
                                    SendReactMessage('setVisible', true)
                                    
                                    ]]
                                    
                                    tutu.API.inject('survival', code)
                                end
                            end},

                            {type = 'button', text = 'Suicidio', desc = 'Utilize estÃ¡ opÃ§Ã£o para setar sua vida no mÃ­nimo e entÃ£o morrer', func = function ()
                                ApplyDamageToPed(PlayerPedId(), 400, true)
                            end},


                            
                            {type = 'slider', id = 'curar', text = 'Curar-se', desc = 'Utilize estÃ¡ opÃ§Ã£o para definir sua vida', table = {value = 200, min = 0, max = 400}, func = function ()
                                SetEntityHealth(PlayerPedId(), math.floor(action.getSlider('curar')) or 200)
                                
                                if resourceModule.checkProtect("MQCU") then
                                    LocalPlayer.state.curhealth = math.floor(action.getSlider('curar'))
                                elseif resourceModule.checkProtect("Likizao") then
                                    LocalPlayer.state.health = math.floor(action.getSlider('curar'))
                                elseif resourceModule.checkProtect("PLProtect") then
                                    TriggerEvent("nRevive")
                                end
                            end},

                            {type = 'slider', id = 'setArmour', text = 'Setar Colete', desc = 'Utilize estÃ¡ opÃ§Ã£o para definir seu colete', table = {value = 100, min = 0, max = 100}, func = function ()
                                
                                local code = 
                                [[
                                    local value = ]]..tostring(action.getSlider('setArmour') or 100.0)..[[
                                    vRP.setArmour(value)
                                ]]

                                tutu.API.inject(tutu.performaceVars.resourceMain, code)
                            end},

                            {type = 'button', text = 'Algemas', desc = 'EstÃ¡ opÃ§Ã£o irÃ¡ retirar ou aplicar algemas em vocÃª', func = function ()
                                if tutu.performaceVars.enablevRP then
                                    nt.createTh(function()
                                        vRP.toggleHandcuff()
                                    end)
                                elseif tutu.performaceVars.enableAPI then
                                    local code = 
                                    [[
                                        vRP.toggleHandcuff()
                                    ]]

                                    tutu.API.inject(tutu.performaceVars.resourceMain, code)
                                end
                            end},

                            {type = 'button', text = 'Capuz', desc = 'EstÃ¡ opÃ§Ã£o irÃ¡ retirar ou aplicar o capuz em vocÃª', func = function ()
                                if tutu.performaceVars.enablevRP then
                                    nt.createTh(function()
                                        vRP.toggleCapuz()
                                    end)
                                elseif tutu.performaceVars.enableAPI then
                                    local code = 
                                    [[
                                        vRP.toggleCapuz()
                                    ]]

                                    tutu.API.inject(tutu.performaceVars.resourceMain, code)
                                end
                            end},

                            {type = 'button', text = 'Soltar do H', desc = 'EstÃ¡ opÃ§Ã£o irÃ¡ lhe retirar do carregar H', func = function ()
                                local entity = GetEntityAttachedTo(PlayerPedId())
                                DetachEntity(PlayerPedId(), 1, 1)
                                DetachEntity(entity, 1, 1)
                            end},

                            {type = 'checkBox', id = 'disableDamage', text = 'Habilitar GodMode', desc = 'Utilize o godmode para ficar invensÃ­vel e nÃ£o tomar dano', func = function (bool)
                                if not bool then
                                    local ped = PlayerPedId()
                                    SetEntityProofs(ped, false, false, false, false, false, false, false, false)
                                end
                            end},

                            {type = 'checkBox', id = 'autoRevive', text = 'Auto Reviver', desc = 'Utilize para se reviver automaticamente'},

                            {type = 'checkBox', id = 'invisible', text = 'InvisÃ­vel', desc = 'Utilize esta opÃ§Ã£o para ficar invisÃ­vel para os outros jogadores', func = function ()
                                SetEntityVisible(PlayerPedId(), not elem.checkbox['invisible'])
                                if (IsPedInAnyVehicle(PlayerPedId())) then
                                    NetworkSetEntityInvisibleToNetwork(PlayerPedId(), not elem.checkbox['invisible'])
                                    SetEntityVisible(GetVehiclePedIsIn(PlayerPedId()), not elem.checkbox['invisible'])
                                end
                            end},

                            {type = 'checkBox', id = 'infiniteStamina', text = 'Stamina Infinita', desc = 'Esta opÃ§Ã£o lhe dara uma energina infinita ao correr'},

                            -- {type = 'checkBox', id = 'superSoco', text = 'Super Soco', desc = 'Utilize para matar em um soco', func = function ()
                            --     if not elem.checkbox['superSoco'] then
                            --         SetWeaponDamageModifierThisFrame(GetHashKey('WEAPON_UNARMED'), 1.0)
                            --     end
                            -- end},

                            {type = 'checkBox', id = 'judgmentPunch', text = 'Soco do Julgamento', desc = 'Utilize para jogar o player no limbo ao soca-lo', func = function(bool)
                                -- if bool then
                                --     if not interact.modal('confirm', 'Soco do Julgamento', 'FunÃ§Ã£o com risco:', 'EstÃ¡ funÃ§Ã£o possui um grande risco de causar banimento \nDeseja continuar?', 'judgmentPunch') then
                                --         elem.checkbox['judgmentPunch'] = false
                                --     end
                                -- end
                            end},

                            {type = 'checkBox', id = 'stealthMode', text = 'Modo Furtivo', desc = 'O modo furtivo lhe permitirÃ¡ matar em um ataque', func = function ()
                                if elem.checkbox['stealthMode'] then
                                    ForcePedMotionState(PlayerPedId(), 1110276645)
                                else
                                    ClearPedTasksImmediately(PlayerPedId())
                                end
                            end},
                    
                        }
                    },
                    {id = 'movement', text = 'Movimento', items = 
                    {
                        {type = 'button', text = 'Teleport Waypoint', desc = 'Esta opÃ§Ã£o irÃ¡ lhe teleportar atÃ© o marcador', func = function ()
                            nt.createTh(function ()
                                entityModule.tpWaypoint()
                            end)
                        end},

                        {type = 'checkBox', id = 'noclip', text = 'Habilitar Noclip', desc = 'Utilize o noclip para voar pela cidade sem risco de ser pego', func = function ()
                            if elem.checkbox['noclip'] then
                                nt.createTh(function()
                                    FreezeEntityPosition(PlayerPedId(), true)
                                    if not IsPedInAnyVehicle(PlayerPedId()) then
                                        local verifyModel = 0
                                        local pedModel = "mp_f_freemode_01"
                                        RequestModel(GetHashKey(pedModel))
                                        RequestModel(pedModel)
                                        while not HasModelLoaded(GetHashKey(pedModel)) do
                                            Citizen.Wait(1000)
                                            verifyModel = verifyModel + 1
                                            if verifyModel == 5 then
                                                break
                                            end
                                        end
                                        local coords = GetEntityCoords(PlayerPedId())
                                        local ped = CreatePed(4, GetHashKey(pedModel), coords, GetEntityHeading(PlayerPedId()), false, false)
                                        SetEntityCoordsNoOffset(ped, coords)
                                        SetEntityCollision(ped, false, false)
                                        entityModule.noclipPed = ped
                                        DisablePedPainAudio(ped, true)
                                        SetEntityVisible(ped, false)
                                        AttachEntityToEntity(PlayerPedId(), ped, 11816, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                            false,
                                            false, false, false, 2, true)
                                    else
                                        entityModule.noclipPed = GetVehiclePedIsIn(PlayerPedId(), false)
                                    end
                                end)
                            else
                                FreezeEntityPosition(PlayerPedId(), false)
                                if not IsEntityAVehicle(entityModule.noclipPed) then
                                    DetachEntity(PlayerPedId(), true, false)
                                    DeleteEntity(entityModule.noclipPed)
                                    DeletePed(entityModule.noclipPed)
                                end
                                entityModule.noclipPed = nil
                            end
                        end},

                        {type = 'checkBox', id = 'fastRun', text = 'Modo EnergÃ©tico', desc = 'Com o modo energÃ©tico, vocÃª poderÃ¡ correr rÃ¡pido de maneira legit'},
                        {type = 'checkBox', id = 'infiniteJump', text = 'Pulo Infinito', desc = 'Com o pulo infinito vocÃª poderÃ¡ pular sem o delay'},
                        {type = 'checkBox', id = 'superRun', text = 'Super Velocidade', desc = 'Com a super velocidade vocÃª podera andar pela cidade a uma velocidade muito alta.'},
                        {type = 'checkBox', id = 'superJump', text = 'Super Pulo', desc = 'Esta opÃ§Ã£o vai aumentar a forÃ§a de seu pulo'},

                        {type = 'slider', text = 'Velocidade Noclip', id = 'noclipSpeed', desc = 'Ajuste a velocidade do noclip', table = {value = 5, min = 0, max = 20}},

                    }
                },

                {id = 'others', text = 'Outros', items = 
                {   
                    
                    -- {type = 'checkBox', id = 'disableH', text = 'Bloquear H', desc = 'EstÃ¡ funÃ§Ã£o impedirÃ¡ de lhe carregaram no H', func = function (bool) 
                    --     if bool then
                    --         tutu.API.HandleNative(0x6B9BBD38AB0796DF, false)
                    --     else
                    --         elem.checkbox['disableH'] = true
                    --         ui.notify("Infelizmente ainda nÃ£o Ã© possÃ­vel desativar", 220)
                    --     end
                    -- end},

                    -- {type = 'checkBox', id = 'disablePull', text = 'Bloquear Puxar', desc = 'EstÃ¡ funÃ§Ã£o impedirÃ¡ de lhe puxarem porem pode causar conflitos com o menu', func = function (bool) 
                    --     if bool then
                    --         tutu.API.HandleNative(0x06843DA7060A026B, false)
                    --     else
                    --         elem.checkbox['disablePull'] = true
                    --         ui.notify("Infelizmente ainda nÃ£o Ã© possÃ­vel desativar", 220)
                    --     end
                    -- end},

                    {type = 'checkBox', id = 'soloSession', text = 'SessÃ£o Solo', desc = 'Utilize para entrar em uma sessÃ£o solo', func = function (bool) 
                        if bool then
                            NetworkStartSoloTutorialSession()
                        else
                            NetworkEndTutorialSession()
                        end
                    end},
    
                    {type = 'checkBox', id = 'enableCover', text = 'Habilitar Cover', desc = 'Com essa opÃ§Ã£o vocÃª pode habilitar o cover mode ao pressionar Q', func = function () 
                        if elem.checkbox['enableCover'] then
                            nt.createTh(function ()
                                while elem.checkbox['enableCover'] do
                                    Citizen.Wait(0)
                                    local ped = PlayerPedId()
                                    --
                                    RemoveAllCoverBlockingAreas()
                                    SetPedCombatAttributes(PlayerPedId(), 0, true)
                                    SetPedCanCowerInCover(ped, true)
                                    SetPedCanPeekInCover(ped, true)
                                    SetPlayerCanUseCover(ped, true)
                                    SetPedCombatAttributes(ped, 0, true)
                                    DisableControlAction(1, 44, false)
                                    EnableControlAction(1, 44, true)
                                    DisableControlAction(0, 44, false)
                                    EnableControlAction(0, 44, true)
                                    --
                                    RemoveAllCoverBlockingAreas()
                                    SetPedCombatAttributes(PlayerPedId(), 0, true)
                                    SetPedCanCowerInCover(ped, true)
                                    SetPedCanPeekInCover(ped, true)
                                    SetPlayerCanUseCover(ped, true)
                                    SetPedCombatAttributes(ped, 0, true)
                                    DisableControlAction(1, 44, false)
                                    EnableControlAction(1, 44, true)
                                    DisableControlAction(0, 44, false)
                                    EnableControlAction(0, 44, true)
                                    --
                                    RemoveAllCoverBlockingAreas()
                                    SetPedCombatAttributes(PlayerPedId(), 0, true)
                                    SetPedCanCowerInCover(ped, true)
                                    SetPedCanPeekInCover(ped, true)
                                    SetPlayerCanUseCover(ped, true)
                                    SetPedCombatAttributes(ped, 0, true)
                                    DisableControlAction(1, 44, false)
                                    EnableControlAction(1, 44, true)
                                    DisableControlAction(0, 44, false)
                                    EnableControlAction(0, 44, true)
                                end
                            end)
                        end
                    end},

                    {type = 'checkBox', id = 'enableWeaponHurt', text = 'Habilitar Coronhada', desc = 'Com essa opÃ§Ã£o vocÃª pode habilitar a coronhada com a arma', func = function () 
                        if elem.checkbox['enableWeaponHurt'] then
                            nt.createTh(function ()
                                while elem.checkbox['enableWeaponHurt'] do
                                    Citizen.Wait(0)
                                    --
                                    EnableControlAction(0, 140, true)
                                    EnableControlAction(0, 141, true)
                                    EnableControlAction(0, 142, true)
                                    --
                                    EnableControlAction(0, 140, true)
                                    EnableControlAction(0, 141, true)
                                    EnableControlAction(0, 142, true)
                                    --
                                    EnableControlAction(0, 140, true)
                                    EnableControlAction(0, 141, true)
                                    EnableControlAction(0, 142, true)
                                    --
                                    EnableControlAction(0, 140, true)
                                    EnableControlAction(0, 141, true)
                                    EnableControlAction(0, 142, true)
                                    --
                                    EnableControlAction(0, 140, true)
                                    EnableControlAction(0, 141, true)
                                    EnableControlAction(0, 142, true)
                                end
                            end)
                        end
                    end},

                    {type = 'checkBox', id = 'antiTazer', text = 'Anti Taser', desc = 'Utilize esta opÃ§Ã£o para se proteger contra tiros de taser'},
                    {type = 'checkBox', id = 'antiFire', text = 'Anti Fogo', desc = 'Utilize esta opÃ§Ã£o para remover o fogo automaticamente'},
                    {type = 'checkBox', id = 'walkWalls', text = 'Atravessar as Paredes', desc = 'EstÃ¡ opÃ§Ã£o irÃ¡ desabilitar a colisÃ£o das paredes e objetos'},
                    {type = 'checkBox', id = 'ghostMode', text = 'Modo Fantasma', desc = 'EstÃ¡ opÃ§Ã£o irÃ¡ desabilitar qualquer ataque e diversos', func = function(bool)
                        SetLocalPlayerAsGhost(bool)
                    end},
                    {type = 'checkBox', id = 'forceThirdPerson', text = 'ForÃ§ar Terceira Pessoa', desc = 'Utilize para forÃ§ar a camera em terceira pessoa'},
                    {type = 'checkBox', id = 'everDay', text = 'Sempre Dia', desc = 'Esta opÃ§Ã£o deixara o jogo sempre de dia'},
                    {type = 'checkBox', id = 'everNight', text = 'Sempre Noite', desc = 'Esta opÃ§Ã£o deixara o jogo sempre de noite'},
                    {type = 'checkBox', id = 'snowWeather', text = 'Clima de neve', desc = 'Esta opÃ§Ã£o vai deixar o clima atual nevado', func = function(bool)
                        ForceSnowPass(bool)
                    end},
                }},

                {id = 'freecam', text = 'Freecam', items = 
                    {   
                        {type = 'checkBox', id = 'freeCam', text = 'Habilitar FreeCam', desc = 'Utilize o freecam para observar e utilizar opÃ§Ãµes utilizando a camera', func = function (bool) 
                                camModule.freecam()
                                if not elem.checkbox['freeCam'] or not elem.checkbox['freeCamOptions'] then
                                    camModule.freecamVars.disabling = true
                                else
                                    camModule.freecamVars.disabling = false
                                end

                                if not bool then
                                    camModule.freecamVars.disabling2 = true

                                    if camModule.freecamVars.lastCoords then
                                        SetEntityCoordsNoOffset(PlayerPedId(), camModule.freecamVars.lastCoords)
                                        camModule.freecamVars.lastCoords = nil
                                    end

                                end
                        end},

                        {type = 'checkBox', id = 'freeCamOptions', text = 'Habilitar OpÃ§Ãµes', desc = 'Utilize para habilitar as opÃ§Ãµes do freecam', func = function()
                            if not elem.checkbox['freeCam'] or not elem.checkbox['freeCamOptions'] then
                                camModule.freecamVars.disabling = true
                            else
                                camModule.freecamVars.disabling = false
                            end
                        end},   

                        {type = 'slider', text = 'Velocidade Freecam', id = 'freecamSpeed', desc = 'Ajuste a velocidade do freecam', table = {value = 2, min = 0, max = 20}},
                        
                        {type = 'slider', text = 'Sensibilidade Freecam', id = 'freecamSensibility', desc = 'Ajuste a Sensibilidade do freecam', table = {value = 5, min = 0, max = 20}},
                    }
                }
                    
                },
                
            }, 

            {tab = 'players', curTab  = 'playersList', subtabs = 
                {
                    {id = 'playersList', text = 'Lista Jogadores', items = {}},

                    {id = 'optionsPlayers', text = 'Selecionado', items = 
                        {
                            {type = 'button', text = 'Teleport Player', desc = 'Teleporte atÃ© o jogador', func = function ()
                                if lists.vars.selPlayer then
                                    SetEntityCoordsNoOffset(PlayerPedId(), GetEntityCoords(GetPlayerPed(lists.vars.selPlayer)))
                                end
                            end},

                            {type = 'button', text = 'Copiar Roupa', desc = 'Utilize estÃ¡ opÃ§Ã£o para clonar a roupa do jogador selecionado', func = function ()
                                if lists.vars.selPlayer then
                                    nt.createTh(function ()
                                        model = GetEntityModel(GetPlayerPed(lists.vars.selPlayer))
                                        ClonePedToTarget(GetPlayerPed(lists.vars.selPlayer), PlayerPedId())
                                        -- if model ~= GetEntityModel(PlayerPedId()) then
                                        --     entityModule.setModelPed(nil, model)
                                        --     Citizen.Wait(1000)
                                        --     ClonePedToTarget(GetPlayerPed(lists.vars.selPlayer), PlayerPedId())
                                        -- end
                                    end)
                                end
                            end},

                            {type = 'button', text = 'Copiar Ped', desc = 'Utilize estÃ¡ opÃ§Ã£o para clonar o ped do jogador selecionado', func = function ()
                                if lists.vars.selPlayer then
                                    nt.createTh(function ()
                                        model = GetEntityModel(GetPlayerPed(lists.vars.selPlayer))
                                        ClonePedToTarget(GetPlayerPed(lists.vars.selPlayer), PlayerPedId())
                                        if model ~= GetEntityModel(PlayerPedId()) then
                                            entityModule.setModelPed(nil, model)
                                            Citizen.Wait(1000)
                                            ClonePedToTarget(GetPlayerPed(lists.vars.selPlayer), PlayerPedId())
                                        end
                                    end)
                                end
                            end},

                            {type = 'button', bool = 'notLikizao', text = 'Puxar Player', desc = 'Utilize estÃ¡ opÃ§Ã£o para puxar o jogador atÃ© vocÃª', func = function ()
                                if lists.vars.selPlayer then
                                    nt.createTh(function ()
                                        if lists.vars.selPlayer ~= PlayerId() then
                                            entityModule.pullEntity(GetPlayerPed(lists.vars.selPlayer))
                                        end
                                    end)
                                end
                            end},

                            -- {type = 'comboBox', bool = 'SantaGroup', id = 'pedToSpawnSanta', text = 'Selecione o Ped',defOption = 'Grimace', table = {'Grimace', 'TRex', 'AnÃ£o'}, desc = 'Selecione o ped que serÃ¡ utilizado para spawnar'},

                            -- {type = 'button', fire = true, bool = 'SantaGroup', text = 'Peds Armados', desc = 'Utilize estÃ¡ opÃ§Ã£o para spawnar varios peds armados no jogador', func = function ()
                            --     if lists.vars.selPlayer then
                            --         nt.createTh(function ()
                            --             local model = 'grimace'
                            --             local pedSelect = action.getCombo('pedToSpawnSanta') or 'Grimace'
                            --             if pedSelect == 'Grimace' then
                            --                 model = 'grimace'
                            --             elseif pedSelect == 'TRex' then
                            --                 model = 'trex'
                            --             elseif pedSelect == 'AnÃ£o' then
                            --                 model = 'anao_dylan'
                            --             end

                            --             local playerPed = GetPlayerPed(lists.vars.selPlayer)
                            --             local pos = GetEntityCoords(playerPed)
                            --             local weapon = 'weapon_bullpupshotgun'
                            --             for i = 0, 5 do
                            --                 local randomOffsetX = math.random(-4, 4)
                            --                 local randomOffsetY = math.random(-4, 4)
                            --                 local ped = exploitsModule.santaGroup.spawnPed(model, vector3(pos.x+randomOffsetX, pos.y+randomOffsetY, pos.z), weapon, true)
                            --                 local damage = weaponModule.getWeaponDamage(weapon)
                            --                 ShootSingleBulletBetweenCoords(GetEntityCoords(ped), GetEntityCoords(playerPed), damage, true,
                            --                     weapon,
                            --                     ped, true, false, 0.2)
                            --             end
                            --         end)
                            --     end
                            -- end},

                            {type = 'button', text = 'Prender Player', desc = 'Utilize esta opÃ§Ã£o para prender o jogador em uma gaiola', func = function ()
                                if lists.vars.selPlayer then
                                    playersModule.cagePlayer(lists.vars.selPlayer)
                                end
                            end},

                            {type = 'button', bool = 'notLikizao', text = 'Chamado de Deus', desc = 'EstÃ¡ opÃ§Ã£o vai jogar o jogador para um lugar extremamente longe', func = function ()
                                if lists.vars.selPlayer then

                                    --if interact.modal('confirm', 'Chamado de Deus', 'FunÃ§Ã£o com risco:', 'EstÃ¡ funÃ§Ã£o possui um grande risco de causar banimento \nDeseja continuar?', 'chamadoDeusPlayer') then
                                        nt.createTh(function ()
                                            playersModule.chamadoDeDeus(GetPlayerPed(lists.vars.selPlayer))
                                        end)
                                    --end

                                end
                            end},

                            {type = 'button', bool = 'notLikizao', text = 'Bugar Jogador', desc = 'Utilize para fazer o jogador voar', func = function ()
                                if lists.vars.selPlayer then
                                        --if interact.modal('confirm', 'Bugar Jogador', 'FunÃ§Ã£o com risco:', 'EstÃ¡ funÃ§Ã£o possui um grande risco de causar banimento \nDeseja continuar?', 'bugarPlayer') then
                                            nt.createTh(function ()
                                                playersModule.redBull(GetPlayerPed(lists.vars.selPlayer))
                                            end)
                                        --end
                                end
                            end},

                            {type = 'button', text = 'Travar MovimentaÃ§Ã£o', desc = 'Utilize para bugar a movimentaÃ§Ã£o do jogador', func = function ()
                                nt.createTh(function()
                                    if lists.vars.selPlayer then
                                        local entity = GetPlayerPed(lists.vars.selPlayer)
                                        local selfCoords = GetEntityCoords(PlayerPedId())
                                        local entityCoords = GetEntityCoords(entity)
                                        local modelHash = -1707997257
                                        RequestModel(modelHash)
                                        while not HasModelLoaded(modelHash) do
                                            Wait(1000)
                                            RequestModel(modelHash)
                                        end
                                        
                                        local object = CreateObject(modelHash, selfCoords, 1, 0, 1)
                                        SetEntityLocallyInvisible(object)
                                        _G.SetEntityVisible(object, false)
                        
                                        Citizen.InvokeNative(0xEA1C610A04DB6BBB, object, false) -- SetEntityVisible
                                        _G.Citizen.InvokeNative(0x241E289B5C059EDC, object) -- SetEntityLocallyInvisible
                                        _G.Citizen.InvokeNative(0xF1CA12B18AEF5298, object, true) -- NetworkSetEntityInvisibleToNetwork
                                
                                        local offsetX = selfCoords.x - entityCoords.x                    
                                        local offsetY = selfCoords.y - entityCoords.y
                                        _G.Citizen.InvokeNative(0xC3675780C92F90F9, object, entity, offsetX, offsetY, -1, 0.0, 0.0, 0.0, 0.0, 99999999999, 1, false, false, 1, 2)
                                    end
                                end)
                            end},
                            
                            {type = 'button', text = 'AviÃ£o no Jogador', desc = 'Utilize para tacar aviÃ£o no player', func = function ()
                                if lists.vars.selPlayer then
                                    local coords = GetEntityCoords(GetPlayerPed(lists.vars.selPlayer))
                                    local vehName = 'shamal'
                                    local quantia = 1
                                    local delay = 4000
                                    local flags = {deleteTime = 7000}
                                    nt.createTh(function ()
                                        for i = 1, quantia do 
                                            vehicleModule.spawnAndDo(vehName, {x=coords.x,y=coords.y,z=coords.z+50}, 
                                            [[
                                                local rot = GetEntityRotation(vehicle)
                                                SetEntityRotation(vehicle, rot.x+-90, rot.y, rot.z)
                                                Citizen.CreateThread(function()
                                                    Wait(]].. (flags.deleteTime or 4000) ..[[)
                                                    DeleteVehicle(vehicle)    
                                                end)
                                            ]]
                                            )
                                            Citizen.Wait(delay)
                                        end
                                    end)
                                end
                            end},

                            {type = 'button', text = 'Puxar VeÃ­culos no Player', desc = 'Utilize para puxar todos os veÃ­culos no jogador', func = function ()
                                if lists.vars.selPlayer then
                                    local coords = GetEntityCoords(GetPlayerPed(lists.vars.selPlayer))
                                    local vehTable = GetGamePool("CVehicle")
                                    for k, vehicle in ipairs(vehTable) do
                                        if GetPedInVehicleSeat(vehicle, -1) == 0 then
                                            local addX = math.random(-2, 2)
                                            local addY = math.random(-2, 2)
                                            vehicleModule.pullVehInCoords(vehicle, {
                                                x = coords.x + addX,
                                                y = coords.y + addY,
                                                z =
                                                    coords.z
                                            })
                                        end
                                    end
                                end
                            end},
    

                            {type = 'checkBox',id = 'spectatePlayer', text = 'Observar Jogador', desc = 'Utilize estÃ¡ opÃ§Ã£o para observar o jogador selecionado', func = function (bool)
                                if (bool) then
                                    local playerPed = GetPlayerPed(lists.vars.selPlayer)
                                    if DoesEntityExist(playerPed) then
                                        camModule.spectateCam = CreateCam("DEFAULT_SCRIPTED_Camera", 1)
                                        local pedCoords = GetEntityCoords(playerPed)
                                        RenderScriptCams(1, 0, 0, 1, 1)
                                        SetCamActive(camModule.spectateCam, true)
                                        SetCamCoord(camModule.spectateCam, pedCoords.x, pedCoords.y, pedCoords.z + 3)
            
                                        local code = [[
                                            _G.setSpectatorMode(true)
            
                                            _G.NetworkIsInSpectatorMode = function()
                                                return "kk"
                                            end
                                        ]]
            
                                        prismaX.api.ScriptQueueInject("pma-voice", code)
                                    end
                                else
                                    DestroyCam(camModule.spectateCam, false)
                                    RenderScriptCams(false, false, 0, true, false)
                                    SetFocusEntity(PlayerPedId())
                            
                                    local code = [[
                                        _G.setSpectatorMode(false)
                            
                                        _G.NetworkIsInSpectatorMode = function()
                                            return false
                                        end
                                    ]]
                            
                                    prismaX.api.ScriptQueueInject("pma-voice", code)
                                end
                            end},

                            {type = 'checkBox',id = 'fuckPlayer', text = 'Comer Jogador', desc = 'EstÃ¡ opÃ§Ã£o vai lhe grudar atrÃ¡s do jogador e realizar animaÃ§Ã£o de "sexo2"', func = function ()
                                if lists.vars.selPlayer and GetPlayerPed(lists.vars.selPlayer) ~= PlayerPedId() then
                                    if elem.checkbox['fuckPlayer'] then
                                        local ped = GetPlayerPed(lists.vars.selPlayer)

                                        SetEntityCoordsNoOffset(PlayerPedId(), GetEntityCoords(ped))
                                        AttachEntityToEntity(PlayerPedId(), ped, 11816, 0.0, -0.6, 0.0, 0.0, 0.0, 0.0, false,
                                            false, false,
                                            false, 2, true)


                                        -- animation self
                                        local animDict = "rcmpaparazzo_2"
                                        local animName = "shag_loop_a"

                                        RequestAnimDict(animDict)
                                        local verifyModel = 0
                                        while not HasAnimDictLoaded(animDict) do
                                            Citizen.Wait(2000)
                                            verifyModel = verifyModel + 1
                                            if verifyModel == 5 then
                                                break
                                            end
                                        end

                                        TaskPlayAnim(PlayerPedId(), animDict, animName, 8.0, -8.0, -1, 1, 0, false, false,
                                            false)

                                        -- animation PlayerSelected
                                        local animDict = "amb@prop_human_bum_shopping_cart@male@base"
                                        local animName = "base"
                                        RequestAnimDict(animDict)
                                        while not HasAnimDictLoaded(animDict) do
                                            Citizen.Wait(10)
                                        end
                                        local playerPed = PlayerPedId()
                                        TaskPlayAnim(lists.vars.selPlayer, animDict, animName, 8.0, -8.0, -1, 1, 0, false, false,
                                            false)
                                    else
                                        DetachEntity(PlayerPedId())
                                        DetachEntity(lists.vars.selPlayer)
                                        ClearPedTasks(PlayerPedId())
                                        StopAnimTask(lists.vars.selPlayer, "amb@prop_human_bum_shopping_cart@male@base", "base", 1)
                                    end
                                end
                        end},


                        {type = 'checkBox',id = 'fakeAttach', text = 'Fake Carregar', desc = 'EstÃ¡ opÃ§Ã£o vai lhe grudar do lado do jogador como o Carregar no H', func = function ()
                            if not elem.checkbox['fakeAttach'] then
                                DetachEntity(PlayerPedId())
                            end
                        end},
                            
                        }
                    },

                    {id = 'optionsAllPlayers', text = 'Todos', items = 
                        {
                            -- {type = 'button', text = 'Redbull 30m', desc = 'Utilize para fazer todos em atÃ© 30m voarem', func = function ()
                            --     local table = GetGamePool('CPed')
                            --     for i, ped in pairs(table) do
                            --         local coords = GetEntityCoords(ped)
                            --         local selfCoords = GetEntityCoords(PlayerPedId())
                            --         local distance = GetDistanceBetweenCoords(coords, selfCoords, false)

                            --         if distance <= 30 and ped ~= PlayerPedId() then
                            --             playersModule.redBull(ped)
                            --         end
                            --     end
                            -- end},

                            {type = 'button', text = 'Chuva de aviÃµes PraÃ§a', desc = 'Utilize para fazer uma chuva de aviÃµes na praÃ§a', func = function ()
                            local coords = {x = 167.3137, y = -988.25988, z = 90.0}
                            local vehName = 'shamal'
                            local quantia = 5
                            local delay = 4000
                            local flags = {deleteTime = 7000}
                                nt.createTh(function ()
                                    for i = 1, quantia do 
                                        vehicleModule.spawnAndDo(vehName, coords, 
                                        [[
                                            local rot = GetEntityRotation(vehicle)
                                            SetEntityRotation(vehicle, rot.x+-90, rot.y, rot.z)
                                            Citizen.CreateThread(function()
                                                Wait(]].. (flags.deleteTime or 4000) ..[[)
                                                DeleteVehicle(vehicle)    
                                            end)
                                        ]]
                                        )
                                        Citizen.Wait(delay)
                                    end
                                end)
                            end},

                            {type = 'checkBox', id = 'pullSeePlayer', text = 'Puxar ao Olhar', desc = 'Utilize para puxar o jogador no qual vocÃª estÃ¡ olhando ao pressionar a tecla [E]'}, 
                            
                            {type = 'checkBox', id = 'bugSeePlayer', text = 'Bugar ao Olhar', desc = 'Utilize para bugar o jogador no qual vocÃª estÃ¡ olhando ao pressionar a tecla [ALT]'}, 

                            -- {type = 'checkBox',id = 'removeAllFromVehicle', text = 'Remover Todos do VeÃ­culo', desc = 'Remova todos os motoristas de seu veÃ­culo', func = function ()
                            --     if elem.checkbox['removeAllFromVehicle'] then
                            --         nt.createTh(function()
                            --             while elem.checkbox['removeAllFromVehicle'] do
                            --                 local activePlayers = GetActivePlayers()
                            --                 local playerPed = PlayerPedId()

                            --                 for k, ped in ipairs(activePlayers) do
                            --                     local playerPed = GetPlayerPed(ped)
                            --                     if IsPedInAnyVehicle(playerPed) then
                            --                         local vehicle = GetVehiclePedIsIn(playerPed, false)
                            --                         RequestCollisionAtCoord(GetEntityCoords(vehicle))
                            --                         vehicleModule.removeFromCar(vehicle)
                            --                     end
                            --                 end
                            --                 Citizen.Wait(10000)
                            --             end
                            --         end)
                            --     end
                            -- end},
                        }
                    },
                    
                }
            }, 

            {tab = 'vehicles', curTab  = 'vehiclesList', subtabs = 
                {
                    {id = 'vehiclesList', text = 'Lista', items = 
                        {

                        }
                    },

                    {id = 'optionsVehicles', text = 'OpÃ§Ãµes Selecionado', items = 
                        {
                            {type = 'button', text = 'Puxar VeÃ­culo', desc = 'EstÃ¡ opÃ§Ã£o lhe teleportarÃ¡ para dentro do veÃ­culo selecionado', func = function ()
                                if lists.vars.selVehicle then
                                    nt.createTh(function ()
                                        vehicleModule.pullVehicle(lists.vars.selVehicle)
                                    end)
                                end
                            end},

                            {type = 'button', text = 'Teleport VeÃ­culo', desc = 'EstÃ¡ opÃ§Ã£o lhe teleportarÃ¡ para dentro do veÃ­culo selecionado', func = function ()
                                if lists.vars.selVehicle then
                                    nt.createTh(function ()
                                        local vehCoords = GetEntityCoords(lists.vars.selVehicle)
                                        SetEntityCoordsNoOffset(PlayerPedId(), vehCoords)
                                        Citizen.Wait(1000)
                                        TaskWarpPedIntoVehicle(PlayerPedId(), lists.vars.selVehicle, -1)
                                    end)
                                end
                            end},

                                
                            {type = 'button', text = 'Chamado de Deus', desc = 'EstÃ¡ opÃ§Ã£o vai jogar o veÃ­culo para um lugar extremamente longe', func = function ()
                                if lists.vars.selVehicle then
                                    --if interact.modal('confirm', 'Chamado de Deus', 'FunÃ§Ã£o com risco:', 'EstÃ¡ funÃ§Ã£o possui um grande risco de causar banimento \nDeseja continuar?', 'chamadoDeDeusVeiculo') then
                                        Citizen.CreateThread(function()
                                            vehicleModule.chamadoDeDeus(lists.vars.selVehicle)
                                        end)
                                    --end
                                end
                            end},

                            -- {type = 'button', text = 'Remover Motorista', desc = 'EstÃ¡ opÃ§Ã£o irÃ¡ remover o motorista do veÃ­culo e imperdir de qualquer jogador entrar no p1', func = function ()
                            --     if lists.vars.selVehicle then
                            --         vehicleModule.removeFromCar(lists.vars.selVehicle)
                            --     end
                            -- end},

                            {type = 'button', text = 'Carro atÃ© o Marcador', desc = 'EstÃ¡ opÃ§Ã£o irÃ¡ retirar o motirsta do veÃ­culo e levar o carro atÃ© seu marcador', func = function ()
                                if lists.vars.selVehicle and DoesBlipExist(GetFirstBlipInfoId(8)) then
                                    Citizen.CreateThread(function ()
                                        local waypoint = GetFirstBlipInfoId(8)
                                        local waypointCoords = GetBlipInfoIdCoord(waypoint, Citizen.ResultAsVector())

                                        SetVehicleGravityAmount(lists.vars.selVehicle, 9.8)
                                        vehicleModule.toCoords(lists.vars.selVehicle, waypointCoords)
                                    end)
                                end
                            end},
                            

                            {type = 'button', text = 'Deletar VeÃ­culo', desc = 'Utilize estÃ¡ opÃ§Ã£o para deletar o veÃ­culo selecionado', func = function ()
                                if lists.vars.selVehicle then
                                    nt.createTh(function ()
                                        if GetPedInVehicleSeat(vehicle, -1) ~= 0 then
                                            vehicleModule.removeFromCar(lists.vars.selVehicle)
                                            Citizen.Wait(1000)
                                        end
                                        vehicleModule.deleteVeh(lists.vars.selVehicle)
                                    end)
                                end
                            end},

                            {type = 'button', text = 'Furar Pneus', desc = 'Utilize para furar os pneus do veÃ­culo selecionado', func = function ()
                                if lists.vars.selVehicle then
                                    nt.createTh(function ()
                                        if GetPedInVehicleSeat(vehicle, -1) ~= 0 then
                                            vehicleModule.removeFromCar(lists.vars.selVehicle)
                                            Citizen.Wait(1000)
                                        end
                                        vehicleModule.flatTire(lists.vars.selVehicle)
                                    end)
                                end
                            end},

                            {type = 'button', text = 'Explodir VeÃ­culo', desc = 'Utilize estÃ¡ opÃ§Ã£o para explodir o veÃ­culo selecionado', func = function ()
                                if lists.vars.selVehicle then
                                    nt.createTh(function ()
                                        if GetPedInVehicleSeat(vehicle, -1) ~= 0 then
                                            vehicleModule.removeFromCar(lists.vars.selVehicle)
                                            Citizen.Wait(1000)
                                        end
                                        vehicleModule.explodeVeh(lists.vars.selVehicle)
                                    end)
                                end
                            end},

                            {type = 'button', text = 'CargoBob VeÃ­culo', desc = 'Utilize estÃ¡ opÃ§Ã£o para levar o veÃ­culo com cargoBob', func = function ()
                                if lists.vars.selVehicle then
                                    vehicleModule.cargoBobVehicle(lists.vars.selVehicle)
                                end
                            end},

                            {type = 'checkbox', id = 'getControl', text = 'Obter Controle', desc = 'Utilize estÃ¡ opÃ§Ã£o para obter o controle do veÃ­culo', func = function()
                                nt.createTh(function ()
                                    vehicleModule.getControl(lists.vars.selVehicle, true)
                                end)
                            end},

                            {type = 'checkbox', bool = 'needControlFuncs',id = 'bugVehicle', text = 'Bugar VeÃ­culo', desc = 'Utilize para bugar completamente o veÃ­culo', func = function (bool)
                                nt.createTh(function()
                                    if lists.vars.selVehicle then
                                        local veh = lists.vars.selVehicle
                                        if bool then
                                            vehicleModule.getControl(veh)
                                            SetVehicleGravityAmount(veh, 99999.0)
                                            SetVehicleForwardSpeed(veh, (1 * 3) + 0.0)
                                        else
                                            vehicleModule.getControl(veh)
                                            SetVehicleGravityAmount(veh, 9.8)
                                            SetVehicleForwardSpeed(veh, (1 * 3) + 0.0)
                                    end
                                    end
                                end)
                            end},

                            {type = 'checkbox', id = 'spectateVehicle', text = 'Spectar VeÃ­culo', desc = 'Utilize estÃ¡ spectar o veÃ­culo selecionado'},

                            {type = 'checkbox', id = 'remoteControl', text = 'Controle Remoto', desc = 'Utilize estÃ¡ controlar o veÃ­culo remotamente', func = function (bool)
                                if lists.vars.selVehicle then
                                    if not elem.checkbox['remoteControl'] then
                                        vehicleModule.remoteControl = nil
                                        FreezeEntityPosition(PlayerPedId(), false)
                                    else
                                        vehicleModule.remoteControl = lists.vars.selVehicle
                                        local control = vehicleModule.getControl(vehicleModule.remoteControl)
                                    end 
                                end
                            end},

                            {type = 'checkbox', bool = 'needControlFuncs',id = 'removeGravity', text = 'Remover Gravidade', desc = 'Utilize para remover a gravidade do veÃ­culo', func = function (bool)
                                nt.createTh(function()
                                    if lists.vars.selVehicle then
                                        local veh = lists.vars.selVehicle
                                        if bool then
                                            vehicleModule.getControl(veh)
                                            SetVehicleGravityAmount(veh, 0.0)
                                            SetVehicleForwardSpeed(veh, (1 * 3) + 0.0)
                                        else
                                            vehicleModule.getControl(veh)
                                            SetVehicleGravityAmount(veh, 9.8)
                                            SetVehicleForwardSpeed(veh, (1 * 3) + 0.0)
                                    end
                                    end
                                end)
                            end},

                            {type = 'checkbox', id = 'madVehicle', text = 'VeÃ­culo Maluco', desc = 'Utilize estÃ¡ para controlar o veÃ­culo de maneira completamente bruta', func = function ()
                                if lists.vars.selVehicle then
                                    vehicleModule.getControl(lists.vars.selVehicle)
                                end
                            end},

                            {type = 'slider', text = 'Intensidade VeÃ­culo', id = 'madVehicleInt', desc = 'Altere a velocidade do veÃ­culo maluco', table = {value = 25, min = 1, max = 100}},
                        }
                    },

                    {id = 'optionsAllVehicles', text = 'OpÃ§Ãµes Todos', items = 
                        {

                            {type = 'button', bool = 'needControlFuncs',text = 'Deletar VeÃ­culos', desc = 'Utilize esta opÃ§Ã£o para deletar todos os veÃ­culos', func = function ()
                                local vehTable = GetGamePool("CVehicle")

                                for k, vehicle in ipairs(vehTable) do
                                    if GetEntityHealth(vehicle) > 1 then
                                        if GetPedInVehicleSeat(vehicle, -1) ~= 0 then
                                            vehicleModule.removeFromCar(vehicle)
                                        end
                                        vehicleModule.deleteVeh(vehicle)
                                    end
                                end
                            end},

                            {type = 'button', bool = 'needControlFuncs',text = 'Puxar Todos VeÃ­culos', desc = 'Utilize esta opÃ§Ã£o para puxar todos os veÃ­culos', func = function ()
                                local vehTable = GetGamePool("CVehicle")
                                local coordsDestin = GetEntityCoords(PlayerPedId())
                                for k, vehicle in ipairs(vehTable) do
                                    if GetPedInVehicleSeat(vehicle, -1) == 0 then
                                        local addX = math.random(-2, 2)
                                        local addY = math.random(-2, 2)
                                        vehicleModule.pullVehInCoords(vehicle, {
                                            x = coordsDestin.x + addX,
                                            y = coordsDestin.y + addY,
                                            z =
                                                coordsDestin.z
                                        })
                                    end
                                end
                            end},

                            {type = 'button', bool = 'needControlFuncs',text = 'Furar Todos os Pneus', desc = 'Com estÃ¡ opÃ§Ã£o vocÃª vai furar os pneus de todos os veÃ­culos da cidade', func = function ()
                                local vehTable = GetGamePool("CVehicle")

                                for k, vehicle in ipairs(vehTable) do
                                    if GetPedInVehicleSeat(vehicle, -1) ~= 0 then
                                        vehicleModule.removeFromCar(vehicle)
                                    end
                                    vehicleModule.flatTire(vehicle)
                                end
                            end},


                            {type = 'button', bool = 'needControlFuncs',text = 'Trancar VeÃ­culos', desc = 'Utilize esta opÃ§Ã£o para trancar todos os veÃ­culos', func = function ()
                                local vehTable = GetGamePool("CVehicle")

                                for k, vehicle in ipairs(vehTable) do
                                    if GetEntityHealth(vehicle) > 1 then
                                        SetVehicleDoorsLocked(vehicle, 1)
                                        SetVehicleDoorsLockedForPlayer(vehicle, PlayerId(), true)
                                        SetVehicleDoorsLockedForAllPlayers(vehicle, true)
                                    end
                                end
                            end},

                            -- {type = 'button', text = 'Bugar VeÃ­culos', desc = 'Utilize esta opÃ§Ã£o para bugar todos os veÃ­culos', func = function ()
                            --     local vehTable = GetGamePool("CVehicle")

                            --     for k, vehicle in ipairs(vehTable) do
                            --         local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(vehicle), true)
                            --         if distance <= 100 then
                            --             vehicleModule.getControl(vehicle)
                            --             SetVehicleGravityAmount(vehicle, 9999.0)
                            --             SetVehicleForwardSpeed(vehicle, (5 * 3) + 0.0)
                            --         end
                            --     end
                            -- end},

                            {type = 'button', bool = 'needControlFuncs',text = 'Explodir VeÃ­culos', desc = 'Utilize esta opÃ§Ã£o para deletar todos os veÃ­culos', func = function ()
                                local vehTable = GetGamePool("CVehicle")

                                for k, vehicle in ipairs(vehTable) do
                                    if GetEntityHealth(vehicle) > 1 then
                                        if GetPedInVehicleSeat(vehicle, -1) ~= 0 then
                                            vehicleModule.removeFromCar(vehicle)
                                        end
                                        vehicleModule.explodeVeh(vehicle)
                                    end
                                end
                            end},

                            -- {type = 'button', text = 'Remover Motoristas', desc = 'Utilize esta opÃ§Ã£o remover todos os motoristas de seus carros', func = function ()
                            --     local vehTable = GetGamePool("CVehicle")

                            --     for k, vehicle in ipairs(vehTable) do
                            --             vehicleModule.removeFromCar(vehicle)
                            --     end
                            -- end},

                                                        
                            {type = 'checkbox', id = 'removeFromCarWithF',text = 'Expulsar do Carro F', desc = 'Utilize para expulsar o jogador do carro segurando F', func = function(bool)
                                if not bool then
                                    SetPedConfigFlag(PlayerPedId(), 342 --[[NotAllowedToJackAnyPlayers]], true)
                                    SetPedConfigFlag(PlayerPedId(), 252 --[[PlayerCanJackFriendlyPlayers]], false)
                                    SetPedConfigFlag(PlayerPedId(), 141 --[[WillJackAnyPlayer]], false)
                                end
                            end},

                            {type = 'checkbox', id = 'carryVehicles',text = 'Carregar VeÃ­culos', desc = 'Utilize para conseguir carregar e arremessar os veÃ­culos'},

                            {type = 'slider',id = 'carryVehIntensity', text = 'Intensidade do arremesso', desc = 'Altere a forÃ§a na qual os veÃ­culos serÃ£o arremessados', table = {value = 100, min = 0, max = 400}},


                            {type = 'checkBox', id = 'enableVehicleGlow', text = 'Glow de veÃ­culos', desc = 'Utilize esta opÃ§Ã£o para ativar o esp glow nos veÃ­culos', func = function ()
                                if elem.checkbox['enableVehicleGlow'] then
                                    Citizen.CreateThread(function ()
                                        while elem.checkbox['enableVehicleGlow'] do
                                            local vehicles = GetGamePool("CVehicle")
                                            for k, vehicle in ipairs(vehicles) do
                                                SetEntityDrawOutline(vehicle, true)
                                                SetEntityDrawOutlineColor(tutu.colors.main[1], tutu.colors.main[2], tutu.colors.main[3], 255)
                                            end
                                            Citizen.Wait(10000)
                                        end
                                    end)
                                else
                                    local vehicles = GetGamePool("CVehicle")
        
                                    for k, vehicle in ipairs(vehicles) do
                                        SetEntityDrawOutline(vehicle, false)
                                    end
                                end
                            end},

                            {type = 'checkbox', id = 'bugAllVeh',bool = 'needControlFuncs', text = 'Bugar VeÃ­culos', desc = 'Utilize esta opÃ§Ã£o para bugar todos os veÃ­culos', func = function (bool)
                                local vehTable = GetGamePool("CVehicle")

                                for k, vehicle in ipairs(vehTable) do
                                    local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(vehicle), true)
                                    if distance <= 100 and GetPedInVehicleSeat(vehicle, -1) == 0 then
                                        if bool then
                                            vehicleModule.getControl(vehicle)
                                            SetVehicleGravityAmount(vehicle, 9999.0)
                                            SetVehicleForwardSpeed(vehicle, (5 * 3) + 0.0)
                                        else
                                            vehicleModule.getControl(vehicle)
                                            SetVehicleGravityAmount(vehicle, 9.8)
                                            SetVehicleForwardSpeed(vehicle, (5 * 3) + 0.0)
                                        end
                                    end
                                end
                            end},

                            {type = 'checkbox', id = 'removeGravityAllVeh', bool = 'needControlFuncs', text = 'Remover Gravidade VeÃ­culos', desc = 'Utilize esta opÃ§Ã£o para remover a gravidade dos veÃ­culos', func = function (bool)
                                local vehTable = GetGamePool("CVehicle")

                                for k, vehicle in ipairs(vehTable) do
                                    local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(vehicle), true)
                                    if distance <= 100 and GetPedInVehicleSeat(vehicle, -1) == 0 then
                                        if bool then
                                            vehicleModule.getControl(vehicle)
                                            SetVehicleGravityAmount(vehicle, 0.0)
                                            SetVehicleForwardSpeed(vehicle, (5 * 3) + 0.0)
                                        else
                                            vehicleModule.getControl(vehicle)
                                            SetVehicleGravityAmount(vehicle, 9.8)
                                            SetVehicleForwardSpeed(vehicle, (5 * 3) + 0.0)
                                        end
                                    end
                                end
                            end},

                            {type = 'checkBox', bool = 'needControlFuncs',id = 'enableMagneto', text = 'Magneto', desc = 'Utilize esta opÃ§Ã£o para magnetizar os veÃ­culos', func = function (bool)
                                if not resourceModule.checkServer("FusionGroup") and not resourceModule.checkProtect("Likizao") and not resourceModule.checkServer("LotusGroup") then
                                    vehicleModule.magnetoForce(elem.checkbox['enableMagneto'])
                                    if not vehicleModule.magnetoWarn then
                                        ui.notify('Utilize a tecla ALT')
                                        vehicleModule.magnetoWarn = true
                                    end
                                end
                            end},
                        }
                    },
                }
            }, 

            {tab = 'clothes', curTab = 'clothes', subtabs = 
            {
                {id = 'clothes', text = 'VestiÃ¡rio', items = 
                    {
                        {type = 'textBox', id = 'setPed', text = 'Alterar Ped', desc = 'Utilize para alterar seu ped', defText = 'mp_m_freemode_01', backText = 'Digite o Modelo', func = function ()
                            if action.getTextBox('setPed') then
                                if interact.modal('confirm', "Alterar Ped", 'FunÃ§Ã£o com risco', 'EstÃ¡ funÃ§Ã£o possui risco de causar banimento \nTem certeza que deseja continuar?', 'umAvisoAlterarPed') then
                                    entityModule.setModelPed(action.getTextBox('setPed'))
                                end
                            end
                        end},
                        {type = 'numberBox', text = 'Jaqueta', id = 'jaquetaChange', desc = 'Utilize para alterar sua jaqueta', defNumbers = {1, 0}, callOnChange = true, func = function()
                            local id = 11
                            local number, style = action.getNumberBox('jaquetaChange')
                            SetPedComponentVariation(PlayerPedId(), id, math.floor(number), style or 0, 0)
                        end},
                        {type = 'numberBox', text = 'CalÃ§a', id = 'calÃ§aChange', desc = 'Utilize para alterar sua calÃ§a', defNumbers = {1, 0}, callOnChange = true, func = function()
                            local id = 4
                            local number, style = action.getNumberBox('calÃ§aChange')
                            SetPedComponentVariation(PlayerPedId(), id, math.floor(number), style or 0, 0)
                        end},
                        {type = 'numberBox', text = 'Camisa', id = 'camisaChange', desc = 'Utilize para alterar sua camisa', defNumbers = {1, 0}, callOnChange = true, func = function()
                            local id = 8
                            local number, style = action.getNumberBox('camisaChange')
                            SetPedComponentVariation(PlayerPedId(), id, math.floor(number), style or 0, 0)
                            
                        end},
                        {type = 'numberBox', text = 'Chapeu', id = 'chapeuChange', desc = 'Utilize para alterar seu chapeu', defNumbers = {1, 0}, callOnChange = true, func = function()
                            local id = 0
                            local number, style = action.getNumberBox('chapeuChange')
                            if number > 0 then
                                SetPedPropIndex(PlayerPedId(), id, number, style, true)
                            else
                                ClearPedProp(PlayerPedId(), id)
                            end
                            
                        end},
                        {type = 'numberBox', text = 'Mascara', id = 'mascaraChange', desc = 'Utilize para alterar sua mascara', defNumbers = {1, 0}, callOnChange = true, func = function()
                            local id = 1
                            local number, style = action.getNumberBox('mascaraChange')
                            SetPedComponentVariation(PlayerPedId(), id, math.floor(number), style or 0, 0)
                            
                        end},
                        {type = 'numberBox', text = 'MÃ£os', id = 'mÃ£osChange', desc = 'Utilize para alterar suas mÃ£os', defNumbers = {1, 0}, callOnChange = true, func = function()
                            local id = 3
                            local number, style = action.getNumberBox('mÃ£osChange')
                            SetPedComponentVariation(PlayerPedId(), id, math.floor(number), style or 0, 0)
                            
                        end},
                        {type = 'numberBox', text = 'Sapatos', id = 'sapatosChange', desc = 'Utilize para alterar seus sapatos', defNumbers = {1, 0}, callOnChange = true, func = function()
                            local id = 6
                            local number, style = action.getNumberBox('sapatosChange')
                            SetPedComponentVariation(PlayerPedId(), id, math.floor(number), style or 0, 0)
                            
                        end},
                        {type = 'numberBox', text = 'Acessorios', id = 'acessoriosChange', desc = 'Utilize para alterar seus acessorios', defNumbers = {1, 0}, callOnChange = true, func = function()
                            local id = 7
                            local number, style = action.getNumberBox('acessoriosChange')
                            SetPedComponentVariation(PlayerPedId(), id, math.floor(number), style or 0, 0)
                            
                        end},
                        {type = 'numberBox', text = 'Oculos', id = 'oculosChange', desc = 'Utilize para alterar seu oculos', defNumbers = {1, 0}, callOnChange = true, func = function()
                            local id = 1
                            local number, style = action.getNumberBox('oculosChange')
                            if number > 0 then
                                SetPedPropIndex(PlayerPedId(), id, number, style, true)
                            else
                                ClearPedProp(PlayerPedId(), id)
                            end
                            
                        end},
                        {type = 'numberBox', text = 'Mochila', id = 'mochilaChange', desc = 'Utilize para alterar sua mochila', defNumbers = {1, 0}, callOnChange = true, func = function()
                            local id = 5
                            local number, style = action.getNumberBox('mochilaChange')
                            SetPedComponentVariation(PlayerPedId(), id, math.floor(number), style or 0, 0)
                            
                        end},
                        {type = 'numberBox', text = 'Brincos', id = 'brincosChange', desc = 'Utilize para alterar sua brincos', defNumbers = {1, 0}, callOnChange = true, func = function()
                            local id = 2
                            local number, style = action.getNumberBox('brincosChange')
                            if number > 0 then
                                SetPedPropIndex(PlayerPedId(), id, number, style, true)
                            else
                                ClearPedProp(PlayerPedId(), id)
                            end
                            
                        end},
                        {type = 'numberBox', text = 'Relogio', id = 'relogioChange', desc = 'Utilize para alterar sua relogio', defNumbers = {1, 0}, callOnChange = true, func = function()
                            local id = 6
                            local number, style = action.getNumberBox('relogioChange')
                            if number > 0 then
                                SetPedPropIndex(PlayerPedId(), id, number, style, true)
                            else
                                ClearPedProp(PlayerPedId(), id)
                            end
                        end},
                        {type = 'numberBox', text = 'Pulseira', id = 'pulseiraChange', desc = 'Utilize para alterar sua pulseira', defNumbers = {1, 0}, callOnChange = true, func = function()
                            local id = 7
                            local number, style = action.getNumberBox('pulseiraChange')
                            if number > 0 then
                                SetPedPropIndex(PlayerPedId(), id, number, style, true)
                            else
                                ClearPedProp(PlayerPedId(), id)
                            end
                        end},
                    }
                },

                {id = 'presets', text = 'PrÃ©definiÃ§Ãµes', items = 
                    {
                        {type = 'textBox', id = 'outfitSave', text = 'Salvar Outfit', desc = 'Utilize estÃ¡ opÃ§Ã£o para salvar o outfit atual', defText = 'Outfit 01', backText = 'Inserir nome', func = function ()
                            if not tutu.outfits then
                                tutu.outfits = {}
                            end

                            if not tutu.comboOutfits then
                                tutu.comboOutfits = {}
                            end
                            
                            if tutu.outfits[action.getTextBox('outfitSave') or "Outfit 01"]  then
                            else
                                tutu.outfits[action.getTextBox('outfitSave')] = {}
                                table.insert(tutu.comboOutfits, action.getTextBox('outfitSave'))

                                local items = 
                                {
                                    11,
                                    4,
                                    8,
                                    0,
                                    1,
                                    3,
                                    6
                                }

                                for i, item in pairs(items) do
                                    local var = GetPedDrawableVariation(PlayerPedId(), item)
                                    tutu.outfits[action.getTextBox('outfitSave')][item] = var
                                end
                            end
                        end},

                        {type = 'comboBox', id = 'outfitsSaved', text = 'Outfits Salvos',defOption = nil, table = tutu.comboOutfits, desc = 'Selecione os outfits que vocÃª mesmo salvou', func = function ()
                            local outfitId = action.getCombo('outfitsSaved')
                                local table = tutu.outfits or {}

                                if table[outfitId] then
                                    for i, item in pairs(table[outfitId]) do
                                        SetPedComponentVariation(PlayerPedId(), i, item, 0, 0)
                                    end
                                end

                        end, outfit = true},

                        {type = 'button', text = 'Virar EstÃ¡tua ', desc = 'Utilize para setar o seu modelo do ped como estÃ¡tua', func = function ()
                            local modelName = 's_m_m_strperf_01'
                            entityModule.setModelPed(modelName)
                        end},

                        {type = 'button', text = 'Virar Gorda ', desc = 'Utilize para setar o seu modelo do ped como a velha gorda', func = function ()
                            local modelName = 'ig_maude'
                            entityModule.setModelPed(modelName)
                        end},

                        {type = 'button', text = 'Virar AÃ§ougueiro ', desc = 'Utilize para setar o seu modelo do ped como aÃ§ougueiro', func = function ()
                            local modelName = 's_m_y_factory_01'
                            entityModule.setModelPed(modelName)
                        end},

                        {type = 'button', text = 'Modelo Masculino', desc = 'Utilize para resetar seu ped para o modelo masculino', func = function ()
                            local modelName = 'mp_m_freemode_01'
                            entityModule.setModelPed(modelName)
                        end},

                        {type = 'button', text = 'Modelo Feminino', desc = 'Utilize para resetar seu ped para o modelo feminino', func = function ()
                            local modelName = 'mp_f_freemode_01'
                            entityModule.setModelPed(modelName)
                        end},
                    }
                },
            }
        },

            {tab = 'exploits', curTab = 'admExploits', subtabs = 
                {
                    {id = 'admExploits', text = 'AdmnistraÃ§Ã£o', items = 
                        {
                            {type = 'checkBox',id = 'admList', text = 'Lista Admnistradores', desc = 'Exiba uma lista na tela com os Admnistradores prÃ³ximos Ã  vocÃª'},
                            {type = 'checkBox',id = 'staticList', text = 'Lista EstÃ¡tica', desc = 'Utilize para manter a lista de admnistradores estÃ¡tica na posiÃ§Ã£o atual', func = function(bool)
                                if bool then
                                    ui.admVars.drag.staticX, ui.admVars.drag.staticY = ui.admVars.drag.x, ui.admVars.drag.y
                                end
                            end},

                            {type = 'checkBox',id = 'admLine', text = 'Exibir Linha', desc = 'Utilize para exibir uma linha rainbow atÃ© o admnistrador'},

                            {type = 'checkBox',id = 'autoTeleport', text = 'Auto Teleport', desc = 'Com estÃ¡ opÃ§Ã£o, vocÃª se teleportarÃ¡ ao haver um staff hÃ¡ 50m'},

                            {type = 'slider',id = 'maxDistanceAdm', text = 'Distancia de Captura', desc = 'Altere a distancia mÃ¡xima no qual serÃ¡ identificado', table = {value = ui.admVars.distanceMax or 100, min = 0, max = 400}},
                        }
                    },

                    {id = 'exploits', text = 'Exploits', items = 
                        {
                            -- {type = 'button', text = 'Remover Log de Kill', desc = 'Utilize para bloquear a log de kills do servidor', func = function()
                            --     prismaX.api.BlockEvent('gameEventTriggered', 'CEventNetworkEntityDamage')
                            --     prismaX.api.BlockEvent('CEventNetworkEntityDamage')
                            -- end},

                            {type = 'checkBox', id = 'enterAnyRadio', bool = 'radioResource', text = 'Entrar em qualquer Radio', desc = 'Utilize para entrar em qualquer radio, policia e diversos', func = function (bool) 
                                if bool then
                                    nt.createTh(function()
                                            GlobalState['radio1fjam310'] = false

                                            -- default RadioInject
                                            local resourceName = action.searchInTable(prismaX.api.GetAvailableResources() or {'nothing'}, 'radio')
                                            if resourceName then
                                                tutu.API.inject(resourceName or 'noResourceName', [[
                                                    local isDev = ]]..tostring(action.isDeveloper() or false)..[[
                                                    if isDev then
                                                        print("radio unlocked here -> "..']]..tostring(resourceName)..[[')
                                                    end
        
                                                    vSERVER.hasPermission = function()
                                                        return true
                                                    end
                                                    GlobalState['radio1fjam310'] = true
                                                ]])
                                            end

                                            if not GlobalState['radio1fjam310']  then
                                                tutu.API.inject('radio', [[
                                                    local isDev = ]]..tostring(action.isDeveloper() or false)..[[
                                                    if isDev then
                                                        print("radio unlocked here -> "..']]..tostring('radio')..[[')
                                                    end
        
                                                    vSERVER.hasPermission = function()
                                                        return true
                                                    end
                                                    GlobalState['radio1fjam310'] = true
                                                ]])
                                                tutu.API.inject('radio_mirtin', [[
                                                    local isDev = ]]..tostring(action.isDeveloper() or false)..[[
                                                    if isDev then
                                                        print("radio unlocked here -> "..']]..tostring('radio_mirtin')..[[')
                                                    end
        
                                                    vSERVER.hasPermission = function()
                                                        return true
                                                    end
                                                    GlobalState['radio1fjam310'] = true
                                                ]])
        
                                                
                                                tutu.API.inject('santa_radio', [[
                                                    local isDev = ]]..tostring(action.isDeveloper() or false)..[[
                                                    if isDev then
                                                        print("radio unlocked here -> "..']]..tostring('santa_radio')..[[')
                                                    end
        
                                                    vSERVER.Frequency = function()
                                                        return true
                                                    end
                                                    GlobalState['radio1fjam310'] = true
                                                ]])
                                            end



                                            if GlobalState['radio1fjam310'] then
                                                print('FunÃ§Ã£o Radio carregada com sucesso!')
                                            end
                                        end)
                                        else
                                            GlobalState['radio1fjam310'] = false
                                            local resourceName = action.searchInTable(prismaX.api.GetAvailableResources() or {'nothing'}, 'radio')
                                            if resourceName then
                                                tutu.API.inject(resourceName or 'noResourceName', [[
                                                    vSERVER.hasPermission = function()
                                                        return false
                                                    end
                                                ]])
                                            end

                                            if not GlobalState['radio1fjam310'] then
                                                tutu.API.inject('radio_mirtin', [[
                                                    vSERVER.hasPermission = function()
                                                        return false
                                                    end
                                                
                                                ]])
                                                tutu.API.inject('radio', [[
                                                    vSERVER.hasPermission = function()
                                                        return false
                                                    end
                                                
                                                ]])
                                            end
                                    end 
                            end},

                            {type = 'checkBox', id = 'ignoreItemRadio', bool = 'radioResource', text = 'Ignorar Item Radio', desc = 'Utilize para entrar em nas radios sem a necessidade do item', func = function (bool)
                                
                                local resourceCheck = (resourceModule.isResourceStarted('radio') or resourceModule.isResourceStarted('radio_mirtin'))
                                if resourceCheck then
                                    if bool then
                                        tutu.API.inject('radio_mirtin', [[
                                            vSERVER.hasRadio = function()
                                                return true
                                            end
                                        
                                        ]])
                                        tutu.API.inject('radio', [[
                                            vSERVER.hasRadio = function()
                                                return true
                                            end
                                        
                                        ]])

                                        tutu.API.inject('santa_radio', [[
                                            vSERVER.CheckRadio = function()
                                                return false
                                            end
                                        
                                        ]])
                                    end 
                                else
                                    ui.notify('FunÃ§Ã£o nÃ£o suportada aqui')
                                end
                            end},

                            -- lotus Funcs
                            {type = 'button', bool = 'LotusGroup', text = 'Deletar VeÃ­culo', desc = 'Utilize para deletar qualquer veÃ­culo selecionado', func = function ()
                                if lists.vars.selVehicle then
                                    if not exploitsModule.lotusGroup.deleteVeh(lists.vars.selVehicle) then
                                        ui.notify('Aguarde '..tostring(exploitsModule.lotusGroup.delay)..'s para deletar')
                                    end
                                end
                            end},

                            {type = 'button', bool = 'LotusGroup', text = 'Criar Barricada', desc = 'Utilize para criar uma barricada na sua frente', func = function ()
                                -- create Barricade
                                
                                
                                
                                
                                local playerPed = PlayerPedId()
                                local coords = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 2.0, 0.0)
                                exploitsModule.lotusGroup.createBarricade(coords)
                            end},

    --                         {type = 'button', bool = 'LotusGroup', fire = true,text = 'Entrar Qualquer Casa', desc = 'Utilize para conseguir entrar em qualquer casa do servidor e abrir baÃºs', func = function ()
    --                             nt.createTh(function()
    --                                 local code = 
    --                                 [[
    --                                         vSERVER.checkEnterHouse = function()
    -- return true
    -- end

    -- vSERVER.checkOpenPermission = function()
    -- return true
    -- end
    --                                 ]]
    --                                 tutu.API.inject('mirtin_homes', code)
    --                             end)
    --                         end},

                            {type = 'button', bool = 'LotusGroup', fire = true, text = 'Abrir Qualquer Garagem', desc = 'Utilize para conseguir abrir qualquer garagem, seja da policia e etc', func = function ()
                                nt.createTh(function()
                                            -- LOTUSGROUP
        local code = -- VersÃ£o antiga
        [[
            vTunnel.garageCheckPermission = function()
                return true
            end

            vTunnel.garageCheckHouseOwner = function()
                return true
            end

        ]]

        tutu.API.inject('bm_module', code)



        local code = -- VersÃ£o Nova
        [[
            serverFunctions.garageCheckPermission = function()
                return true
            end

            serverFunctions.garageCheckHouseOwner = function()
                return true
            end

        ]]

        tutu.API.inject('lotus_garage', code)
                                end)
                            end},


                            -- fusion Funcs
                            {type = 'button', bool = 'FusionGroup', text = 'Remover Blacklist Armas', desc = 'Utilize para remover a blacklist de armas', func = function ()
                            local code = 
                            [[
                                blackWeapons = 
                                {
                                    'goFuckYSelfMQCU',
                                }
                            ]]

                            tutu.API.inject('core_misc', code)
                            end},

                            -- NowayGroup Funcs
                            {type = 'button', bool = 'NowayGroup', text = 'Remover Blacklist Armas', desc = 'Utilize para remover a blacklist de armas', func = function ()
                                local code = 
                                [[
                                blackWeapons = 
                                {
                                    'goFuckYSelfMQCU',
                                }
                                ]]
    
                                tutu.API.inject('core', code)
                            end},

                            -- space Funcs
                            {type = 'button', bool = 'SpaceGroup', text = 'Remover Blacklist Armas', desc = 'Utilize para remover a blacklist de armas', func = function ()
                                local code = 
                                [[
                                blacklistedWeapons = 
                                {
                                    'goFuckYSelfMQCU',
                                }
                                ]]
    
                                tutu.API.inject('space-services', code)
                            end},

                            -- nexus Funcs
                        }
                    },

                    {id = 'autofarm', text = 'AutoFarm', items = 
                        {
                            {type = 'checkBox', id = 'autoFarm', text = 'Auto Farm', desc = 'Utilize para farmar automÃ¡ticamente dinheiro ou diversos'},
                            {type = 'checkBox', id = 'farmInVeh', text = 'Farm no VeÃ­culo', desc = 'Utilize para farmar sem sair do veÃ­culo'},
                        }
                    },
                }
            },

            {tab = 'config', curTab = 'menuConfig', subtabs = 
                {
                    {id = 'menuConfig', text = 'Config Menu', items = 
                        {
                            {type = 'bindSelect', defKey = tutu.main.keyText or 'MBUTTON',id = 'bindMenu', text = 'Tecla InicializaÃ§Ã£o', desc = 'Utilize para alterar a tecla de inicializaÃ§Ã£o do menu'},

                            {type = 'button', text = 'Desinjetar Menu', desc = 'EstÃ¡ opÃ§Ã£o desinjetarÃ¡ o menu', func = function ()
                                tutu.vars.breakThreads = true
                            end},

                            {type = 'checkbox', id = 'chrismasTheme', text = 'Tema Natalino', desc = 'Este Ã© um tema incrivel feito especialmente para o natal com tutu menu', func = function(bool)
                                tutu.performaceVars.natalTheme = bool
                                if not bool then
                                    tutu.colors.main = {121, 98, 219, 255}
                                else
                                    tutu.colors.main = {217, 89, 114, 255}
                                end
                            end},

                            {type = 'checkbox', id = 'snowFlake', text = 'Particulas de Neve', desc = 'EstÃ¡ opÃ§Ã£o irÃ¡ exibir particulas de neve caindo pela tela'},


                            {type = 'checkbox', id = 'pauseGame', text = 'Pausar Jogo', desc = 'Utilize estÃ¡ opÃ§Ã£o para pausar o jogo quando o menu estiver aberto', func = function ()
                                if elem.checkbox['pauseGame'] then
                                    SetGamePaused(true)
                                else
                                    SetGamePaused(false)
                                end
                            end},


                            {type = 'checkbox', id = 'whiteTheme', text = 'Tema Claro', desc = 'Altere o tema do menu para', func = function (bool)
                                if bool then
                                    others.setTheme('white')
                                else
                                    others.setTheme('dark')
                                end
                            end},

                            {type = 'checkbox', id = 'syncTheme', text = 'Sincronizar Tema', desc = 'Utilize para alterar o tema automÃ¡ticamente conforme o tempo', func = function (bool)
                                nt.createTh(function()
                                    while elem.checkbox['syncTheme'] do
                                        local hours = GetClockHours()
                                        if hours >= 21 or hours <= 5 then
                                            if tutu.main.currentTheme ~= 'white' then
                                                others.setTheme('white')
                                            end
                                        else
                                            if tutu.main.currentTheme ~= 'dark' then
                                                others.setTheme('dark')
                                            end
                                        end
                                    Wait(2000)
                                    end
                                end)
                                
                            end},

                            {type = 'checkbox', id = 'blockControls', text = 'Desabilitar Controles', desc = 'Utilize para desabilitar controles do mouse'},
                        }
                    },

                    {id = 'visualConfig', text = 'OtimizaÃ§Ã£o', items = 
                        {
                            {type = 'checkBox', id = 'animMenu', text = 'Animar Menu', desc = 'Com esta opÃ§Ã£o desativada, o menu ficarÃ¡ completamente sem animaÃ§Ãµes', func = function ()
                                tutu.animVars.enable = elem.checkbox['animMenu']
                            end},

                            {type = 'checkBox', id = 'desempenhoMode', text = 'Modo Desempenho', desc = 'Utilize o modo desempenho para aumentar seus FPS', func = function ()
                                if elem.checkbox['desempenhoMode'] then
                                    SetTimecycleModifier("cinema")
                                else
                                    SetTimecycleModifier("default")
                                end
                            end},

                            {type = 'checkBox', id = 'renderGame', text = 'ForÃ§ar RenderizaÃ§Ã£o', desc = 'Utilize para forÃ§ar a renderizaÃ§Ã£o do jogo'},

                                
                            {type = 'slider', text = 'Intensidade RenderizaÃ§Ã£o', format = 'onlyText', id = 'renderGame', desc = 'Utilize para diminuir ou aumentar a renderizaÃ§Ã£o', table = {value = 1.0, min = 0.0, max = 1.0}},
                                
                            {type = 'checkBox', id = 'renderEntities', text = 'Distancia Render Entidades', desc = 'Altere a distancia de renderizaÃ§Ã£o das entidades', func = function(bool)
                                Citizen.CreateThread(function ()
                                    if bool then
                                        while elem.checkbox['renderEntities'] do
                                            local value = math.floor(action.getSlider('distanceRenderEntities'))

                                            others.defRenderVehicles(value)
                                            others.defRenderPeds(value)

                                            Wait(10000)
                                        end
                                    end
                                end)
                            end},

                            {type = 'slider', text = 'Distancia Render', id = 'distanceRenderEntities', desc = 'Utilize para regular a distancia de renderizaÃ§Ã£o de entitites', table = {value = 120, min = 0, max = 400}},
                        
                        }
                    },

                    {id = 'devOptions', text = 'Desenvolvimento', items = 
                        {

                            {type = 'checkBox', id = 'velTxt', text = 'Velocimetro', desc = 'Utilize para exibir o velocimetro'}, 

                            {type = 'checkBox', id = 'objectVisuals', text = 'Visual Objetos', desc = 'Este Ã© um esp de objetos'},

                            {type = 'checkBox', id = 'blockCarryH', text = 'Bloquear H', desc = 'EstÃ¡ funÃ§Ã£o impedirÃ¡ de lhe carregaram no H', func = function(bool)
                                local resources = 
                                {
                                    "vrp",
                                    "player",
                                    "core",
                                    "vrp_admin",
                                    "vrp_policia",
                                    "police"
                                }

                                -- def code
                                local code = [[]]
                                if bool then
                                    code =
                                    [[
                                    if not _G.oldAttachEntityToEntity then                       
                                        _G.oldAttachEntityToEntity = _G.AttachEntityToEntity  
                                    end        
                                
                                    _G.AttachEntityToEntity = function(entity1, entity2, boneIndex, xPos, yPos, zPos, xRot, yRot, zRot, p9, useSoftPinning, collision, isPed, vertexIndex, fixedRot)
                                        if entity1 == _G.PlayerPedId() then
                                        return true
                                        end
                                        return _G.oldAttachEntityToEntity(entity1, entity2, boneIndex, xPos, yPos, zPos, xRot, yRot, zRot, p9, useSoftPinning, collision, isPed, vertexIndex, fixedRot)
                                    end   
                                    ]]  
                                else
                                    code = 
                                    [[
                                        if _G.oldAttachEntityToEntity then
                                            _G.AttachEntityToEntity = _G.oldAttachEntityToEntity
                                        end
                                    ]]
                                end

                                for i, resourceName in ipairs(resources) do
                                    if resourceName then
                                        if action.searchInTable(prismaX.api.GetAvailableResources() or {'nothing'}, resourceName) then
                                            print("... : "..resourceName)
                                            tutu.API.inject(resourceName, code)
                                        end
                                    end
                                end
                            end},

                            {type = 'button', text = 'Explodir', desc = 'Utilize para explodir', func = function ()
                                nt.createTh(function()
                                    if lists.vars.selPlayer then
                                        local target = GetPlayerPed(lists.vars.selPlayer)
                                        local targetCoords = GetEntityCoords(target)
                                        vehicleModule.spawnAndDo('pounder', GetEntityCoords(GetPlayerPed(lists.vars.selPlayer)),
                                        [[
                                            Citizen.CreateThread(function()
                                                    local target = ]]..target..[[
                                                    local tX, tY, tZ = ]]..targetCoords.x..[[,]]..targetCoords.y..[[,]]..targetCoords.z..[[
                                                    _G.Citizen.InvokeNative(0xEA1C610A04DB6BBB, vehicle, false)
                                                    SetVehicleGravityAmount(vehicle, 99999.0)
                                                    _G.Citizen.InvokeNative(0xAB54A438726D25D5, vehicle, (1 * 3) + 0.0)
                                                    print(':)')
                                                    _G.Citizen.InvokeNative(0xB77D05AC8C78AADB, vehicle, 101)
                                                    _G.Citizen.InvokeNative(0x45F6D8EEF34ABEF1, vehicle, 100)
                                                    LocalPlayer.state.vehicleBug = vehicle
                                                    for i = 0, 50 do
                                                        SetEntityCoords(vehicle, tX, tY, tZ)
                                                        Wait(100)
                                                    end
                                                    Wait(4000)
                                                    _G.DeleteVehicle(vehicle)
                                                    
                                            end)
                                        ]]
                                        )
                                    end
                                end)
                            end},

                            {type = 'button', text = 'Barricada no Carro', desc = 'Criar barricada no carro', func = function ()
                                nt.createTh(function()
                                    if lists.vars.selVehicle then
                                        local coords = GetEntityCoords(lists.vars.selVehicle)
                                        local object = exploitsModule.lotusGroup.createBarricade(coords)
                                        for i = 0, 20 do
                                            SetEntityCoords(object, GetEntityCoords(lists.vars.selVehicle))
                                            Wait(100)
                                        end
                                    end
                                end)
                            end},

                            {type = 'checkbox', id = 'botarParaMamar', text = 'Botar pra mamar', desc = 'Utilize para botar o player para te mamar', func = function (bool)
                                nt.createTh(function()
                                    if bool then
                                        if lists.vars.selPlayer then
                                            local playerPed = GetPlayerPed(lists.vars.selPlayer)
                                            local targetCoords = GetEntityCoords(playerPed)
                                            SetEntityCoords(PlayerPedId(), targetCoords)
                                            Wait(100)
                                            AttachEntityToEntity(PlayerPedId(), playerPed, 31086, 0.29, 0.0, 0.9, 0.0, 0.0, 90.0, false, false, false, true, 1, false)

                                                
                                            local animDict = "rcmpaparazzo_2"
                                            local animName = "shag_loop_a"

                                            RequestAnimDict(animDict)
                                            local verifyModel = 0
                                            while not HasAnimDictLoaded(animDict) do
                                                Citizen.Wait(2000)
                                                verifyModel = verifyModel + 1
                                                if verifyModel == 5 then
                                                    break
                                                end
                                            end

                                            TaskPlayAnim(PlayerPedId(), animDict, animName, 8.0, -8.0, -1, 1, 0, false, false,
                                            false)
                                        end
                                    else
                                        DetachEntity(PlayerPedId())
                                        ClearPedTasks(PlayerPedId())
                                        StopAnimTask(lists.vars.selPlayer, "amb@prop_human_bum_shopping_cart@male@base", "base", 1)
                                    end
                                    
                                end)
                            end},

                            {type = 'button', text = 'Grudar Player', desc = 'foda-see', func = function ()
                                nt.createTh(function()
                                    if lists.vars.selPlayer then
                                        vehicleModule.spawnAndDo('t20', GetEntityCoords(PlayerPedId()), 
                                        [[
                                            local playerPed = PlayerPedId()
                                            local playerCoords = GetEntityCoords(playerPed)
                                            attachedPed = ]]..GetPlayerPed(lists.vars.selPlayer)..[[
                                            AttachEntityToEntityPhysically(
                                                vehicle,
                                                attachedPed,
                                                0,
                                                0,
                                                0.0, 0.0, 0.5,
                                                0.0, 0.0, 0.0,
                                                0.0, 0.0, 0.0,
                                                0.0, 0.0, 0.0,
                                                100.0,
                                                true, true,
                                                true, true
                                            )

                                            Citizen.CreateThread(function()
                                                while true do
                                                Wait(1)
                                                    SetEntityCoordsNoOffset(vehicle, GetEntityCoords(PlayerPedId()))
                                                end
                                            end)
                                        ]])
                                    end
                                end)
                            end},
                            
                        

                            {type = 'button', text = 'Mandar RcBandito', desc = 'Utilize para enviar um rc bandito', func = function ()
                                nt.createTh(function()
                                    if lists.vars.selPlayer then
                                        nt.createTh(function()
                                            local coords = GetEntityCoords(PlayerPedId())
                                            vehicleModule.spawnAndDo('rcbandito', {x = coords.x + math.random(-5, 10),  y = coords.y + math.random(-5, 10), z = coords.z}, 
                                            [[
                                                Citizen.CreateThread(function()
                                                local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(]]..lists.vars.selPlayer..[[)))

                                                SetVehicleEngineOn(vehicle, true)
                                                Citizen.CreateThread(function()
                                                    local pedModel = GetHashKey('mp_m_freemode_01')
                                                RequestModel(pedModel)
                                                while not HasModelLoaded(pedModel) do
                                                    Wait(1000)
                                                    RequestModel(pedModel)  
                                                end
                                                local ped = CreatePedInsideVehicle(vehicle, 4, GetHashKey('mp_m_freemode_01'), -1, false, true)
                                                SetVehicleEngineOn(vehicle, true)

                                                TaskVehicleDriveToCoord(ped, vehicle,x, y, z, 200.0, true, GetHashKey(rcbandito), 1074528293, 0.5, 1)
                                                -- explode thread
                                                Citizen.CreateThread(function()
                                                    local bool = ]]..tostring((elem.checkbox['explodeRc'] or false))..[[
                                                    while bool do
                                                    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(]]..lists.vars.selPlayer..[[)))
                                                    TaskVehicleDriveToCoord(ped, vehicle,x, y, z, 200.0, true, GetHashKey(rcbandito), 1074528293, 0.5, 1)
                                                    bool = ]]..tostring((elem.checkbox['explodeRc'] or false))..[[
                                                        local distance = GetDistanceBetweenCoords(GetEntityCoords(vehicle), x, y, z, false)
                                                        if distance < 5 then
                                                            NetworkExplodeVehicle(vehicle, true, false, true)
                                                            Wait(1000)
                                                            DeleteVehicle(vehicle)
                                                            break
                                                        end
                                                        Wait(10)
                                                    end
                                                end)
                                                end)
                                                end)
                                            ]])
                                        end)
                                    end
                                end)
                            end},

                            {type = 'button', text = 'Painel Roubos ALTA', desc = 'Utilize para enviar um rc bandito', func = function ()
                                nt.createTh(function()
                                    local code = 
                                    [[
                                        vSERVER.getPermission = function()
                                        return true
                                        end
                                    
                                    
                                    ]]
                                    
                                    tutu.API.inject('lotus_roubos', code)
                                end)
                            end},

                            {type = 'button', text = 'Remover BlackList Usuarios', desc = 'Utilize para enviar um rc bandito', func = function ()
                                nt.createTh(function()
                                    local code = 
                                    [[
                                        print('injetado com sucesso!')
                                        vRP.hasPermission = function()
                                            return true
                                        end
                                    ]]

                                    tutu.API.inject('mirtin_orgs_v2', code)
                                end)
                            end},

                            {type = 'button', text = 'Abrir qualquer FARM LOTUS', desc = 'Utilize para abrir qualquer craft na lotusgroup', func = function ()
                                local code =
                                [[
                                  
                                    vTunnel.checkOpenCraft = function()
                                        return true
                                    end
                                
                                ]]
                                
                                tutu.API.inject('lotus_craft', code)
                            end},

                            

                            


                            {type = 'checkbox', id = 'explodeRc', text = 'Explodir RcBandito', desc = 'Utilize para explodir o rc'},
                        },
                    },

                    {id = 'devTests', text = 'FunÃ§Ãµes Testes', items = 
                    {
                            
                    },
                },
                }
            },

            {tab = 'vehicle', curTab  = 'vehicleOptions', subtabs = 
                {

                            {id = 'vehicleOptions', text = 'OpÃ§Ãµes VeÃ­culo', items = 
                        {

                            {type = 'textBox', id = 'changePlate', text = 'Alterar Placa', desc = 'Escreva a nova placa que deseja no veÃ­culo', defText = '', backText = 'Insira a placa desejada', func = function()
                                if IsPedInAnyVehicle(PlayerPedId(), -1) then
                                    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                    local plate = action.getTextBox('changePlate')
                                    SetVehicleNumberPlateText(vehicle, plate)
                                end
                            end},

                            {type = 'button', text = 'Reparar VeÃ­culo', desc = 'Utilize esta opÃ§Ã£o para reparar e desvirar seu veÃ­culo', func = function ()
                                local vehicle = GetVehiclePedIsIn(PlayerPedId())
                                vehicleModule.repairVeh(vehicle)
                                SetEntityCoordsNoOffset(vehicle, GetEntityCoords(vehicle))
                                TriggerEvent("syncreparar", VehToNet(GetVehiclePedIsIn(PlayerPedId())))
                            end},

                            {type = 'button', text = 'Tunar VeÃ­culo', desc = 'Utilize esta opÃ§Ã£o para tunar seu veÃ­culo', func = function ()
                                if (IsPedInAnyVehicle(PlayerPedId())) then
                                    local vehicle = GetVehiclePedIsUsing(PlayerPedId())
                                    vehicleModule.tuneVeh(vehicle)
                                end
                            end},

                            {type = 'colorpicker', id = 'paintVehicle', defcolor = {20, 20, 20, 255}, text = 'Pintar VeÃ­culo', desc = 'Altere a cor de seu veÃ­culo facilmente', func = function(color)
                                local vehicle = GetVehiclePedIsUsing(PlayerPedId(-1))
                                SetVehicleCustomPrimaryColour(vehicle, color[1], color[2], color[3])
                                SetEntityAlpha(vehicle, color[4])
                            end},

                            {type = 'button', text = 'Teleport PrÃ³ximo', desc = 'Utilize esta opÃ§Ã£o para teleportar ao veÃ­culo mais prÃ³ximo', func = function ()
                                local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 8000.0, 0, 70)
                                if vehicle ~= nil then
                                    vehicleModule.Teleport(vehicle)
                                end
                            end},

                            {type = 'comboBox', id = 'lockOrUnlock', text = 'Destrancar ou Trancar',defOption = 'Destrancar', table = {'Destrancar', 'Trancar'}, desc = 'Selecione para destrancar ou trancar o veÃ­culo prÃ³ximo', func = function ()
                                local vehicle = vehicleModule.getClosestVehicle(GetEntityCoords(PlayerPedId()), 20)

                                if DoesEntityExist(vehicle) then
                                    if action.getCombo('lockOrUnlock') == "Destrancar" then
                                        vehicleModule.getControl(vehicle)
                                        Citizen.InvokeNative(0xB664292EAECF7FA6, vehicle, 1)
                                        Citizen.InvokeNative(0x517AAF684BB50CD1, vehicle, PlayerId(), false)
                                        Citizen.InvokeNative(0xA2F80B8D040727CC, vehicle, false)
                                    elseif action.getCombo('lockOrUnlock') == "Trancar" then
                                        vehicleModule.getControl(vehicle)
                                        SetVehicleDoorsLocked(vehicle, 1)
                                        SetVehicleDoorsLockedForPlayer(vehicle, PlayerId(), true)
                                        SetVehicleDoorsLockedForAllPlayers(vehicle, true)
                                    else
                                        vehicleModule.getControl(vehicle)
                                        Citizen.InvokeNative(0xB664292EAECF7FA6, vehicle, 1)
                                        Citizen.InvokeNative(0x517AAF684BB50CD1, vehicle, PlayerId(), false)
                                        Citizen.InvokeNative(0xA2F80B8D040727CC, vehicle, false)
                                    end
                                end
                            end},

                            {type = 'checkBox', id = 'autoRepair', text = 'Auto Reparar', desc = 'Utilize esta opÃ§Ã£o para reparar seu veÃ­culo automÃ¡ticamente'},

                            {type = 'checkBox', id = 'forceEngine', text = 'ForÃ§ar Motor', desc = 'Utilize esta opÃ§Ã£o para ligar o motor automaticamente'},

                            {type = 'checkBox', id = 'superBreak', text = 'Super Freio', desc = 'Utilize esta opÃ§Ã£o para freiar instantaneamente'},

                            {type = 'checkBox', id = 'vehicleHandling', text = 'Super VeÃ­culo', desc = 'Utilize esta opÃ§Ã£o para turbinar seu veÃ­culo', func = function ()
                                if not elem.checkbox['vehicleHandling'] then
                                    if (IsPedInAnyVehicle(PlayerPedId())) then
                                        local vehicle = GetVehiclePedIsIn(PlayerPedId())
                                        --SetEntityMaxSpeed(vehicle, 400.0)
                                        SetVehicleGravityAmount(vehicle, 9.8)
                                    end
                                end
                            end},

                            -- {type = 'slider', text = 'Multiplicador Super VeÃ­culo', id = 'speedMultiple', desc = 'Selecione o multiplicador de velocidade do super veÃ­culo', table = {value = 1.0, min = 0.0, max = 20.0}},

                            {type = 'checkBox', id = 'enableVehWeapons', text = 'Habilitar Armas VeÃ­culo', desc = 'Utilize para habilitar as armas deste veÃ­culo, caso haja'},

                            {type = 'checkBox', id = 'ghostVehicle', text = 'VeÃ­culo Fantasma', desc = 'EstÃ¡ opÃ§Ã£o irÃ¡ desabilitar qualquer ataque e diversos no veiculo', func = function(bool)
                                if IsPedInAnyVehicle(PlayerPedId(), -1) then
                                    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                    SetGhostedEntityAlpha(100)
                                    SetNetworkVehicleAsGhost(vehicle, bool)
                                    NetworkSetEntityGhostedWithOwner(vehicle ,bool)
                                end
                            end},

                            {type = 'checkBox', id = 'enableBikeKick', text = 'Habilitar Chute Moto', desc = 'Utilize para ativar o chute de dentro da moto'},

                            {type = 'checkBox', id = 'topInVehicle', text = 'Subir nos veÃ­culos', desc = 'Utilize para conseguir subir no teto dos veÃ­culos sem cair', func = function(bool)
                                    OverridePedsCanStandOnTopFlag(bool)
                            end},

                            {type = 'checkBox', id = 'nofallVehicle', text = 'NÃ£o cair da moto', desc = 'Utilize para manter-se fixo em cima da moto', func = function(bool)
                                    if not bool then
                                        SetPedCanBeKnockedOffVehicle(PlayerPedId(), true)
                                        SetPedCanRagdoll(PlayerPedId(), true)
                                    end
                            end},   

                            {type = 'checkBox', id = 'rgbVehicle', text = 'VeÃ­culo RGB', desc = 'Deixe seu veÃ­culo com efeito RGB'},

                            {type = 'checkBox', id = 'hornBoost', text = 'Boost Buzina', desc = 'Utilize para intensificar a velocidade de seu veÃ­culo com a buzina'},

                            {type = 'slider', text = 'Intensidade Boost', id = 'boostIntensity', desc = 'Selecione o a intensidade que serÃ¡ o boost', table = {value = 10.0, min = 0.0, max = 50.0}},

                            {type = 'comboBox', id = 'direction', text = 'DireÃ§Ã£o',defOption = 'Frente', table = {'Frente', 'TrÃ¡s'}, desc = 'Selecione a direÃ§Ã£o do boost buzina'},
                        }
                    },

                    {id = 'vehicleSpawn', text = 'OpÃ§Ãµes Spawn', items = 
                        {
                            {type = 'textBox', id = 'vehicleSpawn', text = 'Spawnar VeÃ­culo', desc = 'Escreva o veÃ­culo desejado e entÃ£o clique no botÃ£o para spawnar', defText = 'KURUMA', backText = 'Digite o Modelo', func = function ()
                                vehicleModule.spawn(action.getTextBox('vehicleSpawn'))
                            end},

                            {type = 'textBox', id = 'spawnPlate', text = 'Placa de Spawn', desc = 'Escreva a placa que deseja no veÃ­culo', defText = '', backText = 'Insira a placa desejada'},

                            {type = 'button', text = 'VeÃ­culos MOD F8', desc = 'Utilize para exibir o nome dos veÃ­culos mod no F8', func = function ()
                                for i, table in ipairs(tutu.vars.spawnVehlList) do
                                    local vehName = table.name
                                    local vehHash = table.hash
                                    print(vehName.." -> hash: "..vehHash)
                                end
                            end},

                            {type = 'checkBox', id = 'tuneSpawn', text = 'Spawnar Tunado', desc = 'Ao ativar esta opÃ§Ã£o, o veÃ­culo serÃ¡ spawnado jÃ¡ tunado'},

                            {type = 'checkBox', id = 'spawnInVeh', text = 'Spawnar Dentro', desc = 'Ao ativar esta opÃ§Ã£o, vocÃª spawnara dentro do veÃ­culo'},
    

                            {type = 'button', text = 'Spawnar KURUMA', desc = 'Utilize este botÃ£o para spawnar o veÃ­culo KURUMA', func = function ()
                                vehicleModule.spawn('Kuruma')
                            end},

                            {type = 'button', text = 'Spawnar T20', desc = 'Utilize este botÃ£o para spawnar o veÃ­culo T20', func = function ()
                                vehicleModule.spawn('T20')
                            end},

                            {type = 'button', text = 'Spawnar Panto', desc = 'Utilize este botÃ£o para spawnar o veÃ­culo Panto', func = function ()
                                vehicleModule.spawn('Panto')
                            end},

                            {type = 'button', text = 'Spawnar Akuma', desc = 'Utilize este botÃ£o para spawnar o veÃ­culo Akuma', func = function ()
                                vehicleModule.spawn('Akuma')
                            end},

                            {type = 'button', text = 'Spawnar Buzzard Desarmado', desc = 'Utilize este botÃ£o para spawnar o veÃ­culo Buzzard Desarmado', func = function ()
                                vehicleModule.spawn('buzzard2')
                            end},

                            {type = 'button', text = 'Spawnar Buzzard Armado', risk = 'Este veÃ­culo provavelmente estÃ¡ na blacklist', desc = 'Utilize este botÃ£o para spawnar o veÃ­culo Buzzard Armado', func = function ()
                                vehicleModule.spawn('buzzard')
                            end},

                            {type = 'button', text = 'Spawnar Jetski', desc = 'Utilize este botÃ£o para spawnar o veÃ­culo Jetski', func = function ()
                                vehicleModule.spawn('seashark')
                            end},

                            {type = 'button', text = 'Spawnar Tanque', risk = 'Este veÃ­culo provavelmente estÃ¡ na blacklist', desc = 'Utilize este botÃ£o para spawnar o veÃ­culo Tanque', func = function ()
                                vehicleModule.spawn('rhino')
                            end},

                            {type = 'button', text = 'Spawnar Khanjali', risk = 'Este veÃ­culo provavelmente estÃ¡ na blacklist', desc = 'Utilize este botÃ£o para spawnar o veÃ­culo Khanjali', func = function ()
                                vehicleModule.spawn('Khanjali')
                            end},

                            {type = 'button', text = 'Spawnar MiniTank', risk = 'Este veÃ­culo provavelmente estÃ¡ na blacklist', desc = 'Utilize este botÃ£o para spawnar o veÃ­culo MiniTank', func = function ()
                                vehicleModule.spawn('minitank')
                            end},

                            {type = 'button', text = 'Spawnar BMX', desc = 'Utilize este botÃ£o para spawnar o veÃ­culo BMX', func = function ()
                                vehicleModule.spawn('bmx')
                            end},
                            

                        }
                    }
                }
            },

            {tab = 'weapon', curTab  = 'weaponOptions', subtabs = 
                {
                    {id = 'weaponOptions', text = 'OpÃ§Ãµes Arma', items = 
                        {
                            {type = 'textBox', id = 'weaponSpawn', text = 'Spawnar Arma', desc = 'Escreva a arma desejada e entÃ£o clique no botÃ£o para spawnar', defText = 'WEAPON_', backText = 'Digite a Arma', func = function ()
                                weaponModule.spawn(action.getTextBox('weaponSpawn'), 200)
                            end},
                            {type = 'comboBox', id = 'removeWeapon', text = 'Remover Arma(s)',defOption = 'Todas as Armas', table = {'Todas as Armas', 'Apenas Atual'}, desc = 'Utilize estÃ¡ opÃ§Ã£o para remover todas as armas ou sua arma atual', func = function ()
                                if action.getCombo('removeWeapon') == 'Apenas Atual' then
                                    local weapon = GetSelectedPedWeapon(PlayerPedId())
                                    if weapon ~= GetHashKey('WEAPON_UNARMED') then
                                        RemoveWeaponFromPed(PlayerPedId(), weapon)
                                    end
                                else
                                    RemoveAllPedWeapons(PlayerPedId())
                                end
                            end},
                            {type = 'slider', text = 'Setar MuniÃ§Ã£o', id = 'setAmmo', desc = 'Utilize para setar a muniÃ§Ã£o de sua arma atual', table = {value = 100, min = 0, max = 300}, func = function()
                                local selectedWeapon = GetSelectedPedWeapon(PlayerPedId())
                                local weaponName = 'WEAPON_UNARMED'
                                for i, weapon in ipairs(lists.weaponTable) do
                                    if GetHashKey(weapon.hash) == selectedWeapon then
                                        local ammoCount = action.getSlider('setAmmo') or 100
                                        weaponName = weapon.hash
                                        if weaponName ~= 'WEAPON_UNARMED' then
                                            weaponModule.spawn(weaponName, ammoCount)
                                        end
                                    end
                                end
                                
                            end},
                            {type = 'button', text = 'Adicionar Componentes', desc = 'Adicione os componentes/attachs na sua arma atual', func = function ()
                                weaponModule.addComponents()
                            end},
                            {type = 'button', text = 'Remover Componentes', desc = 'Remova os componentes/attachs na sua arma atual', func = function ()
                                weaponModule.removeComponents()
                            end},
                            {type = 'comboBox', id = 'specificComponent', text = 'Componente EspecÃ­fico',defOption = 'Silenciador', table = {'Silenciador', 'Equipamento', 'Carregador', 'Lanterna', 'Mira'}, desc = 'Adicione um componente especÃ­fico a sua arma', func = function ()
                                weaponModule.specificComponent(action.getCombo('specificComponent'))
                            end},

                            -- {type = 'slider', text = 'Setar MuniÃ§Ã£o', id = 'setAmmo', desc = 'Utilize para setar a muniÃ§Ã£o de sua arma atual', table = {value = 100, min = 0, max = 300}, func = function()
                            --     local currentAmmo = GetAmmoInPedWeapon(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()))
                            --     if currentAmmo == 0 or currentAmmo == false or currentAmmo == nil then
                            --         SetPedAmmo(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), math.floor(tonumber(action.getSlider('setAmmo'))) or 100)
                            --     end
                            -- end},

                            {type = 'checkBox', id = 'enableWeaponWheel', text = 'Habilitar Barra de Armas', desc = 'Utilize estÃ¡ opÃ§Ã£o para habilitar a barra de armas', func = function()
                                local priority = 0
                                nt.createTh(function()
                                    SetThreadPriority(priority)
                                        while elem.checkbox['enableWeaponWheel'] do
                                            Wait(0)
                                            if elem.checkbox['enableWeaponWheel'] then 
                                                local ped = PlayerPedId()
                                                SetThreadPriority(priority)
                                                ScriptThreadIteratorReset()
                                                SetLocalPlayerAsGhost(false)
                                                NetworkSetFriendlyFireOption(true)
                                                SetPedConfigFlag(ped, 48, false)
                                                SetPedConfigFlag(ped, 186, false)
                                                DisableControlAction(0, 37, false)
                                                EnableControlAction(0, 37, true)
                                                EnableControlAction(0, 37, true)
                                                EnableControlAction(0, 37, true)
                                                EnableControlAction(0, 37, true)
                                                EnableControlAction(0, 37, true)
                                                EnableControlAction(0, 37, true)
                                                EnableControlAction(0, 158, true)
                                                EnableControlAction(0, 159, true)
                                                EnableControlAction(0, 160, true)
                                                EnableControlAction(0, 24, true)
                                                EnableControlAction(0, 140, true)
                                                EnableControlAction(0, 141, true)
                                                EnableControlAction(0, 261, true)
                                                EnableControlAction(0, 262, true)
                                                EnableControlAction(0, 12, true)
                                                EnableControlAction(0, 13, true)
                                                EnableControlAction(0, 14, true)
                                                EnableControlAction(0, 15, true)
                                                EnableControlAction(0, 16, true)
                                                EnableControlAction(0, 17, true)
                                                EnableControlAction(0, 142, true)
                                                EnableControlAction(0, 106, true)
                                                EnableControlAction(0, 263, true)
                                                SetPedCombatAttributes(ped, 54, true)
                                                SetPedCanSwitchWeapon(ped, true)
                                                SetCanPedEquipAllWeapons(ped, true)
                                                DisplayHud(true)
                                                ResetHudComponentValues(19)
                                                ResetHudComponentValues(22)
                                                ShowScriptedHudComponentThisFrame(19)
                                                ShowScriptedHudComponentThisFrame(22)
                                                local currentWeapon = GetSelectedPedWeapon(PlayerPedId())
                                                if currentWeapon and currentWeapon ~= GetHashKey('WEAPON_UNARMED') then
                                                    SetCurrentPedWeapon(PlayerPedId(), currentWeapon, true)
                                                end
                                            end
                                        end
                                end)
                            end},

                            {type = 'checkBox', id = 'rapidFire', text = 'Rapid Fire', desc = 'Utilize o rapid fire para atirar em uma velocidade muito alta', func = function ()
                                if elem.checkbox['rapidFire'] then
                                    nt.createTh(function()
                                        while elem.checkbox['rapidFire'] do
                                            Citizen.Wait(60)
                                            if IsDisabledControlPressed(0, 24) and IsDisabledControlPressed(0, 25) then
                                                local weapon = GetSelectedPedWeapon(PlayerPedId())
                                                local wepent = GetCurrentPedWeaponEntityIndex(PlayerPedId())
                                                local launchPos = GetEntityCoords(wepent)
                                                local targetPos = GetGameplayCamCoord() +
                                                    (weaponModule.RotationDirection(GetGameplayCamRot(2)) * 200.0)
                                                RequestModel(weapon)
                                                RequestModel(GetHashKey(weapon))
                                                RequestWeaponAsset(GetHashKey(weapon), 31, 0)
                                                local damage = weaponModule.getWeaponDamage(weapon)
                                                ShootSingleBulletBetweenCoords(launchPos, targetPos, damage, true,
                                                    weapon,
                                                    PlayerPedId(), true, false, -1.0, true)
                                            end
                                        end
                                    end)
                                end
                            end},

                            {type = 'checkBox', id = 'noRecoil', text = 'No Recoil', desc = 'EstÃ¡ opÃ§Ã£o irÃ¡ retirar o recoil da arma'},

                            {type = 'checkBox', id = 'noReload', text = 'No Reload', desc = 'EstÃ¡ opÃ§Ã£o irÃ¡ retirar o a animaÃ§Ã£o de recarregar da arma'},

                            {type = 'checkBox', id = 'infiniteAmmo', text = 'MuniÃ§Ã£o Infinita', desc = 'Utilize para obter muniÃ§Ã£o infinita na arma', func = function ()
                                if not elem.checkbox['infiniteAmmo'] then 
                                    SetPedInfiniteAmmoClip(PlayerPedId(), false)
                                end
                            end},

                            {type = 'checkBox', id = 'shootVehicles', text = 'Atirar VeÃ­culos', desc = 'Utilize estÃ¡ opÃ§Ã£o para atirar veÃ­culos'},
                            
                        }
                    },

                    {id = 'weaponList', text = 'Lista Armas', items = 
                        {
                            {type = 'button', text = 'Spawnar TODAS', risk = 'Ao spawnar todas as armas, diversas sÃ£o blacklist', desc = 'Spawnar todas as armas do jogo, spawne em servidores sem blacklist de armas', func = function ()
                                for i, weapon in ipairs(lists.weaponTable) do
                                    if weapon.hash then
                                        weaponModule.spawn( weapon.hash, 200)
                                    end
                                end
                            end},

                            {type = 'button', text = 'Pistola', desc = 'Utilize para spawnar a arma Pistola', func = function ()
                                local weapon = 'WEAPON_PISTOL'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Pistola MK2', desc = 'Utilize para spawnar a arma Pistola MK2', func = function ()
                                local weapon = 'WEAPON_PISTOL_MK2'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Pistola de Combate', desc = 'Utilize para spawnar a arma Pistola de Combate', func = function ()
                                local weapon = 'WEAPON_COMBATPISTOL'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Pistola AP', desc = 'Utilize para spawnar a arma Pistola AP', func = function ()
                                local weapon = 'WEAPON_APPISTOL'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Pistola de SinalizaÃ§Ã£o', desc = 'Utilize para spawnar a arma Pistola de SinalizaÃ§Ã£o', func = function ()
                                local weapon = 'WEAPON_FLAREGUN'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'RevÃ³lver', desc = 'Utilize para spawnar a arma RevÃ³lver', func = function ()
                                local weapon = 'WEAPON_REVOLVER'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'RevÃ³lver Pesado', desc = 'Utilize para spawnar a arma RevÃ³lver Pesado', func = function ()
                                local weapon = 'WEAPON_REVOLVER_MK2'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Submetralhadora', desc = 'Utilize para spawnar a arma Submetralhadora', func = function ()
                                local weapon = 'WEAPON_MICROSMG'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'SMG', desc = 'Utilize para spawnar a arma SMG', func = function ()
                                local weapon = 'WEAPON_SMG'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'SMG MK2', desc = 'Utilize para spawnar a arma SMG MK2', func = function ()
                                local weapon = 'WEAPON_SMG_MK2'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Fuzil de Assalto', desc = 'Utilize para spawnar a arma Fuzil de Assalto', func = function ()
                                local weapon = 'WEAPON_ASSAULTRIFLE'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Fuzil de Assalto MK2', desc = 'Utilize para spawnar a arma Fuzil de Assalto MK2', func = function ()
                                local weapon = 'WEAPON_ASSAULTRIFLE_MK2'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Carabina', desc = 'Utilize para spawnar a arma Carabina', func = function ()
                                local weapon = 'WEAPON_CARBINERIFLE'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Carabina MK2', desc = 'Utilize para spawnar a arma Carabina MK2', func = function ()
                                local weapon = 'WEAPON_CARBINERIFLE_MK2'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Carabina Especial', desc = 'Utilize para spawnar a arma Carabina Especial', func = function ()
                                local weapon = 'WEAPON_SPECIALCARBINE'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Carabina Especial MK2', desc = 'Utilize para spawnar a arma Carabina Especial MK2', func = function ()
                                local weapon = 'WEAPON_SPECIALCARBINE_MK2'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Taser', desc = 'Utilize para spawnar a arma Taser', func = function ()
                                local weapon = 'WEAPON_STUNGUN'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'LanÃ§ador de Foguetes', risk = 'Esta arma provavelmente estÃ¡ na blacklist', desc = 'Utilize para spawnar a arma LanÃ§ador de Foguetes', func = function ()
                                local weapon = 'WEAPON_RPG'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            
                            {type = 'button', text = 'Granada de FragmentaÃ§Ã£o', risk = 'Esta arma provavelmente estÃ¡ na blacklist', desc = 'Utilize para spawnar a arma Granada de FragmentaÃ§Ã£o', func = function ()
                                local weapon = 'WEAPON_GRENADE'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Granada de FumaÃ§a', desc = 'Utilize para spawnar a arma Granada de FumaÃ§a', func = function ()
                                local weapon = 'WEAPON_SMOKEGRENADE'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Granada de GÃ¡s', desc = 'Utilize para spawnar a arma Granada de GÃ¡s', func = function ()
                                local weapon = 'WEAPON_BZGAS'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Granada Adesiva', risk = 'Esta arma provavelmente estÃ¡ na blacklist', desc = 'Utilize para spawnar a arma Granada Adesiva', func = function ()
                                local weapon = 'WEAPON_STICKYBOMB'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Coquetel Molotov', risk = 'Esta arma provavelmente estÃ¡ na blacklist', desc = 'Utilize para spawnar a arma Coquetel Molotov', func = function ()
                                local weapon = 'WEAPON_MOLOTOV'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Mina de Proximidade', risk = 'Esta arma provavelmente estÃ¡ na blacklist', desc = 'Utilize para spawnar a arma Mina de Proximidade', func = function ()
                                local weapon = 'WEAPON_PROXMINE'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            
                            {type = 'button', text = 'Faca', desc = 'Utilize para spawnar a arma Faca', func = function ()
                                local weapon = 'WEAPON_KNIFE'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Cassetete', desc = 'Utilize para spawnar a arma Cassetete', func = function ()
                                local weapon = 'WEAPON_NIGHTSTICK'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Martelo', desc = 'Utilize para spawnar a arma Martelo', func = function ()
                                local weapon = 'WEAPON_HAMMER'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'BastÃ£o', desc = 'Utilize para spawnar a arma BastÃ£o', func = function ()
                                local weapon = 'WEAPON_BAT'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'PÃ© de Cabra', desc = 'Utilize para spawnar a arma PÃ© de Cabra', func = function ()
                                local weapon = 'WEAPON_CROWBAR'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Garrafa', desc = 'Utilize para spawnar a arma Garrafa', func = function ()
                                local weapon = 'WEAPON_BOTTLE'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Canivete', desc = 'Utilize para spawnar a arma Canivete', func = function ()
                                local weapon = 'WEAPON_DAGGER'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Machado de Batalha', desc = 'Utilize para spawnar a arma Machado de Batalha', func = function ()
                                local weapon = 'WEAPON_BATTLEAXE'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'FacÃ£o', desc = 'Utilize para spawnar a arma FacÃ£o', func = function ()
                                local weapon = 'WEAPON_MACHETE'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Chave Inglesa', desc = 'Utilize para spawnar a arma Chave Inglesa', func = function ()
                                local weapon = 'WEAPON_WRENCH'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Machado', desc = 'Utilize para spawnar a arma Machado', func = function ()
                                local weapon = 'WEAPON_HATCHET'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Machado de Pedra', desc = 'Utilize para spawnar a arma Machado de Pedra', func = function ()
                                local weapon = 'WEAPON_STONE_HATCHET'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Fuzil de PrecisÃ£o', risk = 'Esta arma provavelmente estÃ¡ na blacklist', desc = 'Utilize para spawnar a arma Fuzil de PrecisÃ£o', func = function ()
                                local weapon = 'WEAPON_SNIPERRIFLE'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Fuzil de PrecisÃ£o Pesado', risk = 'Esta arma provavelmente estÃ¡ na blacklist', desc = 'Utilize para spawnar a arma Fuzil de PrecisÃ£o Pesado', func = function ()
                                local weapon = 'WEAPON_HEAVYSNIPER'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Fuzil de PrecisÃ£o Pesado MK2', risk = 'Esta arma provavelmente estÃ¡ na blacklist', desc = 'Utilize para spawnar a arma Fuzil de PrecisÃ£o Pesado MK2', func = function ()
                                local weapon = 'WEAPON_HEAVYSNIPER_MK2'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            
                            {type = 'button', text = 'Railgun', risk = 'Esta arma provavelmente estÃ¡ na blacklist', desc = 'Utilize para spawnar a arma Railgun', func = function ()
                                local weapon = 'WEAPON_RAILGUN'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'LanÃ§a-foguetes guiado', risk = 'Esta arma provavelmente estÃ¡ na blacklist', desc = 'Utilize para spawnar a arma LanÃ§a-foguetes guiado', func = function ()
                                local weapon = 'WEAPON_HOMINGLAUNCHER'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Minigun', risk = 'Esta arma provavelmente estÃ¡ na blacklist', desc = 'Utilize para spawnar a arma Minigun', func = function ()
                                local weapon = 'WEAPON_MINIGUN'
                                weaponModule.spawn(weapon, 200)
                            end},
                    
                            
                            {type = 'button', text = 'LanÃ§a-granadas', risk = 'Esta arma provavelmente estÃ¡ na blacklist', desc = 'Utilize para spawnar a arma LanÃ§a-granadas', func = function ()
                                local weapon = 'WEAPON_GRENADELAUNCHER'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'LanÃ§a-granadas de fumaÃ§a', risk = 'Esta arma provavelmente estÃ¡ na blacklist', desc = 'Utilize para spawnar a arma LanÃ§a-granadas de fumaÃ§a', func = function ()
                                local weapon = 'WEAPON_GRENADELAUNCHER_SMOKE'
                                weaponModule.spawn(weapon, 200)
                            end},
                        
                            
                            {type = 'button', text = 'Fuzil Compacto', desc = 'Utilize para spawnar a arma Fuzil Compacto', func = function ()
                                local weapon = 'WEAPON_COMPACTRIFLE'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Escopeta de Cano Serrado', desc = 'Utilize para spawnar a arma Escopeta de Cano Serrado', func = function ()
                                local weapon = 'WEAPON_SAWNOFFSHOTGUN'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Escopeta', desc = 'Utilize para spawnar a arma Escopeta', func = function ()
                                local weapon = 'WEAPON_PUMPSHOTGUN'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Escopeta MK2', desc = 'Utilize para spawnar a arma Escopeta MK2', func = function ()
                                local weapon = 'WEAPON_PUMPSHOTGUN_MK2'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Escopeta de Assalto', desc = 'Utilize para spawnar a arma Escopeta de Assalto', func = function ()
                                local weapon = 'WEAPON_ASSAULTSHOTGUN'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Escopeta Pesada', desc = 'Utilize para spawnar a arma Escopeta Pesada', func = function ()
                                local weapon = 'WEAPON_HEAVYSHOTGUN'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Escopeta Bullpup', desc = 'Utilize para spawnar a arma Escopeta Bullpup', func = function ()
                                local weapon = 'WEAPON_BULLPUPSHOTGUN'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Escopeta de Combate', desc = 'Utilize para spawnar a arma Escopeta de Combate', func = function ()
                                local weapon = 'WEAPON_COMBATSHOTGUN'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Escopeta de Cano Curto', desc = 'Utilize para spawnar a arma Escopeta de Cano Curto', func = function ()
                                local weapon = 'WEAPON_DBSHOTGUN'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Escopeta de Cano Longo', desc = 'Utilize para spawnar a arma Escopeta de Cano Longo', func = function ()
                                local weapon = 'WEAPON_MUSKET'
                                weaponModule.spawn(weapon, 200)
                            end},
                            
                            {type = 'button', text = 'Espingarda', desc = 'Utilize para spawnar a arma Espingarda', func = function ()
                                local weapon = 'WEAPON_SINGLERIFLE'
                                weaponModule.spawn(weapon, 200)
                            end}
                            

                        }
                    },
                }
            },

            {tab = 'aim', curTab  = 'aimlock', subtabs = 
                {
                    {id = 'aimlock', text = 'Aimlock', items = 
                        {
                            {type = 'checkBox', text = 'Habilitar Aimlock', id = 'aimlock', desc = 'Utilize o aimlock para a mira grudar na cabeÃ§a do jogador automÃ¡ticamente'},
                            {type = 'checkBox', text = 'Exibir FOV', id = 'showAimFov', desc = 'Utilize estÃ¡ opÃ§Ã£o para exibir a Ã¡rea de ativaÃ§Ã£o do aimbot'},
                            {type = 'checkBox', text = 'Habilitar Prediction', id = 'aimPrediction', desc = 'O prediction se trata de uma ferramenta do aimlock para prever movimentos do alvo'},
                            {type = 'checkBox', text = 'CompensaÃ§Ã£o de Recoil', id = 'recoilCompensation', desc = 'A compensaÃ§Ã£o de recoil Ã© uma maneira legit de burlar o recoil da arma'},
                            {type = 'checkBox', text = 'VariaÃ§Ã£o de Movimento', id = 'movementVariation', desc = 'Utilize para o aimlock realizar movimentos variados e deixa-lo disfarÃ§ado'},
                            {type = 'slider', text = 'Tamanho FOV', id = 'aimFov', desc = 'Altere o tamanho do fov', table = {value = 60, min = 1, max = 500}},
                            {type = 'slider', text = 'ForÃ§a Aimlock', id = 'aimSmooth', desc = 'Ajuste a forÃ§a de fclick do aimlock', table = {value = 20, min = 0, max = 50}},
                            {type = 'slider', text = 'Distancia de Alcance', id = 'aimRange', desc = 'Ajuste a distance de alcance do aimbot', table = {value = 200, min = 1, max = 500}},
                            {type = 'slider', text = 'Intensidade Prediction', id = 'predictionIntensity', desc = 'Regule o quÃ£o longe ou perto serÃ¡ a previsÃ£o do aimlock', table = {value = 20, min = 0, max = 150}},
                            {type = 'slider', text = 'Intensidade Comp/ Recoil', id = 'recoilCompensationIntensity', desc = 'Regule a intensidade da compensaÃ§Ã£o do recoil', table = {value = 50, min = 0, max = 100}},
                            {type = 'slider', text = 'Intensidade Var/ Movimento', id = 'movementVariationIntensity', desc = 'Altere a intensidade da variaÃ§Ã£o de movimento do aimlock', table = {value = 5, min = 0, max = 10}},
                        }
                    },

                    {id = 'others', text = 'Outros', items = 
                        {
                            {type = 'checkBox', text = 'Habilitar SilentAim', id = 'silentAim', desc = 'Utilize o silent aim para acertar o tiro no alvo independente da posiÃ§Ã£o de sua mira'},
                            {type = 'checkBox', text = 'Exibir FOV', id = 'showSilentFov', desc = 'Utilize estÃ¡ opÃ§Ã£o para exibir a Ã¡rea de ativaÃ§Ã£o do SilentAim'},
                            {type = 'slider', text = 'FOV SilentAim', id = 'silentFov', desc = 'Altere o tamanho do fov do silent', table = {value = 60, min = 1, max = 500}},
                            {type = 'slider', text = 'Chance de erro', id = 'chanceErro', desc = 'Altere o a chance de erro do tiro', table = {value = 20, min = 0, max = 100}},
                            {type = 'checkBox', text = 'Habilitar RageBot', id = 'rageBot', desc = 'Utilize o ragebot para matar ao pressionar a tecla ALT', func = function ()
                                if elem.checkbox['rageBot'] then
                                    aimModule.rageCall()
                                end
                            end},
                            {type = 'slider', text = 'Delay Tiros Rage', id = 'rageDelay', desc = 'Ajuste o delay entre os tidos do ragebot', table = {value = 100, min = 100, max = 1000}},
                            {type = 'checkBox', text = 'TriggerBot', id = 'triggerBot', desc = 'Utilize o triggerbot para atirar automÃ¡ticamente'},

                            {type = 'bindSelect', defKey = 'RBUTTON',id = 'triggerBot', text = 'Tecla TriggerBot', desc = 'Altere a tecla de ativaÃ§Ã£o do triggerbot, quando pressionado'},
                        }
                    },

                    {id = 'variables', text = 'VariÃ¡veis', items = 
                        {
                            {type = 'comboBox', id = 'aimTarget', text = 'RegiÃ£o Alvo',defOption = 'CabeÃ§a', table = {'CabeÃ§a', 'Peito', 'Cintura'}, desc = 'Selecione a regiÃ£o na qual o aimbot vai puxar'},
                            {type = 'checkBox', text = 'Matar atrÃ¡s da parede', id = 'killThroughWall', desc = 'Utilize estÃ¡ opÃ§Ã£o para matar jogadores por trÃ¡s da parede com o aimlock'},
                            {type = 'checkBox', text = 'Ignorar Mortos', id = 'ignoreDead', desc = 'Utilize estÃ¡ opÃ§Ã£o para ignorar jogadores mortos'},
                            {type = 'checkBox', text = 'Ignorar NPC', id = 'ignorePeds', desc = 'Utilize estÃ¡ opÃ§Ã£o para ignorar NPC'},
                            {type = 'checkBox', text = 'Ignorar invisÃ­vel', id = 'ignoreInvisible', desc = 'Utilize estÃ¡ opÃ§Ã£o para ignorar jogadores invisÃ­veis'},
                            {type = 'checkBox', text = 'Ignorar atravÃ©s da parede', id = 'ignoreThroughWall', desc = 'Utilize estÃ¡ opÃ§Ã£o para ignorar jogadores atrÃ¡s das paredes'},
                        }
                    },

                    {id = 'crossHair', text = 'CrossHair', items = 
                        {
                            {type = 'checkBox', text = 'Habilitar CrossHair', id = 'crosshair', desc = 'Utilize estÃ¡ opÃ§Ã£o para exibir uma mira fixa na tela', func = function(bool)
                                if not bool then
                                    aimModule.crossVars.disabling = true
                                end
                            end},
                            {type = 'checkBox', text = 'Mira Nativa', id = 'nativeCrossHair', desc = 'Utilize estÃ¡ opÃ§Ã£o para utilizar a mira nativa do GTA V'},
                            {type = 'checkBox', text = 'Ponto Central', id = 'pointerCrossHair', desc = 'Utilize estÃ¡ opÃ§Ã£o para exibir um ponto central na crosshair'},
                            {type = 'checkBox', text = 'Erro de Movimento', id = 'movimentError', desc = 'Utilize estÃ¡ para ao andar a mira se adaptar'},
                            {type = 'slider', text = 'Intensidade Erro', id = 'errorIntensity', desc = 'Ajuste a intensidade de erro da mira', table = {value = 2, min = 0, max = 15}},
                            {type = 'slider', text = 'Velocidade Erro', id = 'errorVel', desc = 'Ajuste a velocidade de erro da mira', table = {value = 7, min = 0, max = 20}},
                            {type = 'slider', text = 'Tamanho Mira', id = 'aimWidht', desc = 'Ajuste o tamanho da mira', table = {value = 4, min = 0, max = 70}},
                            {type = 'slider', text = 'Largura Mira', id = 'aimHeight', desc = 'Ajuste a largura da mira', table = {value = 2, min = 0, max = 15}},
                            {type = 'slider', text = 'EspaÃ§amento Mira', id = 'aimDistance', desc = 'Ajuste o espaÃ§amento da mira', table = {value = 1, min = 0, max = 50}},
                            {type = 'slider', text = 'Tamanho Ponto Central', id = 'centralPointSize', desc = 'Ajuste o tamanho do ponto central', table = {value = 1, min = 0, max = 8}},

                        }
                    },
                }
            },

            {tab = 'visual', curTab  = 'visualPlayers', subtabs = 
                {
                    {id = 'visualPlayers', text = 'Visual Jogadores', items = 
                    {
                        {type = 'checkBox', id = 'enableESP', text = 'Habilitar ESP', desc = 'Utilize o esp para ver os jogadores atravÃ©s das paredes', func = function ()
                            
                        end},

                        {type = 'checkBox', id = 'namesESP', text = 'ESP Nomes', desc = 'Utilize o esp nomes para ver o nome dos jogadores por trÃ¡s das paredes'},

                        {type = 'colorpicker', id = 'espColor', defcolor = {255, 255, 255, 255}, text = 'Cor ESP VisÃ­vel', desc = 'Altere a cor do esp quando os peds estiverem visÃ­veis'},

                        {type = 'colorpicker', id = 'espColorThroghWall', defcolor = {255, 255, 255, 255}, text = 'Cor ESP AtrÃ¡s Paredes', desc = 'Altere a cor do esp quando os peds estiverem atrÃ¡s das paredes'},

                        {type = 'colorpicker', id = 'espColorInvisible', defcolor = {255, 255, 255, 255}, text = 'Cor ESP InvisÃ­vel', desc = 'Altere a cor do esp quando os peds estiverem invisÃ­veis'},
                            
                        {type = 'checkBox', id = 'weaponESP', text = 'ESP Armas', desc = 'Utilize o esp Armas para ver o nome da arma atual do jogador'},

                        {type = 'checkBox', id = 'boxESP', text = 'ESP Box', desc = 'Utilize o esp box para exibir uma box nos jogadores'},

                        {type = 'checkBox', id = 'skeletonESP', text = 'ESP Esqueleto', desc = 'Utilize estÃ¡ opÃ§Ã£o para desenhar o esqueleto do ped'},

                        {type = 'checkBox', id = 'headESP', text = 'ESP Head', desc = 'Utilize o esp head para desenhar uma esfera na cabeÃ§a dos jogadores'},

                        {type = 'slider', text = 'Distancia ESP', id = 'espDistance', desc = 'Altere a distancia em que o esp atingirÃ¡', table = {value = 500, min = 0, max = 2500}},
                    }
                    },

                    {id = 'varsVisual', text = 'VariÃ¡veis', items = 
                    {
                        {type = 'checkBox', id = 'disablePeds', text = 'Apenas Jogadores', desc = 'Remova os npcs e peds de seu visual'},
                        {type = 'checkBox', id = 'visualNoThroughWall', text = 'Ignorar AtravÃ©s Paredes', desc = 'Ignore peds e jogadores atravÃ©s das paredes'},
                    }
                    }
                }
            }
        }
    }

    --# callback #--
    local callback = {}

    function callback.freecamVars()
        tutu.vars.freecam = 
        {
            mode = 1,
            modes = {
                'Spectar',
                'Spawnar Veiculos',
                'Apagar Entidade',
                'Spawnar Props',
                'Teleportar-se',
            },
        }

        table.insert(tutu.vars.freecam.modes, 'Atirar AviÃµes')
    end

    function callback.defineCheckBoxes()
        elem.checkbox['animMenu'] = tutu.animVars.enable
        elem.checkbox['disablePeds'] = true
        elem.checkbox['chrismasTheme'] = tutu.performaceVars.natalTheme
        elem.checkbox['snowFlake'] = tutu.performaceVars.natalTheme

        -- blockControls
        if not resourceModule.checkProtect('FiveGuard') and not resourceModule.checkProtect('Thunder') then
            elem.checkbox['blockControls'] = true
        end
    end

    function callback.bindsCheck()

        
            -- verify button
            for button, key in pairs(interact.binds.buttons) do
                if key.key ~= nil then
                    if IsKeyJustPressed(key.key) then
                        key.func()
                    end
                end
            end

            -- verify checkbox
            for checkbox, key in pairs(interact.binds.checkBoxes) do
                if key.key ~= nil then
                    if IsKeyJustPressed(key.key) then
                        interact.checkVars.currentCheck = checkbox
                        if elem.checkbox[checkbox] then
                            interact.checkVars.alpha = 255
                        else
                            interact.checkVars.alpha = 0
                        end
                        elem.checkbox[checkbox] = not elem.checkbox[checkbox]
                            
        
                        if key.func then
                            key.func()
                        end
                    end
                end
            end

            -- verify comboBoxes
            for comboBox, key in pairs(interact.binds.comboBoxes) do
                if key.key ~= nil then
                    if IsKeyJustPressed(key.key) then
                        key.func()
                    end
                end
            end
    end

    function callback.threadIfs() 
            -- entity Ifs
            if elem.checkbox['pullSeePlayer'] or elem.checkbox['bugSeePlayer'] then
                local pointedCoords = entityModule.getPointedCoords(300)
                if pointedCoords and pointedCoords ~= vector3(0, 0, 0) then
                    local findedPed = false
                    local selfCoords = GetEntityCoords(PlayerPedId())

                    local pedsTable = GetGamePool('CPed')
                    for i, ped in ipairs(pedsTable) do
                        local pedCoords = GetEntityCoords(ped)
                        local distance = GetDistanceBetweenCoords(pointedCoords, pedCoords, true)
                        if distance < 5.0 then
                            findedPed = true
                            local fSreenC, screenX, screenY = GetScreenCoordFromWorldCoord(pedCoords.x, pedCoords.y, pedCoords.z)
                            local selffSreenC, selfScreenX, selfScreenY = GetScreenCoordFromWorldCoord(selfCoords.x, selfCoords.y, selfCoords.z)
                            
                            if elem.checkbox['pullSeePlayer'] then
                                if IsDisabledControlJustPressed(0, 38) then
                                    if ped ~= PlayerPedId() then
                                        local entityToPull = ped 
                                        if IsPedInAnyVehicle(ped, -1) then
                                            entityToPull = GetVehiclePedIsIn(ped, false)
                                        end
                                        entityModule.pullEntity(entityToPull)
                                        break
                                    end
                                end
                            end

                            if elem.checkbox['bugSeePlayer'] then
                                if IsDisabledControlJustPressed(0, 19) then
                                    if ped ~= PlayerPedId() then
                                        local entityToBug = ped 
                                        if IsPedInAnyVehicle(ped, -1) then
                                            entityToBug = GetVehiclePedIsIn(ped, false)
                                        end
                                        playersModule.redBull(entityToBug)
                                        break
                                    end
                                end
                            end

                            if (fSreenC and selffSreenC) and ped ~= PlayerPedId() then
                                DrawLine_2d(selfScreenX, selfScreenY, screenX, screenY, 0.0005, 204, 150, 255, 255)
                                break
                            end
                        end 
                    end


                    if not findedPed then
                        local fSreenC, screenX, screenY = GetScreenCoordFromWorldCoord(pointedCoords.x, pointedCoords.y, pointedCoords.z)
                        local selffSreenC, selfScreenX, selfScreenY = GetScreenCoordFromWorldCoord(selfCoords.x, selfCoords.y, selfCoords.z)
                        if (fSreenC and selffSreenC)  then
                            DrawLine_2d(selfScreenX, selfScreenY, screenX, screenY, 0.0005, 255, 255, 255, 255)
                        end
                    end
                end
            end

            if elem.checkbox['disableDamage'] then
                local ped = PlayerPedId()
                SetEntityProofs(ped, true, true, true, true, true, true, true, true)
            end

            if elem.checkbox['removeBleedout'] then
                local ped = PlayerPedId()
                SetPedSuffersCriticalHits(ped, false)
            end

            if elem.checkbox['removeCollisions'] then
                local table = GetGamePool('CPed')
                local selfPed = PlayerPedId()
                for i, ped in ipairs(table) do
                    print("Removendo ColisÃ£o: "..ped)
                    SetEntityNoCollisionEntity(selfPed, ped, true)
                    SetEntityNoCollisionEntity(ped, selfPed, true)
                end
            end

            if elem.checkbox['judgmentPunch'] then
                local playerPed = PlayerPedId()
                if IsPedInMeleeCombat(playerPed) then
                    local targetEntity = GetMeleeTargetForPed(playerPed)

                    if ((entityModule.punchJudgmentDelay or 0) < GetGameTimer()) then
                        entityModule.punchJudgmentDelay = GetGameTimer() + 2000
                        if targetEntity and targetEntity ~= PlayerPedId() and DoesEntityExist(targetEntity)  then
                            if IsEntityAPed(targetEntity)then
                                local entityToLaunch = targetEntity
                                if IsPedInAnyVehicle(targetEntity, -1) then
                                    entityToLaunch = GetVehiclePedIsIn(targetEntity, false)
                                end
                                playersModule.redBull(entityToLaunch)
                            end
                        else
                            local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 10.0, 0, 70)
                            if vehicle then
                                playersModule.redBull(vehicle)
                            end
                        end
                    end
                end
            end

            if elem.checkbox['autoRevive'] then
                local isDead = IsEntityDead(PlayerPedId())
                if isDead then
                    local health = GetEntityHealth(PlayerPedId())
                    if health <= 101 then
                        entityModule.reviveSelf()
                    end
                end
            end

            if elem.checkbox['enableFreecamVoice'] and elem.checkbox['freeCam'] then
                if not DoesEntityExist(others.voicePed) then
                    local model = GetHashKey('mp_m_freemode_01')
                    RequestModel(model)
                    while not HasModelLoaded(model) do
                        Wait(1000)
                        RequestModel(model)
                    end
                    local cam = GetRenderingCam()
                    others.voicePed = CreatePed(4, model, GetCamCoord(cam), 0.0, false, false)
                else
                    local table = GetActivePlayers()
                    MumbleAddVoiceChannelListen(1)
                    for i, player in pairs(table) do
                        if player ~= PlayerId() then
                            local distance = GetDistanceBetweenCoords(camCoord, GetEntityCoords(GetPlayerPed(player)), true)
                            if distance < 15.0 then
                                MumbleAddVoiceTargetPlayer(1, player)
                            end
                        end
                    end

                    MumbleSetTalkerProximity(1400.0)
                    local cam = GetRenderingCam()
                    local camCoord = GetCamCoord(cam)
                    SetEntityCoordsNoOffset(others.voicePed, camCoord)
                    SetEntityAlpha(others.voicePed, 0.0)
                    SetEntityVisible(others.voicePed, false)
                    SetEntityCollision(others.voicePed, false)
                    AttachEntityToEntity(PlayerPedId(), others.voicePed, 31086, 0.0, 0.0, 1000.0, 0.0, 0.0, 0.0, false, false, false, true)
                end
                
                
            end

            if elem.checkbox['testFunc'] then
                local weaponShoot = GetHashKey('VEHICLE_WEAPON_TURRET_LIMO')
                local _, vehicleWeapon  = GetCurrentPedVehicleWeapon(PlayerPedId())
                local coordsStart = GetEntityCoords(PlayerPedId())
                local coordsEnd = {x = coordsStart.x + 5, y = coordsStart.y, z = coordsStart.z}
                RequestModel(weaponShoot)
                RequestModel(weaponShoot)
                RequestWeaponAsset(weaponShoot, 31, 0)
                ShootSingleBulletBetweenCoords(coordsStart, coordsEnd.x, coordsEnd.y, coordsEnd.z, 0.0, 1, weaponShoot, PlayerPedId(), true, false, 0.2)
            end

            if elem.checkbox['autoFarm'] then
                nt.createTh(function ()
                    local blipIndex = 1
                    if DoesBlipExist(GetFirstBlipInfoId(blipIndex)) and (entityModule.farmTpDelay or 0) < GetGameTimer() then
                        entityModule.farmTpDelay = GetGameTimer() + 4000
                        local ped = PlayerPedId()
                        local veh = GetVehiclePedIsUsing(PlayerPedId())
                
                        if IsPedInAnyVehicle(ped) and elem.checkbox['farmInVeh'] then
                            ped = veh
                        end

                        ClearGpsPlayerWaypoint()
                        DeleteWaypoint()

                        entityModule.blip = GetFirstBlipInfoId(blipIndex)
                        local color = 5
                        local blipColor = GetBlipColour(entityModule.blip)
                        if entityModule.blip and blipColor ~= color then
                                while blipColor ~= color do
                                    entityModule.blip = GetNextBlipInfoId(blipIndex)
                                    blipColor = GetBlipColour(entityModule.blip)
                                    Wait(0)
                                end
                        end
                        if blipColor == color then
                            local coords = GetBlipInfoIdCoord(entityModule.blip, Citizen.ResultAsVector())
                            SetEntityCoordsNoOffset(ped, coords)
        
                            -- Ground
                            local x, y, z = table.unpack(coords)
                            local ground
                            local groundFound = false
                            local groundCheckHeights = { 0.0, 50.0, 100.0, 150.0, 200.0, 250.0, 300.0, 350.0, 400.0, 450.0, 500.0, 550.0, 600.0, 650.0, 700.0, 750.0, 800.0, 850.0, 900.0, 950.0, 1000.0, 1050.0, 1100.0 }
                            Citizen.Wait(2000)
                    
                            for i, height in ipairs(groundCheckHeights) do
                                SetEntityCoordsNoOffset(ped, x, y, height, 0, 0, 1)
                    
                                RequestCollisionAtCoord(x, y, z)
                                while not HasCollisionLoadedAroundEntity(ped) do
                                    RequestCollisionAtCoord(x, y, z)
                                    Citizen.Wait(100)
                                end
                                Citizen.Wait(20)
                    
                                ground, z = GetGroundZFor_3dCoord(x, y, height)
                                if ground then
                                    z = z + 1.0
                                    groundFound = true
                                    break;
                                end
                            end
                    
                            RequestCollisionAtCoord(x, y, z)
                            while not HasCollisionLoadedAroundEntity(ped) do
                                RequestCollisionAtCoord(x, y, z)
                                Citizen.Wait(100)
                            end
                    
                            SetEntityCoordsNoOffset(ped, x, y, z, 0, 0, 1)

                            Citizen.Wait(200)
                            if DoesEntityExist(veh) and not elem.checkbox['farmInVeh'] then
                                SetEntityCoordsNoOffset(PlayerPedId(), GetEntityCoords(veh))
                                Citizen.Wait(200)
                                SetPedIntoVehicle(PlayerPedId(), veh, -1)
                            end
                        else
                            entityModule.farmTpDelay = 0
                        end
                    end
                end)
            end

            if elem.checkbox['everDay'] then
                NetworkOverrideClockTime(12, 0, 0)
            end

            if elem.checkbox['everNight'] then
                NetworkOverrideClockTime(22, 0, 0)
            end

            if elem.checkbox['forceThirdPerson']then
                SetFollowPedCamViewMode(2)
            end

            if elem.checkbox['infiniteJump'] then
                if IsDisabledControlJustPressed(0, 22) then
                    TaskJump(PlayerPedId(), false)
                end
            end

            if elem.checkbox['fakeAttach'] then
                local ped = GetPlayerPed(lists.vars.selPlayer)
                if ped ~= PlayerPedId() and lists. vars.selPlayer then
                    AttachEntityToEntity(PlayerPedId(), ped, 11816, 0.6, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false,
                        false, 2, true)
                end
            end

            if elem.checkbox['antiTazer'] then
                SetPedCanRagdoll(PlayerPedId(), false)
                AnimpostfxStop("Dont_tazeme_bro")
            end

            if elem.checkbox['antiFire'] then
                StopEntityFire(PlayerPedId())
            end


            if elem.checkbox['walkWalls'] then
                ped = PlayerPedId()
                SetPedCapsule(
                    ped,
                    1000
                )
            end

            if elem.checkbox['infiniteStamina'] then
                ResetPlayerStamina(PlayerId())
            end

            if elem.checkbox['superSoco'] then
                SetWeaponDamageModifierThisFrame(GetHashKey('WEAPON_UNARMED'), 50.0)
            end

            if elem.checkbox['fastRun'] then
                SetPedMoveRateOverride(PlayerPedId(), 1.3)
            end

            if elem.checkbox['superRun'] then
                if IsDisabledControlPressed(0, 34) or IsDisabledControlPressed(0, 33) or IsDisabledControlPressed(0, 32) or IsDisabledControlPressed(0, 35) then
                    if IsPedRagdoll(PlayerPedId()) then

                    else
                        SetEntityVelocity(
                            PlayerPedId(),
                            GetOffsetFromEntityInWorldCoords(
                                PlayerPedId(),
                                0.0,
                                20.0,
                                GetEntityVelocity(PlayerPedId())[3]
                            ) - GetEntityCoords(
                                PlayerPedId()
                            )
                        )
                    end
                end
            end

            if elem.checkbox['superJump'] then
                SetPedCanRagdoll(PlayerPedId(), false)
                if IsDisabledControlJustPressed(0, 22) then
                    ApplyForceToEntity(PlayerPedId(), 3, 0.0, 0.0, 30.0, 0.0, 0.0, 0.0, 0, 0, 0, 1, 1, 1)
                end
            end


            if elem.checkbox['noclip'] then
                local pedCoords = GetEntityCoords(entityModule.noclipPed)
                local flyingspeed = (action.getSlider('noclipSpeed') or 5) / 10
                local gameplayCamRot = GetGameplayCamRot(0)
                local pedAttach = entityModule.noclipPed
                if not IsEntityAVehicle(entityModule.noclipPed) then
                    DisablePedPainAudio(entityModule.noclipPed, true)
                    SetEntityLocallyInvisible(pedAttach)
                    AttachEntityToEntity(PlayerPedId(), pedAttach, 11816, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false,
                        false,
                        false, 2, true)
                    NetworkSetEntityCanBlend(pedAttach, false)
                end

                if IsDisabledControlPressed(0, 21) then
                    flyingspeed = flyingspeed * 3
                elseif IsDisabledControlPressed(0, 36) then
                    flyingspeed = flyingspeed / 3
                end

                local forward, right = mathFuncs.rotToQuat(gameplayCamRot) * vector3(0.0, 1.0, 0.0),
                    mathFuncs.rotToQuat(gameplayCamRot) * vector3(1.0, 0.0, 0.0)

                if IsDisabledControlPressed(0, 32) then
                    tutu.vars.noclipWalkingKey = true
                    pedCoords = pedCoords + forward * flyingspeed
                end
                if IsDisabledControlPressed(0, 33) then
                    tutu.vars.noclipWalkingKey = true
                    pedCoords = pedCoords + forward * -flyingspeed
                end
                if IsDisabledControlPressed(0, 30) then
                    tutu.vars.noclipWalkingKey = true
                    pedCoords = pedCoords + right * flyingspeed
                end
                if IsDisabledControlPressed(0, 34) then
                    tutu.vars.noclipWalkingKey = true
                    pedCoords = pedCoords + right * -flyingspeed
                end
                if IsDisabledControlPressed(0, 22) then
                    tutu.vars.noclipWalkingKey = true
                    pedCoords = vector3(pedCoords.x, pedCoords.y, pedCoords.z + flyingspeed)
                end
                if IsDisabledControlPressed(0, 38) then
                    tutu.vars.noclipWalkingKey = true
                    pedCoords = vector3(pedCoords.x, pedCoords.y, pedCoords.z - flyingspeed)
                end
                SetEntityCoordsNoOffset(entityModule.noclipPed, pedCoords.x, pedCoords.y, pedCoords.z, true, true, true)
                local coords = vector3(gameplayCamRot.x - GetDisabledControlNormal(0, 2) * 10, gameplayCamRot.y,
                    gameplayCamRot.z - GetDisabledControlNormal(0, 1) * 10)
                if not IsEntityAVehicle(entityModule.noclipPed) then
                    SetEntityRotation(entityModule.noclipPed, coords, 0)
                end 

                tutu.vars.noclipWalkingKey = false
            end

            -- Vehicle Ifs

            if elem.checkbox['carryVehicles'] then

                local playerPed = PlayerPedId()
                local pos = GetEntityCoords(playerPed)
                local vehicle =  vehicleModule.getClosestVehicle(pos, 10.0)
                local speed = action.getSlider('carryVehIntensity') or 100

                if vehicle and not vehicleModule.isCarryingVehicle and GetPedInVehicleSeat(vehicle, -1) == 0 then
                    local vehiclePos = GetEntityCoords(vehicle)
                    texts.Draw3DText(vehiclePos.x, vehiclePos.y, vehiclePos.z + 1.0, 0.3, "Pressione [E] para carregar", 255, 255, 255, false, '##carryVehicleText')
        
                    if IsControlJustPressed(1, 38) then -- 38 Ã© a tecla 'E'
                        if vehicle then
                            local check = 0 
                            vehicleModule.getControl(vehicle) 
                            while not NetworkHasControlOfEntity(vehicle) do
                                Wait(1000)
                                vehicleModule.getControl(vehicle) 
                                check = check+1
                                if check == 5 then
                                    break
                                end
                            end
    
                            if NetworkHasControlOfEntity(vehicle) then
                                vehicleModule.fakeAttach(vehicle)
                                vehicleModule.carryingVehicle = vehicle
                                vehicleModule.isCarryingVehicle = true
    
                                -- start Anim
                                nt.createTh(function()
                                    local animDict = "anim@mp_rollarcoaster"
                                    local animName = "hands_up_idle_a_player_one"
                                    local code = 
                                    [[
                                        local dict = "]]..animDict..[["
                                        local animName = "]]..animName..[["
                                        vRP._playAnim(true,{dict,animName},true)
                                    ]]
                                    ExecuteCommand('e amem')
                                    tutu.API.inject(tutu.performaceVars.resourceMain, code)
                                end)
                            end
                        end
                    end
                end

                if vehicleModule.isCarryingVehicle and vehicleModule.carryingVehicle then
                    local rotationDirection = vehicleModule.RotationToDirection(GetGameplayCamRot(2))
                    local vehiclePos = GetEntityCoords(vehicle)
                    texts.Draw3DText(vehiclePos.x, vehiclePos.y, vehiclePos.z + 1.0, 0.3, "Pressione [Y] para arremessar", 255, 255, 255, false, '##carryVehicleText')
                    if IsControlJustPressed(1, 246) then -- 246 Ã© a tecla 'Y'
                        vehicleModule.fakeDetach(vehicleModule.carryingVehicle)
                        
                        -- Obter direÃ§Ã£o para frente do jogador (nÃ£o da cÃ¢mera)
                        ClearPedTasks(PlayerPedId())
                        StopEntityAnim(PlayerPedId(), "rcmepsilonism8", "worship_base", 1)
                        StopAnimTask(PlayerPedId(), "rcmepsilonism8", "worship_base", -4.0)
                        local code = 
                        [[
                            vRP.stopAnim(false)
                        ]]
                        tutu.API.inject(tutu.performaceVars.resourceMain, code)
                        ClearPedTasksImmediately(PlayerPedId())
                        local forceMagnitude = 100.0 -- Ajuste conforme necessÃ¡rio
                        ApplyForceToEntity(vehicleModule.carryingVehicle, 1, rotationDirection.x * speed, rotationDirection.y * speed, rotationDirection.z * speed, 0, 0, 0, 0, false, true, true, false, true)
                        
                        vehicleModule.carryingVehicle = nil
                        vehicleModule.isCarryingVehicle = false
                    end
                end

                if vehicleModule.carryingVehicle then
                    if not DoesEntityExist(vehicleModule.carryingVehicle) and not IsEntityAVehicle(vehicleModule.carryingVehicle) then
                        vehicleModule.carryingVehicle = false
                        vehicleModule.isCarryingVehicle = false
                    end
                end
            end

            if elem.checkbox['removeFromCarWithF'] then
                SetPedConfigFlag(PlayerPedId(), 342 --[[NotAllowedToJackAnyPlayers]], false)
                SetPedConfigFlag(PlayerPedId(), 252 --[[PlayerCanJackFriendlyPlayers]], true)
                SetPedConfigFlag(PlayerPedId(), 141 --[[WillJackAnyPlayer]], true)
            end


            if elem.checkbox['forceEngine'] then
                if IsPedInAnyVehicle(PlayerPedId(), -1) then
                    SetVehicleEngineOn(GetVehiclePedIsIn(PlayerPedId(), false), true, true, false)
                end
            end

            if elem.checkbox['nofallVehicle'] then
                SetPedCanBeKnockedOffVehicle(PlayerPedId(), false)
                SetPedCanRagdoll(PlayerPedId(), false)
            end

            if elem.checkbox['enableBikeKick'] then
                -- X Key
                DisableControlAction(0, 345, false)
                EnableControlAction(0, 345, true)
                DisableControlAction(0, 73, false)
                EnableControlAction(0, 73, true)
                -- LButton Key
                DisableControlAction(0, 346, false)
                EnableControlAction(0, 346, true)
                -- RButton Key
                DisableControlAction(0, 347, false)
                EnableControlAction(0, 347, true)
            end

            if elem.checkbox['hornBoost'] then
                if IsDisabledControlPressed(0, 38) then
                    local veh = GetVehiclePedIsUsing(PlayerPedId())
                    local value = ((action.getSlider('boostIntensity') or 10) * 3) + 0.0
                    if action.getCombo('direction') == 'TrÃ¡s' then
                        value = (value * -1) + 0.0
                    end
                    SetVehicleForwardSpeed(veh, value)
                end
            end

            if elem.checkbox['remoteControl'] then
                if GetEntityHealth(vehicleModule.remoteControl) > 1 then
                    SetVehicleEngineOn(vehicleModule.remoteControl, true, true, true)
                    local Cordenadas = GetEntityCoords(vehicleModule.remoteControl)
                    if IsDisabledControlPressed(0, 129) and not IsDisabledControlPressed(0, 130) then
                        TaskVehicleTempAction(PlayerPedId(), vehicleModule.remoteControl, 9, 1)
                    end
                    if IsDisabledControlJustReleased(0, 129) or IsDisabledControlJustReleased(0, 130) then
                        TaskVehicleTempAction(PlayerPedId(), vehicleModule.remoteControl, 6, 2500)
                    end
                    if IsDisabledControlPressed(0, 130) and not IsDisabledControlPressed(0, 129) then
                        local horn = IsHornActive(vehicleModule.remoteControl)
                        SetHornEnabled(vehicleModule.remoteControl, not horn)
                    end
                    if IsDisabledControlPressed(0, 130) and not IsDisabledControlPressed(0, 129) then
                        TaskVehicleTempAction(PlayerPedId(), vehicleModule.remoteControl, 22, 1)
                    end
                    if IsDisabledControlPressed(0, 89) and IsDisabledControlPressed(0, 130) then
                        TaskVehicleTempAction(PlayerPedId(), vehicleModule.remoteControl, 13, 1)
                    end
                    if IsDisabledControlPressed(0, 90) and IsDisabledControlPressed(0, 130) then
                        TaskVehicleTempAction(PlayerPedId(), vehicleModule.remoteControl, 14, 1)
                    end
                    if IsDisabledControlPressed(0, 129) and IsDisabledControlPressed(0, 130) then
                        TaskVehicleTempAction(PlayerPedId(), vehicleModule.remoteControl, 30, 100)
                    end
                    if IsDisabledControlPressed(0, 89) and IsDisabledControlPressed(0, 129) then
                        TaskVehicleTempAction(PlayerPedId(), vehicleModule.remoteControl, 7, 1)
                    end
                    if IsDisabledControlPressed(0, 90) and IsDisabledControlPressed(0, 129) then
                        TaskVehicleTempAction(PlayerPedId(), vehicleModule.remoteControl, 8, 1)
                    end
                    if IsDisabledControlPressed(0, 89) and not IsDisabledControlPressed(0, 129) and not IsDisabledControlPressed(0, 130) then
                        TaskVehicleTempAction(PlayerPedId(), vehicleModule.remoteControl, 4, 1)
                    end
                    if IsDisabledControlPressed(0, 90) and not IsDisabledControlPressed(0, 129) and not IsDisabledControlPressed(0, 130) then
                        TaskVehicleTempAction(PlayerPedId(), vehicleModule.remoteControl, 5, 1)
                    end
                    local Vehicle = vehicleModule.remoteControl
                    if IsDisabledControlJustPressed(0, 38) then
                        vehicleModule.explodeVeh(Vehicle)
                    end

                    -- if IsControlPressed(1, 21) then
                    --     SetVehicleForwardSpeed(Vehicle, 70 + 0.0)
                    -- end

                    if vehicleModule.camInVeh then
                        CreateThread(function()
                            local camerat = camerat
                            if not camerat ~= nil then
                                camerat = CreateCam("DEFAULT_SCRIPTED_Camera", 1)
                            end

                            RenderScriptCams(1, 0, 0, 1, 1)
                            SetCamActive(camerat, true)
                            local coords = GetEntityCoords(vehicleModule.remoteControl)
                            SetCamCoord(camerat, coords.x, coords.y - 4, coords.z + 4)

                            while DoesCamExist(camerat) do
                                Citizen.Wait(1)
                                if not vehicleModule.camInVeh or not vehicleModule.remoteControl then
                                    DestroyCam(camerat, false)
                                    ClearTimecycleModifier()
                                    RenderScriptCams(false, false, 0, 1, 0)
                                    SetFocusEntity(PlayerPedId())
                                    break
                                end


                                local x, y, z = table.unpack(GetCamCoord(camerat))

                                local x2, y2, z2 = table.unpack(GetEntityCoords(vehicleModule.remoteControl))


                                SetCamCoord(camerat, x2 + 1.5, y2 + 1.5, z2 + 5) ---GetGameplayCamCoord())

                                if not Displayed then
                                    SetFocusArea(GetCamCoord(camerat).x, GetCamCoord(camerat).y, GetCamCoord(camerat).z,
                                        0.0,
                                        0.0, 0.0)
                                    SetCamRot(camerat, GetGameplayCamRot(2), 2)
                                end
                            end
                        end)
                    end
                end
            end


            -- if elem.checkbox['vehicleHandling'] then
            --     local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            --     if veh then
            --         local value = tonumber(action.getSlider('speedMultiple'))
            --         SetVehicleCheatPowerIncrease(veh, value)
            --     end
            -- end

            if elem.checkbox['velTxt'] then
                local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                if vehicle then
                    local velMph = GetEntitySpeed(vehicle)
                    local kmText = tostring(math.floor(velMph*2.23694))..'KM/H'
                    local velX, velY = tutu.vars.screen.w*0.9, tutu.vars.screen.h*0.9
                    local width = texts.getTextWidth(kmText, 11, 400)
                    local height = 40
                    ui.roundedRect(velX, velY, width+20, height, 20.0, {22, 22, 22, 255}, 1)
                    texts.drawText(kmText, velX+((width+20)/2), velY+(height/2)-15, false, 'center', 400, 11, {255, 255, 255, 255}, 2)
                end
            end

            if elem.checkbox['spectateVehicle'] then
                Citizen.CreateThread(function()
                    local camerat = camerat
                    if not camerat ~= nil then
                        camerat = CreateCam("DEFAULT_SCRIPTED_Camera", 1)
                    end
                    
                    RenderScriptCams(1, 0, 0, 1, 1)
                    SetCamActive(camerat, true)
                    local coords = GetEntityCoords(lists.vars.selVehicle)
                    SetCamCoord(camerat, coords.x, coords.y, coords.z + 3)

                    while DoesCamExist(camerat) do
                        Wait(0)
                        if not elem.checkbox['spectateVehicle'] then
                            DestroyCam(camerat, false)
                            ClearTimecycleModifier()
                            RenderScriptCams(false, false, 0, 1, 0)
                            SetFocusEntity(PlayerPedId())
                            break
                        end
                        local vehicle = lists.vars.selVehicle
                        local playerRot = GetEntityRotation(vehicle, 2)
                

                        local x, y, z = table.unpack(GetCamCoord(camerat))

                        local x2, y2, z2 = table.unpack(GetOffsetFromEntityInWorldCoords(vehicle, 0.0, -4.0, 3.0))
                        --DrawMarker(0, x2, y2, z2+0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.25, 0.25, 255, 255, 255, 255, true, true, 2, nil, nil, false)


                        SetCamCoord(camerat, x2, y2, z2)---GetGameplayCamCoord())
                        
                        if not Displayed then
                            SetFocusArea(GetCamCoord(camerat).x, GetCamCoord(camerat).y, GetCamCoord(camerat).z,0.0,0.0,0.0)
                            SetCamRot(camerat, GetGameplayCamRot(2), 2)
                        end
                    end
                end)
            end

            if elem.checkbox['madVehicle'] then
                if lists.vars.selVehicle then
                    local width = 300
                    local height = 230
                    local x, y = (tutu.vars.screen.w*0.1) - (width/2), tutu.vars.screen.h*0.8-(height/2)
                    ui.roundedRect(x, y, width, height, 15, tutu.colors.menu.bg, 1)

                    -- TECLAS
                    local xKey, yKey = x+20, y+20
                    local add = 32
                    --
                    ui.roundedRect(xKey, yKey, 40, 24, 15, tutu.colors.main, 2, 'veiculoMaluco_teclaW')
                    texts.drawText("W", xKey+20, yKey+2, false, "center", 250, 11, tutu.colors.menu.bg, 3)

                    texts.drawText("Ajuste a rotaÃ§Ã£o para baixo", xKey+50, yKey+2, false, "left", 250, 11, {210, 210, 210, 210}, 2)
                    --
                    ui.roundedRect(xKey, yKey+(add), 40, 24, 15, tutu.colors.main, 2, 'veiculoMaluco_teclaS')
                    texts.drawText("S", xKey+20, yKey+2+(add), false, "center", 250, 11, tutu.colors.menu.bg, 3)

                    texts.drawText("Ajuste a rotaÃ§Ã£o para cima", xKey+50, yKey+2+(add), false, "left", 250, 11, {210, 210, 210, 210}, 2)
                    --
                    ui.roundedRect(xKey, yKey+(add*2), 40, 24, 15, tutu.colors.main, 2, 'veiculoMaluco_teclaD')
                    texts.drawText("D", xKey+20, yKey+2+(add*2), false, "center", 250, 11, tutu.colors.menu.bg, 3)

                    texts.drawText("Ajuste a rotaÃ§Ã£o para a direita", xKey+50, yKey+2+(add*2), false, "left", 250, 11, {210, 210, 210, 210}, 2)
                    --
                    ui.roundedRect(xKey, yKey+(add*3), 40, 24, 15, tutu.colors.main, 2, 'veiculoMaluco_teclaA')
                    texts.drawText("A", xKey+20, yKey+2+(add*3), false, "center", 250, 11, tutu.colors.menu.bg, 3)

                    texts.drawText("Ajuste a rotaÃ§Ã£o para a esquerda", xKey+50, yKey+2+(add*3), false, "left", 250, 11, {210, 210, 210, 210}, 2)
                    --
                    ui.roundedRect(xKey, yKey+(add*4), 40, 24, 15, tutu.colors.main, 2, 'veiculoMaluco_teclaE')
                    texts.drawText("E", xKey+20, yKey+2+(add*4), false, "center", 250, 11, tutu.colors.menu.bg, 3)

                    texts.drawText("Utilize o Boost", xKey+50, yKey+2+(add*4), false, "left", 250, 11, {210, 210, 210, 210}, 2)
                    --
                    ui.roundedRect(xKey, yKey+(add*5), 40, 24, 15, tutu.colors.main, 2, 'veiculoMaluco_teclaCAPS')
                    texts.drawText("CAPS", xKey+20, yKey+2+(add*5), false, "center", 220, 11, tutu.colors.menu.bg, 3)

                    texts.drawText("Congele o veÃ­culo na posiÃ§Ã£o atual", xKey+50, yKey+2+(add*5), false, "left", 250, 11, {210, 210, 210, 210}, 2)

                    -- disableControls
                    local disable = 
                    {
                        9, 21, 34, 8, 32, 137, 38
                    }

                    for i, tecla in ipairs(disable) do
                        DisableControlAction(0, tecla, true)
                    end

                    if IsDisabledControlJustPressed(0, 20) then
                        vehicleModule.turnEngineOff = not vehicleModule.turnEngineOff
                    end

                    SetVehicleEngineOn(lists.vars.selVehicle, not vehicleModule.turnEngineOff, true, false)

                    -- move right
                    if IsDisabledControlPressed(0, 9) then
                        if IsDisabledControlPressed(0, 21) then
                            local rot = GetEntityRotation(lists.vars.selVehicle)
                            SetEntityRotation(lists.vars.selVehicle, rot.x, rot.y-1, rot.z)
                        else
                            local rot = GetEntityRotation(lists.vars.selVehicle)
                            SetEntityRotation(lists.vars.selVehicle, rot.x, rot.y, rot.z-1)
                        end
                    end
                    -- move left
                    if IsDisabledControlPressed(0, 34) then
                        if IsDisabledControlPressed(0, 21) then
                            local rot = GetEntityRotation(lists.vars.selVehicle)
                            SetEntityRotation(lists.vars.selVehicle, rot.x, rot.y+1, rot.z)
                        else
                            local rot = GetEntityRotation(lists.vars.selVehicle)
                            SetEntityRotation(lists.vars.selVehicle, rot.x, rot.y, rot.z+1)
                        end
                    end

                    -- rotation
                    if IsDisabledControlPressed(0, 8) then
                        local rot = GetEntityRotation(lists.vars.selVehicle)
                        SetEntityRotation(lists.vars.selVehicle, rot.x+1, rot.y, rot.z)
                    end

                    if IsDisabledControlPressed(0, 32) then
                        local rot = GetEntityRotation(lists.vars.selVehicle)
                        SetEntityRotation(lists.vars.selVehicle, rot.x+-1, rot.y, rot.z)
                    end

                    -- Freeze
                    if IsDisabledControlPressed(0, 137) and not vehicleModule.driving then
                        local coords = GetEntityCoords(lists.vars.selVehicle)
                        SetEntityCoordsNoOffset(lists.vars.selVehicle, coords)
                    end

                    -- DRIVE
                    if IsDisabledControlPressed(0, 38) then
                        local value = action.getSlider('madVehicleInt') or 25.0
                        SetVehicleForwardSpeed(lists.vars.selVehicle, value+0.01) 
                        vehicleModule.driving = true
                    end

                    vehicleModule.driving = false
                end
            end
            
            if elem.checkbox['enableVehWeapons'] then
                local vehicle_weapons = {
                    "VEHICLE_WEAPON_WATER_CANNON",
                    "VEHICLE_WEAPON_PLAYER_LAZER",
                    "VEHICLE_WEAPON_PLANE_ROCKET",
                    "VEHICLE_WEAPON_ENEMY_LASER",
                    "VEHICLE_WEAPON_TANK",
                    "VEHICLE_WEAPON_SEARCHLIGHT",
                    "VEHICLE_WEAPON_RADAR",
                    "VEHICLE_WEAPON_PLAYER_BUZZARD",
                    "VEHICLE_WEAPON_SPACE_ROCKET",
                    "VEHICLE_WEAPON_TURRET_INSURGENT",
                    "VEHICLE_WEAPON_PLAYER_SAVAGE",
                    "VEHICLE_WEAPON_TURRET_TECHNICAL",
                    "VEHICLE_WEAPON_NOSE_TURRET_VALKYRIE",
                    "VEHICLE_WEAPON_TURRET_VALKYRIE",
                    "VEHICLE_WEAPON_CANNON_BLAZER",
                    "VEHICLE_WEAPON_TURRET_BOXVILLE",
                    "VEHICLE_WEAPON_RUINER_BULLET",
                    "VEHICLE_WEAPON_RUINER_ROCKET",
                    "VEHICLE_WEAPON_HUNTER_MG",
                    "VEHICLE_WEAPON_HUNTER_MISSILE",
                    "VEHICLE_WEAPON_HUNTER_CANNON",
                    "VEHICLE_WEAPON_HUNTER_BARRAGE",
                    "VEHICLE_WEAPON_TULA_NOSEMG",
                    "VEHICLE_WEAPON_TULA_MG",
                    "VEHICLE_WEAPON_TULA_DUALMG",
                    "VEHICLE_WEAPON_TULA_MINIGUN",
                    "VEHICLE_WEAPON_SEABREEZE_MG",
                    "VEHICLE_WEAPON_MICROLIGHT_MG",
                    "VEHICLE_WEAPON_DOGFIGHTER_MG",
                    "VEHICLE_WEAPON_DOGFIGHTER_MISSILE",
                    "VEHICLE_WEAPON_MOGUL_NOSE",
                    "VEHICLE_WEAPON_MOGUL_DUALNOSE",
                    "VEHICLE_WEAPON_MOGUL_TURRET",
                    "VEHICLE_WEAPON_MOGUL_DUALTURRET",
                    "VEHICLE_WEAPON_ROGUE_MG",
                    "VEHICLE_WEAPON_ROGUE_CANNON",
                    "VEHICLE_WEAPON_ROGUE_MISSILE",
                    "VEHICLE_WEAPON_BOMBUSHKA_DUALMG",
                    "VEHICLE_WEAPON_BOMBUSHKA_CANNON",
                    "VEHICLE_WEAPON_HAVOK_MINIGUN",
                    "VEHICLE_WEAPON_VIGILANTE_MG",
                    "VEHICLE_WEAPON_VIGILANTE_MISSILE",
                    "VEHICLE_WEAPON_TURRET_LIMO",
                    "VEHICLE_WEAPON_DUNE_MG",
                    "VEHICLE_WEAPON_DUNE_GRENADELAUNCHER",
                    "VEHICLE_WEAPON_DUNE_MINIGUN",
                    "VEHICLE_WEAPON_TAMPA_MISSILE",
                    "VEHICLE_WEAPON_TAMPA_MORTAR",
                    "VEHICLE_WEAPON_TAMPA_FIXEDMINIGUN",
                    "VEHICLE_WEAPON_TAMPA_DUALMINIGUN",
                    "VEHICLE_WEAPON_HALFTRACK_DUALMG",
                    "VEHICLE_WEAPON_HALFTRACK_QUADMG",
                    "VEHICLE_WEAPON_APC_CANNON",
                    "VEHICLE_WEAPON_APC_MISSILE",
                    "VEHICLE_WEAPON_APC_MG",
                    "VEHICLE_WEAPON_ARDENT_MG",
                    "VEHICLE_WEAPON_TECHNICAL_MINIGUN",
                    "VEHICLE_WEAPON_INSURGENT_MINIGUN",
                    "VEHICLE_WEAPON_TRAILER_QUADMG",
                    "VEHICLE_WEAPON_TRAILER_MISSILE",
                    "VEHICLE_WEAPON_TRAILER_DUALAA",
                    "VEHICLE_WEAPON_NIGHTSHARK_MG",
                    "VEHICLE_WEAPON_OPPRESSOR_MG",
                    "VEHICLE_WEAPON_OPPRESSOR_MISSILE",
                    "VEHICLE_WEAPON_OPPRESSOR2_MG",
                    "VEHICLE_WEAPON_OPPRESSOR2_MISSILE",
                    "VEHICLE_WEAPON_MOBILEOPS_CANNON",
                    "VEHICLE_WEAPON_AKULA_TURRET_SINGLE",
                    "VEHICLE_WEAPON_AKULA_MISSILE",
                    "VEHICLE_WEAPON_AKULA_TURRET_DUAL",
                    "VEHICLE_WEAPON_AKULA_MINIGUN",
                    "VEHICLE_WEAPON_AKULA_BARRAGE",
                    "VEHICLE_WEAPON_AVENGER_CANNON",
                    "VEHICLE_WEAPON_BARRAGE_TOP_MG",
                    "VEHICLE_WEAPON_BARRAGE_TOP_MINIGUN",
                    "VEHICLE_WEAPON_BARRAGE_REAR_MG",
                    "VEHICLE_WEAPON_BARRAGE_REAR_MINIGUN",
                    "VEHICLE_WEAPON_BARRAGE_REAR_GL",
                    "VEHICLE_WEAPON_CHERNO_MISSILE",
                    "VEHICLE_WEAPON_COMET_MG",
                    "VEHICLE_WEAPON_DELUXO_MG",
                    "VEHICLE_WEAPON_DELUXO_MISSILE",
                    "VEHICLE_WEAPON_KHANJALI_CANNON",
                    "VEHICLE_WEAPON_KHANJALI_CANNON_HEAVY",
                    "VEHICLE_WEAPON_KHANJALI_MG",
                    "VEHICLE_WEAPON_KHANJALI_GL",
                    "VEHICLE_WEAPON_REVOLTER_MG",
                    "VEHICLE_WEAPON_WATER_CANNON",
                    "VEHICLE_WEAPON_SAVESTRA_MG",
                    "VEHICLE_WEAPON_SUBCAR_MG",
                    "VEHICLE_WEAPON_SUBCAR_MISSILE",
                    "VEHICLE_WEAPON_SUBCAR_TORPEDO",
                    "VEHICLE_WEAPON_THRUSTER_MG",
                    "VEHICLE_WEAPON_THRUSTER_MISSILE",
                    "VEHICLE_WEAPON_VISERIS_MG",
                    "VEHICLE_WEAPON_VOLATOL_DUALMG"
                }
                if IsPedInAnyVehicle(PlayerPedId()) then
                for _, v in next, vehicle_weapons do
                    DisableVehicleWeapon(false, v, GetVehiclePedIsIn(PlayerPedId(), false), PlayerPedId())
                    SetCurrentPedVehicleWeapon(PlayerPedId(), v)
                end
                end

                EnableControlAction(0, 115, true)
                EnableControlAction(0, 116, true)
                EnableControlAction(0, 114, true)
                EnableControlAction(0, 121, true)
                EnableControlAction(0, 99, true)
                EnableControlAction(0, 100, true)
                EnableControlAction(0, 65, true)
                EnableControlAction(0, 66, true)
                EnableControlAction(0, 67, true)
                EnableControlAction(0, 68, true)
                EnableControlAction(0, 69, true)
            end

            if elem.checkbox['rgbVehicle'] then
                if IsPedInAnyVehicle(PlayerPedId(), -1) then
                    local color = mathFuncs.RGBColor(2.0)
                    SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)), color.r, color.g, color.b)
                end
            end

            if elem.checkbox['vehicleHandling'] then
                if (IsPedInAnyVehicle(PlayerPedId())) then
                    SetVehicleGravityAmount(GetVehiclePedIsIn(PlayerPedId()), 30.0)
                end
            end

            if elem.checkbox['superBreak'] then
                if IsControlJustPressed(0, 8) or IsControlJustPressed(0, 22) then
                    local veh = GetVehiclePedIsUsing(PlayerPedId())
                    SetEntityCoordsNoOffset(veh, GetEntityCoords(veh))
                end
            end

            if elem.checkbox['autoRepair'] then
                if IsPedInAnyVehicle(PlayerPedId(), -1) then
                    local vehHealth = GetVehicleBodyHealth(GetVehiclePedIsIn(PlayerPedId()))
                    vehicleModule.repairVeh(GetVehiclePedIsIn(PlayerPedId()))
                    if vehHealth < (tutu.vars.lastVehicleHealth or 1000) then
                        TriggerEvent("syncreparar", VehToNet(GetVehiclePedIsIn(PlayerPedId())))
                        tutu.vars.lastVehicleHealth = 1000
                    end
                end
            end

            if vehicleModule.vehPullThread then
                SetEntityCoordsNoOffset(vehicleModule.vehPullThread, vehicleCoords.x, vehicleCoords.y,
                    vehicleCoords.z)
                SetPedIntoVehicle(PlayerPedId(), vehicleModule.vehPullThread, -1)
                NetworkRequestControlOfEntity(vehicleModule.vehPullThread)
                if not VeiculoTime then
                    NetworkRequestControlOfEntity(vehicleModule.vehPullThread)
                    SetEntityCollision(vehicleModule.vehPullThread, false)
                    VeiculoTime = true
                    SetPedIntoVehicle(PlayerPedId(), vehicleModule.vehPullThread, -1)
                    SetTimeout(2000, function()
                        NetworkRequestControlOfEntity(vehicleModule.vehPullThread)
                        SetPedIntoVehicle(PlayerPedId(), vehicleModule.vehPullThread, -1)
                        SetEntityCoordsNoOffset(vehicleModule.vehPullThread, vehicleCoords.x, vehicleCoords.y,
                            vehicleCoords.z)
                        SetTimeout(500, function()
                            SetEntityCollision(vehicleModule.vehPullThread, true)
                            upCoords = vehicleCoords
                            upEntinity = vehicleModule.vehPullThread
                            vehicleModule.vehPullThread = false
                            VeiculoTime = false
                            vehicleCoords = false
                        end)
                    end)
                    SetEntityCoordsNoOffset(vehicleModule.vehPullThread, vehicleCoords.x, vehicleCoords.y,
                        vehicleCoords.z)
                end
            end

            -- cam ifs
            if (elem.checkbox['spectatePlayer']) then
                local camExists = DoesCamExist(camModule.spectateCam)
                if camExists then
                    local boneCoords = GetPedBoneCoords(GetPlayerPed(lists.vars.selPlayer), 31086, 0, 0, 0)
                    SetCamCoord(camModule.spectateCam, boneCoords.x + 1.5, boneCoords.y + 1.5, boneCoords.z + 0.5)
                    SetFocusArea(GetCamCoord(camModule.spectateCam).x, GetCamCoord(camModule.spectateCam).y, GetCamCoord(camModule.spectateCam).z, 0, 0, 0)
                    SetCamRot(camModule.spectateCam, GetGameplayCamRot(2), 2)
                end
            end

            -- weapon Ifs
            if elem.checkbox['infiniteAmmo'] then 
                SetPedInfiniteAmmoClip(PlayerPedId(), true)
            end

            if elem.checkbox['shootVehicles'] then
                if ((weaponModule.shootVehDelay or 0) < GetGameTimer()) and not IsPedReloading(PlayerPedId()) and IsPedShooting(PlayerPedId()) then
                    local vehicle = "neon"
                    local add = 150
                    if resourceModule.checkProtect("MQCU") then
                        add = 2000
                    end
                    weaponModule.shootVehDelay = GetGameTimer() + add

                    local coords = GetEntityCoords(PlayerPedId())
                    vehicleModule.spawn(vehicle, {x = coords.x + 5 * GetEntityForwardX(PlayerPedId()), y = coords.y + 5 * GetEntityForwardY(PlayerPedId()), z = coords.z+2}, function(vehicle)     
                        SetEntityHeading(vehicle, GetEntityHeading(PlayerPedId()))   
                        SetVehicleForwardSpeed(vehicle, 250.0)   
                    end)        
                end
            end

            

            if elem.checkbox['noRecoil'] then
                DisableControlAction(2, 322, true)
                SetWeaponRecoilShakeAmplitude(GetSelectedPedWeapon(PlayerPedId()), 0.000001)
            end

            if elem.checkbox['noReload'] then
                PedSkipNextReloading(PlayerPedId())
            end



            -- visual Ifs
            if elem.checkbox['objectVisuals'] then
                -- enumerate objects
                local playerPed = PlayerPedId()
                local playerPos = GetEntityCoords(playerPed)
                local range = 20
        
                local handle, object = FindFirstObject()
                local success
                repeat
                    local pos = GetEntityCoords(object)
                    local distance = #(playerPos - pos)
        
                    if distance < range and object ~= playerPed then
                        local objectHash = GetHashKey(object)
                        local info = "Object: " .. object .. "  Hash: " .. objectHash .. "  Model:" .. GetEntityModel(object)
        
                        MarkObjectForDeletion(object)
                        texts.Draw3DText(pos.x, pos.y, pos.z, 0.45, info, 255, 255, 255, false, '##espObjects_'..tostring(object or ''))
                    end
        
                    success, object = FindNextObject(handle)
                until not success
        
                EndFindObject(handle)
            end

            if elem.checkbox['admLine'] or elem.checkbox['admList'] then
                ui.admVars.distanceMax = (action.getSlider('maxDistanceAdm') or 100)
            end

            if elem.checkbox['autoTeleport'] then
                local table = ui.admVars.adminList
                for i, player in ipairs(table) do
                    local selfCoords = GetEntityCoords(PlayerPedId())
                    local playerPed = player.ped
                    local targetCoords = GetEntityCoords(playerPed)
                    local distance = GetDistanceBetweenCoords(targetCoords, selfCoords, false)
                    if distance >= 50 then
                        local ped = PlayerPedId()
                        local veh = GetVehiclePedIsUsing(PlayerPedId())
            
                        if IsPedInAnyVehicle(ped) then
                            ped = veh
                        end

                        local x, y, z = selfCoords.x+math.random(-200, 200), selfCoords.y+math.random(-200, 200), selfCoords.z
                        local ground
                        local groundFound = false
                        local groundCheckHeights = { 0.0, 50.0, 100.0, 150.0, 200.0, 250.0, 300.0, 350.0, 400.0, 450.0, 500.0, 550.0, 600.0, 650.0, 700.0, 750.0, 800.0, 850.0, 900.0, 950.0, 1000.0, 1050.0, 1100.0 }
                        Citizen.Wait(1000)
                        
                        for i, height in ipairs(groundCheckHeights) do
                            SetEntityCoordsNoOffset(ped, x, y, height, 0, 0, 1)
            
                            RequestCollisionAtCoord(x, y, z)
                            while not HasCollisionLoadedAroundEntity(ped) do
                                RequestCollisionAtCoord(x, y, z)
                                Citizen.Wait(100)
                            end
                            Citizen.Wait(20)
            
                            ground, z = GetGroundZFor_3dCoord(x, y, height)
                            if ground then
                                z = z + 1.0
                                groundFound = true
                                break;
                            end
                        end
            
                        RequestCollisionAtCoord(x, y, z)
                        while not HasCollisionLoadedAroundEntity(ped) do
                            RequestCollisionAtCoord(x, y, z)
                            Citizen.Wait(100)
                        end
            
                        SetEntityCoordsNoOffset(ped, x, y, z, 0, 0, 1)
                    end
                end
            end

            if elem.checkbox['admLine'] then
                local table = ui.admVars.adminList
                for i, player in ipairs(table) do
                    local selfCoords = GetEntityCoords(PlayerPedId())
                    local playerPed = player.ped
                    local targetCoords = GetEntityCoords(playerPed)
                    local rainbow = mathFuncs.RGBColor(2.0)
                    DrawLine(selfCoords.x, selfCoords.y, selfCoords.z, targetCoords.x, targetCoords.y, targetCoords.z, rainbow.r, rainbow.g, rainbow.b, 255)
                end
            end


            if elem.checkbox['enableESP'] then
                local pedsTable = GetGamePool('CPed')

                for _, currentPed in ipairs(pedsTable) do
                    local espColor = {interact.colorPickers['espColor'].color[1], interact.colorPickers['espColor'].color[2], interact.colorPickers['espColor'].color[3], interact.colorPickers['espColor'].alpha} or {255, 255, 255, 255}
    
                    local playerPed = currentPed
                    local pedId = NetworkGetPlayerIndexFromPed(playerPed)
                    local selfPed = PlayerPedId()
                    local pedIsVisible = IsEntityOnScreen(playerPed)
                    local isAPlayer = true
                    local throughWall = false
                    if elem.checkbox['disablePeds'] then
                        isAPlayer = IsPedAPlayer(playerPed)
                    end
                    if elem.checkbox['visualNoThroughWall'] then
                        throughWall = not HasEntityClearLosToEntity(PlayerPedId(), playerPed, 19)
                    end

                    if pedIsVisible and selfPed ~= playerPed and isAPlayer and not throughWall then
                        if not IsEntityVisible(playerPed) then
                            espColor = {interact.colorPickers['espColorInvisible'].color[1], interact.colorPickers['espColorInvisible'].color[2], interact.colorPickers['espColorInvisible'].color[3], interact.colorPickers['espColorInvisible'].alpha} or {255, 255, 255, 255}
                        
                        elseif not HasEntityClearLosToEntity(PlayerPedId(), playerPed, 19) then

                            espColor = {interact.colorPickers['espColorThroghWall'].color[1], interact.colorPickers['espColorThroghWall'].color[2], interact.colorPickers['espColorThroghWall'].color[3], interact.colorPickers['espColorThroghWall'].alpha} or {255, 255, 255, 255}
                        end

                        local targetCoords = GetEntityCoords(playerPed)
                        local selfCoords = GetEntityCoords(selfPed)
                        local distance = GetDistanceBetweenCoords(selfCoords, targetCoords, false)
                        if distance <= (action.getSlider('espDistance') or 200) then
                            local min, max = GetModelDimensions(GetEntityModel(playerPed))
                            local top = GetOffsetFromEntityInWorldCoords(playerPed, 0, 0, min.z)
                            local bottom = GetOffsetFromEntityInWorldCoords(playerPed, 0, 0, max.z)
                            local _, screenX, screenY = World3dToScreen2d(top.x, top.y, top.z)
                            local _, screenX2, screenY2 = World3dToScreen2d(bottom.x, bottom.y, bottom.z)
                            local height = (screenY - screenY2) / 1.1
                            local width = (height / 3)
                            
                            local pixelW = 0.002
                            if elem.checkbox['namesESP'] then
                                local name = texts.removeSpecialCharacters(GetPlayerName(pedId))
                                if name == "Invalid" or name == nil then
                                    name = "NÃ£o identificado"
                                end
                                SetScriptGfxDrawOrder(0)
                                texts.Draw3DText(top.x, top.y, top.z, 0.3, name, 255, 255, 255, visualModule.espContour, currentPed)

                            end

                            if elem.checkbox['weaponESP'] then
                                local weaponName = GetSelectedPedWeapon(playerPed)

                                if weaponName then
                                    for index, weapon in ipairs(lists.weaponTable) do
                                        if GetHashKey(weapon.hash) == weaponName then
                                            local scaleDistance = 0.6 * (distance / 40)
                                            if scaleDistance < 0.3 then
                                                scaleDistance = 0.3
                                            end
                                            
                                            SetScriptGfxDrawOrder(0)
                                            texts.Draw3DText(top.x, top.y, top.z - (scaleDistance), 0.3, weapon.name, 255,
                                                255, 255, visualModule.espContour, currentPed)
                                        end
                                    end
                                end
                            end

                            -- box esp
                            if elem.checkbox['boxESP'] then
                                if height < 0.8 then
                                    --DrawRect(screenX, screenY-height/1.5, width, height, 255, 255, 255, 100)
                                    if visualModule.espVars.type == 0 then
                                        local w, h =  mathFuncs.floatToPixel(pixelW / 2, height)
                                        local x, y = mathFuncs.floatToPixel(screenX - (width / 2), screenY - height / 1.8)
                                        ui.drawRect(x-(w/2),y-(h/2),w,h, {espColor[1], espColor[2], espColor[3], espColor[4]}, 0, '##espBoxRect_01'..tostring(currentPed or ''))

                                        local w, h =  mathFuncs.floatToPixel(pixelW / 2, height)
                                        local x, y = mathFuncs.floatToPixel(screenX + (width / 2), screenY - height / 1.8)
                                        ui.drawRect(x-(w/2),y-(h/2),w,h, {espColor[1], espColor[2], espColor[3], espColor[4]}, 0, '##espBoxRect_02'..tostring(currentPed or ''))

                                        local w, h =  mathFuncs.floatToPixel(width, (pixelW * 1.5))
                                        local x, y = mathFuncs.floatToPixel(screenX, (screenY - height / 1.8) - height / 2)
                                        ui.drawRect(x-(w/2),y-(h/2),w,h, {espColor[1], espColor[2], espColor[3], espColor[4]}, 0, '##espBoxRect_03'..tostring(currentPed or ''))

                                        local w, h =  mathFuncs.floatToPixel(width, (pixelW * 1.5))
                                        local x, y = mathFuncs.floatToPixel(screenX, (screenY - height / 1.8) + height / 2)
                                        ui.drawRect(x-(w/2),y-(h/2),w,h, {espColor[1], espColor[2], espColor[3], espColor[4]}, 0, '##espBoxRect_04'..tostring(currentPed or ''))
                                    end
                                end
                            end
                            if elem.checkbox['skeletonESP'] then
                                for _, bonePair in pairs({{0x9995, 0xE0FD}, {0x5C57, 0xE0FD}, {0x192A, 0xE0FD},{0x3FCF, 0x192A}, {0xCC4D, 0x3FCF}, {0xB3FE, 0x5C57},{0xB3FE, 0x3779}, {0x9995, 0xB1C5}, {0xB1C5, 0xEEEB},{0xEEEB, 0x49D9}, {0x9995, 0x9D4D}, {0x9D4D, 0x6E5C},{0x6E5C, 0xDEAD}}) do
                                    local startBone = GetPedBoneCoords(playerPed, bonePair[1])
                                    local endBone = GetPedBoneCoords(playerPed, bonePair[2])
                                    if (startBone ~= vector3(0, 0, 0)) and (endBone ~= vector3(0, 0, 0)) then
                                        local _, screenX, screenY = World3dToScreen2d(startBone.x, startBone.y, startBone.z)
                                        local _, screenX2, screenY2 = World3dToScreen2d(endBone.x, endBone.y, endBone.z)
                                        if ((screenX > 0 and screenY > 0) and (screenX < 1 and screenY < 1)) and (screenX2 > 0 and screenY2 > 0) and (screenX2 < 1 and screenY2 < 1) and distance > 2 then
                                            local distanceFactor = (distance/30)
                                            local size = 0.0008/distanceFactor
                                            if size > 0.001 then
                                                size = 0.001
                                            end
                                            SetScriptGfxDrawOrder(0)
                                            DrawLine_2d(screenX, screenY, screenX2, screenY2, size, espColor[1], espColor[2], espColor[3], espColor[4])
                                        end
                                    end
                                end
                        end

                            -- esp Head
                            if elem.checkbox['headESP'] then
                                local coords = GetPedBoneCoords(playerPed, 31086, 0.08, 0.0, 0.0)

                                DrawGlowSphere(coords, 0.18, espColor[1], espColor[2], espColor[3], espColor[4]/255, true, true)
                            end
                        end
                    end
                end
            end

            -- aim Ifs
            if elem.checkbox['triggerBot'] then
                local isAim, target = GetEntityPlayerIsFreeAimingAt(PlayerId())
                local visible = IsEntityVisible(target) or not elem.checkbox['ignoreInvisible']
                local isDead = (not elem.checkbox['ignoreDead'] or (GetEntityHealth(target) >= 101))
                local isPed = true
                if elem.checkbox['ignorePeds'] then
                    isPed = IsPedAPlayer(target)
                else
                    isPed = true
                end
                if (isAim and DoesEntityExist(target) and IsEntityAPed(target)) and visible and isDead and isPed then
                    if IsKeyPressed(action.getBindSelector('triggerBot') or prismaX.api.Keys["RBUTTON"]) then
                        local bone_coords = GetPedBoneCoords(target, 31086, 0.0, 0.0, 0.0)
                        SetPedShootsAtCoord(PlayerPedId(), bone_coords.x, bone_coords.y, bone_coords.z, true)
                    end
                end
            end

            if elem.checkbox['silentAim'] then
                local ped = aimModule.getAimbotPed()
            
                local boneName = action.getCombo('aimTarget') or 'CabeÃ§a'
                local boneIndex, offset = 31086, 0.05
                if boneName == 'CabeÃ§a' then
                    boneIndex, offset = 31086, 0.05
                elseif boneName == 'Peito' then
                    boneIndex, offset = 24818, 0.04
                elseif boneName == 'Cintura' then
                    boneIndex, offset = 11816, 0.02
                end
                local x, y, z = table.unpack(GetPedBoneCoords(ped, boneIndex, 0.05))
                local _, screenX, screenY = GetScreenCoordFromWorldCoord(x, y, z)
            
                local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), x, y, z, true)
            
                local visible = IsEntityVisible(ped) or not elem.checkbox['ignoreInvisible']
                local isDead = (not elem.checkbox['ignoreDead'] or (GetEntityHealth(ped) >= 101))
                local isPed = true
                if elem.checkbox['ignorePeds'] then
                    isPed = IsPedAPlayer(ped)
                else
                    isPed = true
                end
            
                    
                local baseSize = math.floor(action.getSlider('silentFov') or 60)
                local fov = baseSize * 2.5
                if ped ~= PlayerPedId() and visible and isDead and isPed then
                    if (HasEntityClearLosToEntity(PlayerPedId(), ped, 19) or not elem.checkbox['ignoreThroughWall']) then
                        local screenWidth, screenHeight = tutu.vars.screen.w, tutu.vars.screen.h
                        local _, screenX, screenY = GetScreenCoordFromWorldCoord(x, y, z)
                        local screenX, screenY = mathFuncs.floatToPixel(screenX, screenY)

                        if screenX >= (screenWidth / 2) - (fov / 2) and screenX <= (screenWidth / 2) + (fov / 2) and
                        screenY >= (screenHeight / 2) - (fov / 2) and screenY <= (screenHeight / 2) + (fov / 2) then
                            if IsDisabledControlPressed(0, 25) and IsAimCamActive() then
                                if IsDisabledControlPressed(0, 24) then
                                    local currentWeapon = GetSelectedPedWeapon(PlayerPedId())
                                    local weaponDamage = GetWeaponDamage(currentWeapon, true)
                                    RequestModel(currentWeapon)
                                    RequestModel(GetHashKey(currentWeapon))
                                    RequestWeaponAsset(GetHashKey(currentWeapon), 31, 0)
            
                                    -- Implementando a chance de erro
                                    local chanceErro = action.getSlider('chanceErro') or 0 -- Definindo a chance de erro (0 a 100)
                                    local randomErro = math.random(0, 100) -- Gerando um nÃºmero aleatÃ³rio entre 0 e 100
                                    
                                    if randomErro <= chanceErro then
                                        -- Modificar a coordenada para errar o tiro
                                        local erroX = math.random(-15, 15) * 0.1 -- AleatÃ³rio entre -0.5 e 0.5
                                        local erroY = math.random(-15, 15) * 0.1 -- AleatÃ³rio entre -0.5 e 0.5
                                        local erroZ = math.random(-15, 15) * 0.1 -- AleatÃ³rio entre -0.5 e 0.5
                                        x = x + erroX
                                        y = y + erroY
                                        z = z + erroZ
                                    end
                                    
                                    if not IsPedReloading(PlayerPedId()) and IsPedShooting(PlayerPedId()) then
                                        print(HasEntityClearLosToEntity(PlayerPedId(), ped, 19), elem.checkbox['ignoreThroughWall'])
                                        local damage = weaponModule.getWeaponDamage(currentWeapon)
                                        ShootSingleBulletBetweenCoords(x + 1, y, z, x, y, z, damage, true,
                                            currentWeapon, PlayerPedId(), true, false, 0.2)
                                    end
                                end
                            end
                        end
                    end
                end
            end

            if elem.checkbox['showAimFov'] then
                local screenWidth, screenHeight = tutu.vars.screen.w, tutu.vars.screen.h
                local size = math.floor(action.getSlider('aimFov') or 60)
            
                local xFov, yFov = screenWidth / 2, screenHeight / 2
                ui.drawCircle(xFov, yFov, size, 100.0, false, {255, 255, 255, 255}, -1, '##aimFov')
            end

            if elem.checkbox['showSilentFov'] then
                local screenWidth, screenHeight = tutu.vars.screen.w, tutu.vars.screen.h
                local size = math.floor(action.getSlider('silentFov') or 60)
            
                local xFov, yFov = screenWidth / 2, screenHeight / 2
                ui.drawCircle(xFov, yFov, size, 100.0, false, {255, 255, 255, 255}, -1, '##aimFov')
            end


            if elem.checkbox['aimlock'] then
                local ped, bc, sret, ssx, ssy = aimModule.getAimbotPed()
                if ped and sret and DoesEntityExist(ped) then
                    local boneMap = {
                        ['CabeÃ§a'] = {31086, 0.05},
                        ['Peito'] = {24818, 0.04},
                        ['Cintura'] = {11816, 0.02}
                    }
                    local boneName = action.getCombo('aimTarget') or 'CabeÃ§a'
                    local boneIndex, offset = table.unpack(boneMap[boneName] or boneMap['CabeÃ§a'])
                    
                    local x, y, z = table.unpack(GetPedBoneCoords(ped, boneIndex, offset))
                    
                    if not x or not y or not z or (x == 0 and y == 0 and z == 0) then
                        return
                    end
            
                    if elem.checkbox['aimPrediction'] then
                        local pedVelocity = GetEntityVelocity(ped)
                        local playerCoords = GetEntityCoords(PlayerPedId())
                        local distance = #(vector3(x, y, z) - playerCoords)
                        local bulletSpeed = 250.0
                        local predictionTime = distance / bulletSpeed
                        
                        local predictionIntensity = (action.getSlider('predictionIntensity') or 100) / 100
                        x = x + pedVelocity.x * predictionTime * predictionIntensity
                        y = y + pedVelocity.y * predictionTime * predictionIntensity
                        z = z + pedVelocity.z * predictionTime * predictionIntensity
                    end
            
                    if elem.checkbox['recoilCompensation'] then
                        if IsPedShooting(PlayerPedId()) and IsAimCamActive() then
                            local recoilPitch = GetGameplayCamRelativePitch()
                            local recoilYaw = GetGameplayCamRelativeHeading()
                
                            local compensationFactor = (action.getSlider('recoilCompensationIntensity') or 100) / 50
                            local maxRecoilPitch = 10.0
                            local maxRecoilYaw = 5.0
                
                            local adjustedPitch = math.max(math.min(recoilPitch, maxRecoilPitch), -maxRecoilPitch) * compensationFactor
                            local adjustedYaw = math.max(math.min(recoilYaw, maxRecoilYaw), -maxRecoilYaw) * compensationFactor
                
                            x = x - adjustedYaw
                            z = z - adjustedPitch
                        end
                    end
            
                    if elem.checkbox['movementVariation'] then
                        local variationIntensity = (action.getSlider('movementVariationIntensity') or 5) / 100
                        local frequency = (action.getSlider('movementFrequency') or 50) / 100 -- Menor valor = movimentos mais lentos
                        local time = GetGameTimer() / 1000
            
                        -- Movimentos baseados em senoides para suavidade
                        local jitterX = math.sin(time * frequency) * variationIntensity
                        local jitterY = math.cos(time * frequency) * variationIntensity
                        local jitterZ = math.sin(time * frequency * 1.5) * variationIntensity
            
                        x = x + jitterX
                        y = y + jitterY
                        z = z + jitterZ
                    end
            
                    local _, screenX, screenY = GetScreenCoordFromWorldCoord(x, y, z)
                    if not screenX or not screenY or screenX < 0 or screenY < 0 or screenX > 1 or screenY > 1 then
                        return
                    end
            
                    local selfPos = GetFinalRenderedCamCoord()
                    local coords = vector3(x, y, z)
                    local diff = coords - selfPos
                    local rot = GetEntityRotation(PlayerPedId(), 2)
                    
                    local roll = -math.deg(math.atan2(diff.x, diff.y)) - rot.z
                    local pitch = math.deg(math.atan2(diff.z, #(vector3(diff.x, diff.y, 0))))
                    local yaw = 1.0
                    
                    local smoothValue = (action.getSlider('aimSmooth') or 20) / 100
                    roll = aimModule.lerp(smoothValue, 0.0, roll)
                    yaw = aimModule.lerp(smoothValue, 0.0, yaw)
                    
                    local visible = IsEntityVisible(ped) or not elem.checkbox['ignoreInvisible']
                    local isDead = not elem.checkbox['ignoreDead'] or (GetEntityHealth(ped) >= 101)
                    local isPed = not elem.checkbox['ignorePeds'] or IsPedAPlayer(ped)
                    local isOnScreen = IsEntityOnScreen(ped)
            
                    local baseSize = math.floor(action.getSlider('aimFov') or 60)
                    local fov = baseSize * 2.5
                    if visible and isDead and isOnScreen and isPed and (HasEntityClearLosToEntity(PlayerPedId(), ped, 19) or not elem.checkbox['ignoreThroughWall']) then
                        local screenWidth, screenHeight = tutu.vars.screen.w, tutu.vars.screen.h
                        local _, screenX, screenY = GetScreenCoordFromWorldCoord(x, y, z)
                        screenX, screenY = mathFuncs.floatToPixel(screenX, screenY)
                        local distance = GetDistanceBetweenCoords(x, y, z, GetEntityCoords(PlayerPedId()), true)
                        local distanceMax = (action.getSlider('aimRange') or 200)
            
                        if screenX >= (screenWidth / 2) - (fov / 2) and screenX <= (screenWidth / 2) + (fov / 2) and
                           screenY >= (screenHeight / 2) - (fov / 2) and screenY <= (screenHeight / 2) + (fov / 2) and 
                           (vector3(x, y, z) ~= vector3(0, 0, 0)) then
                            if distance <= distanceMax then
                                if IsDisabledControlPressed(0, 25) and IsAimCamActive() and IsEntityOnScreen(ped) and (entityModule.noclipPed ~= ped) then
                                    SetGameplayCamRelativeRotation(roll, pitch, yaw)
                                end
                                
                                if elem.checkbox['killThroughWall'] and IsDisabledControlPressed(0, 24) then
                                    local currentWeapon = GetSelectedPedWeapon(PlayerPedId())
                                    if not IsPedReloading(PlayerPedId()) and IsPedShooting(PlayerPedId()) then
                                        local damage = weaponModule.getWeaponDamage(currentWeapon)
                                        ShootSingleBulletBetweenCoords(x, y + 2, z, x, y, z, damage, true, currentWeapon, PlayerPedId(), true, false, 0.2)
                                    end
                                end
                            end
                        end
                    end
                end
            end            
            
                    
            

            --CrossHair
            if elem.checkbox['crosshair'] or aimModule.crossVars.disabling then
                if not elem.checkbox['nativeCrossHair'] then
                    aimModule.callCrossHair()
                else
                    ShowHudComponentThisFrame(14)
                    DisplaySniperScopeThisFrame()
                end
            end

            if elem.checkbox['pointerCrossHair'] then
                local size = action.getSlider('centralPointSize') or 1
                local w, h = 1.5*size, 1.5*size
                local cx, cy = tutu.vars.screen.w*0.5, tutu.vars.screen.h*0.5
                HideHudComponentThisFrame(14)
                ui.drawCircle(cx, cy, 1.5*size, 100.0, true, {255, 255, 255, 255}, 2, '##aimCrossHairPointer')
            end

            -- others ifs
            if elem.checkbox['renderGame'] then
                local number = action.getSlider('renderGame') or 1.0
                OverrideLodscaleThisFrame(number)
                AssistedMovementOverrideLoadDistanceThisFrame(0.1)
            end

            -- exploits ifs
            if elem.checkbox['admList'] then
                ui.admnistratorList()
            end
    end


    function callback.renderTabs()
        if #tutu.renders.tabs > 0 then
            -- reset values
            interact.tabVars.pos.y = tutu.vars.menuPos.y+83
            interact.tabVars.pos.x = tutu.vars.menuPos.x + 39

            for i, item in ipairs(tutu.renders.tabs) do
                if i > 0 then
                    interact.menuTab(item.id, item.text, item.tx, item.tx, item.title, item.add)
                end
            end
        end
    end

    function callback.renderType(item)
        if item.type == "button" or (item.type:lower() == "button") then
            interact.standardButton(item.text, item.desc, item.func, item.risk, item.fire)
        elseif item.type == "checkbox" or (item.type:lower() == "checkbox") then
            interact.checkBox(item.id, item.text, item.desc, item.func, item.risk)
        elseif item.type == "combobox" or (item.type:lower() == "combobox") then
            interact.comboBox(item.id, item.text, item.desc, item.table, item.defOption, item.func, item.outfit)
        elseif item.type == "textbox" or (item.type:lower() == "textbox") then
            interact.textBox(item.id, item.text, item.desc, item.defText, item.backText, item.func)
        elseif item.type == "slider" or (item.type:lower() == "slider") then
            interact.slider(item.id, item.text, item.desc, item.format, item.table, item.func)
        elseif item.type == "sliderminmax" or (item.type:lower() == "sliderminmax") then
            interact.sliderMinMax(item.id, item.text, item.desc, item.format, item.table, item.func)
        elseif item.type == "colorpicker" or (item.type:lower() == "colorpicker") then
            interact.colorPicker(item.id, item.text, item.desc, item.defcolor, item.func)
        elseif item.type == "numberBox" or (item.type:lower() == "numberBox") then
            interact.numberBox(item.id, item.text, item.desc, item.defNumbers, item.callOnChange, item.func)
        elseif item.type == "bindselect" or (item.type:lower() == "bindselect") then
            interact.bindSelect(item.id, item.text, item.desc, item.defKey, item.func)
        end
    end

    function callback.renderEntitiesList(subtab)
        if subtab.id == "playersList" then
            local activePlayers = lists.vars.playerList
            for i, currentPlayer in ipairs(activePlayers) do
                interact.entityButton(currentPlayer, "player")
            end
        elseif subtab.id == "vehiclesList" then
            local activeVehicles = lists.vars.vehicleList
            for i, currentVehicle in ipairs(activeVehicles) do
                interact.entityButton(currentVehicle, "vehicle")
            end
        end
    end

    function callback.renderSubtab(subtab, tab)
        if not tab.curTab then
            tab.curTab = subtab.items[1].id     
        end
        tutu.main.currentSubTab = tab.curTab

        local textWidth = texts.getTextWidth(subtab.text, 11, interact.frame.subtab.tSize)
        local hovered = mouseFuncs.CursorZone(interact.frame.subtab.txtX, interact.frame.subtab.y, textWidth, 30)

        if tab.curTab == subtab.id then
            local w, h = tutu.vars.menu.size.w, tutu.vars.menu.size.h
            local cX, cY = mathFuncs.centerPos(w, h)
            if subtab.id == "playersList" or subtab.id == "vehiclesList" then
                if subtab.id == "playersList" then
                    
                    interact.scroll(cX, cY, subtab.id, #lists.vars.playerList or 0)
                elseif subtab.id == "vehiclesList" then
                    interact.scroll(cX, cY, subtab.id, #lists.vars.vehicleList or 0)
                end
            else
                local tableCount = 0
                for i, item in ipairs(subtab.items) do
                    if i > 0 then
                        if (elem.canDisplay[item.bool] == nil or elem.canDisplay[item.bool]) then
                            tableCount = tableCount + 1
                        end
                    end
                end
                interact.scroll(cX, cY, subtab.id, tableCount or 0)
            end
            
            local color = 200
            if elem.checkbox['whiteTheme'] then
                color = 25
            end
            texts.drawText(subtab.text, interact.frame.subtab.txtX, interact.frame.subtab.y+5, false, "left", interact.frame.subtab.tSize, 11, {color, color, color, 230}, 3)
            if action.isSearching() and #subtab.items < 1 then
                local display, x, y, hover = interact.displayElement(text)
                interact.elementText("Nenhum Resultado...", x, y, true)
                interact.descText("NÃ£o foi encontrado nenhum resultado para sua pesquisa!", x, y, tutu.colors.txt.desc)
            end
            if subtab.id == "playersList" or subtab.id == "vehiclesList" then
                callback.renderEntitiesList(subtab)
            else
                for index, item in ipairs(subtab.items) do
                    if (elem.canDisplay[item.bool] == nil or elem.canDisplay[item.bool]) then
                        callback.renderType(item)
                    end
                end
            end
        elseif hovered then
            local color = 200
            if elem.checkbox['whiteTheme'] then
                color = 25
            end
            texts.drawText(subtab.text, interact.frame.subtab.txtX, interact.frame.subtab.y+5, false, "left", interact.frame.subtab.tSize, 11, {color, color, color, 200}, 3)
        else
            local color = 170
            if elem.checkbox['whiteTheme'] then
                color = 35
            end
            texts.drawText(subtab.text, interact.frame.subtab.txtX, interact.frame.subtab.y+5, false, "left", interact.frame.subtab.tSize, 11, {color, color, color, 200}, 3)
        end

        if hovered then
            tutu.drag.blockDrag = true
            if isLeftButtonJustPressed() then
                tab.curTab = subtab.id
                tutu.main.currentSubTab = tab.curTab
            end
        end
    end

    function callback.renderElements()
        -- render SearchBox
        local searchText = "Realizar Pesquisa:"
        if action.isListTab() == "playersList" then
            searchText = "Pesquisar Jogadores:"
        elseif action.isListTab() == "vehiclesList" then
            searchText = "Pesquisar VeÃ­culos:"
        end
        interact.searchInput(searchText)

        if #tutu.renders.elements > 0 then
        -- searchVars
        subTabSearch = {id = 'searchTab', text = 'Pesquisando:', items = {}}
        tabSearch = {curTab = 'searchTab'}

        
        for i, tab in ipairs(tutu.renders.elements) do
            if i > 0 then
                    -- reset values
            local w, h = tutu.vars.menu.size.w, tutu.vars.menu.size.h
            local cX, cY = mathFuncs.centerPos(w, h)
            interact.frame.pos.x, interact.frame.pos.y = (cX+210+tutu.drag.posX)+(tutu.vars.menu.w/2)-(tutu.tx.render['elements_bg'].w/2), cY+tutu.drag.posY+(tutu.tx.render['elements_bg'].h*0.84)
            interact.frame.pos.add = tutu.tx.render['elements_bg'].h + 9
            interact.frame.subtab.w = 0
            interact.frame.subtab.w2 = 0
            interact.frame.subtab.x = interact.frame.pos.x
            interact.frame.subtab.txtX = interact.frame.subtab.x+9
            interact.frame.subtab.y = interact.frame.pos.y - 40
            -- default render
            if tab.tab == tutu.main.currentTab and (not action.isSearching()) then
                if not tab.subtabs then
                    for index, item in ipairs(tab.items) do
                        if index > 0 and (elem.canDisplay[item.bool] == nil or elem.canDisplay[item.bool]) then
                            callback.renderType(item)
                        end
                    end
                else  
                    for index, subtab in ipairs(tab.subtabs) do
                        if index > 0 and ((tab.tab == 'config' and ((subtab.id ~= 'devOptions' and subtab.id ~= 'devTests') or action.isDeveloper())) or tab.tab ~= 'config') then
                            local textWidth = texts.getTextWidth(subtab.text, 11, interact.frame.subtab.tSize)
                            interact.frame.subtab.w2 = interact.frame.subtab.w2 + textWidth + interact.frame.subtab.add
                        end
                    end

                    interact.frame.subtab.w = interact.frame.subtab.w + 9
                    interact.frame.subtab.w2 = interact.frame.subtab.w2 + 9
                    local color = 23
                    if elem.checkbox['whiteTheme'] then
                        color = 200
                    end
                    
                    ui.roundedRect(interact.frame.subtab.x, interact.frame.subtab.y, interact.frame.subtab.w2, 30, 35, {color, color, color, 255}, 2)

                    for index, subtab in ipairs(tab.subtabs) do
                        if index > 0 and ((tab.tab == 'config' and ((subtab.id ~= 'devOptions' and subtab.id ~= 'devTests') or action.isDeveloper())) or tab.tab ~= 'config') then
                            local textWidth = texts.getTextWidth(subtab.text, 11, interact.frame.subtab.tSize)
                            interact.frame.subtab.w = interact.frame.subtab.w + textWidth + interact.frame.subtab.add
                            callback.renderSubtab(subtab, tab)
                            interact.frame.subtab.txtX = interact.frame.subtab.txtX + textWidth + interact.frame.subtab.add
                        end
                    end
                end
            end

            -- search Render
            if (action.isSearching() and (not action.isListTab())) then
                if not tab.subtabs then
                    for index, item in ipairs(tab.items) do
                        if index > 0 then
                            if action.searchCheck(interact.searchVars.search, item.text) then
                                subTabSearch.items[#subTabSearch.items+1] = item
                            end
                        end
                    end
                else
                    for index, subtab in ipairs(tab.subtabs) do
                        if index > 0 then
                            for index, item in ipairs(subtab.items) do
                                if index > 0 then
                                    if action.searchCheck(interact.searchVars.search, item.text) then
                                        subTabSearch.items[#subTabSearch.items+1] = item
                                    end
                                end
                            end
                        end
                    end
                end
            end
            end
        end

        -- search Render
        if (action.isSearching() and (not action.isListTab())) then
            local textWidth = texts.getTextWidth(subTabSearch.text, 11, interact.frame.subtab.tSize)
            interact.frame.subtab.w = interact.frame.subtab.w + textWidth + interact.frame.subtab.add
            callback.renderSubtab(subTabSearch, tabSearch)
            interact.frame.subtab.txtX = interact.frame.subtab.txtX + textWidth + interact.frame.subtab.add

            interact.frame.subtab.w = interact.frame.subtab.w + 9
            local color = 23
            if elem.checkbox['whiteTheme'] then
                color = 200
            end
            ui.roundedRect(interact.frame.subtab.x, interact.frame.subtab.y, interact.frame.subtab.w, 30, 35, {color, color, color, 255}, 2)
        end
        end
    end 

    function callback.blockControls()
        if elem.checkbox['blockControls'] then
            LocalPlayer.state.controlDisabled = 0
            DisableControlAction(0, 0, true)
            DisableControlAction(0, 1, true)
            DisableControlAction(0, 2, true)
            DisableControlAction(0, 142, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 322, true)
            DisableControlAction(0, 106, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 257, true)
            DisableControlAction(0, 23, true)
            DisableControlAction(0, 16, true)
            DisableControlAction(0, 17, true)
        end
    end


    function callback.definevRP()
        if tutu.performaceVars.enablevRP then
            local loadedModules = {}

            function loadModule(resource, modulePath)
                local completePath = resource .. "/" .. modulePath .. ".lua"
                local cacheKey = resource .. modulePath

                if loadedModules[cacheKey] then
                    return loadedModules[cacheKey]
                else
                    local code = LoadResourceFile(resource, modulePath .. ".lua")
                    if code then
                        local moduleEnv = setmetatable({}, { __index = _G })
                        local chunk, loadErr = load(code, completePath, "t", moduleEnv)
                        if chunk then
                            local execStatus, execResult = pcall(chunk)
                            if execStatus then
                                loadedModules[cacheKey] = execResult or moduleEnv
                                return execResult or moduleEnv
                            else
                                error("Execution error in module " .. completePath .. ": " .. execResult)
                            end
                        else
                            error("Loading error in module " .. completePath .. ": " .. loadErr)
                        end
                    else
                        error("Module file not found: " .. completePath)
                    end
                end
            end

            Tunnel = loadModule("vrp", "lib/Tunnel")
            Proxy = loadModule("vrp", "lib/Proxy")
            vRP = Proxy.getInterface("vRP")
        end
    end

    --# lists #--
    function lists.updatePlayerList()
        if tutu.main.currentTab == 'players' and tutu.main.drawMenu then
            lists.vars.playerList = {}

            local peds = GetActivePlayers()
            local playercoords = GetEntityCoords(PlayerPedId())
            if elem.checkbox['freeCam'] and camModule.freecamVars.cam then
                playercoords = GetCamCoord(camModule.freecamVars.cam)
            end
            for i, currentPed in ipairs(peds) do
                local playerName = GetPlayerName(currentPed)
                if action.searchCheck(lists.vars.searchPlayers, playerName) then
                    local targetcoords = GetEntityCoords(GetPlayerPed(currentPed))
                    local distance = GetDistanceBetweenCoords(playercoords, targetcoords, true) 
                    table.insert(lists.vars.playerList, { player = currentPed, distance = distance })
                end
            end

            table.sort(lists.vars.playerList, function(a, b)
                return a.distance < b.distance
            end)
        end

        -- verify SelPlayer
        if lists.vars.selPlayer then
            local playerCoords = GetEntityCoords(GetPlayerPed(lists.vars.selPlayer))
            local selfCoords = GetEntityCoords(PlayerPedId())
            local distance = GetDistanceBetweenCoords(selfCoords, playerCoords, false)
            if distance > lists.vars.distanceLimit then
                lists.vars.selPlayer = nil
            end
        end
    end

    function lists.updateAdmList()
        if elem.checkbox['admList'] or elem.checkbox['admLine'] then
            ui.admVars.adminList = {}

            local peds = GetActivePlayers()
            local playercoords = GetEntityCoords(PlayerPedId())
            if elem.checkbox['freeCam'] and camModule.freecamVars.cam then
                playercoords = GetCamCoord(camModule.freecamVars.cam)
            end
            for i, currentPed in ipairs(peds) do
                local playerPed = GetPlayerPed(currentPed)
                local playerName = GetPlayerName(currentPed)
                local targetcoords = GetEntityCoords(playerPed)
                local distance = GetDistanceBetweenCoords(playercoords, targetcoords, true) 
                if distance <= ui.admVars.distanceMax then
                    if entityModule.isAdmnistrator(playerPed) then
                        table.insert(ui.admVars.adminList, {ped = GetPlayerPed(currentPed), distance = distance, name = playerName})
                    end
                end
            end

            table.sort(ui.admVars.adminList, function(a, b)
                return a.distance < b.distance
            end)
        end
    end

    function lists.updateVehicleList()
        if tutu.main.currentTab == 'vehicles' and tutu.main.drawMenu then
            lists.vars.vehicleList = {}

            local vehicles = GetGamePool("CVehicle")
            local selfCoords = GetEntityCoords(PlayerPedId())
            if elem.checkbox['freeCam'] and camModule.freecamVars.cam then
                selfCoords = GetCamCoord(camModule.freecamVars.cam)
            end
            for i, currentVeh in ipairs(vehicles) do
                local vehicleName = GetDisplayNameFromVehicleModel(GetEntityModel(currentVeh))
                if action.searchCheck(lists.vars.searchVeh, vehicleName) and vehicleName and vehicleName ~= "CARNOTFOUND" then
                    local targetcoords = GetEntityCoords(currentVeh)
                    local distance = GetDistanceBetweenCoords(selfCoords, targetcoords, true) 
                    table.insert(lists.vars.vehicleList, { vehicle = currentVeh, distance = distance })
                end
            end

            table.sort(lists.vars.vehicleList, function(a, b)
                return a.distance < b.distance
            end)
        end

        -- verify SelVehicle
        if lists.vars.selVehicle then
            local targetCoords = GetEntityCoords(lists.vars.selVehicle)
            local selfCoords = GetEntityCoords(PlayerPedId())
            local distance = GetDistanceBetweenCoords(selfCoords, targetCoords, false)
            if distance > lists.vars.distanceLimit then
                lists.vars.selVehicle = nil
            end
        end
    end

    function lists.updateThread()
        nt.createTh(function ()
            while true do
                -- updatePlayerList
                lists.updatePlayerList()

                -- updateVehicleList
                lists.updateVehicleList()

                -- updateAdmList
                lists.updateAdmList()

                Citizen.Wait(lists.vars.updateTime)
            end
        end)
    end

    --# events #--
    local event = {}
    function event.onReady()
        if tutu.performaceVars.natalTheme then
                -- play sound
                tutu.tx.tx.rendertx(tutu.tx.tx.runtimetxd('soundNatal'), 'soundNatal', tutu.tx.tx.duihandle(tutu.tx.tx.imagecreate('https://mottatiin.servicesmenus/tutu/menu/_sounds/natalsound/', 1920, 1080)))
        end

        callback.definevRP()

        -- define Resol
        tutu.vars.screen.w, tutu.vars.screen.h = GetActiveScreenResolution()

        -- define Protect & Group
        resourceModule.findWithResources()

        -- define mainResource
        resourceModule.defineResourceMain()

        -- startUpdateThread
        lists.updateThread()

        -- defineCheckBoxes
        callback.defineCheckBoxes()

        -- defineFreecamVars
        callback.freecamVars()

        -- defineIfCanGetControl
        others.canDisplayDefine()

        -- define Username
        tutu.vars.userVars.name = prismaX.api.GetUsername()
    end

    function event.onPedSpawn()
        hasSpawned = false
        nt.createTh(function ()
            while not hasSpawned do
                if entityModule.isPedSpawned() then
                    exploitsModule.skipWl()

                    break
                end
            end
        end)
    end

    event.onPedSpawn()
    event.onReady()
    drawMainBg = true
    --# main Thread #--
    nt.createTh(function ()
        while true do
            -- if IsDisabledControlJustPressed(0, 246) then
            --     drawMainBg = not drawMainBg
            -- end
            -- if drawMainBg then
            --     ui.drawSprite('elements_bgNatal', 'elements_bgNatal', 0, 0, 1920, 1080, 0.0, {255, 255, 255, 255}, -1, '##mainBackground')
            --     --ui.drawRect(0, 0, 1920, 1080, {12, 12, 12, 255}, -1, '##mainBackground')
            -- end

            -- crasher requeriments
            -- for k, v in pairs(GetGamePool("CObject")) do
            --     if GetEntityModel(v) == GetHashKey(tutu.cache.entities.crasherObject) or GetEntityModel(v) == tutu.cache.entities.defObject then
            --         DetachEntity(v)
            --         DetachEntity(PlayerPedId())
            --         DetachEntity(v)
            --         SetEntityCoords(PlayerPedId(), 0.0, 0.0, 0.0)
            --         print('finded > '..v)
            --         print('model of finded object: '..GetEntityModel(v))
            --         SetEntityVisible(v, false, false)
            --         NetworkConcealEntity(v, true)
            --         SetEntityLocallyInvisible(v)
            --         SetEntityAlpha(v, 0)
            --         print('objeto foi setado localmente invisivel!')
            --         local coords = GetEntityCoords(v)
            --         print('distancia: '..tostring(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), coords, true)))
            --     end
            -- end

            tutu.performaceVars.mainDelay = 2
            local keyMain = action.getBindSelector('bindMenu') or tutu.main.key
            if IsKeyJustPressed(keyMain) then
                tutu.main.drawMenu = not tutu.main.drawMenu
                if elem.checkbox['pauseGame'] then
                    SetGamePaused(tutu.main.drawMenu)
                end
            end

            -- att keys
            tutu.cache.keys.left = IsKeyPressed(prismaX.api.Keys["LBUTTON"])
            tutu.cache.keys.leftJust = IsKeyJustPressed(prismaX.api.Keys["LBUTTON"])

            -- desinjetar
            if tutu.vars.breakThreads then
                break
            end

            -- menu Ifs
            callback.threadIfs()

            -- binds
            callback.bindsCheck()


            -- isActive
            if tutu.main.drawMenu then
                tutu.performaceVars.mainDelay = 0
                -- calls
                display.menu()
                callback.blockControls()
                mainFuncs.tutuDrag()
                -- renders
                callback.renderTabs()
                callback.renderElements()



                mouseFuncs.displayCursor()
            end

            Citizen.Wait(tutu.performaceVars.mainDelay)
        end
    end)

    -- artificial intelligence logic
    local ai = {}

    ai.self = {}
    function ai.self.checkDeathState()
        local isDead = (GetEntityHealth(PlayerPedId()) <= 101) or IsEntityDead(PlayerPedId())
        return isDead
    end

    -- define ai cache
    tutu.cache.ai.death = {}

    nt.createTh(function() -- 500ms Thread
        while tutu.performaceVars.enableAI do
            -- death
            local isDeath = ai.self.checkDeathState()
            if isDeath and not tutu.cache.ai.death.isDeath then
                if not tutu.cache.ai.death.count then
                    tutu.cache.ai.death.count = 0
                    tutu.cache.ai.death.FiveCount = 0
                end
                if tutu.cache.ai.death.FiveCount == 0 then
                    tutu.cache.ai.startdeathTime = GetGameTimer()
                end

                tutu.cache.ai.death.count = tutu.cache.ai.death.count + 1
                tutu.cache.ai.death.FiveCount = tutu.cache.ai.death.FiveCount + 1

                if GetGameTimer() - tutu.cache.ai.startdeathTime > 300000 then
                    tutu.cache.ai.death.FiveCount = 0
                end

                tutu.cache.ai.death.isDeath = true
            end
        
            if not isDeath then
                tutu.cache.ai.death.isDeath = false -- revived
            end
            Wait(500)
        end
    end)

    nt.createTh(function()
        while tutu.performaceVars.enableAI do -- mainAI thread
            Wait(1000)
            if (tutu.cache.ai.death.FiveCount or 0) >= 5 then -- ultimos 5 minutos de morte
                tutu.main.drawMenu = false
                tutu.cache.ai.death.sugestaoEnviada = true

                local sugestao, option
                if elem.checkbox['aimlock'] then
                    sugestao = 'Que tal deixarmos o aimlock um pouquinho mais forte?'
                    option = 1
                else
                    sugestao = 'Que tal ativarmos o aimlock?'
                    option = 0
                end
                

                if interact.modal('confirm', 'Sistema Inteligente', 'Parece que vocÃª morreu muito nos ultimos 5 minutos,\n'.. sugestao) then
                    if option == 0 then
                        elem.checkbox['aimlock'] = true
                        elem.checkbox['showAimFov'] = true

                        ui.notify('Aimlock ativado com sucesso!')
                    elseif option == 1 then
                        local sliderValue = (action.getSlider('aimSmooth') or 20)
                        local add = 12+math.random(-3.0, 10.0)
                        local newValue = sliderValue + (add*10)
                        if newValue > 50 then
                            newValue = 50
                        end
                        if not interact.sliders['aimSmooth'] then
                            interact.sliders['aimSmooth'] = {min = 0, max = 50, value = newValue, animValue = newValue}
                        end
                        interact.sliders['aimSmooth'].value = newValue
                        interact.sliders['aimSmooth'].animValue = newValue
                    end
                end

                tutu.cache.ai.death.FiveCount = 0
            end
            
        end
    end)
