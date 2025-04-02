-----------------------------------
-- Eye of the Tiger
-- Horlais Peak BCNM50, Comet Orb
-- !additem 1177
-----------------------------------
local horlaisID = zones[invaderXim.zone.HORLAIS_PEAK]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.HORLAIS_PEAK,
    battlefieldId    = invaderXim.battlefield.id.EYE_OF_THE_TIGER,
    maxPlayers       = 3,
    levelCap         = 50,
    timeLimit        = utils.minutes(15),
    index            = 13,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { invaderXim.item.COMET_ORB, wearMessage = horlaisID.text.A_CRACK_HAS_FORMED, wornMessage = horlaisID.text.ORB_IS_CRACKED },
})

content:addEssentialMobs({ 'Gerjis' })

content.loot =
{
    {
        quantity = 2,
        { item = invaderXim.item.BLACK_TIGER_FANG, weight = 1000 }, -- black_tiger_fang
    },

    {
        { item = invaderXim.item.NONE,     weight = 700 }, -- nothing
        { item = invaderXim.item.NUE_FANG, weight = 300 }, -- nue_fang
    },

    {
        { item = invaderXim.item.NONE,                    weight = 125 }, -- nothing
        { item = invaderXim.item.IVORY_MITTS,             weight = 125 }, -- ivory_mitts
        { item = invaderXim.item.SUPER_RIBBON,            weight = 125 }, -- super_ribbon
        { item = invaderXim.item.MANA_CIRCLET,            weight = 125 }, -- mana_circlet
        { item = invaderXim.item.RIVAL_RIBBON,            weight = 125 }, -- rival_ribbon
        { item = invaderXim.item.SLY_GAUNTLETS,           weight = 125 }, -- sly_gauntlets
        { item = invaderXim.item.SHOCK_MASK,              weight = 125 }, -- shock_mask
        { item = invaderXim.item.SPIKED_FINGER_GAUNTLETS, weight = 125 }, -- spiked_finger_gauntlets
    },

    {
        { item = invaderXim.item.INTELLECT_TORQUE, weight = 125 }, -- intellect_torque
        { item = invaderXim.item.ESOTERIC_MANTLE,  weight = 125 }, -- esoteric_mantle
        { item = invaderXim.item.TEMPLARS_MANTLE,  weight = 125 }, -- templars_mantle
        { item = invaderXim.item.SNIPERS_MANTLE,   weight = 125 }, -- snipers_mantle
        { item = invaderXim.item.HATEFUL_COLLAR,   weight = 125 }, -- hateful_collar
        { item = invaderXim.item.STORM_GORGET,     weight = 125 }, -- storm_gorget
        { item = invaderXim.item.HEAVY_MANTLE,     weight = 125 }, -- heavy_mantle
        { item = invaderXim.item.BENIGN_NECKLACE,  weight = 125 }, -- benign_necklace
    },

    {
        { item = invaderXim.item.NONE,           weight = 125 }, -- nothing
        { item = invaderXim.item.GOLD_INGOT,     weight = 125 }, -- gold_ingot
        { item = invaderXim.item.RAM_HORN,       weight = 125 }, -- ram_horn
        { item = invaderXim.item.WYVERN_SKIN,    weight = 125 }, -- wyvern_skin
        { item = invaderXim.item.EBONY_LOG,      weight = 125 }, -- ebony_log
        { item = invaderXim.item.MYTHRIL_INGOT,  weight = 125 }, -- mythril_ingot
        { item = invaderXim.item.RAM_SKIN,       weight = 125 }, -- ram_skin
        { item = invaderXim.item.CORAL_FRAGMENT, weight = 125 }, -- coral_fragment
    },

    {
        { item = invaderXim.item.NONE,                  weight = 400 }, -- nothing
        { item = invaderXim.item.SLICE_OF_BUFFALO_MEAT, weight = 200 }, -- slice_of_buffalo_meat
        { item = invaderXim.item.SLICE_OF_DRAGON_MEAT,  weight = 200 }, -- slice_of_dragon_meat
        { item = invaderXim.item.SLICE_OF_COEURL_MEAT,  weight = 200 }, -- slice_of_coeurl_meat
    },

    {
        { item = invaderXim.item.NONE,               weight = 625 }, -- nothing
        { item = invaderXim.item.SCROLL_OF_FREEZE,   weight = 125 }, -- scroll_of_freeze
        { item = invaderXim.item.SCROLL_OF_RAISE_II, weight = 125 }, -- scroll_of_raise_ii
        { item = invaderXim.item.SCROLL_OF_QUAKE,    weight = 125 }, -- scroll_of_quake
    },
}

return content:register()
