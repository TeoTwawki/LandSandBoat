-----------------------------------
-- Carapace Combatants
-- Horlais Peak BCNM30, Sky Orb
-- !additem 1552
-----------------------------------
local horlaisID = zones[invaderXim.zone.HORLAIS_PEAK]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.HORLAIS_PEAK,
    battlefieldId    = invaderXim.battlefield.id.CARAPACE_COMBATANTS,
    maxPlayers       = 3,
    levelCap         = 30,
    timeLimit        = utils.minutes(15),
    index            = 8,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { invaderXim.item.SKY_ORB, wearMessage = horlaisID.text.A_CRACK_HAS_FORMED, wornMessage = horlaisID.text.ORB_IS_CRACKED },
})

content:addEssentialMobs({ 'Pilwiz', 'Bisan' })

content.loot =
{
    {
        { item = invaderXim.item.BEETLE_JAW, weight = 1000 }, -- beetle_jaw
    },

    {
        { item = invaderXim.item.BEETLE_SHELL, weight = 1000 }, -- beetle_shell
    },

    {
        { item = invaderXim.item.NONE,        weight = 250 }, -- nothing
        { item = invaderXim.item.KATANA_OBI,  weight = 150 }, -- katana_obi
        { item = invaderXim.item.STAFF_BELT,  weight = 150 }, -- staff_belt
        { item = invaderXim.item.SONG_BELT,   weight = 150 }, -- song_belt
        { item = invaderXim.item.CESTUS_BELT, weight = 150 }, -- cestus_belt
        { item = invaderXim.item.PICK_BELT,   weight = 150 }, -- pick_belt
    },

    {
        { item = invaderXim.item.NONE,              weight = 125 }, -- nothing
        { item = invaderXim.item.GENIN_EARRING,     weight = 125 }, -- genin_earring
        { item = invaderXim.item.MAGICIANS_EARRING, weight = 125 }, -- magicians_earring
        { item = invaderXim.item.PILFERERS_EARRING, weight = 125 }, -- pilferers_earring
        { item = invaderXim.item.WARLOCKS_EARRING,  weight = 125 }, -- warlocks_earring
        { item = invaderXim.item.WRESTLERS_EARRING, weight = 125 }, -- wrestlers_earring
        { item = invaderXim.item.WYVERN_EARRING,    weight = 125 }, -- wyvern_earring
        { item = invaderXim.item.KILLER_EARRING,    weight = 125 }, -- killer_earring
    },

    {
        { item = invaderXim.item.NONE,                   weight = 160 }, -- nothing
        { item = invaderXim.item.CHUNK_OF_DARKSTEEL_ORE, weight = 140 }, -- chunk_of_darksteel_ore
        { item = invaderXim.item.MYTHRIL_INGOT,          weight = 140 }, -- mythril_ingot
        { item = invaderXim.item.SILVER_INGOT,           weight = 140 }, -- silver_ingot
        { item = invaderXim.item.STEEL_INGOT,            weight = 140 }, -- steel_ingot
        { item = invaderXim.item.CHUNK_OF_MYTHRIL_ORE,   weight = 140 }, -- chunk_of_mythril_ore
        { item = invaderXim.item.SARDONYX,               weight = 140 }, -- sardonyx
    },

    {
        { item = invaderXim.item.NONE,                   weight = 250 }, -- nothing
        { item = invaderXim.item.SCROLL_OF_DISPEL,       weight = 125 }, -- scroll_of_dispel
        { item = invaderXim.item.SCROLL_OF_UTSUSEMI_NI,  weight = 125 }, -- scroll_of_utsusemi_ni
        { item = invaderXim.item.SCROLL_OF_FIRE_II,      weight = 125 }, -- scroll_of_fire_ii
        { item = invaderXim.item.SCROLL_OF_MAGIC_FINALE, weight = 125 }, -- scroll_of_magic_finale
        { item = invaderXim.item.SCROLL_OF_ABSORB_AGI,   weight = 125 }, -- scroll_of_absorb-agi
        { item = invaderXim.item.SCROLL_OF_ABSORB_INT,   weight = 125 }, -- scroll_of_absorb-int
    },

    {
        quantity = 2,
        { item = invaderXim.item.NONE,               weight = 500 }, -- nothing
        { item = invaderXim.item.JUG_OF_SCARLET_SAP, weight = 500 }, -- jug_of_scarlet_sap
    },

    {
        { item = invaderXim.item.NONE,     weight = 900 }, -- nothing
        { item = invaderXim.item.HI_ETHER, weight = 100 }, -- hi-ether
    },
}

return content:register()
