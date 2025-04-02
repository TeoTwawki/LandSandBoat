-----------------------------------
-- Grove Guardians
-- Waughroon Shrine BCNM30, Sky Orb
-- !additem 1552
-----------------------------------
local waughroonID = zones[invaderXim.zone.WAUGHROON_SHRINE]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.WAUGHROON_SHRINE,
    battlefieldId    = invaderXim.battlefield.id.GROVE_GUARDIANS,
    maxPlayers       = 6,
    levelCap         = 30,
    timeLimit        = utils.minutes(30),
    index            = 11,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { invaderXim.item.SKY_ORB, wearMessage = waughroonID.text.A_CRACK_HAS_FORMED, wornMessage = waughroonID.text.ORB_IS_CRACKED },
})

content:addEssentialMobs({ 'Metsanneitsyt', 'Metsanhaltija' })

content.loot =
{
    {
        { item = invaderXim.item.MANNEQUIN_BODY, weight = 1000 }, -- mannequin_body
    },

    {
        { item = invaderXim.item.NONE,            weight = 800 }, -- nothing
        { item = invaderXim.item.MANNEQUIN_HANDS, weight = 200 }, -- mannequin_hands
    },

    {
        { item = invaderXim.item.NONE,             weight = 250 }, -- nothing
        { item = invaderXim.item.WRESTLERS_MANTLE, weight = 250 }, -- wrestlers_mantle
        { item = invaderXim.item.MAGICIANS_MANTLE, weight = 250 }, -- magicians_mantle
        { item = invaderXim.item.PILFERERS_MANTLE, weight = 250 }, -- pilferers_mantle
    },

    {
        { item = invaderXim.item.NONE,           weight = 200 }, -- nothing
        { item = invaderXim.item.HEALERS_SHIELD, weight = 200 }, -- healers_shield
        { item = invaderXim.item.GENIN_ASPIS,    weight = 200 }, -- genin_aspis
        { item = invaderXim.item.KILLER_TARGE,   weight = 200 }, -- killer_targe
        { item = invaderXim.item.STAFF_BELT,     weight = 200 }, -- staff_belt
    },

    {
        { item = invaderXim.item.NONE,                   weight = 250 }, -- nothing
        { item = invaderXim.item.BAG_OF_HERB_SEEDS,      weight = 250 }, -- bag_of_herb_seeds
        { item = invaderXim.item.BAG_OF_VEGETABLE_SEEDS, weight = 250 }, -- bag_of_vegetable_seeds
        { item = invaderXim.item.BAG_OF_GRAIN_SEEDS,     weight = 250 }, -- bag_of_grain_seeds
    },

    {
        { item = invaderXim.item.NONE,                   weight = 500 }, -- nothing
        { item = invaderXim.item.SCROLL_OF_DISPEL,       weight = 125 }, -- scroll_of_dispel
        { item = invaderXim.item.SCROLL_OF_UTSUSEMI_NI,  weight = 125 }, -- scroll_of_utsusemi_ni
        { item = invaderXim.item.SCROLL_OF_MAGIC_FINALE, weight = 125 }, -- scroll_of_magic_finale
        { item = invaderXim.item.SCROLL_OF_ERASE,        weight = 125 }, -- scroll_of_erase
    },

    {
        { item = invaderXim.item.NONE,            weight = 800 }, -- nothing
        { item = invaderXim.item.SCORPION_QUIVER, weight = 200 }, -- scorpion_quiver
    },
}

return content:register()
