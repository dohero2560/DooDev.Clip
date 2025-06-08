ESX = exports["es_extended"]:getSharedObject()

-- Cache for weapon hashes to improve performance
local weaponHashCache = {}

local function IsInTable(tbl, val)
    for _, v in pairs(tbl) do
        if v == val then
            return true
        end
    end
    return false
end

-- Function to get weapon hash from name with caching
local function GetWeaponHash(weaponName)
    if not weaponHashCache[weaponName] then
        weaponHashCache[weaponName] = GetHashKey(weaponName)
    end
    return weaponHashCache[weaponName]
end

-- Function to check if player can use ammo
local function CanUseAmmo(playerPed, weaponHash, ammoData)
    if weaponHash == `WEAPON_UNARMED` then return false end
    
    local weaponName = nil
    for k, v in pairs(Config.AmmoTypes) do
        for _, weapon in ipairs(v.weapons) do
            if GetWeaponHash(weapon) == weaponHash then
                weaponName = weapon
                break
            end
        end
        if weaponName then break end
    end

    return weaponName and ammoData.weapons and IsInTable(ammoData.weapons, weaponName)
end

-- Function to normalize weapon ammo to max stack
local function NormalizeWeaponAmmo(playerPed, weaponHash, maxStack)
    local currentAmmo = GetAmmoInPedWeapon(playerPed, weaponHash)
    if currentAmmo > maxStack then
        SetPedAmmo(playerPed, weaponHash, maxStack)
        return true
    end
    return false
end

RegisterNetEvent('inventory:useItem')
AddEventHandler('inventory:useItem', function(itemName)
    if not Config.AmmoTypes[itemName] then return end
    
    local ammoData = Config.AmmoTypes[itemName]
    local playerPed = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(playerPed)

    if not CanUseAmmo(playerPed, currentWeaponHash, ammoData) then
        TriggerEvent('esx:showNotification', 'This ammo type is not compatible with your current weapon')
        return
    end

    local currentAmmo = GetAmmoInPedWeapon(playerPed, currentWeaponHash)
    local maxStack = ammoData.maxStack

    -- Check and normalize if current ammo exceeds max stack
    if currentAmmo > maxStack then
        if NormalizeWeaponAmmo(playerPed, currentWeaponHash, maxStack) then
            TriggerEvent('esx:showNotification', 'Weapon ammo normalized to maximum capacity')
            return
        end
    end

    if currentAmmo >= maxStack then
        TriggerEvent('esx:showNotification', 'This weapon is already at maximum ammo capacity')
        return
    end

    -- Play reload animation
    TaskReloadWeapon(playerPed)
    Wait(1000) -- Wait for animation to complete

    -- Calculate and add ammo
    local ammoToAdd = ammoData.addAmount
    local newAmmo = math.min(currentAmmo + ammoToAdd, maxStack)
    local ammoAdded = newAmmo - currentAmmo

    -- Add ammo using native function and ESX
    AddAmmoToPed(playerPed, currentWeaponHash, ammoAdded)
    TriggerServerEvent('ammo_system:addWeaponAmmo', currentWeaponHash, ammoAdded)
    
    -- Show notification
    TriggerEvent('esx:showNotification', 'Added ' .. ammoAdded .. ' rounds of ' .. ammoData.label)
    
    -- Remove item from inventory
    TriggerServerEvent('ammo_system:removeItem', itemName, 1)
end)

-- Add event handler for when player changes weapon
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end
    weaponHashCache = {} -- Clear cache on resource restart
end)

-- Check and normalize ammo when player equips a weapon
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local playerPed = PlayerPedId()
        local currentWeaponHash = GetSelectedPedWeapon(playerPed)
        
        if currentWeaponHash ~= `WEAPON_UNARMED` then
            for _, ammoData in pairs(Config.AmmoTypes) do
                if CanUseAmmo(playerPed, currentWeaponHash, ammoData) then
                    NormalizeWeaponAmmo(playerPed, currentWeaponHash, ammoData.maxStack)
                    break
                end
            end
        end
    end
end)