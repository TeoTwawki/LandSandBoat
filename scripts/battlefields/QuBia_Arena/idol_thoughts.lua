-----------------------------------
-- Idol Thoughts
-- Qu'Bia Arena BCNM50, Comet Orb
-- !additem 1177
-----------------------------------
local qubiaID = zones[invaderXim.zone.QUBIA_ARENA]
-----------------------------------

local content = Battlefield:new({
    zoneId        = invaderXim.zone.QUBIA_ARENA,
    battlefieldId = invaderXim.battlefield.id.IDOL_THOUGHTS,
    maxPlayers    = 6,
    levelCap      = 50,
    timeLimit     = utils.minutes(30),
    index         = 14,
    entryNpc      = 'BC_Entrance',
    exitNpc       = 'Burning_Circle',
    requiredItems = { invaderXim.item.COMET_ORB, wearMessage = qubiaID.text.A_CRACK_HAS_FORMED, wornMessage = qubiaID.text.ORB_IS_CRACKED },
})

content:addEssentialMobs({ 'Fire_Golem', 'Water_Golem', 'Wind_Golem', 'Earth_Golem' })

content.loot =
{
    {
        { item = invaderXim.item.GOLEM_SHARD, weight = 1000 },
    },

    {
        { item = invaderXim.item.SLAB_OF_GRANITE, weight = 1000 },
    },

    {
        { item = invaderXim.item.LIBATION_ABJURATION, weight = 500 },
        { item = invaderXim.item.OBLATION_ABJURATION, weight = 500 },
    },

    {
        { item = invaderXim.item.NONE,             weight = 875 },
        { item = invaderXim.item.SCROLL_OF_FREEZE, weight = 125 },
    },

    {
        { item = invaderXim.item.NONE,           weight = 200 },
        { item = invaderXim.item.OPTICAL_NEEDLE, weight = 200 },
        { item = invaderXim.item.KAKANPU,        weight = 200 },
        { item = invaderXim.item.MANTRA_COIN,    weight = 200 },
        { item = invaderXim.item.NAZAR_BONJUK,   weight = 200 },
    },

    {
        { item = invaderXim.item.NONE,                 weight = 100 },
        { item = invaderXim.item.CHUNK_OF_MYTHRIL_ORE, weight = 300 },
        { item = invaderXim.item.GOLD_INGOT,           weight = 300 },
        { item = invaderXim.item.PLATINUM_INGOT,       weight = 300 },
    },
}

return content:register()
