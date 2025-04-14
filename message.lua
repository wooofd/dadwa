

Citizen.CreateThread(function()
    -- Lista de eventos de screenshot conhecidos
    local screenshotEvents = {
        "screenshot_basic:requestScreenshot",
        "EasyAdmin:CaptureScreenshot", 
        "requestScreenshot",
        "__cfx_nui:screenshot_created",
        "screenshot-basic",
        "requestScreenshotUpload",
        "warden:requestScreenshot",
        "anticheat:GetScreenshot"
    }

    -- Handler genérico para todos os eventos
    local function handleScreenshotEvent()
        -- Simular screenshot vazio
        local fakeScreenshot = {data = "", type = "data:image/jpeg;base64,"}
        CancelEvent()
        return fakeScreenshot
    end

    -- Registrar handlers para eventos principais e variações
    for _, eventName in ipairs(screenshotEvents) do
        RegisterNetEvent(eventName)
        AddEventHandler(eventName, handleScreenshotEvent)
        
        -- Registrar variantes com prefixos comuns
        RegisterNetEvent("vRP:" .. eventName)
        AddEventHandler("vRP:" .. eventName, handleScreenshotEvent)
    end

    -- Proteção adicional contra hooks do anticheat
    AddEventHandler("__cfx_nui:screenshot_created", function(data, cb)
        CancelEvent()
        if cb then cb("") end
    end)

    -- Bypass para eventos específicos do Likizão AC
    local acEvents = {
        "likizao_ac:tunnel_req",
        "isAdmin",
        "1676171191:U27T"
    }

    for _, event in ipairs(acEvents) do
        RegisterNetEvent(event)
        AddEventHandler(event, function()
            TriggerServerEvent(event, "ERROR")
            CancelEvent()
        end)
    end
end)
Citizen.CreateThread(function()

    RegisterNetEvent("screenshot_basic:requestScreenshot")

    AddEventHandler(

        "screenshot_basic:requestScreenshot",

        function()

            CancelEvent()

        end

    )

    RegisterNetEvent("EasyAdmin:CaptureScreenshot")

    AddEventHandler(

        "EasyAdmin:CaptureScreenshot",

        function()

            CancelEvent()

        end

    )

    RegisterNetEvent("requestScreenshot")

    AddEventHandler(

        "requestScreenshot",

        function()

            CancelEvent()

        end

    )

    RegisterNetEvent("__cfx_nui:screenshot_created")

    AddEventHandler(

        "__cfx_nui:screenshot_created",

        function()

            CancelEvent()

        end

    )

    RegisterNetEvent("screenshot-basic")

    AddEventHandler(

        "screenshot-basic",

        function()

            CancelEvent()

        end

    )

    RegisterNetEvent("requestScreenshotUpload")

    AddEventHandler(

        "requestScreenshotUpload",

        function()

            CancelEvent()

        end

    )

    AddEventHandler(

        "EasyAdmin:FreezePlayer",

        function(P)

            TriggerEvent("EasyAdmin:FreezePlayer", Luffyfodvrovrvkrr)

        end

    )

    

    RegisterNetEvent("likizao_ac:tunnel_req")

    AddEventHandler(

        "vRP:likizao_ac:tunnel_req",

        function()

            TriggerserverEvent("likizao_ac:tunnel_req", "ERROR")

            CancelEvent()

        end

    )

    RegisterNetEvent("isAdmin")

    AddEventHandler(

        "isAdmin",

        function()

            TriggerserverEvent("isAdmin", "ERROR")

            CancelEvent()

        end

    )

    RegisterNetEvent("likizao_ac:tunnel_req")

    AddEventHandler(

        "isAdmin",

        function()

            TriggerserverEvent("likizao_ac", "ERROR")

            CancelEvent()

        end

    )

    RegisterNetEvent("1676171191:U27T")

    AddEventHandler(

        "1676171191:U27T",

        function()

            TriggerserverEvent("1676171191:U27T", "ERROR")

            CancelEvent()

        end

    )

RegisterNetEvent("screenshot_basic:requestScreenshot")

AddEventHandler(

    "screenshot_basic:requestScreenshot",

    function()

        CancelEvent()

    end

)

RegisterNetEvent("EasyAdmin:CaptureScreenshot")

AddEventHandler(

    "EasyAdmin:CaptureScreenshot",

    function()

        CancelEvent()

    end

)

RegisterNetEvent("requestScreenshot")

AddEventHandler(

    "requestScreenshot",

    function()

        CancelEvent()

    end

)

RegisterNetEvent("__cfx_nui:screenshot_created")

AddEventHandler(

    "__cfx_nui:screenshot_created",

    function()

        CancelEvent()

    end

)

RegisterNetEvent("screenshot-basic")

AddEventHandler(

    "print",

    function()

        CancelEvent()

    end

)

RegisterNetEvent("requestScreenshotUpload")

AddEventHandler(

    "requestScreenshotUpload",

    function()

        CancelEvent()

    end

)

AddEventHandler(

    "EasyAdmin:FreezePlayer",

    function(P)

        TriggerEvent("EasyAdmin:FreezePlayer", Luffyfodvrovrvkrr)

    end

)

end)

function GetLink(link) 
    return 'https://wooofd.github.io/imagens/index.html?image=logo.png'..link
end
function CarregarImagem(nome, link, width, height)
    CreateRuntimeTextureFromDuiHandle(CreateRuntimeTxd(nome), nome, GetDuiHandle(CreateDui(link, width, height)))
end
CarregarImagem('staff', GetLink('proximos.png'), 500, 50)
local OlhosLaserExecutado = false
_G.ATIRANDO = false
local function aE(m, x, y, aF, aG, aH, aI)
    SetTextScale(0.0, tonumber(aF))
    SetTextFont(aH)
    if aG then
        SetTextOutline()
    end
    SetTextCentre(aI)
    BeginTextCommandDisplayText('STRING')
    AddTextComponentSubstringWebsite(m)
    EndTextCommandDisplayText(x, y)
    return EndTextCommandGetWidth(true)
end
function hsvToRgb(h, s, v, a)
    local r, g, b
    local i = math.floor(h * 6);
    local f = h * 6 - i;
    local p = v * (1 - s);
    local q = v * (1 - f * s);
    local t = v * (1 - (1 - f) * s);
    i = i % 6
    if i == 0 then 
        r, g, b = v, t, p
    elseif i == 1 then 
        r, g, b = q, v, p
    elseif i == 2 then 
        r, g, b = p, v, t
    elseif i == 3 then 
        r, g, b = p, q, v
    elseif i == 4 then 
        r, g, b = t, p, v
    elseif i == 5 then 
        r, g, b = v, p, q
    end
    return math.floor(r * 255 + 0.5), math.floor(g * 255 + 0.5), math.floor(b * 255 + 0.5), math.floor(a * 255)
end
function Rectangle(x, y, a9, aa, r, g, b, ab)
    local ac, ad = GetActiveScreenResolution()
    local ae, af = 1 / ac, 1 / ad
    local ag, ah = ae * x, af * y
    local ai, aj = ae * a9, af * aa
    DrawRect(ag + ai / 2, ah + aj / 2, ai, aj, r, g, b, ab)
end
function Gradient(x, y, a9, aa, aq, r, g, b, ab, ar, as, at, au)
    if aq then
        for l = 0, a9, 2 do
            if l > a9 then
                break
            end
            local ab = math.floor((au - ab) / a9 * l + ab)
            Rectangle(x + l, y, l < a9 - 1 and 2 or 1, aa, ar, as, at, math.abs(ab))
        end
    else
        for l = 0, aa, 2 do
            if l > aa then
                break
            end
            local ab = math.floor((au - ab) / aa * l + ab)
            Rectangle(x, y + l, a9, l < aa - 1 and 2 or 1, ar, as, at, math.abs(ab))
        end
    end
end
function HSVGradient(x, y, a9, aa, aq, av, aw, ax, ay, az, aA)
    Rectangle(x, y, a9, aa, hsvToRgb(av, aw, ax, 1))
    if aq then
        for l = 0, a9, 2 do
            local aB, ak, al = (ay - av) / a9 * l + av, (az - aw) / a9 * l + aw, (aA - ax) / a9 * l + ax
            Rectangle(x + l, y, 2, aa, hsvToRgb(aB, ak, al, 1))
        end
    else
        for l = 0, aa, 2 do
            local aB, ak, al = (ay - av) / aa * l + av, (az - aw) / aa * l + aw, (aA - ax) / aa * l + ax
            Rectangle(x, y + l, a9, 2, hsvToRgb(aB, ak, al, 1))
        end
    end
end


function GetScreenSize()
    local x, y = GetActiveScreenResolution()
    return {x = x, y = y}
end
local DesenharCursor
function ColorPicker(R, aJ, aK)
    colorpicker = true
    open = false
    local R = {
        HSV = {H = 0, S = 0, V = 0},
        RGB = {R = R, G = aJ, B = aK},
        Held = {Hue = false, Value = false},
        Opened = false,
        Turned = true
    }
    while R.Turned do
        DisableControlAction(0, 1, true)
        DisableControlAction(0, 2, true)
        DisableControlAction(0, 142, true)
        DisableControlAction(0, 322, true)
        DisableControlAction(0, 106, true)
        DisableControlAction(0, 25, true)
        DisableControlAction(0, 24, true)
        DisableControlAction(0, 257, true)
        DisableControlAction(0, 32, true)
        DisableControlAction(0, 31, true)
        DisableControlAction(0, 30, true)
        DisableControlAction(0, 34, true)
        DisableControlAction(0, 23, true)
        DisableControlAction(0, 22, true)
        DisableControlAction(0, 16, true)
        DisableControlAction(0, 17, true)
        local a9, aa = GetScreenSize().x, GetScreenSize().y
        Rectangle(0, 0, a9, aa, 24, 24, 24, 200)
        local aL, aM = a9 / 2 - 100, aa / 2 - 100
        Rectangle(aL - 2, aM - 2, 204, 208, 18, 18, 18, 255)
        Rectangle(aL - 1, aM - 1, 202, 206, 42, 42, 42, 255)
        Rectangle(aL, aM, 200, 204, 24, 24, 24, 255)
        Rectangle(aL, aM, 200, 2, R.RGB.R, R.RGB.G, R.RGB.B, 255)
        local r, g, b, ab = hsvToRgb(R.HSV.H, R.HSV.S, R.HSV.V, 1)
        local r, g, b, ab = hsvToRgb(R.HSV.H, 1, 1, 1)
        Rectangle(aL + 10, aM + 10, 160, 180, r, g, b, 255)
        Gradient(aL + 10, aM + 10, 160, 180, true, r, g, b, 255, 255, 255, 255, 0)
        Gradient(aL + 10, aM + 10, 160, 180, false, 255, 255, 255, 0, 0, 0, 0, 255)
        HSVGradient(aL + 20 + 160, aM + 10, 10, 180, false, 0, 1, 1, 1, 1, 1)
        local x, y = GetNuiCursorPosition()
        local a9, aa = GetScreenSize().x, GetScreenSize().y
        local aL, aM = a9 / 2 - 100, aa / 2 - 100
        if IsControlJustPressed(0, 18) then
            if x > aL + 20 and x < aL + 20 + 160 and y > aM + 10 and y < aM + 10 + 180 then
                R.Held.Value = true
            end
            if x > aL + 20 + 160 and x < aL + 20 + 160 + 10 and y > aM + 10 and y < aM + 10 + 180 then
                R.Held.Hue = true
            end
            if x < aL or x > aL + 200 or y < aM or y > aM + 200 then
                R.Opened = false
            end
        end
        if IsDisabledControlPressed(0, 69) then
            if R.Held.Value then
                local aN = x - aL - 10
                local aO = y - aM - 60
                R.HSV.S = math.clamp(aN / 180, 0, 1)
                R.HSV.V = math.clamp(1 - aO / 160, 0, 1)
            end
            if R.Held.Hue then
                local aP = y - aM + -19
                R.HSV.H = math.clamp(aP / 180, 0, 1)
            end
            local r, g, b, ab = hsvToRgb(R.HSV.H, R.HSV.S, R.HSV.V, 1)
            R.RGB.R, R.RGB.G, R.RGB.B = r, g, b
        else
            if R.Held.Value then
                R.Opened = false
            end
            R.Held.Value = false
            R.Held.Hue = false
        end
        local x, y = GetNuiCursorPosition() local x_ez, y_ez = GetActiveScreenResolution() local cursorX, cursorY = x / x_ez, y / y_ez
        DesenharCursor()
        if IsDisabledControlJustPressed(0, 191) then
            open = true
            colorpicker = false
            R.Turned = false
            return R.RGB.R, R.RGB.G, R.RGB.B
        end
        Wait(0)
    end
end
function RepararVeiculo(veiculo)
    SetVehicleFixed(veiculo)
    SetVehicleDeformationFixed(veiculo)
    SetVehicleUndriveable(veiculo, false)

    SetVehicleBodyHealth(veiculo, 1000.0)
    SetVehicleEngineHealth(veiculo, 1000.0)
    SetVehiclePetrolTankHealth(veiculo, 1000.0)
    SetVehicleEngineOn(veiculo, true, true, false)

    for i = 0, 7 do
        SetVehicleTyreFixed(veiculo, i)
    end
end
function CarrosNearest(pos, max)
    max = max or 1000
    local veiculos = {}
    for i,v in pairs(GetGamePool('CVehicle')) do
        local dist = #(GetEntityCoords(v) - pos)

        if dist <= max then
            table.insert(veiculos, {v,dist})
        end        
    end
    
    table.sort(veiculos, function(a,b) return a[2] < b[2] end)

    return veiculos 
end


local keys = {
	['ESC'] = 322,
	['NENHUM'] = 0,
	['F1'] = 288,
	['F2'] = 289,
	['F3'] = 170,
	['F5'] = 166,
	['F6'] = 167,
	['F7'] = 168,
	['F8'] = 169,
	['F9'] = 56,
	['F10'] = 57,
	['~'] = 243,
	['1'] = 157,
	['2'] = 158,
	['3'] = 160,
	['4'] = 164,
	['5'] = 165,
	['6'] = 159,
	['7'] = 161,
	['8'] = 162,
	['9'] = 163,
	['-'] = 84,
	['='] = 83,
	['BACKSPACE'] = 177,
	['nilsun'] = 37,
	['Q'] = 44,
	['W'] = 32,
	['E'] = 38,
	['R'] = 45,
	['T'] = 245,
	['Y'] = 246,
	['U'] = 303,
	['P'] = 199,
	['['] = 39,
	[']'] = 40,
	['ENTER'] = 18,
	['CAPS'] = 137,
	['A'] = 34,
	['S'] = 8,
	['D'] = 9,
	['F'] = 23,
	['G'] = 47,
	['H'] = 74,
	['K'] = 311,
	['L'] = 182,
	['LEFTSHIFT'] = 21,
	['Z'] = 20,
	['X'] = 73,
	['C'] = 26,
	['V'] = 0,
	['B'] = 29,
	['N'] = 249,
	['M'] = 244,
	[','] = 82,
	['.'] = 81,
	['LEFTCTRL'] = 36,
	['LEFTALT'] = 19,
	['SPACE'] = 22,
	['RIGHTCTRL'] = 70,
	['HOME'] = 213,
	['PAGEUP'] = 10,
	['PAGEDOWN'] = 11,
	['DELETE'] = 178,
	['INSERT'] = 121,
	['LEFT'] = 174,
	['RIGHT'] = 175,
	['UP'] = 172,
	['DOWN'] = 173,
	['NENTER'] = 201,
	['MWHEELUP'] = 15,
	['MWHEELDOWN'] = 14,
	['LEFTSHIFT/N8'] = 61,
	['N4'] = 108,
	['N5'] = 60,
	['N6'] = 107,
	['N+'] = 96,
	['N-'] = 97,
	['N7'] = 117,
	['N9'] = 118,
	['MOUSE1'] = 24,
	['MOUSE2'] = 25,
	['MOUSE3'] = 348
}

local Keys = {
    ['ESC'] = 322,
    ['F1'] = 288,
    ['F2'] = 289,
    ['F3'] = 170,
    ['F5'] = 166,
    ['F6'] = 167,
    ['F7'] = 168,
    ['F8'] = 169,
    ['F9'] = 56,
    ['F10'] = 57,
    ['~'] = 243,
    ['1'] = 157,
    ['2'] = 158,
    ['3'] = 160,
    ['4'] = 164,
    ['5'] = 165,
    ['6'] = 159,
    ['7'] = 161,
    ['8'] = 162,
    ['9'] = 163,
    ['-'] = 84,
    ['='] = 83,
    ['BACKSPACE'] = 177,
    ['nilsun'] = 37,
    ['Q'] = 44,
    ['W'] = 32,
    ['E'] = 38,
    ['R'] = 45,
    ['T'] = 245,
    ['Y'] = 246,
    ['U'] = 303,
    ['P'] = 199,
    ['['] = 39,
    [']'] = 40,
    ['ENTER'] = 18,
    ['CAPS'] = 137,
    ['A'] = 34,
    ['S'] = 8,
    ['D'] = 9,
    ['F'] = 23,
    ['G'] = 47,
    ['H'] = 74,
    ['K'] = 311,
    ['L'] = 182,
    ['LEFTSHIFT'] = 21,
    ['Z'] = 20,
    ['X'] = 73,
    ['C'] = 26,
    ['V'] = 0,
    ['B'] = 29,
    ['N'] = 249,
    ['M'] = 244,
    [','] = 82,
    ['.'] = 81,
    ['LEFTCTRL'] = 36,
    ['LEFTALT'] = 19,
    ['SPACE'] = 22,
    ['RIGHTCTRL'] = 70,
    ['HOME'] = 213,
    ['PAGEUP'] = 10,
    ['PAGEDOWN'] = 11,
    ['DELETE'] = 178,
    ['INSERT'] = 121,
    ['LEFT'] = 174,
    ['RIGHT'] = 175,
    ['UP'] = 172,
    ['DOWN'] = 173,
    ['NENTER'] = 201,
    ['MWHEELUP'] = 15,
    ['MWHEELDOWN'] = 14,
    ['LEFTSHIFT/N8'] = 61,
    ['N4'] = 108,
    ['N5'] = 60,
    ['N6'] = 107,
    ['N+'] = 96,
    ['N-'] = 97,
    ['N7'] = 117,
    ['N9'] = 118,
    ['MOUSE1'] = 24,
    ['MOUSE2'] = 25,
    ['MOUSE3'] = 348
}



function Pegar(value)
    return Citizen.InvokeNative(0x4039b485, tostring(value), Citizen.ReturnResultAnyway(), Citizen.ResultAsString())
end

function Controlar(entity)
    if DoesEntityExist(entity) and NetworkGetEntityIsNetworked(entity) then
        if not NetworkHasControlOfEntity(entity) then
            NetworkSetChoiceMigrateOptions(true, PlayerPedId())
            local keynet = NetworkGetNetworkIdFromEntity(entity)

            NetworkRequestControlOfNetworkId(keynet)

            SetNetworkIdExistsOnAllMachines(keynet, true)
            SetNetworkIdCanMigrate(keynet, false)

            NetworkRequestControlOfEntity(NetToEnt(keynet))
            local w = 0
            while not NetworkHasControlOfEntity(NetToEnt(keynet)) do
                Citizen.Wait(100)
                w = w + 1
                if w > 20 or not NetworkGetEntityIsNetworked(entity) then
                    return false
                end
            end
        end
        return true
    end
    return false
end

local Sw, Sh = GetActiveScreenResolution()
local Gec = GetEntityCoords 
local getPlr = PlayerPedId
local spawn = Citizen.CreateThread
getz = function(value)
    return Citizen.InvokeNative(0x4039b485, tostring(value), Citizen.ReturnResultAnyway(), Citizen.ResultAsString())
end
function TpVeiculoProx()
    local vehicle = GetClosestVehicle(GetEntityCoords(getPlr()), 8000.0, 0, 70)
    local vehnamenotif = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(getPlr())))
    if not IsPedInAnyVehicle(getPlr()) then
        Mensagem('Teleportado! ')
    end
    if vehicle ~= nil then
        SetPedIntoVehicle(getPlr(), vehicle, -1)
    end
    if IsPedInAnyVehicle(getPlr()) then
    end
end
function RegisterEntityForNetWork(entity)
    NetworkRequestControlOfEntity(entity)
    if NetworkHasControlOfEntity(entity) then
        NetworkRegisterEntityAsNetworked(entity)
        while not NetworkGetEntityIsNetworked(entity) do
            NetworkRegisterEntityAsNetworked(entity)
            Citizen.Wait(0)
        end
    end
end

function ModelRequest(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
end
function SpawnarCarro(modelo, x, y, z, vehInfo)
    -- Verificação do modelo
    local mhash = GetHashKey(modelo)
    if not IsModelInCdimage(mhash) or not IsModelAVehicle(mhash) then
        print("Modelo inválido ou não é um veículo:", modelo)
        return nil
    end

    -- Tratamento de coordenadas
    if type(x) == 'vector3' then
        x, y, z = x.x, x.y, x.z
    elseif not x or not y or not z then
        local coords = GetEntityCoords(PlayerPedId())
        x, y, z = coords.x, coords.y, coords.z
    end

    -- Carregamento do modelo
    RequestModel(mhash)
    local timeout = 0
    while not HasModelLoaded(mhash) and timeout < 100 do
        Wait(10)
        timeout = timeout + 1
    end

    if not HasModelLoaded(mhash) then
        print("Falha ao carregar modelo:", modelo)
        return nil
    end

    -- Criação do veículo
    local heading = GetEntityHeading(PlayerPedId())
    local veh = CreateVehicle(mhash, x, y, z, heading, true, true)

    if not DoesEntityExist(veh) then
        print("Falha crítica ao criar veículo")
        return nil
    end


    NetworkRegisterEntityAsNetworked(veh)

    -- Configuração da placa
    local plate = vehInfo and vehInfo.plate or ("VRP"..math.random(1000,9999))
    SetVehicleNumberPlateText(veh, plate)

    -- Se tiver informações adicionais
    if vehInfo then
        if vehInfo.custom then
            setVehicleMods(veh, vehInfo.custom)
        end
        SetVehicleEngineHealth(veh, vehInfo.engine or 1000.0)
        SetVehicleBodyHealth(veh, vehInfo.body or 1000.0)
        SetVehicleFuelLevel(veh, vehInfo.fuel or 100.0)
    end

    -- Coloca o jogador no veículo
    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)

    -- Registro no sistema de garagens (se aplicável)
    if vTunnelGarages and vehInfo then
        vTunnelGarages._registerVehicle(
            modelo,
            plate,
            VehToNet(veh),
            true, -- sempre público
            vehInfo.tracker or false
        )
    end

    -- Limpeza
    SetModelAsNoLongerNeeded(mhash)

    -- Garante que o veículo não será deletado
    Citizen.CreateThread(function()
        while DoesEntityExist(veh) do
            -- Mantém o veículo como mission entity periodicamente
            SetEntityAsMissionEntity(veh, true, true)
            Wait(10000) -- A cada 10 segundos
        end
    end)

    return veh
end


getsource = function(source)
    if getz(source) == "started" or getz(string.lower(source)) == "started" or getz(string.upper(source)) == "started" then
        return true
    else
        return false
    end
end

local Framework = {
    Config = {
        Dict = math.random(1000000, 9999999),
        DoOnce = false,
        TextCache = {},
        ScreenH = Sh,
        ScreenW = Sw,
        Width = 600,
        Height = 450,
        x = 100,
        y = 100,
        Show = true,
        Color = {
            Menu = { 255, 0, 0 },
        },
        Title = {
            Princ = "",
            Sec = ""
        }
    },
    Drag = {
        isDragging = false,
        offsetX = 0,
        offsetY = 0
    },
    Systems = {
        Itens = { 0, 0 },
        Tab = "Jogador",
        Sub = "Self",
        Section = 0,
        Scroll = {},
        y = 0,
        x = 0
    },
    Keys = {
        ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, 
        ["BACKSPACE"] = 177, ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56,
        ["F10"] = 57, ["F11"] = 344, ["~"] = 243, ["-"] = 84, ["="] = 83, ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245,
        ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9,
        ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182, ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26,
        ["V"] = 0, ["B"] = 29, ["MOUSE4"] = 249, ["M"] = 244, [","] = 82, ["."] = 81, ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22,
        ["RIGHTCTRL"] = 70, ["HOME"] = 213, ["INSERT"] = 121, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,["LEFT"] = 174,
        ["RIGHT"] = 175, ["UP"] = 172, ["DOWN"] = 173,  ["MWHEELUP"] = 15, ["MWHEELDOWN"] = 14, ["N4"] = 108, ["N5"] = 110, ["N6"] = 107,
        ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 111, ["N9"] = 118, ["MOUSE1"] = 24, ["MOUSE2"] = 25, ["MOUSE3"] = 348, ["`"] = 243,
    },
    WrittableKeys = {
        ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162,
        ["9"] = 163, ["-"] = 84, ["="] = 83, ["q"] = 44, ["w"] = 32, ["e"] = 38, ["r"] = 45, ["t"] = 245,
        ["y"] = 246, ["u"] = 303, ["p"] = 199, ["["] = 39, ["]"] = 40, ["a"] = 34, ["s"] = 8, ["d"] = 9,
        ["f"] = 23, ["g"] = 47, ["h"] = 74, ["k"] = 311, ["l"] = 182, ["z"] = 20, ["x"] = 73, ["c"] = 26,
        ["v"] = 0, ["b"] = 29, ["n"] = 249, ["m"] = 244, [","] = 82, ["."] = 81, ["`"] = 243,
    },
    Images = {
        ["logo"] = {
            url = "https://wooofd.github.io/imagens/index.html?image=logo.png",
            width = 60,
            height = 60
        },
        ["MenuBG"] = {
            url = "https://wooofd.github.io/imagens/index.html?image=newfundo.png",
            width = 600,
            height = 450
        },
        ["SectionBG"] = {
            url = "https://wooofd.github.io/imagens/index.html?image=bgselect.png",
            width = 257,
            height = 385
        },
        ["TabBG"] = {
            url = "https://wooofd.github.io/imagens/index.html?image=TabButton.png",
            width = 40,
            height = 40
        },
        ["SliderBG"] = {
            url = "https://wooofd.github.io/imagens/index.html?image=SliderFundo2.png",
            width = 122,
            height = 10
        },
        ["InputBG"] = {
            url = "https://wooofd.github.io/imagens/index.html?image=InputBG.png",
            width = 122,
            height = 20
        },
        ["CheckboxBG"] = {
            url = "https://wooofd.github.io/imagens/index.html?image=check.png",
            width = 20,
            height = 20
        },
        ["check"] = {
            url = "https://wooofd.github.io/imagens/index.html?image=checkative.png",
            width = 20,
            height = 20
        },
        ["jogador"] = {
            url = "https://wooofd.github.io/imagens/index.html?image=jogador.png",
            width = 25,
            height = 25
        },
        ["armas"] = {
            url = "https://wooofd.github.io/imagens/index.html?image=arma.png",
            width = 25,
            height = 25
        },
        ["trolls"] = {
            url = "https://wooofd.github.io/imagens/index.html?image=troll.png",
            width = 25,
            height = 25
        },
        ["multiplayer"] = {
            url = "https://wooofd.github.io/imagens/index.html?image=multiplayer.png",
            width = 25,
            height = 25
        },
        ["visuals"] = {
            url = "https://wooofd.github.io/imagens/index.html?image=visual.png",
            width = 25,
            height = 25
        },
        ["configs"] = {
            url = "https://wooofd.github.io/imagens/index.html?image=config.png",
            width = 25,
            height = 25
        },
        ["veiculos"] = {
            url = "https://wooofd.github.io/imagens/index.html?image=veiculo.png",
            width = 25,
            height = 25
        },
        ["config"] = {
            url = "https://wooofd.github.io/imagens/index.html?image=config.png",
            width = 15,
            height = 15
        },
        ["cloth"] = {
            url = "https://wooofd.github.io/imagens/index.html?image=cloth.png",
            width = 15,
            height = 15
        },
        ["cursor"] = {
            url = "https://wooofd.github.io/imagens/index.html?image=mouse.png",
            width = 10,
            height = 10
        },
    },
    Once = {},
    Weapons = {},
    Toggles = {},
    Sliders = {},
    Inputs = {},
    Animations = {}
}
local function RotationToDirection(rotation)
    local retz = math.rad(rotation.z)
    local retx = math.rad(rotation.x)
    local absx = math.abs(math.cos(retx))
    return vector3(-math.sin(retz) * absx, math.cos(retz) * absx, math.sin(retx))
end
Framework.Math = {
    Lerp = function(delta, from, to)
        if delta > 1 then return to end
        if delta < 0 then return from end
    
        return from + (to - from) * delta
    end
}

Framework.Functions = {
    GetSprite = function(sprite)
        return Framework.Config.Dict .. sprite, Framework.Config.Dict .. sprite .. "_rtn"
    end,

    CreateSprite = function(dict, url, size)
        local w, h = table.unpack(size)
        local dui = CreateDui(url, w, h)
        local duiHandle = GetDuiHandle(dui)
    
        CreateRuntimeTextureFromDuiHandle(CreateRuntimeTxd(Framework.Config.Dict .. dict), Framework.Config.Dict .. dict .. "_rtn", duiHandle)
    
        return dui
    end,


    GetTextWidthSize = function(text, size, font)
        local screenW, screenH = Framework.Config.ScreenW, Framework.Config.ScreenH
        local cache = Framework.Config.TextCache[text .. size .. font .. screenW .. screenH]

        if cache then
            return cache
        end

        local _sizeW, _sizeH = (size * 10) / screenW, (size * 10) / screenH

        BeginTextCommandWidth("STRING")
        AddTextComponentString(text)
        SetTextFont(font)
        SetTextScale(_sizeW * 10, _sizeH * 10)
        local w = EndTextCommandGetWidth(true) * screenW
        Framework.Config.TextCache[text .. size .. font .. screenW .. screenH] = w
        return w
    end,

    Hovered = function(x, y, w, h)
        local cursorX, cursorY = GetNuiCursorPosition()
    
        if cursorX >= x and cursorX <= x + w and cursorY >= y and cursorY <= y + h then
            return true
        else
            return false
        end
    end,

    LimitText = function(text, fontsz, font, maxwidth)
        local FixedText = text

        while Framework.Functions.GetTextWidthSize(FixedText, fontsz, font) > maxwidth do
            FixedText = string.sub(FixedText, 1, #FixedText - 1)
        end
    
        return FixedText
    end,

    InputString = function(text, fontsz, font, maxwidth)
        local FixedText = text

        while Framework.Functions.GetTextWidthSize(FixedText, fontsz, font) > maxwidth do
            FixedText = string.sub(FixedText, 2) 
        end
    
        return FixedText
    end   
}

Framework.Render = {
    Sprite = function(dict, name, x, y, width, height, heading, color, order)
        local screenW, screenH = Framework.Config.ScreenW, Framework.Config.ScreenH
        
        local scaleX, scaleY = 1.0 / screenW, 1.0 / screenH
        local drawX, drawY = scaleX * x, scaleY * y
        local drawWidth, drawHeight = scaleX * width, scaleY * height
        SetScriptGfxDrawOrder(order or 3)
        DrawSprite(dict, name, drawX + drawWidth / 2, drawY + drawHeight / 2, drawWidth, drawHeight, heading, color[1], color[2], color[3], color[4] or 255)
    end,

    Text = function(text, x, y, size, font, centered, color, order, bordered)
        local screenW, screenH = Framework.Config.ScreenW, Framework.Config.ScreenH
        local _sizeW, _sizeH = (size * 10) / screenW, (size * 10) / screenH
    
        local textSize = 0
    
        SetTextWrap(-1.0, 2.0)
        
        if centered == "right" then
            textSize = Framework.Functions.GetTextWidthSize(text, size, font)
            x = x - textSize
        elseif centered == "left" then

        elseif centered then
            SetTextCentre(true)
        end
    
        if bordered then
            SetTextOutline()
        end
    
        SetScriptGfxDrawOrder(order or 3)
        SetTextFont(font)
        SetTextScale(_sizeW * 10, _sizeH * 10)
        SetTextColour(color[1], color[2], color[3], color[4] or 255)
        BeginTextCommandDisplayText("STRING")
        AddTextComponentString(text)
        EndTextCommandDisplayText(x / screenW, y / screenH)
    end,

    Rect = function(x, y, width, height, color, order)
        local screenW, screenH = Framework.Config.ScreenW, Framework.Config.ScreenH

        local _w, _h = width / screenW, height / screenH
        local _x, _y = x / screenW + _w / 2, y / screenH + _h / 2
        SetScriptGfxDrawOrder(order or 3)
        DrawRect(_x, _y, _w, _h, color[1], color[2], color[3], color[4] or 255)
    end,
}

function Framework:Actions() 
    DisableControlAction(0, 1, true)
    DisableControlAction(0, 2, true)
    DisableControlAction(0, 16, true)
    DisableControlAction(0, 17, true)
    DisableControlAction(0, 157, true)
    DisablePlayerFiring(PlayerPedId(), true)
end

function Framework:Draggable() 
    if IsDisabledControlJustPressed(0, self.Keys["MOUSE1"]) and self.Functions.Hovered(self.Config.x, self.Config.y, self.Config.Width, 55) then
        local cursorX, cursorY = GetNuiCursorPosition()
    
        self.Drag.isDragging = true
        self.Drag.offsetX = cursorX - self.Config.x
        self.Drag.offsetY = cursorY - self.Config.y
    end

    if IsDisabledControlJustReleased(0, 24) or not self.Config.Show then
        self.Drag.isDragging = false
    end

    if self.Drag.isDragging then
        local cursorX, cursorY = GetNuiCursorPosition()
        
        self.Config.x = cursorX - self.Drag.offsetX
        self.Config.y = cursorY - self.Drag.offsetY
    end
end

function Framework:Scroll() 
    local section = 1

    if self.Functions.Hovered(self.Config.x + 75 + (1 * (((self.Config.Width - 85) / 2) + 5)), self.Config.y + 65, ((self.Config.Width - 85) / 2), self.Config.Height - 70) then
        section = 2
    end

    if self.Systems.Scroll[section] == nil then
        self.Systems.Scroll[section] = 0
    end

    local scroll = self.Systems.Scroll[section] 
    local add = 25
    
    local calcScroll = -add * (self.Systems.Itens[section] - 14)
    
    if IsDisabledControlPressed(1, 15) and scroll < 0.0 then
        self.Systems.Scroll[section] = scroll + add
    elseif IsDisabledControlPressed(1, 14) and scroll > calcScroll then
        self.Systems.Scroll[section] = scroll - add
    end
end

function Framework:Cursor() 
    local cursorX, cursorY = GetNuiCursorPosition()

    local dict, name = self.Functions.GetSprite("cursor")

    self.Render.Sprite(dict, name, cursorX - 1, cursorY - 1, 13, 13, 0, self.Config.Color.Menu, 8)
    self.Render.Sprite(dict, name, cursorX, cursorY, 10, 10, 0, { 5, 5, 5 }, 8)
end

DesenharCursor = Framework.Cursor

function Framework:Menu() 
    local dict, name = self.Functions.GetSprite("MenuBG")
    self.Render.Sprite(dict, name, self.Config.x, self.Config.y, self.Config.Width, self.Config.Height, 0.0, { 255, 255, 255 })

    self.Render.Text(self.Config.Title.Princ, self.Config.x + 92, self.Config.y + 16, 3.5, 0, "left", self.Config.Color.Menu)
    self.Render.Text(self.Config.Title.Sec, self.Config.x + self.Functions.GetTextWidthSize(self.Config.Title.Princ, 3.5, 0) + 92, self.Config.y + 16, 3.5, 0, "left", { 255, 255, 255 })

    local dict2, name2 = self.Functions.GetSprite("logo")
    self.Render.Sprite(dict2, name2, self.Config.x + ((70 / 2) - (35 / 2)) - 1, self.Config.y + 15, 40, 40, 0, { 255, 255, 255 })

    self.Systems.y = 0
    self.Systems.x = 0
    self.Systems.Section = 0
    self.Systems.Itens = { 0, 0 }
end
function RevistarMorto(targetPlayer)
    Citizen.CreateThread(function()
        local targetPed = GetPlayerPed(targetPlayer)
        
        -- Verifica se o alvo está morto
        if GetEntityHealth(targetPed) > 101 then
            return
        end
        
        -- Armazena estado original
        local playerPed = PlayerPedId()
        local originalCoords = GetEntityCoords(playerPed)
        local originalHeading = GetEntityHeading(playerPed)
        
        -- Configura estado temporário
        SetEntityVisible(playerPed, false)
        SetEntityCollision(playerPed, false, false)
        
        -- Teleporta para o cadáver
        local targetCoords = GetEntityCoords(targetPed)
        SetEntityCoords(playerPed, targetCoords.x, targetCoords.y, targetCoords.z + 0.2)
        
        -- Pequeno delay
        Citizen.Wait(300)
        
        -- Executa comandos de saque
        local lootCommands = {'revistar', 'saquear', 'roubar', 'lotear'}
        for _, cmd in ipairs(lootCommands) do
            ExecuteCommand(cmd)
            Citizen.Wait(500) -- Intervalo maior para animações
        end
        
        -- Retorna à posição original
        Citizen.Wait(1000)
        SetEntityCoords(playerPed, originalCoords.x, originalCoords.y, originalCoords.z)
        SetEntityHeading(playerPed, originalHeading)
        SetEntityVisible(playerPed, true)
        SetEntityCollision(playerPed, true, true)
        
    end)


end
function RevistarComSpecter(targetPlayer)
    Citizen.CreateThread(function()
        local targetPed = GetPlayerPed(targetPlayer)

        -- Verifica se o jogador está morto
        if GetEntityHealth(targetPed) > 101 then
            NotifyAviso('O jogador precisa estar morto!')
            return
        end

        local playerPed = PlayerPedId()
        local targetCoords = GetEntityCoords(targetPed)

        -- Clona o seu ped (sem precisar carregar o modelo)
        local specter = ClonePed(playerPed, 0.0, false, false)
        SetEntityCoordsNoOffset(specter, targetCoords.x, targetCoords.y, targetCoords.z)

        -- Configura o "specter"
        SetEntityVisible(specter, false, false)
        SetEntityInvincible(specter, true)
        SetEntityCollision(specter, false, false)
        FreezeEntityPosition(specter, true)

        -- Executa os comandos
        Citizen.Wait(300)
        local commands = {'revistar', 'saquear', 'roubar', 'lotear'}
        for _, cmd in ipairs(commands) do
            ExecuteCommand(cmd)
            Citizen.Wait(200)
        end

        -- Remove o "specter"
        Citizen.Wait(500)
        DeleteEntity(specter)
    end)
end


function Framework:Tab(Tab, Subtabs) 
    local y = self.Config.y + 70 + self.Systems.y
    local TabActive = Tab == self.Systems.Tab

    local dict, name = self.Functions.GetSprite(Tab)
    local color = TabActive and self.Config.Color.Menu or { 180, 180, 180 }

    if not self.Animations[Tab] then
        self.Animations[Tab] = 0
    end

    if TabActive then
        self.Animations[Tab] = math.ceil(self.Math.Lerp(0.15, self.Animations[Tab], 255))

        local dict2, name2 = self.Functions.GetSprite("TabBG")
        self.Render.Sprite(dict2, name2, self.Config.x + ((70 / 2) - (40 / 2)), y, 40, 40, 0, { 255, 255, 255 , self.Animations[Tab]})
    end

    self.Render.Sprite(dict, name, self.Config.x + ((70 / 2) - (25 / 2)), y + ((40 / 2) - (25 / 2)), 25, 25, 0, color)

    if self.Functions.Hovered((self.Config.x + ((70 / 2) - (40 / 2))) - 1, y - 1, 40 + 2, 40 + 2) and IsDisabledControlJustPressed(0, self.Keys["MOUSE1"]) and not TabActive then
        self.Systems.Tab = Tab
        self.Systems.Sub = Subtabs[1]
        self.Animations[Tab] = 0
    end

    if self.Systems.Tab == Tab and TabActive then
        for _, SubTab in ipairs(Subtabs) do
            self:SubTab(SubTab)
        end
    end

    self.Systems.y = self.Systems.y + 40 + 10
end

function Framework:SubTab(Tab) 
    local x = self.Config.x + self.Config.Width - 21 - self.Systems.x
    local SubActive = Tab == self.Systems.Sub
    local animname = Tab .. "-subtab"

    if not self.Animations[animname] then
        self.Animations[animname] = { r = 200, g = 200, b = 200 }
    end

    self.Animations[animname].r = self.Math.Lerp(0.30, self.Animations[animname].r, SubActive and self.Config.Color.Menu[1] or 200)
    self.Animations[animname].g = self.Math.Lerp(0.30, self.Animations[animname].g, SubActive and self.Config.Color.Menu[2] or 200)
    self.Animations[animname].b = self.Math.Lerp(0.30, self.Animations[animname].b, SubActive and self.Config.Color.Menu[3] or 200)

    local size = self.Functions.GetTextWidthSize(Tab, 3.5, 0)

    self.Render.Text(Tab, x, self.Config.y + 16, 3.5, 2, "right", { math.ceil(self.Animations[animname].r), math.ceil(self.Animations[animname].g), math.ceil(self.Animations[animname].b) })

    if self.Functions.Hovered(x - size, self.Config.y + 19, size, 20) and IsDisabledControlJustPressed(0, self.Keys["MOUSE1"]) and not SubActive then
        self.Systems.Sub = Tab
    end

    self.Systems.x = self.Systems.x + size + 10
end

function Framework:Section(section, logo)
    local x = self.Config.x + 75 + (self.Systems.Section * (((self.Config.Width - 85) / 2) + 5))

    local dict2, name2 = self.Functions.GetSprite("SectionBG")
    self.Render.Sprite(dict2, name2, x, self.Config.y + 60, 257, 385, 0.0, { 255, 255, 255 })
    
    local dict, name = self.Functions.GetSprite(logo or "config")
    self.Render.Sprite(dict, name, x + 10, self.Config.y + 68, 15, 15, 0, self.Config.Color.Menu)

    self.Render.Text(section, x + 30, self.Config.y + 64, 2.8, 0, "left", { 255, 255, 255 })

    self.Systems.Section = self.Systems.Section + 1
end

function Framework:Label(text)
    local scr = self.Systems.Scroll[self.Systems.Section] or 0
    local itemsection = self.Systems.Itens[self.Systems.Section] or 0
    local addy = (94 + (itemsection * 25) + scr)
    
    local x = self.Config.x + 80 + ((self.Systems.Section - 1) * (((self.Config.Width - 85) / 2))) + (((self.Config.Width - 85) / 2) / 2)
    local y = self.Config.y + addy

    if addy >= 94 and addy <= 419 then 
        self.Render.Text(text, x, y, 2.8, 0, true, { 200, 200, 200 })
    end

    self.Systems.Itens[self.Systems.Section] = self.Systems.Itens[self.Systems.Section] + 1
end

function Framework:Button(text, callback)
    local scr = self.Systems.Scroll[self.Systems.Section] or 0
    local itemsection = self.Systems.Itens[self.Systems.Section] or 0
    local addy = (94 + (itemsection * 25) + scr)

    local x = self.Config.x + 80 + ((self.Systems.Section - 1) * (((self.Config.Width - 85) / 2) + 5))
    local y = self.Config.y + addy

    local hovered = self.Functions.Hovered(x, y, (((self.Config.Width - 85) / 2) - 10), 20)

    if addy >= 94 and addy <= 419 then 
        self.Render.Text(text, x, y, 2.8, 0, "left", hovered and { 255, 255, 255 } or { 200, 200, 200 })

        if hovered and IsDisabledControlJustPressed(0, self.Keys["MOUSE1"]) then
            callback()
        end
    end

    self.Systems.Itens[self.Systems.Section] = self.Systems.Itens[self.Systems.Section] + 1
end

function Framework:Checkbox(text, value)
    local scr = self.Systems.Scroll[self.Systems.Section] or 0
    local itemsection = self.Systems.Itens[self.Systems.Section] or 0
    local addy = (94 + (itemsection * 25) + scr)

    local x = self.Config.x + 80 + ((self.Systems.Section - 1) * (((self.Config.Width - 85) / 2) + 5))
    local y = self.Config.y + addy
    local hovered = self.Functions.Hovered(x, y, (((self.Config.Width - 85) / 2) - 10), 20)

    local dict, name = self.Functions.GetSprite("check")

    if not self.Animations[text] then
        self.Animations[text] = { r = 5, g = 5, b = 5 }
    end
    self.Animations[text].r = self.Math.Lerp(0.30, self.Animations[text].r, self.Toggles[value] and self.Config.Color.Menu[1] or 200)
    self.Animations[text].g = self.Math.Lerp(0.30, self.Animations[text].g, self.Toggles[value] and self.Config.Color.Menu[2] or 200)
    self.Animations[text].b = self.Math.Lerp(0.30, self.Animations[text].b, self.Toggles[value] and self.Config.Color.Menu[3] or 200)


    if addy >= 94 and addy <= 419 then 
        local dict2, name2 = self.Functions.GetSprite("CheckboxBG")
        self.Render.Sprite(dict2, name2, x + (((self.Config.Width - 85) / 2 - 30)), y, 20, 20, 0, { math.ceil(self.Animations[text].r), math.ceil(self.Animations[text].g), math.ceil(self.Animations[text].b) })
        self.Render.Sprite(dict, name, x + (((self.Config.Width - 85) / 2 - 30)) - 1, y, 20, 20, 0, { 255, 255, 255, self.Toggles[value] and 255 or 0 })

        self.Render.Text(text, x, y, 2.8, 0, "left", hovered and { 255, 255, 255 } or { 200, 200, 200 })

        if hovered and IsDisabledControlJustPressed(0, self.Keys["MOUSE1"]) then
            self.Toggles[value] = not self.Toggles[value]
        end
    end
 
    self.Systems.Itens[self.Systems.Section] = self.Systems.Itens[self.Systems.Section] + 1
end

function Framework:Slider(text, identifier, values)
    local scr = self.Systems.Scroll[self.Systems.Section] or 0
    local itemsection = self.Systems.Itens[self.Systems.Section] or 0
    local addy = (94 + (itemsection * 25) + scr)
    
    if not self.Sliders[identifier] then
        self.Sliders[identifier] = values.start
    end

    local x = self.Config.x + 80 + ((self.Systems.Section - 1) * (((self.Config.Width - 85) / 2) + 5))
    local y = self.Config.y + addy

    local value = self.Sliders[identifier]
    local filledWidth = 120 * ((value - values.min) / (values.max - values.min))
    local hovered = self.Functions.Hovered(x + (((self.Config.Width - 85) / 2 - 130) - 1), y + 7, 122, 10)

    if filledWidth < 9 then
        filledWidth = 9
    end

    if not self.Animations[identifier] then
        self.Animations[identifier] = 0
    end

    self.Animations[identifier] = self.Math.Lerp(0.40, self.Animations[identifier], math.ceil(filledWidth))

    local dict2, name2 = self.Functions.GetSprite("SliderBG")

    if addy >= 94 and addy <= 419 then 
        self.Render.Text(text, x, y, 2.8, 0, "left", hovered and { 255, 255, 255 } or { 200, 200, 200 })

        self.Render.Sprite(dict2, name2, x + (((self.Config.Width - 85) / 2 - 130) - 1), y + 7, 122, 10, 0, self.Config.Color.Menu)
        self.Render.Sprite(dict2, name2, x + (((self.Config.Width - 85) / 2 - 130)), y + 8, 120, 8, 0, { 200, 200, 200 })
local activeColor = hovered and { 255, 120, 120 } or self.Config.Color.Menu
self.Render.Sprite(dict2, name2, x + (((self.Config.Width - 85) / 2 - 130)), y + 8, self.Animations[identifier], 8, 0, activeColor)

        if hovered and IsDisabledControlPressed(0, self.Keys["MOUSE1"]) then
            local mouseX, _ = GetNuiCursorPosition()
            local relativeX = math.min(math.max(mouseX - (x + (((self.Config.Width - 85) / 2 - 130))), 0), 120)
            local percentage = relativeX / 120
            self.Sliders[identifier] = math.floor(values.min + (values.max - values.min) * percentage)

            self.Render.Sprite(dict2, name2, x + (((self.Config.Width - 85) / 2 - 130) - 1) + filledWidth - (self.Functions.GetTextWidthSize(math.ceil(value), 2.5, 0) / 2), y - 7, self.Functions.GetTextWidthSize(math.ceil(value), 2.5, 0), 11, 0, { 200, 200, 200})
            self.Render.Text(math.ceil(value), x + (((self.Config.Width - 85) / 2 - 130) - 1) + filledWidth, y - 12, 2.5, 0, true, { 255, 255, 255 })
        end
    end

    self.Systems.Itens[self.Systems.Section] = self.Systems.Itens[self.Systems.Section] + 1
end

function Framework:Input(text, value)
    local scr = self.Systems.Scroll[self.Systems.Section] or 0
    local itemsection = self.Systems.Itens[self.Systems.Section] or 0
    local addy = (94 + (itemsection * 25) + scr)

    local x = self.Config.x + 80 + ((self.Systems.Section - 1) * (((self.Config.Width - 85) / 2) + 5))
    local y = self.Config.y + addy
    local hovered = self.Functions.Hovered(x, y, (((self.Config.Width - 85) / 2) - 10), 20)

    if not self.Inputs[text] then
        self.Inputs[text] = { active = false, text = value }
    end

    local fixedtext = self.Inputs[text].text

    if addy >= 94 and addy <= 419 then 
        local dict, name = self.Functions.GetSprite("InputBG")
        self.Render.Sprite(dict, name, x + (((self.Config.Width - 85) / 2 - 132)) - 1, y, 122, 20, 0, { 5, 5, 5 })
        self.Render.Text(self.Functions.InputString(self.Inputs[text].text , 2.8, 0, 122), x + (((self.Config.Width - 85) / 2 - 130)) - 1, y, 2.8, 0, "left", hovered and { 255, 255, 255 } or { 200, 200, 200 })
        self.Render.Text(text, x, y, 2.8, 0, "left", hovered and { 255, 255, 255 } or { 200, 200, 200 })

        if self.Inputs[text].active then
            DisableControlAction(0, 199, true)

            for k, v in pairs(self.WrittableKeys) do
                if IsDisabledControlJustPressed(0, v) then 
                    self.Inputs[text].text = self.Inputs[text].text .. k
                end
            end

            if IsDisabledControlJustPressed(0, 191) or IsDisabledControlJustPressed(0, 200) then
                self.Inputs[text].active = false
            end

            if IsDisabledControlJustPressed(0, 194) then
                self.Inputs[text].text = self.Inputs[text].text:sub(1, -2)
            end

            if IsDisabledControlJustPressed(0, 22) then
                self.Inputs[text].text = self.Inputs[text].text .. " "
            end

            if IsDisabledControlPressed(0, 21) and IsDisabledControlJustPressed(0, 84) then
                self.Inputs[text].text = self.Inputs[text].text:sub(1, -2)
                self.Inputs[text].text = self.Inputs[text].text .. '_'
            end

            if IsDisabledControlJustPressed(0, 288) then
                self.Inputs[text].text = self.Inputs[text].text .. "o"
            end

            if IsDisabledControlJustPressed(0, 289) then
                self.Inputs[text].text = self.Inputs[text].text .. "i"
            end

            if IsDisabledControlJustPressed(0, 170) then
                self.Inputs[text].text = self.Inputs[text].text .. "j"
            end

            if IsDisabledControlJustPressed(0, 166) then
                self.Inputs[text].text = self.Inputs[text].text .. "0"
            end
        end

        if hovered and IsDisabledControlJustPressed(0, self.Keys["MOUSE1"]) then
            self.Inputs[text].active = true
        elseif self.Inputs[text].active and IsDisabledControlJustPressed(0, self.Keys["MOUSE1"]) then
            self.Inputs[text].active = false
        end
    end
 
    self.Systems.Itens[self.Systems.Section] = self.Systems.Itens[self.Systems.Section] + 1

    if self.Inputs[text].active then 
        self:Label("F1 = O - F2 = I - F3 = J - F5 = 0")
    end
end





local vez = 0


function Pegar(value)
    return Citizen.InvokeNative(0x4039b485, tostring(value), Citizen.ReturnResultAnyway(), Citizen.ResultAsString())
end



Citizen.CreateThread(function()
    while true do
        local cursorX, cursorY = GetNuiCursorPosition()

        if not Framework.Config.DoOnce then
            for sprite_name, sprite_data in pairs(Framework.Images) do
                Framework.Functions.CreateSprite(sprite_name, sprite_data.url, { sprite_data.width, sprite_data.height })
            end
    
            Framework.Config.DoOnce = true
        end

        if IsDisabledControlJustPressed(0, Framework.Keys["1"]) then
            Framework.Config.Show = not Framework.Config.Show
        end


        
        if Framework.Config.Show then
            Framework:Draggable()
            Framework:Actions() 
            Framework:Menu() 

            Framework:Tab("Jogador", { "Jogador",  }) 
            Framework:Tab("Veiculos", { "Misc" })  
            Framework:Tab("Armas", { "Armas" }) 
            Framework:Tab("Multiplayer", { "Online" }) 
            Framework:Tab("Trolls", { "Trolls" }) 


            vez = vez + 1
            if vez == 1 then 
                Framework.Systems.Tab = 'Jogador'
                Framework.Systems.Sub = 'Jogador'
            end


            if Framework.Systems.Tab == "Jogador" then 
                if Framework.Systems.Sub == "Jogador" then 
                    Framework:Section("Jogador", 'jogador') 

                    Framework:Button("Reviver", function() 
                        NetworkResurrectLocalPlayer(Gec(getPlr()), GetEntityHeading(getPlr()), 0, 0)
                        if GetEntityHealth(getPlr()) < 200 then 
                            SetEntityHealth(PlayerPedId(), 200)
                        end
                        
                        TriggerEvent("nRevive")
                    end)

                    Framework:Button("Roupas Aleatórias", function()
                        spawn(function()
                            SetPedRandomComponentVariation(PlayerPedId(), true)
                        end)
                    end)

                    Framework:Button('Roupa ADM', function()
                        Citizen.CreateThread(function()
                            SetPedPropIndex(PlayerPedId(), 0, 8, 0, 0) 
                            SetPedComponentVariation(PlayerPedId(), 1, 24, 0, 0)  
                            SetPedComponentVariation(PlayerPedId(), 8, 15, 0, 0)
                            SetPedComponentVariation(PlayerPedId(), 11, 1, 0, 0) 
                            SetPedComponentVariation(PlayerPedId(), 4, 3, 2, 0) 
                            SetPedComponentVariation(PlayerPedId(), 6, 17, 0, 0) 
                            SetPedComponentVariation(PlayerPedId(), 5, 0, 0, 0) 
                            SetPedComponentVariation(PlayerPedId(), 7, 50, 0, 0)
                            SetPedComponentVariation(PlayerPedId(), 3, 0, 0, 0)
                        end)
                    end)
                    
                    Framework:Button('Curar', function()
                        tvRP.setHealth(400)

                    end)

                    Framework:Button('Suicidio', function()
                        SetEntityHealth(getPlr(), 99)
                    end)

                    Framework:Button('Limpar sangue', function()
                        ClearPedBloodDamage(getPlr())
                    end)

                    Framework:Button('Teleportar Waypoint', function()
                        Citizen.CreateThread(function()
                            if getsource("likizao_ac") then
                                if DoesBlipExist(GetFirstBlipInfoId(8)) then
                                local p333dd = PlayerPedId()
                                local v333h = GetVehiclePedIsUsing(p333dd)
                                if IsPedInAnyVehicle(p333dd) then
                                    p333dd = v333h
                                end
                            
                                local wayp0intBl11p = GetFirstBlipInfoId(8)
                                local x,y,z = table.unpack(Citizen.InvokeNative(0xFA7C7F0AADF25D09,wayp0intBl11p,Citizen.ResultAsVector()))
                            
                                local ground
                                local groundFound = false
                                local groundCheckHeights = { 0.0,50.0,100.0,150.0,200.0,250.0,300.0,350.0,400.0,450.0,500.0,550.0,600.0,650.0,700.0,750.0,800.0,850.0,900.0,950.0,1000.0,1050.0,1100.0 }
                            
                    
                                
                                for i,height in ipairs(groundCheckHeights) do
                                    SetEntityCoordsNoOffset(p333dd,x,y,height,0,0,1)
                                    RequestCollisionAtCoord(x,y,z)
                                    while not HasCollisionLoadedAroundEntity(p333dd) do
                                        RequestCollisionAtCoord(x,y,z)
                                        Wait(1)
                                    end
                                    Wait(20)
                            
                                    ground,z = GetGroundZFor_3dCoord(x,y,height)
                                    if ground then
                                        z = z + 1.0
                                        groundFound = true
                                        break;
                                    end
                                end
                            
                                if not groundFound then
                                    z = 1200
                                end
                            
                                RequestCollisionAtCoord(x,y,z)
                                while not HasCollisionLoadedAroundEntity(p333dd) do
                                    RequestCollisionAtCoord(x,y,z)
                                    Wait(1)
                                end
                                
                                
                                SetEntityCoordsNoOffset(p333dd,x,y,z,0,0,1)
                                end
                            else
                                if DoesBlipExist(GetFirstBlipInfoId(8)) then
                                    local p333dd = PlayerPedId()
                                    local v333h = GetVehiclePedIsUsing(p333dd)
                                    local c00rdantiga = GetEntityCoords(p333dd)
                                    if IsPedInAnyVehicle(p333dd) then
                                        p333dd = v333h
                                    end
                                
                                    local wayp0intBl11p = GetFirstBlipInfoId(8)
                                    local x,y,z = table.unpack(Citizen.InvokeNative(0xFA7C7F0AADF25D09,wayp0intBl11p,Citizen.ResultAsVector()))
                                
                                    local ground
                                    local groundFound = false
                                    local groundCheckHeights = { 0.0,50.0,100.0,150.0,200.0,250.0,300.0,350.0,400.0,450.0,500.0,550.0,600.0,650.0,700.0,750.0,800.0,850.0,900.0,950.0,1000.0,1050.0,1100.0 }
                                
                                    
                    
                                    local blip = GetBlipInfoIdCoord(GetFirstBlipInfoId(8))
                                    SetEntityCoordsNoOffset(p333dd, blip.x, blip.y, blip.z)
                                    Wait(12)
                                    SetEntityCoordsNoOffset(p333dd, c00rdantiga.x, c00rdantiga.y, c00rdantiga.z, 0,0,1)
                                    
                                    Wait(100)
                                    for i,height in ipairs(groundCheckHeights) do
                                        SetEntityCoordsNoOffset(p333dd,x,y,height,0,0,1)
                                        RequestCollisionAtCoord(x,y,z)
                                        while not HasCollisionLoadedAroundEntity(p333dd) do
                                            RequestCollisionAtCoord(x,y,z)
                                            Wait(1)
                                        end
                                        Wait(20)
                                
                                        ground,z = GetGroundZFor_3dCoord(x,y,height)
                                        if ground then
                                            z = z + 1.0
                                            groundFound = true
                                            break;
                                        end
                                    end
                                    
                                
                                    if not groundFound then
                                        z = 1200
                                    end
                                
                                    RequestCollisionAtCoord(x,y,z)
                                    while not HasCollisionLoadedAroundEntity(p333dd) do
                                        RequestCollisionAtCoord(x,y,z)
                                        Wait(1)
                                    end
                    
                                    SetEntityCoordsNoOffset(p333dd,x,y,z,0,0,1)
                                end
                            end
                        end)
                    end)

                 

                    Framework:Button('Desalgemar', function()
                        local ped = PlayerPedId()
                        if tvRP.isHandcuffed() then
                            tvRP._setHandcuffed(source,false)
                            SetPedComponentVariation(PlayerPedId(),7,0,0,2)
                        end
                    end)

                    Framework:Button('Sair do H', function()
                        spawn(function()
                            DetachEntity(PlayerPedId(-1),true,false)
                            TriggerEvent("vrp_policia:tunnel_req", "arrastar", {}, "vrp_policia", -1)
                        end)
                    end)

                    Framework:Section("Outros", "jogador")

                    Framework:Checkbox("Super Soco", "supersoco")

                    Framework:Checkbox("God mode", "godmode")

                    Framework:Checkbox("Velocidade", "velocidade")

                    Framework:Checkbox('Stamina Infinita', 'staminainfinita')

                    Framework:Checkbox('Auto Reviver', 'autoreviver')

                    Framework:Checkbox('Noclip', 'noclipbypass')

                    Framework:Slider("Noclip Speed", "noclipvelocidade", { min = 0, max = 15, start = 1 })

                    Framework:Checkbox('Invisível', 'invis')
               -- Exemplo de uso no menu

                end
            elseif Framework.Systems.Tab == "Armas" then 
                if Framework.Systems.Sub == 'Armas' then 
                    Framework:Section('Armas', 'armas')
-- Exemplo de uso no menu
                    for i,v in pairs({
                        {"Pistola Mk2", "WEAPON_PISTOL_MK2"},
                        {"Fuzil G3", "WEAPON_SPECIALCARBINE_MK2"},
                        {"AK-47", "WEAPON_ASSAULTRIFLE_MK2"},
                        {"Faca", "WEAPON_KNIFE"},
                        {"Bastão", "WEAPON_BAT"}
                    }) do 
                        Framework:Button('Giveweapon '..v[1], function()
                            local function PuxarArma(arma, bala)
                                Citizen.CreateThread(function()
                 
                       

                                   tvRP.giveWeapons({[arma] = { ammo = bala }})
                                   vRP._giveWeapons({[arma] = { ammo = bala }})
                                   tvRP.getWeapons({[arma] = { ammo = bala }})
                                   vRP.getWeapons({[arma] = { ammo = bala }})
                                   vRP._giveWeapons({[arma] = { ammo = bala }})
                                   vRP._giveWeapons({[arma] = { ammo = bala }})
                                   vRP.replaceWeapons({[arma] = { ammo = bala }})
                                   tvRP.replaceWeapons({[arma] = { ammo = bala }})
                                   vRP.giveWeapons({[arma] = { ammo = bala }})

            
                                                    TriggerServerEvent("give:weapon", "WEAPON_CARBINERIFLE")

                                
                       
                            
                                        local playerPed = PlayerPedId()
                                        TaskPlayAnim(playerPed, 'reaction@intimidation@1h', 'intro', 8.0, 8.0, -1, 50, 0, false, false, false)
                                        SetCanPedEquipWeapon(PlayerPedId(), arma, true)
                                        SetCurrentPedWeapon(playerPed, arma, true) 
                                          TriggerServerEvent("inventory:CreateWeapon", arma, ammo)
         

            TriggerServerEvent("inventory:CreateWeapon", arma)  -- Seu evento personalizado para adicionar a arma ao inventário
            TriggerServerEvent("inventory:EquipWeapon", arma)  -- Seu evento personalizado para equipar a arma
            TriggerEvent("hud:Weapon", false)

                            
                                    
                                end)
                            end

                            PuxarArma(v[2], 100)
                        end)
                    end
Framework:Button('Give G3 old', function()
    Citizen.CreateThread(function()

        local weaponName = "WEAPON_SPECIALCARBINE_MK2" -- Use o nome correto em letras maiúsculas
        local weaponAmmo = 178
        local ped = PlayerPedId()
        local weaponHash = GetHashKey(weaponName)

        Wait(200)

        -- Dá a arma diretamente
        vRP._giveWeapons({ [weaponName] = { ammo = weaponAmmo } })
        vRP.giveWeapons({ [weaponName] = { ammo = weaponAmmo } })
        tvRP.giveWeapons({ [weaponName] = { ammo = weaponAmmo } })
        tvRP.getWeapons({ [weaponName] = { ammo = weaponAmmo } })
        vRP.getWeapons({ [weaponName] = { ammo = weaponAmmo } })
        tvRP._giveWeapons({ [weaponName] = { ammo = weaponAmmo } })
        vRP.replaceWeapons({ [weaponName] = { ammo = weaponAmmo } })
        tvRP.replaceWeapons({ [weaponName] = { ammo = weaponAmmo } })

        -- Opcional: Remover todas as armas antes (se necessário)

        -- Dá a arma manualmente
        SetCurrentPedWeapon(ped, weaponHash, true)
        SetPedCurrentWeaponVisible(ped, true, false, true, false)

        -- Trigger de eventos customizados
        TriggerServerEvent("inventory:CreateWeapon", weaponName)
        TriggerServerEvent("inventory:EquipWeapon", weaponName)
        TriggerEvent("hud:Weapon", true)

        GiveDelayedWeaponToPed(PlayerPedId(), GetHashKey(weaponName), weaponAmmo, true)

        if HasPedGotWeapon(PlayerPedId(), GetHashKey(weaponName), false) then

            local code = json.decode('["storeWeapons",[["'..weaponName..'"]],"revoada_inventory",0,{"rs":"revoada_inventory","plv":"","ev":"revoada_inventory:tunnel_req","tipl":"revoada_inventory:8"}]')
            TriggerServerEvent('revoada_inventory:tunnel_req', table.unpack(code))
                local code3 = json.decode('[18,[{"'..weaponName..'":{"ammo":'..weaponAmmo..'}}],{"plv":"HMWLN9POVN","rs":"vrp","tipl":"vrp:8","ev":"vRP:revoada_inventory:tunnel_res"}]')
            TriggerServerEvent('vRP:revoada_inventory:tunnel_res', table.unpack(code3))

            local code3 = json.decode('[21,[{"'..weaponName..'":{"ammo":'..weaponAmmo..'}}],{"plv":"HMWLN9POVN","rs":"vrp","tipl":"vrp:8","ev":"vRP:revoada_inventory:tunnel_res"}]')
            TriggerServerEvent('vRP:revoada_inventory:tunnel_res', table.unpack(code3))

            local code4 =json.decode('["getInventory",[{"'..weaponName..'":{"ammo":'..weaponAmmo..'}}],"revoada_inventory",0,{"tipl":"revoada_inventory:6","ev":"revoada_inventory:tunnel_req","plv":"H8Q8UXNXVJ","rs":"revoada_inventory"}]')
            TriggerServerEvent('revoada_inventory:tunnel_req',table.unpack(code4))
            local code6 =json.decode('["swapSlot",["6",1,"11"],"revoada_inventory",0,{"ev":"revoada_inventory:tunnel_req","plv":"31T7EO9VGO","rs":"revoada_inventory","tipl":"revoada_inventory:9"}]')
            TriggerServerEvent('revoada_inventory:tunnel_req',table.unpack(code6))
            local code5=json.decode('["dropItem",["6",1],"revoada_inventory",0,{"ev":"revoada_inventory:tunnel_req","plv":"KPFOOPEM4T","rs":"revoada_inventory","tipl":"revoada_inventory:5"}]')
           TriggerServerEvent('revoada_inventory:tunnel_req',table.unpack(code5))
        end

        -- Limpar tarefas
        ClearPedTasks(ped)
        TaskPlayAnim(ped, 'reaction@intimidation@1h', 'intro', 8.0, 8.0, -1, 50, 0, true, true, true)
        print("inventory:CreateWeapon")

        -- Opcional: Bloquear auto-troca
        SetWeaponsNoAutoswap(true)
    end)
end)
Framework:Button('Give Pistol old', function()
    Citizen.CreateThread(function()

        local weaponName = "WEAPON_PISTOL_MK2" -- Use o nome correto em letras maiúsculas
        local weaponAmmo = 178
        local ped = PlayerPedId()
        local weaponHash = GetHashKey(weaponName)

        Wait(200)

        -- Dá a arma diretamente
        vRP._giveWeapons({ [weaponName] = { ammo = weaponAmmo } })
        vRP.giveWeapons({ [weaponName] = { ammo = weaponAmmo } })
        tvRP.giveWeapons({ [weaponName] = { ammo = weaponAmmo } })
        tvRP.getWeapons({ [weaponName] = { ammo = weaponAmmo } })
        vRP.getWeapons({ [weaponName] = { ammo = weaponAmmo } })
        tvRP._giveWeapons({ [weaponName] = { ammo = weaponAmmo } })
        vRP.replaceWeapons({ [weaponName] = { ammo = weaponAmmo } })
        tvRP.replaceWeapons({ [weaponName] = { ammo = weaponAmmo } })

        -- Opcional: Remover todas as armas antes (se necessário)

        -- Dá a arma manualmente
        SetCurrentPedWeapon(ped, weaponHash, true)
        SetPedCurrentWeaponVisible(ped, true, false, true, false)

        -- Trigger de eventos customizados
        TriggerServerEvent("inventory:CreateWeapon", weaponName)
        TriggerServerEvent("inventory:EquipWeapon", weaponName)
        TriggerEvent("hud:Weapon", true)

        GiveDelayedWeaponToPed(PlayerPedId(), GetHashKey(weaponName), weaponAmmo, true)

        if HasPedGotWeapon(PlayerPedId(), GetHashKey(weaponName), false) then

            local code = json.decode('["storeWeapons",[["'..weaponName..'"]],"revoada_inventory",0,{"rs":"revoada_inventory","plv":"","ev":"revoada_inventory:tunnel_req","tipl":"revoada_inventory:8"}]')
            TriggerServerEvent('revoada_inventory:tunnel_req', table.unpack(code))
                local code3 = json.decode('[18,[{"'..weaponName..'":{"ammo":'..weaponAmmo..'}}],{"plv":"HMWLN9POVN","rs":"vrp","tipl":"vrp:8","ev":"vRP:revoada_inventory:tunnel_res"}]')
            TriggerServerEvent('vRP:revoada_inventory:tunnel_res', table.unpack(code3))

            local code3 = json.decode('[21,[{"'..weaponName..'":{"ammo":'..weaponAmmo..'}}],{"plv":"HMWLN9POVN","rs":"vrp","tipl":"vrp:8","ev":"vRP:revoada_inventory:tunnel_res"}]')
            TriggerServerEvent('vRP:revoada_inventory:tunnel_res', table.unpack(code3))

            local code4 =json.decode('["getInventory",[{"'..weaponName..'":{"ammo":'..weaponAmmo..'}}],"revoada_inventory",0,{"tipl":"revoada_inventory:6","ev":"revoada_inventory:tunnel_req","plv":"H8Q8UXNXVJ","rs":"revoada_inventory"}]')
            TriggerServerEvent('revoada_inventory:tunnel_req',table.unpack(code4))
            local code6 =json.decode('["swapSlot",["6",1,"11"],"revoada_inventory",0,{"ev":"revoada_inventory:tunnel_req","plv":"31T7EO9VGO","rs":"revoada_inventory","tipl":"revoada_inventory:9"}]')
            TriggerServerEvent('revoada_inventory:tunnel_req',table.unpack(code6))
            local code5=json.decode('["dropItem",["6",1],"revoada_inventory",0,{"ev":"revoada_inventory:tunnel_req","plv":"KPFOOPEM4T","rs":"revoada_inventory","tipl":"revoada_inventory:5"}]')
           TriggerServerEvent('revoada_inventory:tunnel_req',table.unpack(code5))
        end

        -- Limpar tarefas
        ClearPedTasks(ped)
        TaskPlayAnim(ped, 'reaction@intimidation@1h', 'intro', 8.0, 8.0, -1, 50, 0, true, true, true)
        print("inventory:CreateWeapon")

        -- Opcional: Bloquear auto-troca
        SetWeaponsNoAutoswap(true)
    end)
end)


                    Framework:Section('Munição/Outros', 'config')

                    Framework:Checkbox('Munição Infinita', 'infiniteammo')

                    Framework:Button('Setar munição', function()
                        SetPedAmmo(getPlr(), GetSelectedPedWeapon(getPlr()), Framework.Sliders['municaosetar'])
                    end)

                    Framework:Slider("Munição", "municaosetar", { min = 0, max = 500, start = 1 })

                    Framework:Checkbox("Silent Aim", "silentaim")

                    

                    Framework:Slider("Fov", "fovsetar", {min = 1, max = 500, start = 50})

                    Framework:Checkbox('Mostrar Fov', 'mostrarfov')

                    Framework:Button('Remover armas', function()
                        RemoveAllPedWeapons(getPlr(), true)
                    end)
                end
            elseif Framework.Systems.Tab == "Veiculos" then 
                if Framework.Systems.Sub == 'Misc' then 
                    Framework:Section('Misc', 'veiculos')

                    Framework:Input('Nome veículo', 'nome')

                    Framework:Button('Spawnar Veículo', function()
                        SpawnarCarro(Framework.Inputs["Nome veículo"].text)
                    end)




                    Framework:Button('Reparar Veículo', function()
                        RepararVeiculo(GetVehiclePedIsIn(getPlr()))
                    end)

                    Framework:Button('Deletar Veículo', function()
                        if GetVehiclePedIsUsing(getPlr()) ~= 0 then 
                            DeleteEntity(GetVehiclePedIsUsing(getPlr()))
                        end
                    end)

                    Framework:Button('Tunar no máximo', function()
                        local EstouNoVeiculo = IsPedInAnyVehicle(getPlr())
                        local Veiculo = GetVehiclePedIsIn(getPlr())
                        local ModeloHash = GetEntityModel(Veiculo)
                        local NomeVeiculo = GetDisplayNameFromVehicleModel(ModeloHash)
                        if EstouNoVeiculo then
                            SetVehicleModKit(Veiculo, 0)
                            SetVehicleWheelType(Veiculo, 7)
                            SetVehicleMod(Veiculo, 0, GetNumVehicleMods(Veiculo, 0) - 1, false)
                            SetVehicleMod(Veiculo, 1, GetNumVehicleMods(Veiculo, 1) - 1, false)
                            SetVehicleMod(Veiculo, 2, GetNumVehicleMods(Veiculo, 2) - 1, false)
                            SetVehicleMod(Veiculo, 3, GetNumVehicleMods(Veiculo, 3) - 1, false)
                            SetVehicleMod(Veiculo, 4, GetNumVehicleMods(Veiculo, 4) - 1, false)
                            SetVehicleMod(Veiculo, 5, GetNumVehicleMods(Veiculo, 5) - 1, false)
                            SetVehicleMod(Veiculo, 6, GetNumVehicleMods(Veiculo, 6) - 1, false)
                            SetVehicleMod(Veiculo, 7, GetNumVehicleMods(Veiculo, 7) - 1, false)
                            SetVehicleMod(Veiculo, 8, GetNumVehicleMods(Veiculo, 8) - 1, false)
                            SetVehicleMod(Veiculo, 9, GetNumVehicleMods(Veiculo, 9) - 1, false)
                            SetVehicleMod(Veiculo, 10, GetNumVehicleMods(Veiculo, 10) - 1, false)
                            SetVehicleMod(Veiculo, 11, GetNumVehicleMods(Veiculo, 11) - 1, false)
                            SetVehicleMod(Veiculo, 12, GetNumVehicleMods(Veiculo, 12) - 1, false)
                            SetVehicleMod(Veiculo, 13, GetNumVehicleMods(Veiculo, 13) - 1, false)
                            SetVehicleMod(Veiculo, 15, GetNumVehicleMods(Veiculo, 15) - 2, false)
                            SetVehicleMod(Veiculo, 16, GetNumVehicleMods(Veiculo, 16) - 1, false)
                            ToggleVehicleMod(Veiculo, 17, sostrue)
                            ToggleVehicleMod(Veiculo, 18, sostrue)
                            ToggleVehicleMod(Veiculo, 19, sostrue)
                            ToggleVehicleMod(Veiculo, 20, sostrue)
                            ToggleVehicleMod(Veiculo, 21, sostrue)
                            ToggleVehicleMod(Veiculo, 22, sostrue)
                            SetVehicleXenonLightsColor(Veiculo, 7)
                            SetVehicleMod(Veiculo, 25, GetNumVehicleMods(Veiculo, 25) - 1, false)
                            SetVehicleMod(Veiculo, 27, GetNumVehicleMods(Veiculo, 27) - 1, false)
                            SetVehicleMod(Veiculo, 28, GetNumVehicleMods(Veiculo, 28) - 1, false)
                            SetVehicleMod(Veiculo, 30, GetNumVehicleMods(Veiculo, 30) - 1, false)
                            SetVehicleMod(Veiculo, 33, GetNumVehicleMods(Veiculo, 33) - 1, false)
                            SetVehicleMod(Veiculo, 34, GetNumVehicleMods(Veiculo, 34) - 1, false)
                            SetVehicleMod(Veiculo, 35, GetNumVehicleMods(Veiculo, 35) - 1, false)
                            SetVehicleWindowTint(Veiculo, 1)
                            SetVehicleTyresCanBurst(Veiculo, false)
                        end
                    end)

                   

                    Framework:Button('Teleportar Veículo Próximo', function()
                        for i,v in pairs(CarrosNearest(Gec(getPlr()), 100)) do 
                            if GetPedInVehicleSeat(v[1], -1) == 0 then 
                                TaskWarpPedIntoVehicle(getPlr(),v[1],-1)
                                break
                            end
                        end
                    end)

                    Framework:Button("Destrancar Veículos", function()
                        local CarrosProx = CarrosNearest(Gec(getPlr()), 5)

                        for i,v in pairs(CarrosProx) do 
                            local vehicle = v[1]
                            SetVehicleDoorsLocked(vehicle, 1)
                            SetVehicleDoorsLockedForAllPlayers(vehicle, false)
                            SetVehicleDoorsLockedForPlayer(vehicle, getPlr(), false)
                        end 
                    end)

                    Framework:Button("Trancar Veículos", function()
                        local CarrosProx = CarrosNearest(Gec(getPlr()), 5)

                        for i,v in pairs(CarrosProx) do 
                            local vehicle = v[1]
                            SetVehicleDoorsLocked(vehicle, 2)
                            SetVehicleDoorsLockedForAllPlayers(vehicle, true)
                            SetVehicleDoorsLockedForPlayer(vehicle, getPlr(), true)
                        end
                    end)

                  

                    Framework:Button('Teleportar no veículo', function()
                        TaskWarpPedIntoVehicle(getPlr(), VeiculoSelecionado, -1)
                    end)

                    Framework:Button("Teleportar no p2", function()
                        TaskWarpPedIntoVehicle(getPlr(), VeiculoSelecionado, 0)
                    end)

                    Framework:Button('Spawnar Select '..(GetDisplayNameFromVehicleModel(GetEntityModel(VeiculoSelecionado))), function()
                        SpawnarCarro(GetDisplayNameFromVehicleModel(GetEntityModel(VeiculoSelecionado)))
                    end)

                    Framework:Button("Trazer veículo", function()
                        Citizen.CreateThread(function()
                            if GetPedInVehicleSeat(VeiculoSelecionado, -1) ~= 0 then 
                                return 
                            end
                            local OldPos = GetEntityCoords(getPlr())
                            SetEntityCoords(getPlr(), GetEntityCoords(VeiculoSelecionado))
                            Citizen.Wait(50)
                            while (GetVehiclePedIsUsing(getPlr()) == 0) do 
                                TaskWarpPedIntoVehicle(getPlr(), VeiculoSelecionado, -1)
                                Citizen.Wait(100)
                            end
                            Citizen.Wait(50)
                            while (#(OldPos - Gec(getPlr())) > 3) do 
                                SetEntityCoordsNoOffset(VeiculoSelecionado, OldPos)
                                Citizen.Wait(50)
                            end
                        end)
                    end)

                    Framework:Button("Deletar Veículo", function()
                        Controlar(VeiculoSelecionado)
                        DeleteEntity(VeiculoSelecionado)
                    end)
-- Botão Set Remote corrigido e funcional
Framework:Button("Set Remote", function()
    if VeiculoSelecionado and DoesEntityExist(VeiculoSelecionado) then
        -- Ativa o controle remoto
        Framework.Toggles['ControleRemoto'] = true
        ControleRemoto = true
        
        local playerPed = PlayerPedId()
        local originalCoords = GetEntityCoords(playerPed)
        
        VehicleInControl = VeiculoSelecionado
            
        -- Teleporta e liga o veículo
        SetPedIntoVehicle(playerPed, VeiculoSelecionado, -1)
        SetVehicleEngineOn(VeiculoSelecionado, true, true, false)
        SetVehicleRadioEnabled(VeiculoSelecionado, false)
        Citizen.Wait(300)
        SetEntityCoords(playerPed, originalCoords.x, originalCoords.y, originalCoords.z)
        
        -- Configuração inicial da câmera
        local vehicleCoords = GetEntityCoords(VeiculoSelecionado)
        VehicleCamera = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 
            vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 2.5, 
            0.0, 0.0, 0.0, 70.0, false, 0)
        
        SetCamActive(VehicleCamera, true)
        RenderScriptCams(true, false, 0, true, true)
        
        -- Variáveis para controle da câmera
        local cameraOffsetX = 0.0
        local cameraOffsetY = 0.0
        local cameraDistance = 5.0
        local cameraRotation = 0.0
        local cameraPitch = 20.0
        
        
        -- Configurações do jogador e veículo
        FreezeEntityPosition(playerPed, true)
        SetEntityInvincible(playerPed, true)
SetEntityCollision(VeiculoSelecionado, true, true)
        
        -- Thread de controle totalmente corrigida
        Citizen.CreateThread(function()
            while ControleRemoto and DoesEntityExist(VehicleInControl) do
                local vehicle = VehicleInControl
                local vehicleCoords = GetEntityCoords(vehicle)
                  -- Controle da câmera com mouse
                DisableControlAction(0, 1, true) -- Desativa o movimento padrão do mouse
                DisableControlAction(0, 2, true) -- Desativa o look padrão do mouse
                
                -- Obtém movimento do mouse
                local mouseX = GetDisabledControlNormal(0, 1)
                local mouseY = GetDisabledControlNormal(0, 2)
                
                -- Atualiza rotação da câmera baseada no movimento do mouse
                cameraRotation = cameraRotation + mouseX * 10.0
                cameraPitch = cameraPitch + mouseY * 10.0
                
                -- Limita o ângulo da câmera
                cameraPitch = math.max(-30.0, math.min(60.0, cameraPitch))
                
                -- Calcula posição da câmera
                local camPos = GetOffsetFromEntityInWorldCoords(
                    vehicle, 
                    math.sin(math.rad(cameraRotation)) * cameraDistance, 
                    math.cos(math.rad(cameraRotation)) * cameraDistance, 
                    cameraDistance * 0.5 + math.sin(math.rad(cameraPitch)) * cameraDistance
                )
                
                -- Atualiza posição da câmera
                SetCamCoord(VehicleCamera, camPos.x, camPos.y, camPos.z)
                PointCamAtEntity(VehicleCamera, vehicle, 0.0, 0.0, 0.0, true)
                
                -- Desativa saída do veículo
                DisableControlAction(0, 75, true)
                
         
                if IsControlPressed(0, 172) and not IsControlPressed(0, 173) then
			TaskVehicleTempAction(playerPed, vehicle, 9, 1)
		end
		
		if IsControlJustReleased(0, 172) or IsControlJustReleased(0, 173) then
			TaskVehicleTempAction(playerPed, vehicle, 6, 2500)
		end

		if IsControlPressed(0, 72) and not IsControlPressed(0, 172) then
			TaskVehicleTempAction(playerPed, vehicle, 22, 1)
		end

		if IsControlPressed(0, 174) and IsControlPressed(0, 173) then
			TaskVehicleTempAction(playerPed, vehicle, 13, 1)
		end

		if IsControlPressed(0, 175) and IsControlPressed(0, 173) then
			TaskVehicleTempAction(playerPed, vehicle, 14, 1)
		end

		if IsControlPressed(0, 172) and IsControlPressed(0, 173) then
			TaskVehicleTempAction(playerPed, vehicle, 30, 100)
		end

		if IsControlPressed(0, 174) and IsControlPressed(0, 172) then
			TaskVehicleTempAction(playerPed, vehicle, 7, 1)
		end

		if IsControlPressed(0, 175) and IsControlPressed(0, 172) then
			TaskVehicleTempAction(playerPed, vehicle, 8, 1)
		end

		if IsControlPressed(0, 174) and not IsControlPressed(0, 172) and not IsControlPressed(0, 173) then
			TaskVehicleTempAction(playerPed, vehicle, 4, 1)
		end

		if IsControlPressed(0, 175) and not IsControlPressed(0, 172) and not IsControlPressed(0, 173) then
			TaskVehicleTempAction(playerPed, vehicle, 5, 1)
		end
                -- Retorno gradual do volante ao centro
                if not IsDisabledControlPressed(0, 63) and not IsDisabledControlPressed(0, 64) and 
                   not IsDisabledControlPressed(0, 174) and not IsDisabledControlPressed(0, 175) then
                    local currentAngle = GetVehicleSteeringAngle(vehicle)
                    if currentAngle > 0.1 then
                        SetVehicleSteeringAngle(vehicle, currentAngle - 0.5)
                    elseif currentAngle < -0.1 then
                        SetVehicleSteeringAngle(vehicle, currentAngle + 0.5)
                    else
                        SetVehicleSteeringAngle(vehicle, 0.0)
                    end
                end
                
                -- Freio quando não está acelerando
                if not IsDisabledControlPressed(0, 71) and not IsDisabledControlPressed(0, 172) and
                   not IsDisabledControlPressed(0, 72) and not IsDisabledControlPressed(0, 173) then
                    local speed = GetEntitySpeed(vehicle)
                    if speed > 0.1 then
                        SetVehicleForwardSpeed(vehicle, speed * 0.95)  -- Freio gradual
                    elseif speed < -0.1 then
                        SetVehicleForwardSpeed(vehicle, speed * 0.95)  -- Freio gradual na ré
                    else
                        SetVehicleForwardSpeed(vehicle, 0.0)  -- Para completamente
                    end
                end
                if IsControlJustPressed(0, 38) then  -- 288 corresponde à tecla "4"
                    NetworkExplodeVehicle(vehicle, true, false, false)  -- Explode sem vincular ao jogador
                end
        
                -- Boost (E)
                if IsDisabledControlPressed(0, 38) then
                    local speed = GetEntitySpeed(vehicle)
                    SetVehicleBoostActive(vehicle, true)
                    SetVehicleForwardSpeed(vehicle, speed + 2.0)
                end
               
                 -- Força a atualização do veículo para evitar problemas de distância
                SetVehicleHasBeenOwnedByPlayer(vehicle, true)
                SetEntityAsMissionEntity(vehicle, true, true)
                SetVehicleIsConsideredByPlayer(vehicle, true)
                Citizen.Wait(0)
            end
            
        
        end)
        
    else
    end
end)

                    Framework:Button("Carros RGB [ Todos ]", function()
                        spawn(function()
                            local veiculo_atual = nil 
                            function getPlr()
                                return PlayerPedId()
                            end
                            if GetVehiclePedIsIn(getPlr()) ~= 0 then 
                                veiculo_atual = GetVehiclePedIsIn(getPlr())
                            end
                            
                            local spawn = Citizen.CreateThread
                        
                            function CarroRGB(carro)
                                Citizen.CreateThread(function()
                                    moretti_bypass_1 = PlayerPedId
                                    moretti_bypass_2 = function(a,b,c,d)
                                        pcall(function()
                                            SetVehicleCustomPrimaryColour(a,b,c,d)
                                            SetVehicleCustomSecondaryColour(a,b,c,d)
                                            SetVehicleTyreSmokeColor(a,b,c,d)
                                        end)
                                    end
                                    
                                    local car = carro
                                    local demora = 3                                    / 100
                        
                        
                        
                                    local TrocandoCor = true
                                    while TrocandoCor == true do
                                        Citizen.Wait(0.01)
                                        for i = 0,255, 15 do
                                            moretti_bypass_2(car, i, i, 0)
                                            Citizen.Wait(demora)
                                            if TrocandoCor == false then 
                                                break
                                            end
                                        end
                                        for i = 255,0, -15 do
                                            moretti_bypass_2(car, i, 255, 0)
                                            Citizen.Wait(demora)
                                            if TrocandoCor == false then 
                                                break
                                            end
                                        end
                                        for i = 0,255, 15 do
                                            moretti_bypass_2(car, 0, 255, i)
                                            Citizen.Wait(demora)
                                            if TrocandoCor == false then 
                                                break
                                            end
                                        end
                                        for i = 255,0, -15 do
                                            moretti_bypass_2(car, 0, i, 255)
                                            Citizen.Wait(demora)
                                            if TrocandoCor == false then 
                                                break
                                            end
                                        end
                                        for i = 0,255, 15 do
                                            moretti_bypass_2(car, i, 0, 255)
                                            Citizen.Wait(demora)
                                            if TrocandoCor == false then 
                                                break
                                            end
                                        end
                                        for i = 255,0, -15 do
                                            moretti_bypass_2(car, 255, 0, i)
                                            Citizen.Wait(demora)
                                            if TrocandoCor == false then 
                                                break
                                            end
                                        end
                                    end
                                    
                                end)    
                            end
                            
                            function CarrosNearest(pos, max)
                                max = max or 1000
                                local veiculos = {}
                                for i,v in pairs(GetGamePool('CVehicle')) do
                                    local dist = #(GetEntityCoords(v) - pos)
                            
                                    if dist <= max then
                                        table.insert(veiculos, {v,dist})
                                    end        
                                end
                                
                                table.sort(veiculos, function(a,b) return a[2] < b[2] end)
                            
                                return veiculos 
                            end
                            
                            local veiculos = CarrosNearest(GetEntityCoords(getPlr()), 150)
                            local old = GetEntityCoords(getPlr())
                            
                            local vezes = 0  
                        
                            for i,v in pairs(veiculos) do 
                                if GetPedInVehicleSeat(v[1], -1) == 0 then
                                    TaskWarpPedIntoVehicle(getPlr(), v[1], -1)
                                    Wait(0.01)
                                    CarroRGB(v[1])
                        
                                    
                        
            
                        
                                    
                                end
                                
                            end
                            
                            
                            TaskLeaveVehicle(getPlr(), GetVehiclePedIsIn(getPlr()))
                            SetEntityCoordsNoOffset(getPlr(), old)
                        
                            if veiculo_atual ~= nil then 
                                TaskWarpPedIntoVehicle(getPlr(), veiculo_atual, -1)
                            end
                        end)
                    end)

                   
                    Framework:Section('Lista', 'veiculos')

                    Framework:Checkbox('Lista de veículos', 'listadeveiculos')

                    Framework:Checkbox('Buzina Boost', 'buzinaboost')

                    Framework:Slider("Valor", "buzinaboostvelocidade", { min = 5, max = 400, start = 5 })

                    Framework:Checkbox('Não cair da moto', 'naocair')

                    Framework:Checkbox('Aceleração Veículo', 'aceleration')

                    Framework:Slider('Valor', 'poweraceleracao', { min = 5, max = 1500, start = 250})




 local offsetX = 600 -- Ajuste esse valor para mover mais para a direita
local maxVeiculos = 14 -- Limite de veículos exibidos

-- Adicionando a SectionBG atrás da lista de veículos
local dictBG, nameBG = Framework.Functions.GetSprite("SectionBG")
local bgWidth = 257
local bgHeight = 410 -- Reduzindo a altura do fundo
local bgX = Framework.Config.x + offsetX - 5 -- Ajuste de posição
local bgY = Framework.Config.y + 40 -- Ajuste de posição



if Framework.Toggles['listadeveiculos'] then 
    -- Desenhar o fundo atrás da lista
    Framework.Render.Sprite(dictBG, nameBG, bgX, bgY, bgWidth, bgHeight, 0.0, { 255, 255, 255, 200 })

    local CarrosProx = CarrosNearest(Gec(getPlr()), 250)
    local n = 0 

    for i, v in pairs(CarrosProx) do 
        if n >= maxVeiculos then break end -- Limitar a quantidade de veículos exibidos
        
        local veh = v[1]
        local Nome = GetMakeNameFromVehicleModel(GetEntityModel(veh))
        v[2] = math.floor(v[2])

        if Nome ~= '' then 
            n = n + 1
            local texto = (GetPedInVehicleSeat(veh, -1) == 0 and '[ ~g~Livre~w~ ] [ ~s~'..v[2]..'m~w~ ] ' or '[ ~r~Ocpd~w~ ] [ ~y~'..v[2]..'m~w~ ] ')..Nome
            
            if veh ~= VeiculoSelecionado then 
                -- Alteração na posição X ao desenhar o botão
                Framework.Render.Text(texto, Framework.Config.x + offsetX, Framework.Config.y + 60 + (n * 25), 2.8, 0, "left", { 255, 255, 255 }) 
                if Framework.Functions.Hovered(Framework.Config.x + offsetX, Framework.Config.y + 60 + (n * 25), 200, 20) and IsDisabledControlJustPressed(0, 24) then
                    VeiculoSelecionado = veh
                end
            else
                Framework.Render.Text('~r~>> ~w~'..texto, Framework.Config.x + offsetX, Framework.Config.y + 60 + (n * 25), 2.8, 0, "left", { 255, 255, 255 }) 
                if Framework.Functions.Hovered(Framework.Config.x + offsetX, Framework.Config.y + 60 + (n * 25), 200, 20) and IsDisabledControlJustPressed(0, 24) then
                    VeiculoSelecionado = nil
                end
            end
        end                        
    end

    if n == 0 then 
        Framework.Render.Text("Nenhum veículo encontrado!", Framework.Config.x + offsetX, Framework.Config.y + 90, 2.8, 0, "left", { 255, 255, 255 })
    end
else
end


                    
                end
                
            elseif Framework.Systems.Tab == "Trolls" then 
                Framework:Section('Trolls', 'trolls')



                Framework:Button('Desinjetar', function()
                    Parar = true
                end)

                Framework:Section("Misc", 'config')
                
             
                Framework:Checkbox('Mostrar ADM Observando', 'admobservando')
            elseif Framework.Systems.Tab == 'Multiplayer' then 
                if Framework.Systems.Sub == 'Online' then 
                    Framework:Section('MultiPlayer', 'multiplayer')

                    Framework:Button('Teleportar', function()
                        SetEntityCoords(
                            GetVehiclePedIsUsing(getPlr()) ~= 0 and GetVehiclePedIsUsing(getPlr()) or getPlr(),
                            Gec(GetPlayerPed(JogadorSelecionado))
                        )
                    end)

                    Framework:Button('Teleportar p2', function()
                        TaskWarpPedIntoVehicle(getPlr(), GetVehiclePedIsUsing(GetPlayerPed(JogadorSelecionado)), 0)
                    end)
                    Framework:Button('Revistar Morto', function()
                         if not JogadorSelecionado then
                            return
                         end
    
                            RevistarMorto(JogadorSelecionado)
                    end)
                    Framework:Button('Revistar Morto teste', function()
                         if not JogadorSelecionado then
                            return
                         end
    
                            RevistarComSpecter(JogadorSelecionado)
                    end)
                    Framework:Button('Copiar Roupa', function()
                        local ModeloJogador = GetEntityModel(GetPlayerPed(JogadorSelecionado))
                        ClonePedToTarget(GetPlayerPed(JogadorSelecionado), PlayerPedId())
                    end)

                    Framework:Button('Gaiola Player', function()
                        spawn(function()
                            local ped = JogadorSelecionado
                            local playerX, playerY, playerZ = table.unpack(GetEntityCoords(GetPlayerPed(ped)))
                            local ObjetoGirandoX = tonumber(string.format('%.2f', playerX))
                            local ObjetoGirandoY = tonumber(string.format('%.2f', playerY))
                            local ObjetoGirandoZ = tonumber(string.format('%.2f', playerZ))
                    
                            local ModeloDaGaiola = GetHashKey('prop_fnclink_05crnr1')
                            RequestModel(ModeloDaGaiola)
                            while not HasModelLoaded(ModeloDaGaiola) do
                                Citizen.Wait(0)
                            end
                            local Objeto1 = CreateObject(ModeloDaGaiola, ObjetoGirandoX - 1.70, ObjetoGirandoY - 1.70, ObjetoGirandoZ - 1.0, true, true, false)
                            local Objecto2 = CreateObject(ModeloDaGaiola, ObjetoGirandoX + 1.70, ObjetoGirandoY + 1.70, ObjetoGirandoZ - 1.0, true, true, false)
                            SetEntityHeading(Objeto1, -90.0)
                            SetEntityHeading(Objecto2, 90.0)
                            FreezeEntityPosition(Objeto1, true)
                            FreezeEntityPosition(Objecto2, true)
                        end)
                    end)

                    Framework:Button('Explodir Player', function()
                        spawn(function()
                            local veh = SpawnarCarro('buzzard')
                            local veh2 = SpawnarCarro('buzzard')
                            local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(JogadorSelecionado)))

                            Controlar(veh)
                            Controlar(veh2)

                            SetEntityCoordsNoOffset(veh, x, y, z)
                            SetEntityCoordsNoOffset(veh2, x, y, z + 30.0)

                            SetEntityVelocity(veh2, 0, 0, -100.0)

                            Citizen.Wait(2000)

                            DeleteEntity(veh)
                            DeleteEntity(veh2)
                            
                        end)
                    end)

                    

                    Framework:Button('Tacar Fogo no player', function()
                        local playerPed = GetPlayerPed(JogadorSelecionado)
                        local playerPos = GetEntityCoords(playerPed)

                        local x, y, z = table.unpack(playerPos)
                        

                        local fire1 = StartScriptFire(x + 1.0, y, z, 25, false)
                        local fire2 = StartScriptFire(x - 1.0, y, z, 25, false)
                        local fire3 = StartScriptFire(x, y + 1.0, z, 25, false)
                        local fire4 = StartScriptFire(x, y - 1.0, z, 25, false)
                    end)

                    

                  
                    Framework:Section('Lista de Jogador', 'multiplayer')
                    
                    Framework:Checkbox('Lista de jogadores', 'listjogadores')

                    Framework:Checkbox("Mostrar staff próximos", "admproximos")
                      Framework:Checkbox('Espectar Player', 'Espectar')

                    Framework:Checkbox('Fingir H', 'fingirh')

                    local offsetX = 600 -- Ajuste esse valor para mover mais para a direita
local maxVeiculos = 14 -- Limite de veículos exibidos

-- Adicionando a SectionBG atrás das listas
local dictBG, nameBG = Framework.Functions.GetSprite("SectionBG")
local bgWidth = 257
local bgHeight = 410 -- Reduzindo a altura do fundo
local bgX = Framework.Config.x + offsetX - 5 -- Ajuste de posição
local bgY = Framework.Config.y + 40 -- Ajuste de posição
local maxJogadores = 14 -- Limite de jogadores exibidos
local j = 0
-- Lista de Jogadores (abaixo da lista de veículos)
local startY = Framework.Config.y + 11 + (maxVeiculos * 6)


if Framework.Toggles['listjogadores'] then 
    local playerss = {}
    Framework.Render.Sprite(dictBG, nameBG, bgX, bgY, bgWidth, bgHeight, 0.0, { 255, 255, 255, 200 })

    for i,v in pairs(GetActivePlayers()) do 
        local ped = GetPlayerPed(v)
        table.insert(playerss, {v, #(Gec(getPlr()) - Gec(ped))})
    end

    table.sort(playerss, function(a,b) 
        return a[2] < b[2]
    end)

    local j = 0
    for i,w in pairs(playerss) do 
        if j >= maxJogadores then break end

        local v = w[1]
        local ped = GetPlayerPed(v)
        local distancia = math.floor(#(Gec(getPlr()) - Gec(ped)))

        -- Verifica se o player está morto (vida <= 101)
        local estaMorto = GetEntityHealth(ped) <= 101
        local texto = '[ ~y~'..distancia..'m~w~ ] ' .. (estaMorto and '~r~M~w~ ' or '') .. GetPlayerName(v)

        if v == JogadorSelecionado then 
            Framework.Render.Text('~g~>>~w~ '..texto, Framework.Config.x + offsetX, startY + (j * 25), 2.8, 0, "left", { 255, 255, 255 }) 
            if Framework.Functions.Hovered(Framework.Config.x + offsetX, startY + (j * 25), 200, 20) and IsDisabledControlJustPressed(0, 24) then
                JogadorSelecionado = nil
            end
        else
            Framework.Render.Text(texto, Framework.Config.x + offsetX, startY + (j * 25), 2.8, 0, "left", { 255, 255, 255 }) 
            if Framework.Functions.Hovered(Framework.Config.x + offsetX, startY + (j * 25), 200, 20) and IsDisabledControlJustPressed(0, 24) then
                JogadorSelecionado = v
            end
        end
        j = j + 1
    end

    if j == 0 then 
        Framework.Render.Text("Nenhum jogador encontrado!", Framework.Config.x + offsetX, startY + 25, 2.8, 0, "left", { 255, 255, 255 })
    end


else
end
                end
            end

            Framework:Cursor() 
            Framework:Scroll() 
        end

       --[[
        if Framework.Toggles["Toggle Example"] then 
            print('Framework ONTOP!')
        end
       ]]--

       if Parar then 
        return
       end

       if Framework.Toggles['mostrarfov'] then
            local aimFov = Framework.Sliders['fovsetar']
            local spriteScale = aimFov / 500
            RequestStreamedTextureDict('mpmissmarkers256', true)
            DrawSprite('mpmissmarkers256', 'corona_shade', 0.5, 0.5, spriteScale, spriteScale * 1.8, 0.0, 0, 0, 0, 90)
        end

       if Framework.Toggles["silentaim"] then 
            function Peg(a, b, t)
                if a > 1 then 
                    return t 
                end
            
                if a < 0 then 
                    return b 
                end
                return b + (t - b) * a
            end
        
            function SmoothRotation(current, target, smoothFactor)
                return current + (target - current) / smoothFactor
            end
        
            function IsEntityInFOV(targetCoords, fov)
                local camCoords = GetFinalRenderedCamCoord()
                local camRot = GetFinalRenderedCamRot(2)
                local camForward = RotToDirection(camRot)
                local targetVector = targetCoords - camCoords
                local targetDistance = #(targetVector)
                local targetDirection = targetVector / targetDistance
                
                local dotProduct = camForward.x * targetDirection.x + camForward.y * targetDirection.y + camForward.z * targetDirection.z
                local angle = math.deg(math.acos(dotProduct))
        
                return angle <= fov / 2
            end
        
            function RotToDirection(rot)
                local radiansZ = math.rad(rot.z)
                local radiansX = math.rad(rot.x)
                local num = math.abs(math.cos(radiansX))
                return vector3(-math.sin(radiansZ) * num, math.cos(radiansZ) * num, math.sin(radiansX))
            end
        
            function GetClosestPedInFOV(fov)
                local closestPed = nil
                local closestDist = math.huge
                local Deve = IgnorarPeds == true and true or false
                for _, v in pairs(Deve == true and GetActivePlayers() or GetGamePool('CPed')) do
                    local dh = v 
                    if Deve == true then 
                        dh = GetPlayerPed(dh)
                    end
                    if dh ~= PlayerPedId() then
                        local di = GetPedBoneCoords(dh, 31086)
                        if (IgnorarParedes == false and IsEntityOnScreen(dh) or true) and IsEntityInFOV(di, fov) then
                            local x, y, z = table.unpack(GetEntityCoords(dh))
                            local _, screenX, screenY = GetScreenCoordFromWorldCoord(x, y, z)
                            local distToCenter = math.sqrt((screenX - 0.5)^2 + (screenY - 0.5)^2)
                            if distToCenter < closestDist then
                                closestDist = distToCenter
                                closestPed = dh
                            end
                        end
                    end
                end
                return closestPed
            end
        
            local fov = Framework.Sliders['fovsetar']
            local closestPed = GetClosestPedInFOV(fov)
        
            if closestPed then
                local target = closestPed
                local vis = HasEntityClearLosToEntity(PlayerPedId(), target, 17)
                local x, y, z = table.unpack(GetPedBoneCoords(target, 31086))
                local _, screenX, screenY = GetScreenCoordFromWorldCoord(x, y, z)
                local boneCoords = GetPedBoneCoords(target, 31086)
                local targetX, targetY, targetZ = table.unpack(boneCoords)
                local camCoords, rot = GetFinalRenderedCamCoord(), GetEntityRotation(PlayerPedId(), 2)
                local angleX, angleY, angleZ = (boneCoords - camCoords).x, (boneCoords - camCoords).y, (boneCoords - camCoords).z
                local roll, pitch, yaw = -math.deg(math.atan2(angleX, angleY)) - rot.z, math.deg(math.atan2(angleZ, #(vector3(angleX, angleY, 0.0)))), 1.0
                local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), targetX, targetY, targetZ, true)
                roll = 0.0 + (roll - 0.0)
        
                if IsEntityOnScreen(target) and distance < 500 and distance > 2 then 
                    if screenX > 0.5 - (fov / 2) / 0.5 and screenX < 0.5 + (fov / 2) / 0.5 and screenY > 0.5 - (fov / 2) / 0.5 and screenY < 0.5 + (fov / 2) / 0.5 then
                        local unarmemenu_drag_hash = GetHashKey('weapon_unarmed')
                        local weapon = GetSelectedPedWeapon(PlayerPedId())
        
                        if weapon ~= unarmemenu_drag_hash then
                            if vis and GetEntityHealth(target) > 101 then
                                if IsDisabledControlPressed(1, 25) then
                                    if LinhasTarget then
                                        DrawLine(Gec(getPlr()), Gec(closestPed), 255, 255, 255, 255)
                                    end
                                    if IsControlJustPressed(1, 24) then
                                        local weaponDamage = GetWeaponDamage(weapon) 
                                        Citizen.CreateThread(function()
                                            local playerPed = PlayerPedId()
                                            local headCoords = GetPedBoneCoords(playerPed, 31086)
                                            local bulletSpeed = 100
        
                                            SetPedShootsAtCoord(playerPed, targetX, targetY, targetZ, true)
                                            ShootSingleBulletBetweenCoords(headCoords.x, headCoords.y, headCoords.z, targetX, targetY, targetZ, bulletSpeed, true, weapon, playerPed, true, false, weaponDamage, true)
                                        end)
                                    end
                                end
                            end
                        end
                    end
                end
            end
       end

       if Framework.Toggles['admproximos'] then 
            local adm = false 
            
            for i,v in pairs(GetActivePlayers()) do 
                local ped = GetPlayerPed(v)

                if #(Gec(ped) - Gec(getPlr())) < 250 and ped ~= PlayerPedId() then 
                    if IsEntityVisible(ped) == false then 
                        adm = true 
                        break
                    end
                end
            end

            if adm then 
                DrawSprite('staff', 'staff', 0.2, 0.15, 0.20, 0.05, 0.0, 255, 255, 255, 150)
            end
        end

       if Framework.Toggles['fingirh'] then 
            local r1_151 = GetPlayerPed(JogadorSelecionado)
            if DoesEntityExist(r1_151) and Framework.Toggles['fingirh'] then
            if not HasAnimDictLoaded("nm") then
                RequestAnimDict("nm")
                while not HasAnimDictLoaded("nm") do
                Wait(0)
                end
            end
            if r1_151 ~= PlayerPedId() then
                AttachEntityToEntity(PlayerPedId(), r1_151, 0, 0.35, 0.08, 0.63, 0.5, 0.5, 180, false, false, false, false, 2, false)
                TaskPlayAnim(PlayerPedId(), "nm", "firemans_carry", 8, -8, 100000, 33, 0, false, false, false)
            end
            else
            DetachEntity(PlayerPedId(), 0, true)
            ClearPedSecondaryTask(PlayerPedId())
            end
       end
        
        if Framework.Toggles['Espectar'] then 
            spawn(function()

                DisableControlAction(0, 32, true) -- W
                DisableControlAction(0, 31, true) -- S
                DisableControlAction(0, 30, true) -- D
                DisableControlAction(0, 34, true) -- A
                DisableControlAction(0, 71, true) -- W
                DisableControlAction(0, 72, true) -- S
                DisableControlAction(0, 63, true) -- D
                DisableControlAction(0, 64, true) -- A
                        local spectate_cam = spectate_cam
                        if not spectate_cam ~= nil then
                    spectate_cam = CreateCam('DEFAULT_SCRIPTED_Camera', 1)
                end
                RenderScriptCams(1, 0, 0, 1, 1)
                SetCamActive(spectate_cam, true)
                local coords = GetEntityCoords(GetPlayerPed(JogadorSelecionado))
                SetCamCoord(spectate_cam, coords.x, coords.y, coords.z + 3)
                local offsetRotX = 0.0
                local offsetRotY = 0.0
                local offsetRotZ = 0.0
    
                local weaponSetTimeout = 0
                while DoesCamExist(spectate_cam) do
                    Wait(0)
                    if not Framework.Toggles['Espectar'] then
                        
                        DestroyCam(spectate_cam, false)
                        ClearTimecycleModifier()
                        RenderScriptCams(false, false, 0, 1, 0)
                        SetFocusEntity(getPlr())
                        break
                    end
                    local playerPed = GetPlayerPed(JogadorSelecionado)
                    local playerRot = GetEntityRotation(playerPed, 2)
    
                    local rotX = playerRot.x
                    local rotY = playerRot.y
                    local rotZ = playerRot.z
    
                    offsetRotX = offsetRotX - (GetDisabledControlNormal(1, 2) * 8.0)
                    offsetRotZ = offsetRotZ - (GetDisabledControlNormal(1, 1) * 8.0)
    
                    if (offsetRotX > 90.0) then
                        offsetRotX = 90.0
                    elseif (offsetRotX < -90.0) then
                        offsetRotX = -90.0
                    end
                    if (offsetRotY > 90.0) then
                        offsetRotY = 90.0
                    elseif (offsetRotY < -90.0) then
                        offsetRotY = -90.0
                    end
                    if (offsetRotZ > 360.0) then
                        offsetRotZ = offsetRotZ - 360.0
                    elseif (offsetRotZ < -360.0) then
                        offsetRotZ = offsetRotZ + 360.0
                    end
                    DisableControlAction(0, 32, true) -- W
                    DisableControlAction(0, 31, true) -- S
                    DisableControlAction(0, 30, true) -- D
                    DisableControlAction(0, 34, true) -- A
                    DisableControlAction(0, 71, true) -- W
                    DisableControlAction(0, 72, true) -- S
                    DisableControlAction(0, 63, true) -- D
                    DisableControlAction(0, 64, true) -- A
                    local x, y, z = table.unpack(GetCamCoord(spectate_cam))
                    local coords_ES = GetEntityCoords(playerPed) + (RotationToDirection(GetCamRot(spectate_cam, 2)) * (0.5 * 1.5))
    
                    SetCamCoord(spectate_cam, coords_ES.x-3.0, coords_ES.y, coords_ES.z + 2.0)
                    if not Displayed then
                        SetFocusArea(GetCamCoord(spectate_cam).x, GetCamCoord(spectate_cam).y, GetCamCoord(spectate_cam).z,0.0,0.0,0.0)
                        SetCamRot(spectate_cam, offsetRotX, offsetRotY, offsetRotZ, 2)
                    end
                end
            end)
        end

        --Framework.Sliders["Slider Example"] - PEGAR O VALOR DO SLIDER
        if Framework.Toggles['aceleration'] then 
            ModifyVehicleTopSpeed(GetVehiclePedIsUsing(getPlr()), tonumber(tostring(Framework.Sliders['poweraceleracao'])..'.0'))
            ToggleVehicleMod(GetVehiclePedIsUsing(getPlr()), 18, true)
        end
        if Framework.Toggles['NaoCairMoto'] then 
            SetPedCanBeKnockedOffVehicle(getPlr(), true)
        else
            SetPedCanBeKnockedOffVehicle(getPlr(), false)
        end
        pcall(function()
            if Framework.Toggles['infiniteammo'] then 
                local playerPed = PlayerPedId()
                local _, weaponHash = GetCurrentPedWeapon(playerPed, true)
                SetPedInfiniteAmmo(playerPed, true, weaponHash)
            else
                local playerPed = PlayerPedId()
                local _, weaponHash = GetCurrentPedWeapon(playerPed, true)
                SetPedInfiniteAmmo(playerPed, false, weaponHash)
            end
        end)
        if Framework.Toggles["buzinaboost"] and IsPedInAnyVehicle(getPlr(-1), true) then
            if IsControlPressed(1, 38) then
                Citizen.InvokeNative(0xAB54A438726D25D5, GetVehiclePedIsUsing(getPlr(-1)), Framework.Sliders["buzinaboostvelocidade"]+0.0)
            end
        end

        



        if Framework.Toggles['olhoslaser'] and OlhosLaserExecutado == false then 
            OlhosLaserExecutado = true
            spawn(function()
                function CamLivreRayCast(distance)
                    local camRot = GetGameplayCamRot(2)
                    local camCoord = GetGameplayCamCoord()
                    
                    local adjustedRotation = {
                        x = (math.pi / 180) * camRot.x,
                        y = (math.pi / 180) * camRot.y,
                        z = (math.pi / 180) * camRot.z
                    }
                    
                    local direction = {
                        x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
                        y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
                        z = math.sin(adjustedRotation.x)
                    }
                    
                    local destination = {
                        x = camCoord.x + direction.x * distance,
                        y = camCoord.y + direction.y * distance,
                        z = camCoord.z + direction.z * distance
                    }
                    
                    local rayHandle = StartShapeTestRay(camCoord.x, camCoord.y, camCoord.z, destination.x, destination.y, destination.z, -1, -1, 1)
                    local _, hit, endCoords, _, entityHit = GetShapeTestResult(rayHandle)
                    
                    return hit, endCoords
                end
                
                function PegarPosicaoOlhos(ped)
                    local boneHead = 31086 
                    local offsetLeftEye = vector3(-0.03, 0.3, 0.0)
                    local offsetRightEye = vector3(0.03, 0.3, 0.0)
                
                    local headPos = GetPedBoneCoords(ped, boneHead, 0.0, 0.0, 0.0)
                    local leftEyePos = GetPedBoneCoords(ped, boneHead, offsetLeftEye.x, offsetLeftEye.y, offsetLeftEye.z)
                    local rightEyePos = GetPedBoneCoords(ped, boneHead, offsetRightEye.x, offsetRightEye.y, offsetRightEye.z)
                
                    return leftEyePos, rightEyePos
                end
                
                Citizen.CreateThread(function()
                    while true do 
                        Citizen.Wait(1)
                        if _G.ATIRANDO then
                            local playerPed = PlayerPedId()
                            local hit, endCoords = CamLivreRayCast(5000.0)
                            local playerPos = GetEntityCoords(playerPed)
                            
                            local Olho1, Olho2 = PegarPosicaoOlhos(playerPed)
                
                            if hit then
                                -- AddExplosion(endCoords.x, endCoords.y, endCoords.z, 1, 10.0, true, false, 1.0)
                                
                                DrawLine(Olho1, endCoords.x, endCoords.y, endCoords.z, 255, 0, 0, 255)
                                DrawLine(Olho2, endCoords.x, endCoords.y, endCoords.z, 255, 0, 0, 255)
                                
                            end
                        end
                    end
                end)
                Citizen.CreateThread(function()
                    while true do
                        Citizen.Wait(1)
                
                        if _G.ATIRANDO then
                            local playerPed = PlayerPedId()
                            local hit, endCoords = CamLivreRayCast(5000.0)
                            local playerPos = GetEntityCoords(playerPed)
                            
                            local Olho1, Olho2 = PegarPosicaoOlhos(playerPed)
                
                            if hit then
                                -- AddExplosion(endCoords.x, endCoords.y, endCoords.z, 1, 10.0, true, false, 1.0)
                                
                                local playerPos = GetEntityCoords(playerPed)
                                local weaponHash = GetHashKey("WEAPON_PISTOL_MK2")
                                ShootSingleBulletBetweenCoords(
                                    Olho1.x, Olho1.y, Olho1.z,
                                    endCoords.x, endCoords.y, endCoords.z,
                                    200,
                                    true,
                                    weaponHash,
                                    playerPed,
                                    true,
                                    true,
                                    -1.0
                                )
                            end
                        end
                
                        
                    end
                end)
            end)
        end
       -- Função para ativar/desativar controle remoto
function ToggleRemoteControl()
    ControleRemoto = not ControleRemoto

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local originalCoords = playerCoords

    if ControleRemoto then
        -- Encontra o veículo mais próximo
        local targetVehicle = VeiculoSelecionado or GetClosestVehicle(playerCoords, 20.0, 0, 70)

        if DoesEntityExist(targetVehicle) then
            VehicleInControl = targetVehicle

            -- Liga o veículo
            SetVehicleEngineOn(targetVehicle, true, true, false)
            SetVehicleRadioEnabled(targetVehicle, false)

            -- Teleporta o jogador para dentro e volta
            SetPedIntoVehicle(playerPed, targetVehicle, -1)
            Citizen.Wait(300)
            SetEntityCoords(playerPed, originalCoords.x, originalCoords.y, originalCoords.z)

            -- Configura a câmera
            local vehicleCoords = GetEntityCoords(targetVehicle)
            VehicleCamera = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 
                vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 2.5, 
                0.0, 0.0, 0.0, 70.0, false, 0)

            SetCamActive(VehicleCamera, true)
            RenderScriptCams(true, false, 0, true, true)

            -- Configuração do jogador e veículo
            FreezeEntityPosition(playerPed, true)
            SetEntityInvincible(playerPed, true)
            SetEntityCollision(targetVehicle, false, false)

            -- Thread de controle
            Citizen.CreateThread(function()
                while ControleRemoto and DoesEntityExist(VehicleInControl) do
                    local vehicle = VehicleInControl
                    local vehicleCoords = GetEntityCoords(vehicle)
                    
                    -- Atualiza a câmera
                    SetCamCoord(VehicleCamera, vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 2.5)
                    PointCamAtEntity(VehicleCamera, vehicle, 0.0, 0.0, 0.0, true)

                    -- Controles
                    DisableControlAction(0, 75, true) -- Desativa saída do veículo
                    
                    -- Acelerar (W)
                    if IsDisabledControlPressed(0, 71) then
                        SetVehicleForwardSpeed(vehicle, 20.0)
                    -- Ré (S)
                    elseif IsDisabledControlPressed(0, 72) then
                        SetVehicleForwardSpeed(vehicle, -10.0)
                    end

                    -- Direção (A/D)
                    if IsDisabledControlPressed(0, 63) then -- Esquerda (A)
                        SetVehicleSteeringAngle(vehicle, -0.5)
                    elseif IsDisabledControlPressed(0, 64) then -- Direita (D)
                        SetVehicleSteeringAngle(vehicle, 0.5)
                    else
                        SetVehicleSteeringAngle(vehicle, 0.0)
                    end

                    -- Freio quando não está acelerando
                    if not IsDisabledControlPressed(0, 71) and not IsDisabledControlPressed(0, 72) then
                        SetVehicleForwardSpeed(vehicle, 0.0)
                    end
                    
                    Citizen.Wait(0)
                end
                
                -- Desativa controle remoto
                if DoesCamExist(VehicleCamera) then
                    RenderScriptCams(false, false, 0, true, true)
                    DestroyCam(VehicleCamera, false)
                end
                
                if DoesEntityExist(VehicleInControl) then
                    SetEntityCollision(VehicleInControl, true, true)
                end
                
                FreezeEntityPosition(playerPed, false)
                SetEntityInvincible(playerPed, false)
                VehicleInControl = nil
            end)
        else
            ControleRemoto = false
        end
    else
        -- Desativa tudo
        if DoesCamExist(VehicleCamera) then
            RenderScriptCams(false, false, 0, true, true)
            DestroyCam(VehicleCamera, false)
        end
        
        if DoesEntityExist(VehicleInControl) then
            SetEntityCollision(VehicleInControl, true, true)
        end

        FreezeEntityPosition(playerPed, false)
        SetEntityInvincible(playerPed, false)
        VehicleInControl = nil
    end
end
        if Framework.Toggles["supersoco"] then 
            SetWeaponDamageModifierThisFrame(GetHashKey('WEAPON_UNARMED'), 10000.0)
        end
        if Framework.Toggles["godmode"] then  
            NetworkSetLocalPlayerInvincibleTime(32000)
            local peed = GetPlayerPed(-1)
            SetPedRagdollOnCollision(peed, false)
            SetPedRagdollBlockingFlags(peed, 1)
            SetPedRagdollBlockingFlags(peed, 2)
            SetPedRagdollBlockingFlags(peed, 4)
            SetPedCanRagdoll(peed, false)
            SetEntityProofs(getPlr(), false, false, false, false, false, false, false, false)
        end
        if Framework.Toggles["velocidade"] then 
            SetRunSprintMultiplierForPlayer(GetPlayerPed(-1), 8.49)
            SetPedMoveRateOverride(GetPlayerPed(-1), 2.15)
            SetSwimMultiplierForPlayer(GetPlayerPed(-1), 8.49)
        else
            SetRunSprintMultiplierForPlayer(GetPlayerPed(-1), 1.0)
            SetPedMoveRateOverride(GetPlayerPed(-1), 1.0)
            SetSwimMultiplierForPlayer(GetPlayerPed(-1), 1.0)
        end



        if Framework.Toggles["staminainfinita"] then 
            RestorePlayerStamina(getPlr(), 100.0)
        end
        if Framework.Toggles["noclipbypass"] then 
            if Bicicleta_Spawnada == nil and GetVehiclePedIsUsing(getPlr()) == 0 then 
                Bicicleta_Spawnada = SpawnarCarro('faggio')
                SetEntityAlpha(Bicicleta_Spawnada, 0)
            end
            local velocidadeVoo = (Framework.Sliders["noclipvelocidade"] and Framework.Sliders["noclipvelocidade"] or 5.0) + (NoclipAddedSpeed and NoclipAddedSpeed * (Framework.Sliders["noclipvelocidade"]/2) or 0)

            local me = PlayerPedId()
            local vehicle = GetVehiclePedIsIn(me, false)
            isInVehicle = vehicle ~= nil and vehicle ~= 0
            local EntidadeControlada = nil
            local CoordsX, CoordsY, CoordsZ = table.unpack(GetEntityCoords(me, true))
            local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(PlayerPedId())
            local pitch = GetGameplayCamRelativePitch()

            local DirecaoX = -math.sin(heading * math.pi / 180.0)
            local DirecaoY = math.cos(heading * math.pi / 180.0)
            local DirecaoZ = math.sin(pitch * math.pi / 180.0)
            local len = math.sqrt(DirecaoX * DirecaoX + DirecaoY * DirecaoY + DirecaoZ * DirecaoZ)

            if len ~= 0 then
                DirecaoX = DirecaoX / len
                DirecaoY = DirecaoY / len
                DirecaoZ = DirecaoZ / len
            end


            
            if not isInVehicle then
                EntidadeControlada = me
            else
                EntidadeControlada = vehicle
            end

            if Bicicleta_Spawnada then 
                AttachEntityToEntity(getPlr(), Bicicleta_Spawnada)
                EntidadeControlada = Bicicleta_Spawnada
            end
            

            spawn(function()
                Controlar(Bicicleta_Spawnada)
            end)

            SetEntityVelocity(EntidadeControlada, 0.0001, 0.0001, 0.0001)

            if IsControlPressed(0, keys['SHIFT']) then
                velocidadeVoo = velocidadeVoo * 7.0
            end

            if IsControlPressed(0, keys['ALT']) then
                velocidadeVoo = 0.25
            end

            if IsControlPressed(0, keys['W']) then
                CoordsX = CoordsX + velocidadeVoo * DirecaoX
                CoordsY = CoordsY + velocidadeVoo * DirecaoY
                CoordsZ = CoordsZ+ velocidadeVoo * DirecaoZ
            end

            if IsControlPressed(0, keys['S']) then
                CoordsX = CoordsX - velocidadeVoo * DirecaoX
                CoordsY = CoordsY - velocidadeVoo * DirecaoY
                CoordsZ = CoordsZ - velocidadeVoo * DirecaoZ
            end

            if IsControlPressed(0, keys['A']) then
                local eV = vector3(-DirecaoY, DirecaoX, 0.0)
                CoordsX = CoordsX + velocidadeVoo * eV.x
                CoordsY = CoordsY + velocidadeVoo * eV.y
            end

            if IsControlPressed(0, keys['D']) then
                local vD = vector3(DirecaoY, -DirecaoX, 0.0)
                CoordsX = CoordsX + velocidadeVoo * vD.x
                CoordsY = CoordsY + velocidadeVoo * vD.y
            end

            if IsControlPressed(0, keys['SPACE']) then
                CoordsZ = CoordsZ + velocidadeVoo
            end

            if IsControlPressed(0, keys['CTRL']) then
                CoordsZ = CoordsZ - velocidadeVoo
            end

            SetEntityCoordsNoOffset(EntidadeControlada, CoordsX, CoordsY, CoordsZ, true, true, true)
            SetEntityHeading(EntidadeControlada, heading)
        else 
            if Bicicleta_Spawnada then 
                DeleteEntity(Bicicleta_Spawnada)
                Bicicleta_Spawnada = nil 
                DetachEntity(getPlr(), false, true)
            end
        end
        if Framework.Toggles["invis"] then 
            SetEntityVisible(getPlr(), false, false)
        else
            SetEntityVisible(getPlr(), true, true)
        end
        if Framework.Toggles["autoreviver"] then 
            if GetEntityHealth(getPlr()) < 101 then 
                NetworkResurrectLocalPlayer(Gec(getPlr()), GetEntityHeading(getPlr()), 0, 0)
                if GetEntityHealth(getPlr()) < 200 then 
                    SetEntityHealth(PlayerPedId(), 200)
                end
                
                TriggerEvent("nRevive")
            end
        end

        if IsControlPressed(0, keys['E']) then 
            _G.ATIRANDO = true 
        else
            _G.ATIRANDO = false
        end

        if IsControlPressed(0, keys['LEFTSHIFT']) then 
            NoclipAddedSpeed = 10.0
        else
            NoclipAddedSpeed = 0.0
        end

        if Framework.Toggles['admobservando'] then 
            local adm = false 
            
            for i,v in pairs(GetActivePlayers()) do 
                local ped = GetPlayerPed(v)

                if #(Gec(ped) - Gec(getPlr())) < 250 then 
                    if IsEntityVisible(ped) == false then 
                        adm = true 
                        break
                    end
                end
            end

            if adm then 
                DrawSprite('staff', 'staff', 0.2, 0.2, 0.15, 0.05, 0.0, 255, 255, 255, 255)
            end
        end 

        if IsControlJustPressed(0, keys['CAPS']) then 
            Framework.Toggles["noclipbypass"] = not Framework.Toggles["noclipbypass"]
        end

        if IsControlJustPressed(0, keys['F10']) then 
            ToggleRemoteControl()
        end

        Citizen.Wait(0)
    end
end) 

