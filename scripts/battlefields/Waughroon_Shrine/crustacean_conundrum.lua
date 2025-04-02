-----------------------------------
-- Crustacean Conundrum
-- Waughroon Shrine BCNM20, Cloudy Orb
-- !additem 1551
-----------------------------------
local waughroonID = zones[invaderXim.zone.WAUGHROON_SHRINE]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.WAUGHROON_SHRINE,
    battlefieldId    = invaderXim.battlefield.id.CRUSTACEAN_CONUNDRUM,
    maxPlayers       = 3,
    levelCap         = 20,
    timeLimit        = utils.minutes(15),
    index            = 10,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { invaderXim.item.CLOUDY_ORB, wearMessage = waughroonID.text.A_CRACK_HAS_FORMED, wornMessage = waughroonID.text.ORB_IS_CRACKED },

    experimental = true,
})

content:addEssentialMobs({ 'Heavy_Metal_Crab', 'Metal_Crab' })

content.loot =
{
    {
        { item = invaderXim.item.SLICE_OF_LAND_CRAB_MEAT, weight = 1000 }, -- slice_of_land_crab_meat
    },

    {
        { item = invaderXim.item.MANNEQUIN_BODY, weight = 1000 }, -- mannequin_body
    },

    {
        { item = invaderXim.item.NONE,       weight = 334 }, -- nothing
        { item = invaderXim.item.CRAB_SHELL, weight = 666 }, -- crab_shell
    },

    {
        { item = invaderXim.item.BEETLE_QUIVER,         weight = 444 }, -- beetle_quiver
        { item = invaderXim.item.JUG_OF_FISH_OIL_BROTH, weight = 556 }, -- jug_of_fish_oil_broth
    },

    {
        { item = invaderXim.item.NONE,         weight = 450 }, -- nothing
        { item = invaderXim.item.BRASS_INGOT,  weight = 100 }, -- brass_ingot
        { item = invaderXim.item.BRONZE_SHEET, weight = 150 }, -- bronze_sheet
        { item = invaderXim.item.BRONZE_INGOT, weight = 300 }, -- bronze_ingot
    },

    {
        { item = invaderXim.item.NONE,              weight = 300 }, -- nothing
        { item = invaderXim.item.MYTHRIL_BEASTCOIN, weight = 500 }, -- mythril_beastcoin
        { item = invaderXim.item.MANNEQUIN_HANDS,   weight = 100 }, -- mannequin_hands
        { item = invaderXim.item.MANNEQUIN_HEAD,    weight = 100 }, -- mannequin_head
    },

    {
        { item = invaderXim.item.NONE,            weight = 200 }, -- nothing
        { item = invaderXim.item.PLATOON_CESTI,   weight = 100 }, -- platoon_cesti
        { item = invaderXim.item.PLATOON_DAGGER,  weight = 100 }, -- platoon_dagger
        { item = invaderXim.item.PLATOON_AXE,     weight = 100 }, -- platoon_axe
        { item = invaderXim.item.PLATOON_BOW,     weight = 100 }, -- platoon_bow
        { item = invaderXim.item.PLATOON_LANCE,   weight = 100 }, -- platoon_lance
        { item = invaderXim.item.PLATOON_SWORD,   weight = 100 }, -- platoon_sword
        { item = invaderXim.item.PLATOON_MACE,    weight = 100 }, -- platoon_mace
        { item = invaderXim.item.PLATOON_ZAGHNAL, weight = 100 }, -- platoon_zaghnal
    },
}

return content:register()
