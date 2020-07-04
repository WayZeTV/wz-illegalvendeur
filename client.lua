ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

------------ Création du Menu / Sous Menu -----------

RMenu.Add('example', 'main', RageUI.CreateMenu("", "~r~Magasin Illégal"))
RMenu.Add('example', 'boisson', RageUI.CreateSubMenu(RMenu:Get('example', 'main'), "", "~r~Magasin Illégal - Armes à feu"))
RMenu.Add('example', 'chargeur', RageUI.CreateSubMenu(RMenu:Get('example', 'main'), "", "~r~Magasin Illégal - Accessoires"))
RMenu.Add('example', 'couteau', RageUI.CreateSubMenu(RMenu:Get('example', 'main'), "", "~r~Magasin Illégal - Armes Blanches"))

Citizen.CreateThread(function()
    while true do
        RageUI.IsVisible(RMenu:Get('example', 'main'), true, true, true, function()

            RageUI.Button("Armes Blanches", "Pour vous défendre au corps à corps !", {RightLabel = "→→→"},true, function()
            end, RMenu:Get('example', 'couteau'))

            RageUI.Button("Armes à feu", "Pour vous défendre à moyenne portée !", {RightLabel = "→→→"},true, function()
            end, RMenu:Get('example', 'boisson'))

             RageUI.Button("Accessoires", "Pour améliorer tes armes !", {RightLabel = "→→→"},true, function()
            end, RMenu:Get('example', 'chargeur'))
        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('example', 'boisson'), true, true, true, function()

            RageUI.Button("Pistolet", "Acheter un Pistolet", {RightLabel = "~r~10000$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('powx_tuto:BuyPistolet')
                end
            end)

            RageUI.Button("Pistolet Calibre 50", "Acheter un Pistolet Calibre 50", {RightLabel = "~r~25000$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('powx_tuto:BuyCalibre')
                end
            end)

            RageUI.Button("Pétoire", "Acheter un Pétoire", {RightLabel = "~r~6000$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('powx_tuto:BuyPetoire')
                end
            end)
        end, function()

        end)
                RageUI.IsVisible(RMenu:Get('example', 'chargeur'), true, true, true, function()


            RageUI.Button("Lampe", "Acheter une Lampe", {RightLabel = "~r~250$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('powx_tuto:BuyLampe2')
                end
            end)

            RageUI.Button("Chargeur", "Acheter un Chargeur", {RightLabel = "~r~1000$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('powx_tuto:BuyChargeur2')
                end
            end)

             RageUI.Button("Skin de Luxe", "Acheter un Skin de Luxe", {RightLabel = "~r~2500$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('powx_tuto:BuySkinDeLuxe2')
                      end
                end)

               RageUI.Button("Silencieux", "Acheter un Silencieux", {RightLabel = "~r~750$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('powx_tuto:BuySilencieux2')
                      end
                end)


        end, function()
        end)

                RageUI.IsVisible(RMenu:Get('example', 'couteau'), true, true, true, function()


            RageUI.Button("Couteau", "Acheter un Couteau", {RightLabel = "~r~500$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('powx_tuto:BuyCouteau')
                end
            end)

                        RageUI.Button("Machette", "Acheter une Machette", {RightLabel = "~r~800$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('powx_tuto:BuyCouteau3')
                end
            end)


            RageUI.Button("Batte", "Acheter une Batte de Baseball", {RightLabel = "~r~750$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('powx_tuto:BuyCouteau2')
                      end
                end)

                        
            end, function()
                ---Panels
            end, 1)
    
            Citizen.Wait(0)
        end
    end)



    ---------------------------------------- Position du Menu --------------------------------------------

    local position = {
        {x = 1555.54 , y = 3599.06, z = 38.78, }
    }    
    
    
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
    
            for k in pairs(position) do
    
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
    
                if dist <= 1.0 then

                  -- RageUI.Text({
                  --      message = "Appuyez sur [~r~E~w~] pour parler à ~r~Moussa",
                   --     time_display = 1
                    --})
                    ESX.ShowHelpNotification("Appuyez sur [~r~E~w~] pour parler à ~r~Moussa")
                    if IsControlJustPressed(1,51) then
                        RageUI.Visible(RMenu:Get('example', 'main'), not RageUI.Visible(RMenu:Get('example', 'main')))
                    end
                end
            end
        end
    end)

     Citizen.CreateThread(function()
    local hash = GetHashKey("s_m_y_dealer_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "s_m_y_dealer_01", 1554.8, 3600.31, 37.78, 208.28, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
end)