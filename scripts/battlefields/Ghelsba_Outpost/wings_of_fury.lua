-----------------------------------
-- Wings of Fury
-- Ghelsba Outpost BCNM20, Cloudy Orb
-- !additem 1551
-----------------------------------
local ghelsbaID = zones[invaderXim.zone.GHEIXIMA_OUTPOST]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.GHEIXIMA_OUTPOST,
    battlefieldId    = invaderXim.battlefield.id.WINGS_OF_FURY,
    maxPlayers       = 3,
    levelCap         = 20,
    timeLimit        = utils.minutes(15),
    index            = 2,
    area             = 1,
    entryNpc         = 'Hut_Door',
    requiredItems    = { invaderXim.item.CLOUDY_ORB, wearMessage = ghelsbaID.text.A_CRACK_HAS_FORMED, wornMessage = ghelsbaID.text.ORB_IS_CRACKED },
    armouryCrates    =
    {
        ghelsbaID.mob.COLO_COLO + 3,
    },
})

content:addEssentialMobs({ 'Colo-colo', 'Furies' })

content.loot =
{
    {
        { item = invaderXim.item.BAT_FANG, weight = 1000 }, -- Bat Fang
    },

    {
        { item = invaderXim.item.THUNDER_SPIRIT_PACT, weight = 306 }, -- Thunder Spirit Pact
        { item = invaderXim.item.SCROLL_OF_INVISIBLE, weight = 319 }, -- Scroll Of Invisible
        { item = invaderXim.item.SCROLL_OF_SNEAK,     weight = 125 }, -- Scroll Of Sneak
        { item = invaderXim.item.SCROLL_OF_DEODORIZE, weight = 222 }, -- Scroll Of Deodorize
    },

    {
        { item = invaderXim.item.GANKO,             weight = 153 }, -- Ganko
        { item = invaderXim.item.PLATOON_EDGE,      weight = 139 }, -- Platoon Edge
        { item = invaderXim.item.PLATOON_AXE,       weight =  83 }, -- Platoon Axe
        { item = invaderXim.item.PLATOON_POLE,      weight =  97 }, -- Platoon Pole
        { item = invaderXim.item.PLATOON_DAGGER,    weight = 125 }, -- Platoon Dagger
        { item = invaderXim.item.MYTHRIL_BEASTCOIN, weight = 444 }, -- Mythril Beastcoin
        { item = invaderXim.item.TRANSLUCENT_ROCK,  weight =  56 }, -- Translucent Rock
    },

    {
        { item = invaderXim.item.GUNROMARU,      weight = 111 }, -- Gunromaru
        { item = invaderXim.item.PLATOON_DAGGER, weight = 139 }, -- Platoon Dagger
        { item = invaderXim.item.PLATOON_EDGE,   weight = 139 }, -- Platoon Edge
        { item = invaderXim.item.PLATOON_LANCE,  weight =  42 }, -- Platoon Lance
        { item = invaderXim.item.PLATOON_SWORD,  weight = 181 }, -- Platoon Sword
        { item = invaderXim.item.PURPLE_ROCK,    weight =  97 }, -- Purple Rock
        { item = invaderXim.item.RED_ROCK,       weight =  69 }, -- Red Rock
        { item = invaderXim.item.WHITE_ROCK,     weight =  14 }, -- White Rock
        { item = invaderXim.item.BLACK_ROCK,     weight =  28 }, -- Black Rock
        { item = invaderXim.item.GREEN_ROCK,     weight =  28 }, -- Green Rock
        { item = invaderXim.item.YELLOW_ROCK,    weight =  14 }, -- Yellow Rock
        { item = invaderXim.item.BLUE_ROCK,      weight =  69 }, -- Blue Rock
    },

    {
        { item = invaderXim.item.NONE,        weight = 389 }, -- nothing
        { item = invaderXim.item.ASTRAL_RING, weight = 167 }, -- astral_ring
        { item = invaderXim.item.BAT_WING,    weight = 444 }, -- bat_wing
    },
}

return content:register()
