-----------------------------------
-- The Final Bout
-- Waughroon Shrine BCNM50, Comet Orb
-- !additem 1177
-----------------------------------
local waughroonID = zones[invaderXim.zone.WAUGHROON_SHRINE]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.WAUGHROON_SHRINE,
    battlefieldId    = invaderXim.battlefield.id.FINAL_BOUT,
    maxPlayers       = 3,
    levelCap         = 50,
    timeLimit        = utils.minutes(3),
    index            = 14,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { invaderXim.item.COMET_ORB, wearMessage = waughroonID.text.A_CRACK_HAS_FORMED, wornMessage = waughroonID.text.ORB_IS_CRACKED },

    experimental = true,
})

content:addEssentialMobs({ 'The_Waughroon_Kid' })

content.loot =
{
    {
        quantity = 2,
        { item = invaderXim.item.BAG_OF_TREE_CUTTINGS, weight = 1000 }, -- bag_of_tree_cuttings
    },

    {
        { item = invaderXim.item.CLUMP_OF_BOYAHDA_MOSS, weight = 1000 }, -- clump_of_boyahda_moss
    },

    {
        { item = invaderXim.item.SCROLL_OF_QUAKE,          weight = 100 }, -- scroll_of_quake
        { item = invaderXim.item.PIECE_OF_WISTERIA_LUMBER, weight = 100 }, -- piece_of_wisteria_lumber
        { item = invaderXim.item.MAHOGANY_LOG,             weight = 100 }, -- mahogany_log
        { item = invaderXim.item.EBONY_LOG,                weight = 100 }, -- ebony_log
        { item = invaderXim.item.SCROLL_OF_FREEZE,         weight = 100 }, -- scroll_of_freeze
        { item = invaderXim.item.DARKSTEEL_INGOT,          weight = 100 }, -- darksteel_ingot
        { item = invaderXim.item.SCROLL_OF_RAISE_II,       weight = 100 }, -- scroll_of_raise_ii
        { item = invaderXim.item.PETRIFIED_LOG,            weight = 100 }, -- petrified_log
        { item = invaderXim.item.GOLD_INGOT,               weight = 100 }, -- gold_ingot
        { item = invaderXim.item.CORAL_FRAGMENT,           weight = 100 }, -- coral_fragment
    },

    {
        { item = invaderXim.item.SHOCK_MASK,              weight = 62 }, -- shock_mask
        { item = invaderXim.item.SUPER_RIBBON,            weight = 62 }, -- super_ribbon
        { item = invaderXim.item.RIVAL_RIBBON,            weight = 62 }, -- rival_ribbon
        { item = invaderXim.item.IVORY_MITTS,             weight = 62 }, -- ivory_mitts
        { item = invaderXim.item.SPIKED_FINGER_GAUNTLETS, weight = 70 }, -- spiked_finger_gauntlets
        { item = invaderXim.item.SLY_GAUNTLETS,           weight = 62 }, -- sly_gauntlets
        { item = invaderXim.item.RUSH_GLOVES,             weight = 62 }, -- rush_gloves
        { item = invaderXim.item.MANA_CIRCLET,            weight = 62 }, -- mana_circlet
        { item = invaderXim.item.HATEFUL_COLLAR,          weight = 62 }, -- hateful_collar
        { item = invaderXim.item.ESOTERIC_MANTLE,         weight = 62 }, -- esoteric_mantle
        { item = invaderXim.item.TEMPLARS_MANTLE,         weight = 62 }, -- templars_mantle
        { item = invaderXim.item.HEAVY_MANTLE,            weight = 62 }, -- heavy_mantle
        { item = invaderXim.item.INTELLECT_TORQUE,        weight = 62 }, -- intellect_torque
        { item = invaderXim.item.STORM_GORGET,            weight = 62 }, -- storm_gorget
        { item = invaderXim.item.BENIGN_NECKLACE,         weight = 62 }, -- benign_necklace
        { item = invaderXim.item.SNIPERS_MANTLE,          weight = 62 }, -- snipers_mantle
    },
}

return content:register()
