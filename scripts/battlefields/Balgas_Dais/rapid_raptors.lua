-----------------------------------
-- Rapid Raptors
-- Balga's Dais BCNM50, Comet Orb
-- !additem 1177
-----------------------------------
local balgasID = zones[invaderXim.zone.BALGAS_DAIS]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.BALGAS_DAIS,
    battlefieldId    = invaderXim.battlefield.id.RAPID_RAPTORS,
    maxPlayers       = 3,
    levelCap         = 50,
    timeLimit        = utils.minutes(15),
    index            = 13,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { invaderXim.item.COMET_ORB, wearMessage = balgasID.text.A_CRACK_HAS_FORMED, wornMessage = balgasID.text.ORB_IS_CRACKED },
})

content:addEssentialMobs({ 'Dromiceiomimus' })

content.loot =
{
    {
        { item = invaderXim.item.RAPTOR_SKIN, weight = 1000 }, -- raptor_skin
    },

    {
        { item = invaderXim.item.ADAMAN_INGOT, weight = 1000 }, -- adaman_ingot
    },

    {
        { item = invaderXim.item.NONE,                    weight = 190 }, -- nothing
        { item = invaderXim.item.SLY_GAUNTLETS,           weight = 110 }, -- sly_gauntlets
        { item = invaderXim.item.SPIKED_FINGER_GAUNTLETS, weight = 120 }, -- spiked_finger_gauntlets
        { item = invaderXim.item.RUSH_GLOVES,             weight = 140 }, -- rush_gloves
        { item = invaderXim.item.RIVAL_RIBBON,            weight = 140 }, -- rival_ribbon
        { item = invaderXim.item.MANA_CIRCLET,            weight = 150 }, -- mana_circlet
        { item = invaderXim.item.IVORY_MITTS,             weight = 150 }, -- ivory_mitts
    },

    {
        { item = invaderXim.item.NONE,             weight =  30 }, -- nothing
        { item = invaderXim.item.STORM_GORGET,     weight = 100 }, -- storm_gorget
        { item = invaderXim.item.INTELLECT_TORQUE, weight = 100 }, -- intellect_torque
        { item = invaderXim.item.BENIGN_NECKLACE,  weight = 120 }, -- benign_necklace
        { item = invaderXim.item.HEAVY_MANTLE,     weight = 130 }, -- heavy_mantle
        { item = invaderXim.item.HATEFUL_COLLAR,   weight = 170 }, -- hateful_collar
        { item = invaderXim.item.ESOTERIC_MANTLE,  weight = 170 }, -- esoteric_mantle
        { item = invaderXim.item.TEMPLARS_MANTLE,  weight = 180 }, -- templars_mantle
    },

    {
        { item = invaderXim.item.NONE,              weight = 230 }, -- nothing
        { item = invaderXim.item.MYTHRIL_INGOT,     weight = 200 }, -- mythril_ingot
        { item = invaderXim.item.CHUNK_OF_IRON_ORE, weight = 200 }, -- chunk_of_iron_ore
        { item = invaderXim.item.PETRIFIED_LOG,     weight = 370 }, -- petrified_log
    },

    {
        { item = invaderXim.item.NONE,     weight = 560 }, -- nothing
        { item = invaderXim.item.RERAISER, weight = 440 }, -- reraiser
    },
}

return content:register()
