-----------------------------------
-- Amphibian Assault
-- Sacrificial Chamber BCNM60, Moon Orb
-- !additem 1130
-----------------------------------
local sacrificialChamberID = zones[invaderXim.zone.SACRIFICIAL_CHAMBER]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.SACRIFICIAL_CHAMBER,
    battlefieldId    = invaderXim.battlefield.id.AMPHIBIAN_ASSAULT,
    maxPlayers       = 6,
    levelCap         = 60,
    timeLimit        = utils.minutes(30),
    index            = 2,
    entryNpc         = '_4j0',
    exitNpcs         = { '_4j2', '_4j3', '_4j4' },
    requiredItems    = { invaderXim.item.MOON_ORB, wearMessage = sacrificialChamberID.text.A_CRACK_HAS_FORMED, wornMessage = sacrificialChamberID.text.ORB_IS_CRACKED },
    armouryCrates    =
    {
        sacrificialChamberID.mob.QULL_THE_FALLSTOPPER + 4,
        sacrificialChamberID.mob.QULL_THE_FALLSTOPPER + 10,
        sacrificialChamberID.mob.QULL_THE_FALLSTOPPER + 16,
    },
})

content.groups =
{
    {
        mobIds =
        {
            {
                sacrificialChamberID.mob.QULL_THE_FALLSTOPPER,
                sacrificialChamberID.mob.QULL_THE_FALLSTOPPER + 1,
                sacrificialChamberID.mob.QULL_THE_FALLSTOPPER + 2,
                sacrificialChamberID.mob.QULL_THE_FALLSTOPPER + 3,
            },

            {
                sacrificialChamberID.mob.QULL_THE_FALLSTOPPER + 6,
                sacrificialChamberID.mob.QULL_THE_FALLSTOPPER + 7,
                sacrificialChamberID.mob.QULL_THE_FALLSTOPPER + 8,
                sacrificialChamberID.mob.QULL_THE_FALLSTOPPER + 9,
            },

            {
                sacrificialChamberID.mob.QULL_THE_FALLSTOPPER + 12,
                sacrificialChamberID.mob.QULL_THE_FALLSTOPPER + 13,
                sacrificialChamberID.mob.QULL_THE_FALLSTOPPER + 14,
                sacrificialChamberID.mob.QULL_THE_FALLSTOPPER + 15,
            },
        },

        allDeath = utils.bind(content.handleAllMonstersDefeated, content),
    },

    -- Wyvern
    {
        mobIds =
        {
            { sacrificialChamberID.mob.QULL_THE_FALLSTOPPER + 5  },
            { sacrificialChamberID.mob.QULL_THE_FALLSTOPPER + 11 },
            { sacrificialChamberID.mob.QULL_THE_FALLSTOPPER + 17 },
        },

        spawned = false,
    },
}

content.loot =
{
    {
        { item = invaderXim.item.ENFEEBLING_TORQUE, weight = 250 }, -- Enfeebling Torque
        { item = invaderXim.item.DIVINE_TORQUE,     weight = 250 }, -- Divine Torque
        { item = invaderXim.item.SHIELD_TORQUE,     weight = 250 }, -- Shield Torque
        { item = invaderXim.item.STRING_TORQUE,     weight = 250 }, -- String Torque
    },

    {
        { item = invaderXim.item.ELEMENTAL_TORQUE, weight = 250 }, -- Elemental Torque
        { item = invaderXim.item.EVASION_TORQUE,   weight = 250 }, -- Evasion Torque
        { item = invaderXim.item.GUARDING_TORQUE,  weight = 250 }, -- Guarding Torque
        { item = invaderXim.item.ENHANCING_TORQUE, weight = 250 }, -- Enhancing Torque
    },

    {
        { item = invaderXim.item.CHUNK_OF_WATER_ORE,     weight = 125 }, -- Chunk Of Water Ore
        { item = invaderXim.item.CHUNK_OF_WIND_ORE,      weight = 125 }, -- Chunk Of Wind Ore
        { item = invaderXim.item.CHUNK_OF_ICE_ORE,       weight = 125 }, -- Chunk Of Ice Ore
        { item = invaderXim.item.CHUNK_OF_LIGHTNING_ORE, weight = 125 }, -- Chunk Of Lightning Ore
        { item = invaderXim.item.CHUNK_OF_LIGHT_ORE,     weight = 125 }, -- Chunk Of Light Ore
        { item = invaderXim.item.CHUNK_OF_FIRE_ORE,      weight = 125 }, -- Chunk Of Fire Ore
        { item = invaderXim.item.CHUNK_OF_DARK_ORE,      weight = 125 }, -- Chunk Of Dark Ore
        { item = invaderXim.item.CHUNK_OF_EARTH_ORE,     weight = 125 }, -- Chunk Of Earth Ore
    },

    {
        { item = invaderXim.item.NONE,             weight = 750 }, -- nothing
        { item = invaderXim.item.SUMMONING_TORQUE, weight = 250 }, -- Summoning Torque
    },

    {
        { item = invaderXim.item.NONE,               weight = 200 }, -- nothing
        { item = invaderXim.item.PLATINUM_BEASTCOIN, weight = 800 }, -- Platinum Beastcoin
    },

    {
        { item = invaderXim.item.NONE,                 weight = 375 }, -- nothing
        { item = invaderXim.item.FIRE_SPIRIT_PACT,     weight = 125 }, -- Fire Spirit Pact
        { item = invaderXim.item.SCROLL_OF_ABSORB_STR, weight = 125 }, -- Scroll Of Absorb-str
        { item = invaderXim.item.SCROLL_OF_ERASE,      weight = 125 }, -- Scroll Of Erase
        { item = invaderXim.item.SCROLL_OF_PHALANX,    weight = 125 }, -- Scroll Of Phalanx
        { item = invaderXim.item.SCROLL_OF_RAISE_II,   weight = 125 }, -- Scroll Of Raise Ii
    },

    {
        { item = invaderXim.item.NONE,           weight = 888 }, -- nothing
        { item = invaderXim.item.VILE_ELIXIR_P1, weight =  56 }, -- Vile Elixir +1
        { item = invaderXim.item.HI_RERAISER,    weight =  56 }, -- Hi-reraiser
    },

    {
        { item = invaderXim.item.FLUORITE,         weight =  10 }, -- Fluorite
        { item = invaderXim.item.PAINITE,          weight =  50 }, -- Painite
        { item = invaderXim.item.SUNSTONE,         weight =  10 }, -- Sunstone
        { item = invaderXim.item.JADEITE,          weight = 150 }, -- Jadeite
        { item = invaderXim.item.AQUAMARINE,       weight =  50 }, -- Aquamarine
        { item = invaderXim.item.MOONSTONE,        weight = 150 }, -- Moonstone
        { item = invaderXim.item.YELLOW_ROCK,      weight =  50 }, -- Yellow Rock
        { item = invaderXim.item.RED_ROCK,         weight =  50 }, -- Red Rock
        { item = invaderXim.item.WHITE_ROCK,       weight = 100 }, -- White Rock
        { item = invaderXim.item.GREEN_ROCK,       weight =  50 }, -- Green Rock
        { item = invaderXim.item.TRANSLUCENT_ROCK, weight = 100 }, -- Translucent Rock
        { item = invaderXim.item.CHRYSOBERYL,      weight = 150 }, -- Chrysoberyl
        { item = invaderXim.item.BLACK_ROCK,       weight =  50 }, -- Black Rock
        { item = invaderXim.item.PURPLE_ROCK,      weight =  50 }, -- Purple Rock
    },

    {
        { item = invaderXim.item.PLATINUM_BEASTCOIN,     weight = 500 }, -- Platinum Beastcoin
        { item = invaderXim.item.CORAL_FRAGMENT,         weight = 222 }, -- Coral Fragment
        { item = invaderXim.item.SPOOL_OF_MALBORO_FIBER, weight =  10 }, -- Spool Of Malboro Fiber
        { item = invaderXim.item.STEEL_INGOT,            weight = 111 }, -- Steel Ingot
        { item = invaderXim.item.EBONY_LOG,              weight =  56 }, -- Ebony Log
    },
}

return content:register()
