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
--  this verion is 26.93% compressed in comparison to the client.lua

RegisterNetEvent('raag:blip')RegisterNetEvent('raag:helpText')RegisterNetEvent('raag:setView')RegisterNetEvent('raag:addPed')RegisterNetEvent('raag:notify')AddEventHandler('raag:addPed',function(a,b,c,d,e)local f=GetHashKey(e)RequestModel(f)while not HasModelLoaded(f)do Citizen.Wait(5000)end;pedId=CreatePed(5,f,a,b,c,d,false,true)SetPedCombatAttributes(pedId,46,true)SetPedFleeAttributes(pedId,0,0)SetBlockingOfNonTemporaryEvents(pedId,true)SetEntityAsMissionEntity(pedId,true,true)SetEntityInvincible(pedId,true)FreezeEntityPosition(pedId,true)end)AddEventHandler('raag:setView',function(a,b,c,d,g)if g==true then function ChangeView(a,b,c)local h=CreateCam("DEFAULT_SCRIPTED_CAMERA",1)if createdCamera~=0 then DestroyCam(createdCamera,0)createdCamera=0 end;SetCamCoord(h,a,b,c)SetCamRot(h,0.0,0.0,d)RenderScriptCams(1,0,0,1,1)Citizen.Wait(250)createdCamera=h end elseif g==false then function StopView()DestroyCam(createdCamera,0)RenderScriptCams(0,0,1,1,1)createdCamera=0;SetFocusEntity(GetPlayerPed(PlayerId()))FreezeEntityPosition(GetPlayerPed(PlayerId()),false)end end end)AddEventHandler('raag:helpText',function(i)ClearAllHelpMessages()SetTextComponentFormat("STRING")AddTextComponentString(i)DisplayHelpTextFromStringLabel(0,false,true,5000)end)AddEventHandler('raag:blip',function(i,a,b,c)local j=AddBlipForCoord(a,b,c)SetBlipScale(j,1.25)SetBlipDisplay(j,4)SetBlipSprite(j,430)SetBlipColour(j,3)SetBlipAsShortRange(j,true)BeginTextCommandSetBlipName("STRING")AddTextComponentString(i)EndTextCommandSetBlipName(j)end)AddEventHandler('raag:notify',function(i)SetNotificationTextEntry("STRING")AddTextComponentString(string)DrawNotification(false,true)end)
