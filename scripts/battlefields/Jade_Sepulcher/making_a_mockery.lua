-----------------------------------
-- Making a Mockery
-- Jade Sepulcher, Confidential Imperial Order
-- !addkeyitem CONFIDENTIAL_IMPERIAL_ORDER
-----------------------------------
local ID = zones[invaderXim.zone.JADE_SEPULCHER]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.JADE_SEPULCHER,
    battlefieldId    = invaderXim.battlefield.id.MAKING_A_MOCKERY,
    maxPlayers       = 6,
    levelCap         = 60,
    timeLimit        = utils.minutes(30),
    index            = 0,
    entryNpc         = '_1v0',
    exitNpcs         = { '_1v1', '_1v2', '_1v3' },
    requiredKeyItems = { invaderXim.ki.CONFIDENTIAL_IMPERIAL_ORDER, message = ID.text.IMPERIAL_ORDER_BREAKS },
})

content:addEssentialMobs({ 'Mocking_Colibri' })

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
        { item = invaderXim.item.SQUARE_OF_POLYFLAN, weight = invaderXim.loot.weight.HIGH },
        { item = invaderXim.item.BUNDLE_OF_HOMUNCULUS_NERVES, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.GLASS_SHEET, weight = invaderXim.loot.weight.LOW },
        { item = invaderXim.item.PETRIFIED_LOG, weight = invaderXim.loot.weight.LOW },
    },

    {
        { item = invaderXim.item.SCROLL_OF_AERO_IV, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.SCROLL_OF_MAIDENS_VIRELAI, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.SCROLL_OF_CARNAGE_ELEGY, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.SCROLL_OF_FLARE, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.SCROLL_OF_FLOOD, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.SCROLL_OF_TORNADO, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.DARK_SPIRIT_PACT, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.LIGHT_SPIRIT_PACT, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.LOUDSPEAKER_II, weight = invaderXim.loot.weight.VERY_LOW },
        { item = invaderXim.item.ACCELERATOR_II, weight = invaderXim.loot.weight.VERY_LOW },
        { item = invaderXim.item.STABILIZER_II, weight = invaderXim.loot.weight.VERY_LOW },
    },

    {
        { item = invaderXim.item.CHOCOBO_EGG_A_LITTLE_WARM, weight = invaderXim.loot.weight.NORMAL },
    },

    {
        { item = invaderXim.item.COLIBRI_FEATHER, weight = invaderXim.loot.weight.NORMAL },
    },

    {
        { item = invaderXim.item.NONE, weight = invaderXim.loot.weight.EXTREMELY_HIGH },
        { item = invaderXim.item.CHUNK_OF_DARKSTEEL_ORE, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.DEMON_HORN, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.IYO_SCALE, weight = invaderXim.loot.weight.LOW },
        { item = invaderXim.item.SQUARE_OF_MOBLINWEAVE, weight = invaderXim.loot.weight.LOW },
        { item = invaderXim.item.ALUMINUM_SHEET, weight = invaderXim.loot.weight.VERY_LOW },
        { item = invaderXim.item.MYTHRIL_COIL, weight = invaderXim.loot.weight.VERY_LOW },
    },

    {
        { item = invaderXim.item.NONE, weight = invaderXim.loot.weight.EXTREMELY_HIGH },
        { item = invaderXim.item.IMMORTALS_CAPE, weight = invaderXim.loot.weight.LOW },
        { item = invaderXim.item.DEADEYE_GLOVES, weight = invaderXim.loot.weight.LOW },
        { item = invaderXim.item.LEECH_SCIMITAR, weight = invaderXim.loot.weight.LOW },
        { item = invaderXim.item.PIRATES_EARRING, weight = invaderXim.loot.weight.LOW },
    },

    {
        { item = invaderXim.item.CHUNK_OF_PLATINUM_ORE, weight = invaderXim.loot.weight.VERY_HIGH },
        { item = invaderXim.item.CHUNK_OF_DARKSTEEL_ORE, weight = invaderXim.loot.weight.VERY_HIGH },
        { item = invaderXim.item.CHUNK_OF_ADAMAN_ORE, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.CHUNK_OF_ORICHALCUM_ORE, weight = invaderXim.loot.weight.LOW },
        { item = invaderXim.item.DEMON_HORN, weight = invaderXim.loot.weight.LOW },
    },
}

return content:register()
