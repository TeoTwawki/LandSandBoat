-----------------------------------
-- Happy Caster
-- Navukgo Execution Chamber, Confidential Imperial Order
-- !addkeyitem SECRET_IMPERIAL_ORDER
-----------------------------------
local ID = zones[invaderXim.zone.NAVUKGO_EXECUTION_CHAMBER]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.NAVUKGO_EXECUTION_CHAMBER,
    battlefieldId    = invaderXim.battlefield.id.HAPPY_CASTER,
    maxPlayers       = 6,
    levelCap         = 75,
    timeLimit        = utils.minutes(30),
    index            = 1,
    entryNpc         = '_1s0',
    exitNpcs         = { '_1s1', '_1s2', '_1s3' },
    requiredKeyItems = { invaderXim.ki.SECRET_IMPERIAL_ORDER, message = ID.text.IMPERIAL_ORDER_BREAKS },
})

content:addEssentialMobs({ 'Two-faced_Flan' })

content.loot =
{
    {
        { item = invaderXim.item.GIL, weight = invaderXim.loot.weight.NORMAL, amount = 12000 },
    },

    {
        { item = invaderXim.item.CHARISMA_POTION, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.ICARUS_WING, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.INTELLIGENCE_POTION, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.MIND_POTION, weight = invaderXim.loot.weight.NORMAL },
    },

    {
        { item = invaderXim.item.BOTTLE_OF_SIEGLINDE_PUTTY, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.BRASS_TANK, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.MERROW_SCALE, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.AHRIMAN_WING, weight = invaderXim.loot.weight.NORMAL },
    },

    {
        { item = invaderXim.item.SCROLL_OF_ERASE, weight = invaderXim.loot.weight.HIGH },
        { item = invaderXim.item.SCROLL_OF_PROTECTRA_IV, weight = invaderXim.loot.weight.HIGH },
        { item = invaderXim.item.SCROLL_OF_BLIZZARD_IV, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.SCROLL_OF_DISPEL, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.SCROLL_OF_PROTECT_IV, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.SCROLL_OF_QUAKE, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.SCROLL_OF_RERAISE_III, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.SCROLL_OF_WATER_IV, weight = invaderXim.loot.weight.NORMAL },
    },

    {
        { item = invaderXim.item.CHOCOBO_EGG_SOMEWHAT_WARM, weight = invaderXim.loot.weight.NORMAL },
    },

    {
        { item = invaderXim.item.CHUNK_OF_FLAN_MEAT, weight = invaderXim.loot.weight.NORMAL },
    },

    {
        { item = invaderXim.item.NONE, weight = invaderXim.loot.weight.EXTREMELY_HIGH },
        { item = invaderXim.item.ARAKAN_SAMUE, weight = invaderXim.loot.weight.LOW },
        { item = invaderXim.item.MENSUR_EPEE, weight = invaderXim.loot.weight.LOW },
        { item = invaderXim.item.CRUDE_SWORD, weight = invaderXim.loot.weight.LOW },
        { item = invaderXim.item.WARDANCER, weight = invaderXim.loot.weight.LOW },
    },

    {
        { item = invaderXim.item.NONE, weight = invaderXim.loot.weight.EXTREMELY_HIGH },
        { item = invaderXim.item.PIECE_OF_HABU_SKIN, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.SQUARE_OF_RAINBOW_CLOTH, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.BUFFALO_HORN, weight = invaderXim.loot.weight.LOW },
        { item = invaderXim.item.SQUARE_OF_WAMOURA_CLOTH, weight = invaderXim.loot.weight.LOW },
        { item = invaderXim.item.SQUARE_OF_RED_GRASS_CLOTH, weight = invaderXim.loot.weight.VERY_LOW },
        { item = invaderXim.item.SQUARE_OF_KARAKUL_CLOTH, weight = invaderXim.loot.weight.VERY_LOW },
        { item = invaderXim.item.SQUARE_OF_RAXA, weight = invaderXim.loot.weight.VERY_LOW },
        { item = invaderXim.item.POT_OF_URUSHI, weight = invaderXim.loot.weight.VERY_LOW },
    },

    {
        { item = invaderXim.item.BEHEMOTH_HORN, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.DRAGON_TALON, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.CHUNK_OF_KHROMA_ORE, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.CHUNK_OF_LUMINIUM_ORE, weight = invaderXim.loot.weight.NORMAL },
    },
}

return content:register()
