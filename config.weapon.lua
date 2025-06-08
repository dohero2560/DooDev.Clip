Config = {}

Config.AmmoTypes = {
    ["am.357"] = {
        label = ".357 Ammo",
        weapons = {
            "WEAPON_REVOLVER",
            "WEAPON_DOUBLEACTION",
            "WEAPON_PISTOL50"
        },
        addAmount = 7,
        maxStack = 50
    },
    ["am.380"] = {
        label = ".380 Ammo",
        weapons = {
            "WEAPON_SNSPISTOL",
            "WEAPON_MINISMG"
        },
        addAmount = 25,
        maxStack = 150
    },
    ["am5.45x39"] = {
        label = "5.45x39 Ammo",
        weapons = {
            "WEAPON_COMPACTRIFLE",
            "WEAPON_AKS74U",
            "WEAPON_MB47",
            "WEAPON_AK47",
            "WEAPON_ASSAULTRIFLE"
        },
        addAmount = 20,
        maxStack = 200
    },
    ["am5.56x45"] = {
        label = "5.56x45 Ammo",
        weapons = {
            "WEAPON_M249",
            "WEAPON_COMBATMG",
            "WEAPON_SCAR17FM",
            "WEAPON_SPECIALCARBINE",
            "WEAPON_M16A1",
            "WEAPON_FM1_M16A4",
            "WEAPON_CARBINERIFLE",
            "WEAPON_BULLPUPRIFLE",
            "WEAPON_ADVANCEDRIFLE",
            "WEAPON_HK416",
            "WEAPON_FM41",
            "WEAPON_MK18MOD0",
            "WEAPON_M6IC",
            "WEAPON_PM4",
            "WEAPON_XM117",
            "WEAPON_M249SAW"
        },
        addAmount = 20,
        maxStack = 200
    },
    ["am7.62x39"] = {
        label = "7.62x39 Ammo",
        weapons = {
            "WEAPON_ALPHA47",
            "WEAPON_AKM"
        },
        addAmount = 20,
        maxStack = 200
    },
    ["am7.62x54"] = {
        label = "7.62x54 Ammo",
        weapons = {
            "WEAPON_MARKSMANRIFLE"
        },
        addAmount = 20,
        maxStack = 100
    },
    ["am7.62x52"] = {
        label = "7.62x52 Ammo",
        weapons = {
            "WEAPON_GUSENBERG"
        },
        addAmount = 20,
        maxStack = 200
    },
    ["am9x19"] = {
        label = "9x19 Ammo",
        weapons = {
            "WEAPON_GLOCK19",
            "WEAPON_COMBATPISTOL",
            "WEAPON_APPISTOL",
            "WEAPON_MICROSMG",
            "WEAPON_MP7",
            "WEAPON_PISTOL",
            "WEAPON_GLOCK17GEN5",
            "WEAPON_COMBATPDW",
            "WEAPON_ASSAULTSMG",
            "WEAPON_FM42",
            "WEAPON_SMG"
        },
        addAmount = 30,
        maxStack = 200
    },
    ["am.45ACP"] = {
        label = ".45 ACP Ammo",
        weapons = {
            "WEAPON_HEAVYPISTOL",
            "WEAPON_MACHINEPISTOL",
            "WEAPON_KVR",
            "WEAPON_MI9",
            "WEAPON_HKUMP",
            "WEAPON_VINTAGEPISTOL"
        },
        addAmount = 30,
        maxStack = 200
    },
    ["am12ga"] = {
        label = "12 Gauge Ammo",
        weapons = {
            "WEAPON_ASSAULTSHOTGUN",
            "WEAPON_BULLPUPSHOTGUN",
            "WEAPON_SAWNOFFSHOTGUN",
            "WEAPON_DBSHOTGUN",
            "WEAPON_HEAVYSHOTGUN",
            "WEAPON_PUMPSHOTGUN"
        },
        addAmount = 10,
        maxStack = 100
    },
    ["oil_box"] = {
        label = "Oil Box",
        weapons = {
            "WEAPON_PETROLCAN"
        },
        addAmount = 4000,
        maxStack = 10000
    },
    ["pg-7v"] = {
        label = "PG-7V Rocket",
        weapons = {
            "WEAPON_RPG"
        },
        addAmount = 1,
        maxStack = 5
    },
    ["water"] = {
        label = "Water Grenade",
        weapons = {
            "WEAPON_GRENADE"
        },
        addAmount = 1,
        maxStack = 5
    }
}

-- Debug mode
Config.Debug = true

-- Cooldown between ammo uses (in milliseconds)
Config.UseCooldown = 1000