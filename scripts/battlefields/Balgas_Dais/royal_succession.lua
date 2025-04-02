-----------------------------------
-- Royal Succession
-- Balga's Dais BCNM40, Star Orb
-- !additem 1131
-----------------------------------
local balgasID = zones[invaderXim.zone.BALGAS_DAIS]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.BALGAS_DAIS,
    battlefieldId    = invaderXim.battlefield.id.ROYAL_SUCCESSION,
    maxPlayers       = 3,
    levelCap         = 40,
    timeLimit        = utils.minutes(15),
    index            = 12,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { invaderXim.item.STAR_ORB, wearMessage = balgasID.text.A_CRACK_HAS_FORMED, wornMessage = balgasID.text.ORB_IS_CRACKED },
})

content:addEssentialMobs({
    'Opo-opo_Monarch',
    'Opo-opo_Heir',
    'Myrmidon_Spo-spo',
    'Myrmidon_Apu-apu',
    'Myrmidon_Epa-epa',
})

content.loot =
{
    {
        { item = invaderXim.item.BUNCH_OF_WILD_PAMAMAS, weight = 1000 }, -- bunch_of_wild_pamamas
    },

    {
        { item = invaderXim.item.NONE,             weight = 300 }, -- nothing
        { item = invaderXim.item.DUSKY_STAFF,      weight = 100 }, -- dusky_staff
        { item = invaderXim.item.JONGLEURS_DAGGER, weight = 100 }, -- jongleurs_dagger
        { item = invaderXim.item.CALVELEYS_DAGGER, weight = 100 }, -- calveleys_dagger
        { item = invaderXim.item.SEALED_MACE,      weight = 100 }, -- sealed_mace
        { item = invaderXim.item.HIMMEL_STOCK,     weight = 100 }, -- himmel_stock
        { item = invaderXim.item.KAGEHIDE,         weight = 100 }, -- kagehide
        { item = invaderXim.item.OHAGURO,          weight = 100 }, -- ohaguro
    },

    {
        { item = invaderXim.item.NONE,          weight = 100 }, -- nothing
        { item = invaderXim.item.GENIN_EARRING, weight = 300 }, -- genin_earring
        { item = invaderXim.item.AGILE_GORGET,  weight = 300 }, -- agile_gorget
        { item = invaderXim.item.JAGD_GORGET,   weight = 300 }, -- jagd_gorget
    },

    {
        { item = invaderXim.item.NONE,                 weight = 370 }, -- nothing
        { item = invaderXim.item.TURQUOISE,            weight = 100 }, -- turquoise
        { item = invaderXim.item.BUNCH_OF_PAMAMAS,     weight = 100 }, -- bunch_of_pamamas
        { item = invaderXim.item.SQUARE_OF_SILK_CLOTH, weight = 110 }, -- square_of_silk_cloth
        { item = invaderXim.item.ROSEWOOD_LOG,         weight = 140 }, -- rosewood_log
        { item = invaderXim.item.PEARL,                weight = 180 }, -- pearl
    },

    {
        { item = invaderXim.item.SCROLL_OF_PHALANX,    weight = 250 }, -- scroll_of_phalanx
        { item = invaderXim.item.SCROLL_OF_ABSORB_STR, weight = 250 }, -- scroll_of_absorb
        { item = invaderXim.item.SCROLL_OF_REFRESH,    weight = 250 }, -- scroll_of_refresh
        { item = invaderXim.item.SCROLL_OF_ERASE,      weight = 250 }, -- scroll_of_erase
    },

    {
        { item = invaderXim.item.NONE,           weight = 600 }, -- nothing
        { item = invaderXim.item.GOLD_BEASTCOIN, weight = 400 }, -- gold_beastcoin
    },
}

return content:register()
