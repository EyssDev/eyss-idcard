ESX = exports['es_extended']:getSharedObject()

local open = false

RegisterCommand("idcard", function()
    TriggerEvent('montrer:idcard', source)
end)

RegisterNetEvent('eyss:open')
AddEventHandler('eyss:open', function( data, type )
	open = true
	SendNUIMessage({
		action = "open",
		array  = data,
		type   = type
	})
end)

RegisterKeyMapping("closeidc", 'Close ID Card', 'keyboard', 'BACK')
RegisterCommand("closeidc", function()
    SendNUIMessage({
        action = "close"
    })
    open = false
end)

RegisterNetEvent('montrer:idcard')
AddEventHandler('montrer:idcard', function(id)
    local player, distance = ESX.Game.GetClosestPlayer()
    ESX.TriggerServerCallback('getlicensefish', function(fish)
        if fish == "fish" then
            TriggerServerEvent('eyss:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()),'fish')
            if distance ~= -1 and distance <= 3.0 then
                TriggerServerEvent('eyss:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player),'fish')     
            end
        end
    end)
    ESX.TriggerServerCallback('getlicensehunting', function(hunting)
        if hunting == "hunting" then
            TriggerServerEvent('eyss:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()),'hunting')
            if distance ~= -1 and distance <= 3.0 then
                TriggerServerEvent('eyss:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player),'hunting')     
            end
        end
    end)
    ESX.TriggerServerCallback('getlicenseppa', function(ppa)
        if ppa == "ppa" then
            TriggerServerEvent('eyss:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()),'ppa')
            if distance ~= -1 and distance <= 3.0 then
                TriggerServerEvent('eyss:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player),'ppa')     
            end
        end
    end)
    TriggerServerEvent('eyss:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
    if distance ~= -1 and distance <= 3.0 then
        TriggerServerEvent('eyss:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))                                
    end
end)