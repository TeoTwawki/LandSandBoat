-----------------------------------
-- Holy Cow
-- Bearclaw Pinnacle ENM, Zephyr Fan
-- !addkeyitem ZEPHYR_FAN
-- !pos -520 25 -801 6
-----------------------------------
local ID = zones[invaderXim.zone.BEARCLAW_PINNACLE]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.BEARCLAW_PINNACLE,
    battlefieldId    = invaderXim.battlefield.id.HOLY_COW,
    maxPlayers       = 18,
    levelCap         = 75,
    timeLimit        = utils.minutes(30),
    index            = 4,
    entryNpc         = 'Wind_Pillar_5',
    exitNpc          = 'Wind_Pillar_Exit',
    requiredKeyItems = { invaderXim.ki.ZEPHYR_FAN, message = ID.text.ZEPHYR_RIPS },
    grantXP          = 4000,
})

content:addEssentialMobs({ 'Apis' })

content.loot =
{
    {
        { item = invaderXim.item.NONE, weight = invaderXim.loot.weight.VERY_LOW },
        { item = invaderXim.item.SQUARE_OF_ELTORO_LEATHER, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.PIECE_OF_CASSIA_LUMBER, weight = invaderXim.loot.weight.NORMAL },
        { item = invaderXim.item.DRAGON_BONE, weight = invaderXim.loot.weight.NORMAL },
    },

    {
        { item = invaderXim.item.NONE, weight = invaderXim.loot.weight.EXTREMELY_HIGH },
        { item = invaderXim.item.CLOUD_EVOKER, weight = invaderXim.loot.weight.LOW },
    },

    {
        quantity = 2,
        { item = invaderXim.item.NONE, weight = invaderXim.loot.weight.HIGH },
        { item = invaderXim.item.GIGANT_MANTLE, weight = invaderXim.loot.weight.LOW },
        { item = invaderXim.item.PSILOS_MANTLE, weight = invaderXim.loot.weight.LOW },
        { item = invaderXim.item.MARTIAL_BOW, weight = invaderXim.loot.weight.LOW },
        { item = invaderXim.item.MARTIAL_KNUCKLES, weight = invaderXim.loot.weight.LOW },
        { item = invaderXim.item.SCROLL_OF_RAISE_III, weight = invaderXim.loot.weight.HIGH },
    },
}

return content:register()
