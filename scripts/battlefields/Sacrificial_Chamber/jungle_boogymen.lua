-----------------------------------
-- Jungle Boogymen
-- Sacrificial Chamber BCNM60, Moon Orb
-- !additem 1130
-----------------------------------
local sacrificialChamberID = zones[invaderXim.zone.SACRIFICIAL_CHAMBER]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.SACRIFICIAL_CHAMBER,
    battlefieldId    = invaderXim.battlefield.id.JUNGLE_BOOGYMEN,
    maxPlayers       = 6,
    levelCap         = 60,
    timeLimit        = utils.minutes(30),
    index            = 1,
    entryNpc         = '_4j0',
    exitNpcs         = { '_4j2', '_4j3', '_4j4' },
    requiredItems    = { invaderXim.item.MOON_ORB, wearMessage = sacrificialChamberID.text.A_CRACK_HAS_FORMED, wornMessage = sacrificialChamberID.text.ORB_IS_CRACKED },
    armouryCrates    =
    {
        sacrificialChamberID.mob.SABLE_TONGUED_GONBERRY + 4,
        sacrificialChamberID.mob.SABLE_TONGUED_GONBERRY + 11,
        sacrificialChamberID.mob.SABLE_TONGUED_GONBERRY + 18,
    },
})

content.groups =
{
    {
        mobIds =
        {
            {
                sacrificialChamberID.mob.SABLE_TONGUED_GONBERRY,
                sacrificialChamberID.mob.SABLE_TONGUED_GONBERRY + 1,
                sacrificialChamberID.mob.SABLE_TONGUED_GONBERRY + 2,
                sacrificialChamberID.mob.SABLE_TONGUED_GONBERRY + 3,
            },

            {
                sacrificialChamberID.mob.SABLE_TONGUED_GONBERRY + 7,
                sacrificialChamberID.mob.SABLE_TONGUED_GONBERRY + 8,
                sacrificialChamberID.mob.SABLE_TONGUED_GONBERRY + 9,
                sacrificialChamberID.mob.SABLE_TONGUED_GONBERRY + 10,
            },

            {
                sacrificialChamberID.mob.SABLE_TONGUED_GONBERRY + 14,
                sacrificialChamberID.mob.SABLE_TONGUED_GONBERRY + 15,
                sacrificialChamberID.mob.SABLE_TONGUED_GONBERRY + 16,
                sacrificialChamberID.mob.SABLE_TONGUED_GONBERRY + 17,
            },
        },

        superlink = true,
        allDeath  = utils.bind(content.handleAllMonstersDefeated, content),
    },

    -- Elemental
    {
        mobIds =
        {
            { sacrificialChamberID.mob.SABLE_TONGUED_GONBERRY + 5  },
            { sacrificialChamberID.mob.SABLE_TONGUED_GONBERRY + 12 },
            { sacrificialChamberID.mob.SABLE_TONGUED_GONBERRY + 19 },
        },
    },

    -- Avatar
    {
        mobIds =
        {
            { sacrificialChamberID.mob.SABLE_TONGUED_GONBERRY + 6  },
            { sacrificialChamberID.mob.SABLE_TONGUED_GONBERRY + 13 },
            { sacrificialChamberID.mob.SABLE_TONGUED_GONBERRY + 20 },
        },

        spawned = false,
    },
}

content.loot =
{
    {
        { item = invaderXim.item.DARK_TORQUE,      weight = 250 }, -- Dark Torque
        { item = invaderXim.item.ELEMENTAL_TORQUE, weight = 250 }, -- Elemental Torque
        { item = invaderXim.item.HEALING_TORQUE,   weight = 250 }, -- Healing Torque
        { item = invaderXim.item.WIND_TORQUE,      weight = 250 }, -- Wind Torque
    },

    {
        { item = invaderXim.item.PLATINUM_BEASTCOIN,     weight = 500 }, -- Platinum Beastcoin
        { item = invaderXim.item.SCROLL_OF_ABSORB_STR,   weight =  48 }, -- Scroll Of Absorb-STR
        { item = invaderXim.item.SCROLL_OF_ERASE,        weight = 143 }, -- Scroll Of Erase
        { item = invaderXim.item.SCROLL_OF_PHALANX,      weight = 119 }, -- Scroll Of Phalanx
        { item = invaderXim.item.FIRE_SPIRIT_PACT,       weight =  48 }, -- Fire Spirit Pact
        { item = invaderXim.item.CHUNK_OF_FIRE_ORE,      weight =  48 }, -- Chunk Of Fire Ore
        { item = invaderXim.item.CHUNK_OF_ICE_ORE,       weight =  48 }, -- Chunk Of Ice Ore
        { item = invaderXim.item.CHUNK_OF_WIND_ORE,      weight =  48 }, -- Chunk Of Wind Ore
        { item = invaderXim.item.CHUNK_OF_EARTH_ORE,     weight =  48 }, -- Chunk Of Earth Ore
        { item = invaderXim.item.CHUNK_OF_LIGHTNING_ORE, weight =  48 }, -- Chunk Of Lightning Ore
        { item = invaderXim.item.CHUNK_OF_WATER_ORE,     weight =  48 }, -- Chunk Of Water Ore
        { item = invaderXim.item.CHUNK_OF_LIGHT_ORE,     weight =  48 }, -- Chunk Of Light Ore
        { item = invaderXim.item.CHUNK_OF_DARK_ORE,      weight =  48 }, -- Chunk Of Dark Ore
    },

    {
        { item = invaderXim.item.PLATINUM_BEASTCOIN, weight = 833 }, -- Platinum Beastcoin
        { item = invaderXim.item.CHUNK_OF_ICE_ORE,   weight = 167 }, -- Chunk Of Ice Ore
    },

    {
        { item = invaderXim.item.ENFEEBLING_TORQUE, weight = 250 }, -- Enfeebling Torque
        { item = invaderXim.item.EVASION_TORQUE,    weight = 250 }, -- Evasion Torque
        { item = invaderXim.item.GUARDING_TORQUE,   weight = 250 }, -- Guarding Torque
        { item = invaderXim.item.SUMMONING_TORQUE,  weight = 250 }, -- Summoning Torque
    },

    {
        { item = invaderXim.item.DARKSTEEL_INGOT,    weight = 154 }, -- Darksteel Ingot
        { item = invaderXim.item.PAINITE,            weight = 154 }, -- Painite
        { item = invaderXim.item.GOLD_INGOT,         weight = 154 }, -- Gold Ingot
        { item = invaderXim.item.AQUAMARINE,         weight =  77 }, -- Aquamarine
        { item = invaderXim.item.VILE_ELIXIR_P1,     weight =  77 }, -- Vile Elixir +1
        { item = invaderXim.item.MYTHRIL_INGOT,      weight = 153 }, -- Mythril Ingot
        { item = invaderXim.item.CHRYSOBERYL,        weight =  30 }, -- Chrysoberyl
        { item = invaderXim.item.MOONSTONE,          weight =  30 }, -- Moonstone
        { item = invaderXim.item.SUNSTONE,           weight =  30 }, -- Sunstone
        { item = invaderXim.item.ZIRCON,             weight =  30 }, -- Zircon
        { item = invaderXim.item.AQUAMARINE,         weight =  30 }, -- Aquamarine
        { item = invaderXim.item.EBONY_LOG,          weight =  30 }, -- Ebony Log
        { item = invaderXim.item.MAHOGANY_LOG,       weight =  30 }, -- Mahogany Log
        { item = invaderXim.item.PHILOSOPHERS_STONE, weight =  30 }, -- Philosophers Stone
    },

    {
        { item = invaderXim.item.DARKSTEEL_INGOT,            weight =  77 }, -- Darksteel Ingot
        { item = invaderXim.item.MOONSTONE,                  weight = 134 }, -- Moonstone
        { item = invaderXim.item.STEEL_INGOT,                weight = 154 }, -- Steel Ingot
        { item = invaderXim.item.CHRYSOBERYL,                weight =  50 }, -- Chrysoberyl
        { item = invaderXim.item.HI_RERAISER,                weight = 154 }, -- Hi-reraiser
        { item = invaderXim.item.JADEITE,                    weight = 121 }, -- Jadeite
        { item = invaderXim.item.SPOOL_OF_MALBORO_FIBER,     weight =  10 }, -- Spool Of Malboro Fiber
        { item = invaderXim.item.VIAL_OF_BLACK_BEETLE_BLOOD, weight =  10 }, -- Vial Of Black Beetle Blood
        { item = invaderXim.item.RED_ROCK,                   weight =  30 }, -- Red Rock
        { item = invaderXim.item.BLUE_ROCK,                  weight =  30 }, -- Blue Rock
        { item = invaderXim.item.YELLOW_ROCK,                weight =  30 }, -- Yellow Rock
        { item = invaderXim.item.GREEN_ROCK,                 weight =  30 }, -- Green Rock
        { item = invaderXim.item.TRANSLUCENT_ROCK,           weight =  30 }, -- Translucent Rock
        { item = invaderXim.item.PURPLE_ROCK,                weight =  30 }, -- Purple Rock
        { item = invaderXim.item.BLACK_ROCK,                 weight =  30 }, -- Black Rock
        { item = invaderXim.item.WHITE_ROCK,                 weight =  30 }, -- White Rock
        { item = invaderXim.item.FLUORITE,                   weight =  50 }, -- Fluorite
    },
}

return content:register()
