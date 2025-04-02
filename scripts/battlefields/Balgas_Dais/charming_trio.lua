-----------------------------------
-- Charming Trio
-- Balga's Dais BCNM20, Cloudy Orb
-----------------------------------
local balgasID = zones[invaderXim.zone.BALGAS_DAIS]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.BALGAS_DAIS,
    battlefieldId    = invaderXim.battlefield.id.CHARMING_TRIO,
    maxPlayers       = 3,
    levelCap         = 20,
    timeLimit        = utils.minutes(15),
    index            = 9,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { invaderXim.item.CLOUDY_ORB, wearMessage = balgasID.text.A_CRACK_HAS_FORMED, wornMessage = balgasID.text.ORB_IS_CRACKED },
})

content:addEssentialMobs({ 'Prune', 'Pepper', 'Phoedme' })

content.loot =
{
    {
        { item = invaderXim.item.MANNEQUIN_HANDS, weight = 1000 }, -- Mannequin Hands
    },

    {
        { item = invaderXim.item.JAR_OF_TOAD_OIL,        weight = 250 }, -- Jar Of Toad Oil
        { item = invaderXim.item.POTION,                 weight = 300 }, -- Potion
        { item = invaderXim.item.POTION_P1,              weight = 180 }, -- Potion +1
        { item = invaderXim.item.AIR_SPIRIT_PACT,        weight = 130 }, -- Air Spirit Pact
        { item = invaderXim.item.SQUARE_OF_COTTON_CLOTH, weight = 280 }, -- Square Of Cotton Cloth
    },

    {
        { item = invaderXim.item.MYTHRIL_BEASTCOIN,     weight = 250 }, -- Mythril Beastcoin
        { item = invaderXim.item.GANKO,                 weight = 190 }, -- Ganko
        { item = invaderXim.item.SQUARE_OF_WOOL_CLOTH,  weight = 270 }, -- Square Of Wool Cloth
        { item = invaderXim.item.PLATOON_DISC,          weight = 145 }, -- Platoon Disc
        { item = invaderXim.item.SQUARE_OF_GRASS_CLOTH, weight = 295 }, -- Square Of Grass Cloth
        { item = invaderXim.item.SQUARE_OF_LINEN_CLOTH, weight = 260 }, -- Square Of Linen Cloth
    },

    {
        { item = invaderXim.item.NONE,           weight = 800 }, -- Nothing
        { item = invaderXim.item.PLATOON_CUTTER, weight = 167 }, -- Platoon Cutter
    },

    {
        quantity = 2,
        { item = invaderXim.item.NONE,                weight = 500 },  -- Nothing
        { item = invaderXim.item.VIAL_OF_FIEND_BLOOD, weight = 500 },  -- Vial Of Fiend Blood
    },

    {
        { item = invaderXim.item.PLATOON_EDGE,           weight = 235 }, -- Platoon Edge
        { item = invaderXim.item.PLATOON_GUN,            weight = 235 }, -- Platoon Gun
        { item = invaderXim.item.PLATOON_SPATHA,         weight = 235 }, -- Platoon Spatha
        { item = invaderXim.item.PLATOON_POLE,           weight = 235 }, -- Platoon Pole
        { item = invaderXim.item.GUNROMARU,              weight = 255 }, -- Gunromaru
        { item = invaderXim.item.MANNEQUIN_HEAD,         weight = 260 }, -- Mannequin Head
        { item = invaderXim.item.SCROLL_OF_DRAIN,        weight = 250 }, -- Scroll Of Drain
        { item = invaderXim.item.VIAL_OF_BEASTMAN_BLOOD, weight = 190 }, -- Vial Of Beastman Blood
    },
}

return content:register()
