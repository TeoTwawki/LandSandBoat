-----------------------------------
-- Wild Wild Whiskers
-- Balga's Dais BCNM60, Moon Orb
-- !additem 1130
-----------------------------------
local balgasID = zones[invaderXim.zone.BALGAS_DAIS]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.BALGAS_DAIS,
    battlefieldId    = invaderXim.battlefield.id.WILD_WILD_WHISKERS,
    maxPlayers       = 3,
    levelCap         = 60,
    timeLimit        = utils.minutes(15),
    index            = 14,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { invaderXim.item.MOON_ORB, wearMessage = balgasID.text.A_CRACK_HAS_FORMED, wornMessage = balgasID.text.ORB_IS_CRACKED },
})

content:addEssentialMobs({ 'Macan_Gadangan' })

content.loot =
{
    {
        quantity = 3,
        { item = invaderXim.item.HIGH_QUALITY_COEURL_HIDE, weight = 1000 }, -- high-quality_coeurl_hide
    },

    {
        { item = invaderXim.item.CHUNK_OF_ADAMAN_ORE, weight = 1000 }, -- chunk_of_adaman_ore
    },

    {
        { item = invaderXim.item.HERMES_QUENCHER, weight = 1000 }, -- hermes_quencher
    },

    {
        { item = invaderXim.item.ICARUS_WING, weight = 1000 }, -- icarus_wing
    },

    {
        { item = invaderXim.item.GLEEMANS_BELT,  weight = 365 }, -- gleemans_belt
        { item = invaderXim.item.PENITENTS_ROPE, weight = 635 }, -- penitents_rope
    },

    {
        { item = invaderXim.item.TELEPORT_RING_MEA,   weight = 426 }, -- teleport_ring_mea
        { item = invaderXim.item.TELEPORT_RING_YHOAT, weight = 574 }, -- teleport_ring_yhoat
    },

    {
        { item = invaderXim.item.NONE,         weight = 848 }, -- nothing
        { item = invaderXim.item.WALKURE_MASK, weight =  58 }, -- walkure_mask
        { item = invaderXim.item.HI_RERAISER,  weight =  78 }, -- hi-reraiser
        { item = invaderXim.item.EBONY_LOG,    weight =  16 }, -- ebony_log
    },

    {
        { item = invaderXim.item.YELLOW_ROCK,      weight =  9 }, -- yellow_rock
        { item = invaderXim.item.BLACK_ROCK,       weight =  9 }, -- black_rock
        { item = invaderXim.item.AQUAMARINE,       weight = 16 }, -- aquamarine
        { item = invaderXim.item.RED_ROCK,         weight = 16 }, -- red_rock
        { item = invaderXim.item.BLUE_ROCK,        weight = 16 }, -- blue_rock
        { item = invaderXim.item.PURPLE_ROCK,      weight = 16 }, -- purple_rock
        { item = invaderXim.item.MAHOGANY_LOG,     weight = 33 }, -- mahogany_log
        { item = invaderXim.item.CHRYSOBERYL,      weight = 33 }, -- chrysoberyl
        { item = invaderXim.item.ZIRCON,           weight = 33 }, -- zircon
        { item = invaderXim.item.STEEL_INGOT,      weight = 49 }, -- steel_ingot
        { item = invaderXim.item.DARKSTEEL_INGOT,  weight = 49 }, -- darksteel_ingot
        { item = invaderXim.item.TRANSLUCENT_ROCK, weight = 49 }, -- translucent_rock
        { item = invaderXim.item.SUNSTONE,         weight = 49 }, -- sunstone
        { item = invaderXim.item.MOONSTONE,        weight = 66 }, -- moonstone
        { item = invaderXim.item.MYTHRIL_INGOT,    weight = 82 }, -- mythril_ingot
        { item = invaderXim.item.FLUORITE,         weight = 82 }, -- fluorite
        { item = invaderXim.item.GOLD_INGOT,       weight = 98 }, -- gold_ingot
        { item = invaderXim.item.JADEITE,          weight = 98 }, -- jadeite
        { item = invaderXim.item.PAINITE,          weight = 98 }, -- painite
        { item = invaderXim.item.VILE_ELIXIR_P1,   weight = 99 }, -- vile_elixir_+1
    },
}

return content:register()
