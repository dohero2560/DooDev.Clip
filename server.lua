ESX = exports["es_extended"]:getSharedObject()


-- Cooldown tracking
local playerCooldowns = {}

-- Function to check if player is on cooldown
local function IsOnCooldown(source)
    if not playerCooldowns[source] then return false end
    return (GetGameTimer() - playerCooldowns[source]) < Config.UseCooldown
end

-- Function to set player cooldown
local function SetCooldown(source)
    playerCooldowns[source] = GetGameTimer()
end

-- Function to remove player from cooldown tracking
local function RemoveCooldown(source)
    playerCooldowns[source] = nil
end

-- Register usable items for ESX
if ESX then
    for itemName, _ in pairs(Config.AmmoTypes) do
        ESX.RegisterUsableItem(itemName, function(source)
            local xPlayer = ESX.GetPlayerFromId(source)
            if xPlayer then
                TriggerClientEvent('inventory:useItem', source, itemName)
            end
        end)
    end
end



-- Handle ESX weapon ammo
RegisterNetEvent('ammo_system:addWeaponAmmo')
AddEventHandler('ammo_system:addWeaponAmmo', function(weaponHash, amount)
    local _source = source
    if ESX then
        local xPlayer = ESX.GetPlayerFromId(_source)
        if xPlayer then
            xPlayer.addWeaponAmmo(weaponHash, amount)
        end
    end
end)

-- Clean up cooldowns when player disconnects
AddEventHandler('playerDropped', function()
    RemoveCooldown(source)
end)

RegisterNetEvent('ammo_system:removeItem')
AddEventHandler('ammo_system:removeItem', function(itemName, count)
    local _source = source
    
    -- Check cooldown
    if IsOnCooldown(_source) then
        TriggerClientEvent('esx:showNotification', _source, 'Please wait before using ammo again')
        return
    end

    -- Validate input
    if not itemName or not count or count < 1 then
        if Config.Debug then
            print(string.format('^3Ammo System: ^1Invalid input from Player ID: %s^0', _source))
        end
        return
    end

    local xPlayer = nil
    local success = false

    -- Check for ESX Framework
    if ESX then
        xPlayer = ESX.GetPlayerFromId(_source)
        if xPlayer then
            local item = xPlayer.getInventoryItem(itemName)
            if item and item.count >= count then
                xPlayer.removeInventoryItem(itemName, count)
                success = true
            end
        end
    -- Check for QBCore Framework
    end

    -- Handle result
    if success then
        SetCooldown(_source)
    else
        TriggerClientEvent('esx:showNotification', _source, 'Failed to remove ammo item')
    end
end)

-- Clean up cooldowns periodically
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000) -- Check every minute
        local currentTime = GetGameTimer()
        for source, cooldownTime in pairs(playerCooldowns) do
            if (currentTime - cooldownTime) > Config.UseCooldown then
                RemoveCooldown(source)
            end
        end
    end
end)