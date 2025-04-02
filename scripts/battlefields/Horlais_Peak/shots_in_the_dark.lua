-----------------------------------
-- Shots in the Dark
-- Horlais Peak BCNM60, Moon Orb
-- !additem 1130
-----------------------------------
local horlaisID = zones[invaderXim.zone.HORLAIS_PEAK]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.HORLAIS_PEAK,
    battlefieldId    = invaderXim.battlefield.id.SHOTS_IN_THE_DARK,
    maxPlayers       = 3,
    levelCap         = 60,
    timeLimit        = utils.minutes(15),
    index            = 14,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { invaderXim.item.MOON_ORB, wearMessage = horlaisID.text.A_CRACK_HAS_FORMED, wornMessage = horlaisID.text.ORB_IS_CRACKED },

    experimental = true,
})

content:addEssentialMobs({ 'Orcish_Onager' })

content.loot =
{
    {
        { item = invaderXim.item.GOLD_BEASTCOIN,    weight = 500 }, -- gold_beastcoin
        { item = invaderXim.item.MYTHRIL_BEASTCOIN, weight = 500 }, -- mythril_beastcoin
    },

    {
        { item = invaderXim.item.STEEL_INGOT, weight = 500 }, -- steel_ingot
        { item = invaderXim.item.AQUAMARINE,  weight = 500 }, -- aquamarine
    },

    {
        { item = invaderXim.item.NONE,         weight = 500 }, -- nothing
        { item = invaderXim.item.DEMON_QUIVER, weight = 500 }, -- demon_quiver
    },

    {
        { item = invaderXim.item.NONE,                weight = 600 }, -- nothing
        { item = invaderXim.item.TELEPORT_RING_HOLLA, weight = 200 }, -- teleport_ring_holla
        { item = invaderXim.item.TELEPORT_RING_VAHZL, weight = 200 }, -- teleport_ring_vahzl
    },

    {
        { item = invaderXim.item.NONE,                weight = 600 }, -- nothing
        { item = invaderXim.item.SAPIENT_CAPE,        weight = 200 }, -- sapient_cape
        { item = invaderXim.item.TRAINERS_WRISTBANDS, weight = 200 }, -- trainers_wristbands
    },
}

return content:register()
