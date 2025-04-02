-----------------------------------
-- Harem Scarem
-- Balga's Dais BCNM30, Sky Orb
-- !additem 1552
-----------------------------------
local balgasID = zones[invaderXim.zone.BALGAS_DAIS]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.BALGAS_DAIS,
    battlefieldId    = invaderXim.battlefield.id.HAREM_SCAREM,
    maxPlayers       = 6,
    levelCap         = 30,
    timeLimit        = utils.minutes(30),
    index            = 10,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { invaderXim.item.SKY_ORB, wearMessage = balgasID.text.A_CRACK_HAS_FORMED, wornMessage = balgasID.text.ORB_IS_CRACKED },
})

content:addEssentialMobs({ 'Nenaunir', 'Nenaunirs_Wife' })

content.loot =
{
    {
        { item = invaderXim.item.DHALMEL_HIDE, weight = 1000 }, -- dhalmel_hide
    },

    {
        { item = invaderXim.item.NONE,        weight =  500 }, -- nothing
        { item = invaderXim.item.GIANT_FEMUR, weight =  500 }, -- giant_femur
    },

    {
        { item = invaderXim.item.NONE,                  weight = 500 }, -- nothing
        { item = invaderXim.item.SLICE_OF_DHALMEL_MEAT, weight = 500 }, -- slice_of_dhalmel_meat
    },

    {
        { item = invaderXim.item.NONE,             weight = 400 }, -- nothing
        { item = invaderXim.item.MERCENARY_MANTLE, weight = 150 }, -- mercenary_mantle
        { item = invaderXim.item.BEATERS_MANTLE,   weight = 150 }, -- beaters_mantle
        { item = invaderXim.item.ESQUIRES_MANTLE,  weight = 150 }, -- esquires_mantle
        { item = invaderXim.item.HEALERS_MANTLE,   weight = 150 }, -- healers_mantle
    },

    {
        { item = invaderXim.item.NONE,           weight = 400 }, -- nothing
        { item = invaderXim.item.WIZARDS_SHIELD, weight = 200 }, -- wizards_shield
        { item = invaderXim.item.TRIMMERS_ASPIS, weight = 200 }, -- trimmers_aspis
        { item = invaderXim.item.WYVERN_TARGE,   weight = 200 }, -- wyvern_targe
    },

    {
        { item = invaderXim.item.NONE,                   weight = 200 }, -- nothing
        { item = invaderXim.item.SCROLL_OF_ERASE,        weight = 200 }, -- scroll_of_erase
        { item = invaderXim.item.SCROLL_OF_DISPEL,       weight = 200 }, -- scroll_of_dispel
        { item = invaderXim.item.SCROLL_OF_MAGIC_FINALE, weight = 200 }, -- scroll_of_magic_finale
        { item = invaderXim.item.SCROLL_OF_UTSUSEMI_NI,  weight = 200 }, -- scroll_of_utsusemi_ni
    },

    {
        { item = invaderXim.item.NONE,                   weight = 250 }, -- nothing
        { item = invaderXim.item.SQUARE_OF_VELVET_CLOTH, weight = 250 }, -- square_of_velvet_cloth
        { item = invaderXim.item.SQUARE_OF_LINEN_CLOTH,  weight = 250 }, -- square_of_linen_cloth
        { item = invaderXim.item.SQUARE_OF_WOOL_CLOTH,   weight = 250 }, -- square_of_wool_cloth
    },

    {
        { item = invaderXim.item.NONE,            weight = 600 }, -- nothing
        { item = invaderXim.item.MANNEQUIN_HEAD,  weight = 200 }, -- mannequin_head
        { item = invaderXim.item.MANNEQUIN_HANDS, weight = 200 }, -- mannequin_hands
    },
}

return content:register()
