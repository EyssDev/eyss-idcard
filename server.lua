ESX = exports['es_extended']:getSharedObject()

RegisterServerEvent('eyss:open')
AddEventHandler('eyss:open', function(ID, targetID, type)
	local identifier = ESX.GetPlayerFromId(ID).identifier
	local _source 	 = ESX.GetPlayerFromId(targetID).source
	local show       = true

	MySQL.Async.fetchAll('SELECT firstname, lastname, dateofbirth, sex, height FROM users WHERE identifier = @identifier', {['@identifier'] = identifier},
	function (user)
		
		if show then
			local array = {
				user = user
			}
			TriggerClientEvent('eyss:open', _source, array, type)
		end
	end)
end)

ESX.RegisterServerCallback("getlicensefish", function(source, cb)
	local identifier = ESX.GetPlayerFromId(source).identifier
	MySQL.Async.fetchAll('SELECT type FROM user_licenses WHERE owner = @identifier', {['@identifier'] = identifier},
	function (licenses)
		for i=1, #licenses, 1 do
			if licenses[i].type == 'fish' then
				cb("fish")
			end
		end
	end)
end)

ESX.RegisterServerCallback("getlicensehunting", function(source, cb)
	local identifier = ESX.GetPlayerFromId(source).identifier
	MySQL.Async.fetchAll('SELECT type FROM user_licenses WHERE owner = @identifier', {['@identifier'] = identifier},
	function (licenses)
		for i=1, #licenses, 1 do
			if licenses[i].type == 'hunting' then
				cb("hunting")
			end
		end
	end)
end)

ESX.RegisterServerCallback("getlicenseppa", function(source, cb)
	local identifier = ESX.GetPlayerFromId(source).identifier
	MySQL.Async.fetchAll('SELECT type FROM user_licenses WHERE owner = @identifier', {['@identifier'] = identifier},
	function (licenses)
		for i=1, #licenses, 1 do
			if licenses[i].type == 'ppa' then
				cb("ppa")
			end
		end
	end)
end)