-----------------------------------
-- Call to Arms
-- Talacca Cove, Confidential Imperial Order
-- !addkeyitem CONFIDENTIAL_IMPERIAL_ORDER
-----------------------------------
local ID = zones[invaderXim.zone.TALACCA_COVE]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.TALACCA_COVE,
    battlefieldId    = invaderXim.battlefield.id.CALL_TO_ARMS,
    maxPlayers       = 6,
    levelCap         = 60,
    timeLimit        = utils.minutes(30),
    index            = 0,
    entryNpc         = '_1l0',
    exitNpcs         = { '_1l1', '_1l2', '_1l3' },
    requiredKeyItems = { invaderXim.ki.CONFIDENTIAL_IMPERIAL_ORDER, message = ID.text.IMPERIAL_ORDER_BREAKS },
})

content.groups = {
    {
        mobs = { 'Imp_Bandsman' },
    },

    {
        mobs     = { 'Imp_Bandsman', 'Imp_Bandsman_Add' },
        spawned  = false,
        allDeath = utils.bind(content.handleAllMonstersDefeated, content),
    },
}

content.loot =
{
    {
        { item = invaderXim.item.GIL, weight = invaderXim.loot.weight.NORMAL, amount = 8000 },
    },

    {
        { item = invaderXim.item.AGILITY_POTION, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.VITALITY_POTION, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.STRENGTH_POTION, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.DEXTERITY_POTION, weight = invaderXim.loot.weight.NORMAL },
    },

    {
        { item = invaderXim.item.GLASS_SHEET, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.BUNDLE_OF_HOMUNCULUS_NERVES, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.SQUARE_OF_POLYFLAN, weight = invaderXim.loot.weight.NORMAL },
    },

    {
        { item = invaderXim.item.SCROLL_OF_MAIDENS_VIRELAI, weight = invaderXim.loot.weight.HIGH },
        { item = invaderXim.item.SCROLL_OF_CARNAGE_ELEGY, weight = invaderXim.loot.weight.HIGH },
        { item = invaderXim.item.SCROLL_OF_AERO_IV, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.SCROLL_OF_FLARE, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.SCROLL_OF_FLOOD, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.SCROLL_OF_TORNADO, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.DARK_SPIRIT_PACT, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.LIGHT_SPIRIT_PACT, weight = invaderXim.loot.weight.NORMAL },
    },

    {
        { item = invaderXim.item.CHOCOBO_EGG_A_LITTLE_WARM, weight = invaderXim.loot.weight.NORMAL },
    },

    {
        { item = invaderXim.item.IMP_WING, weight = invaderXim.loot.weight.NORMAL },
    },

    {
        { item = invaderXim.item.NONE, weight = invaderXim.loot.weight.EXTREMELY_HIGH },
        { item = invaderXim.item.TEMPLAR_SABATONS, weight = invaderXim.loot.weight.LOW },
        { item = invaderXim.item.BUSKERS_CAPE, weight = invaderXim.loot.weight.LOW },
        { item = invaderXim.item.DOMINION_RING, weight = invaderXim.loot.weight.LOW },
        { item = invaderXim.item.IMMORTALS_EARRING, weight = invaderXim.loot.weight.LOW },
    },

    {
        { item = invaderXim.item.NONE, weight = invaderXim.loot.weight.EXTREMELY_HIGH },
        { item = invaderXim.item.CHUNK_OF_PLATINUM_ORE, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.CHUNK_OF_DARKSTEEL_ORE, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.CHUNK_OF_ADAMAN_ORE, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.CHUNK_OF_ORICHALCUM_ORE, weight = invaderXim.loot.weight.NORMAL },
    },
}

return content:register()
