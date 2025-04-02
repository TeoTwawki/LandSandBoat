-----------------------------------
-- Royal Jelly
-- Waughroon Shrine BCNM40, Star Orb
-- !additem 1131
-----------------------------------
local waughroonID = zones[invaderXim.zone.WAUGHROON_SHRINE]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.WAUGHROON_SHRINE,
    battlefieldId    = invaderXim.battlefield.id.ROYAL_JELLY,
    maxPlayers       = 3,
    levelCap         = 40,
    timeLimit        = utils.minutes(15),
    index            = 13,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { invaderXim.item.STAR_ORB, wearMessage = waughroonID.text.A_CRACK_HAS_FORMED, wornMessage = waughroonID.text.ORB_IS_CRACKED },

    experimental = true,
})

-- base queens that must be dead to get win, but doesn't start spawned
content:addEssentialMobs({ 'Queen_Jelly' })
content.groups[1].spawned = false

content:addEssentialMobs({ 'Princess_Jelly' })

content.loot =
{
    {
        quantity = 2,
        { item = invaderXim.item.VIAL_OF_SLIME_OIL, weight = 1000 },
    },

    {
        { item = invaderXim.item.NONE,         weight = 909 },
        { item = invaderXim.item.ARCHERS_RING, weight =  91 },
    },

    {
        { item = invaderXim.item.MANA_RING,             weight = 469 },
        { item = invaderXim.item.GRUDGE_SWORD,          weight = 152 },
        { item = invaderXim.item.DE_SAINTRES_AXE,       weight = 120 },
        { item = invaderXim.item.BUZZARD_TUCK,          weight = 118 },
        { item = invaderXim.item.SCROLL_OF_UTSUSEMI_NI, weight = 106 },
    },

    {
        { item = invaderXim.item.MARKSMANS_RING, weight = 258 },
        { item = invaderXim.item.DUSKY_STAFF,    weight = 152 },
        { item = invaderXim.item.HIMMEL_STOCK,   weight = 101 },
        { item = invaderXim.item.SEALED_MACE,    weight  = 98 },
        { item = invaderXim.item.SHIKAR_BOW,     weight  = 98 },
    },

    {
        { item = invaderXim.item.SCROLL_OF_ABSORB_STR, weight = 123 },
        { item = invaderXim.item.SCROLL_OF_ERASE,      weight = 165 },
        { item = invaderXim.item.SCROLL_OF_PHALANX,    weight = 140 },
        { item = invaderXim.item.FIRE_SPIRIT_PACT,     weight = 145 },
        { item = invaderXim.item.STEEL_SHEET,          weight = 229 },
        { item = invaderXim.item.STEEL_INGOT,          weight = 238 },
    },

    {
        { item = invaderXim.item.SCROLL_OF_REFRESH,     weight = 263 },
        { item = invaderXim.item.SCROLL_OF_ICE_SPIKES,  weight = 246 },
        { item = invaderXim.item.SCROLL_OF_UTSUSEMI_NI, weight = 177 },
        { item = invaderXim.item.GOLD_BEASTCOIN,        weight = 182 },
        { item = invaderXim.item.MYTHRIL_BEASTCOIN,     weight = 133 },
        { item = invaderXim.item.PERIDOT,               weight =  27 },
        { item = invaderXim.item.TURQUOISE,             weight =  20 },
        { item = invaderXim.item.BLACK_PEARL,           weight =  15 },
        { item = invaderXim.item.GOSHENITE,             weight =  15 },
        { item = invaderXim.item.SPHENE,                weight =  15 },
        { item = invaderXim.item.AMETRINE,              weight =  10 },
        { item = invaderXim.item.GARNET,                weight =   7 },
        { item = invaderXim.item.BLACK_ROCK,            weight =  12 },
        { item = invaderXim.item.GREEN_ROCK,            weight =   7 },
        { item = invaderXim.item.WHITE_ROCK,            weight =   7 },
        { item = invaderXim.item.BLUE_ROCK,             weight =   2 },
        { item = invaderXim.item.TRANSLUCENT_ROCK,      weight =   2 },
        { item = invaderXim.item.OAK_LOG,               weight =   5 },
        { item = invaderXim.item.ROSEWOOD_LOG,          weight =   5 },
        { item = invaderXim.item.VILE_ELIXIR,           weight =  10 },
        { item = invaderXim.item.RERAISER,              weight =   2 },
    },
}

return content:register()
