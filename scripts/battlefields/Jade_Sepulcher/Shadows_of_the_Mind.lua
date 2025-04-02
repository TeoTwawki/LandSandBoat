-----------------------------------
-- Shadows of the Mind
-- Jade Sepulcher, Confidential Imperial Order
-- !addkeyitem SECRET_IMPERIAL_ORDER
-----------------------------------
local ID = zones[invaderXim.zone.JADE_SEPULCHER]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.JADE_SEPULCHER,
    battlefieldId    = invaderXim.battlefield.id.SHADOWS_OF_THE_MIND,
    maxPlayers       = 6,
    levelCap         = 75,
    timeLimit        = utils.minutes(30),
    index            = 1,
    entryNpc         = '_1v0',
    exitNpcs         = { '_1v1', '_1v2', '_1v3' },
    requiredKeyItems = { invaderXim.ki.SECRET_IMPERIAL_ORDER, message = ID.text.IMPERIAL_ORDER_BREAKS },
})

content.groups = {
    {
        mobs      = { 'Phantom_Puk' },
        allDeath  = utils.bind(content.handleAllMonstersDefeated, content),
    },

    {
        mobs      = { 'Phantom_Puk_Clone' },
        spawned  = false,
    },
}

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
        { item = invaderXim.item.PUK_WING, weight = invaderXim.loot.weight.NORMAL },
    },

    {
        { item = invaderXim.item.NONE, weight = invaderXim.loot.weight.EXTREMELY_HIGH },
        { item = invaderXim.item.COMPANY_FLEURET, weight = invaderXim.loot.weight.LOW },
        { item = invaderXim.item.MAGNET_KNIFE, weight = invaderXim.loot.weight.LOW },
        { item = invaderXim.item.SACRIFICE_TORQUE, weight = invaderXim.loot.weight.LOW },
        { item = invaderXim.item.TOURNAMENT_LANCE, weight = invaderXim.loot.weight.LOW },
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
