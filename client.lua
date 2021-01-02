--    _____                   ___   ___   ___  _____   _  _    ___   ___   ___  __ 
--   |  __ \                 |__ \ / _ \ / _ \| ____|_| || |_ / _ \ / _ \ / _ \/_ |
--   | |__) |__ _  __ _  __ _   ) | | | | | | | |__ |_  __  _| | | | | | | | | || |
--   |  _  // _` |/ _` |/ _` | / /| | | | | | |___ \ _| || |_| | | | | | | | | || |
--   | | \ \ (_| | (_| | (_| |/ /_| |_| | |_| |___) |_  __  _| |_| | |_| | |_| || |
--   |_|  \_\__,_|\__,_|\__, |____|\___/ \___/|____/  |_||_|  \___/ \___/ \___/ |_|
--                       __/ |                                                     
--                      |___/    
--                                                  
--  This is som simpel events for FiveM
--  Copyright, Oskar Raagart at https://www.raag2005.dk

RegisterNetEvent('raag:blip')
RegisterNetEvent('raag:helpText')
RegisterNetEvent('raag:setView')
RegisterNetEvent('raag:addPed')
RegisterNetEvent('raag:notify')
RegisterNetEvent('raag:Anotify')

-- Add Ped
AddEventHandler('raag:addPed', function(x,y,z,h, ped) 
    local ped1 = GetHashKey(ped)
    RequestModel(ped1)
    while not HasModelLoaded(ped1) do
        Citizen.Wait(5000)
    end
    pedId = CreatePed(5, ped1, x,y, z, h, false, true)
    SetPedCombatAttributes(pedId, 46, true)
    SetPedFleeAttributes(pedId, 0, 0)
    SetBlockingOfNonTemporaryEvents(pedId, true)
    SetEntityAsMissionEntity(pedId, true, true)
    SetEntityInvincible(pedId, true)
    FreezeEntityPosition(pedId, true)
end)

-- Set View
AddEventHandler('raag:setView', function(x,y,z, h, bool)
    if bool == true then
        function ChangeView(x, y, z)
            local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
            if createdCamera ~= 0 then
                DestroyCam(createdCamera, 0)
                createdCamera = 0
            end
            SetCamCoord(cam, x, y, z)
            SetCamRot(cam, 0.0, 0.0, h)
            RenderScriptCams(1, 0, 0, 1, 1)
            Citizen.Wait(250)
            createdCamera = cam
        end
    elseif bool == false then
        function StopView()
            DestroyCam(createdCamera, 0)
            RenderScriptCams(0, 0, 1, 1, 1)
            createdCamera = 0
            SetFocusEntity(GetPlayerPed(PlayerId()))
            FreezeEntityPosition(GetPlayerPed(PlayerId()), false)
        end
    end
end)

-- Help text
AddEventHandler('raag:helpText', function(text) 
    ClearAllHelpMessages();
    SetTextComponentFormat("STRING");
    AddTextComponentString(text);
    DisplayHelpTextFromStringLabel(0, false, true, 5000);
end)

-- blip
AddEventHandler('raag:blip', function(text, x, y, z) 
    local blip = AddBlipForCoord(x, y, z)
    SetBlipScale(blip, 1.25)
    SetBlipDisplay(blip, 4)
    SetBlipSprite(blip, 430)
    SetBlipColour(blip, 3)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(blip)
end)

-- Native Notify
AddEventHandler('raag:notify', function(text)
  SetNotificationTextEntry("STRING")
  AddTextComponentString(string)
  DrawNotification(false, true)
end)

-- Native Notify Advanced
AddEventHandler('raag:Anotify', function(text, sender, subject, clan, duration)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    SetNotificationMessageClanTag(clan, clan, 1, 7, sender, subject, 1000 * duration, "")
    DrawNotification(true, true)
end)
