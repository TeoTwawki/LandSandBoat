-----------------------------------
-- Up in Arms
-- Waughroon Shrine BCNM60, Moon Orb
-- !additem 1130
-----------------------------------
local waughroonID = zones[invaderXim.zone.WAUGHROON_SHRINE]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.WAUGHROON_SHRINE,
    battlefieldId    = invaderXim.battlefield.id.UP_IN_ARMS,
    maxPlayers       = 3,
    levelCap         = 60,
    timeLimit        = utils.minutes(15),
    index            = 15,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { invaderXim.item.MOON_ORB, wearMessage = waughroonID.text.A_CRACK_HAS_FORMED, wornMessage = waughroonID.text.ORB_IS_CRACKED },
})

content:addEssentialMobs({ 'Fee' })

content.loot =
{
    {
        { item = invaderXim.item.GIL, weight = 1000, amount = 15000 }, -- Gil
    },

    {
        { item = invaderXim.item.BLACK_PEARL, weight = 1000 }, -- Black Pearl
    },

    {
        quantity = 2,
        { item = invaderXim.item.PEARL, weight = 1000 }, -- Pearl
    },

    {
        quantity = 3,
        { item = invaderXim.item.PIECE_OF_OXBLOOD, weight = 1000 }, -- Piece Of Oxblood
    },

    {
        { item = invaderXim.item.TELEPORT_RING_ALTEP, weight = 447 }, -- Teleport Ring Altep
        { item = invaderXim.item.TELEPORT_RING_DEM,   weight = 487 }, -- Teleport Ring Dem
    },

    {
        { item = invaderXim.item.AJARI_BEAD_NECKLACE, weight = 494 }, -- Ajari Bead Necklace
        { item = invaderXim.item.PHILOMATH_STOLE,     weight = 449 }, -- Philomath Stole
    },

    {
        { item = invaderXim.item.AQUAMARINE,       weight =  51 }, -- Aquamarine
        { item = invaderXim.item.CHRYSOBERYL,      weight =  32 }, -- Chrysoberyl
        { item = invaderXim.item.DARKSTEEL_INGOT,  weight =  39 }, -- Darksteel Ingot
        { item = invaderXim.item.EBONY_LOG,        weight =  21 }, -- Ebony Log
        { item = invaderXim.item.HI_RERAISER,      weight =  32 }, -- Hi-reraiser
        { item = invaderXim.item.GOLD_INGOT,       weight =  55 }, -- Gold Ingot
        { item = invaderXim.item.JADEITE,          weight =  62 }, -- Jadeite
        { item = invaderXim.item.MYTHRIL_INGOT,    weight =  81 }, -- Mythril Ingot
        { item = invaderXim.item.MOONSTONE,        weight =  56 }, -- Moonstone
        { item = invaderXim.item.PAINITE,          weight = 195 }, -- Painite
        { item = invaderXim.item.STEEL_INGOT,      weight =  58 }, -- Steel Ingot
        { item = invaderXim.item.SUNSTONE,         weight =  38 }, -- Sunstone
        { item = invaderXim.item.TRANSLUCENT_ROCK, weight =  11 }, -- Translucent Rock
        { item = invaderXim.item.VILE_ELIXIR_P1,   weight =  21 }, -- Vile Elixir +1
        { item = invaderXim.item.YELLOW_ROCK,      weight =  15 }, -- Yellow Rock
        { item = invaderXim.item.ZIRCON,           weight =  26 }, -- Zircon
        { item = invaderXim.item.RED_ROCK,         weight =  21 }, -- Red Rock
        { item = invaderXim.item.MAHOGANY_LOG,     weight =  17 }, -- Mahogany Log
        { item = invaderXim.item.BLUE_ROCK,        weight =   9 }, -- Blue Rock
        { item = invaderXim.item.FLUORITE,         weight =  62 }, -- Fluorite
        { item = invaderXim.item.PURPLE_ROCK,      weight =  11 }, -- Purple Rock
        { item = invaderXim.item.BLACK_ROCK,       weight =  11 }, -- Black Rock
        { item = invaderXim.item.GREEN_ROCK,       weight =  11 }, -- Green Rock
        { item = invaderXim.item.WHITE_ROCK,       weight =   9 }, -- White Rock
    },

    {
        { item = invaderXim.item.NONE,         weight =  939 }, -- Nothing
        { item = invaderXim.item.KRAKEN_CLUB,  weight =    7 }, -- Kraken Club
        { item = invaderXim.item.WALKURE_MASK, weight =   54 }, -- Walkure Mask
    },
}

return content:register()
