-----------------------------------
-- Dropping Like Flies
-- Horlais Peak BCNM30, Sky Orb
-- !additem 1552
-----------------------------------
local horlaisID = zones[invaderXim.zone.HORLAIS_PEAK]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.HORLAIS_PEAK,
    battlefieldId    = invaderXim.battlefield.id.DROPPING_LIKE_FLIES,
    maxPlayers       = 6,
    levelCap         = 30,
    timeLimit        = utils.minutes(30),
    index            = 10,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { invaderXim.item.SKY_ORB, wearMessage = horlaisID.text.A_CRACK_HAS_FORMED, wornMessage = horlaisID.text.ORB_IS_CRACKED },
})

content:addEssentialMobs({ 'Huntfly', 'Houndfly' })

content.loot =
{
    {
        { item = invaderXim.item.GIL, weight = 1000, amount = 4000 }, -- Gil
    },

    {
        { item = invaderXim.item.INSECT_WING, weight = 1000 }, -- Insect Wing
    },

    {
        { item = invaderXim.item.MANNEQUIN_HEAD, weight = 1000 }, -- Mannequin Head
    },

    {
        { item = invaderXim.item.NONE,            weight = 636 }, -- Nothing
        { item = invaderXim.item.EMPEROR_HAIRPIN, weight = 364 }, -- Emperor Hairpin
    },

    {
        { item = invaderXim.item.ASHIGARU_TARGE,  weight = 175 }, -- Ashigaru Targe
        { item = invaderXim.item.BEATERS_ASPIS,   weight = 175 }, -- Beaters Aspis
        { item = invaderXim.item.VARLETS_TARGE,   weight = 175 }, -- Varlets Targe
        { item = invaderXim.item.WRESTLERS_ASPIS, weight = 175 }, -- Wrestlers Aspis
        { item = invaderXim.item.CLEAR_TOPAZ,     weight = 100 }, -- Clear Topaz
        { item = invaderXim.item.LAPIS_LAZULI,    weight = 100 }, -- Lapis Lazuli
        { item = invaderXim.item.LIGHT_OPAL,      weight = 100 }, -- Light Opal
    },

    {
        { item = invaderXim.item.MERCENARY_MANTLE, weight = 250 }, -- Mercenary Mantle
        { item = invaderXim.item.SINGERS_MANTLE,   weight = 250 }, -- Singers Mantle
        { item = invaderXim.item.WIZARDS_MANTLE,   weight = 250 }, -- Wizards Mantle
        { item = invaderXim.item.WYVERN_MANTLE,    weight = 250 }, -- Wyvern Mantle
    },

    {
        { item = invaderXim.item.SCROLL_OF_UTSUSEMI_NI,   weight =  70 }, -- Scroll Of Utsusemi Ni
        { item = invaderXim.item.SCROLL_OF_MAGIC_FINALE,  weight =  70 }, -- Scroll Of Magic Finale
        { item = invaderXim.item.JUG_OF_QUADAV_BUG_BROTH, weight = 150 }, -- Jug Of Quadav Bug Broth
        { item = invaderXim.item.ONYX,                    weight = 100 }, -- Onyx
        { item = invaderXim.item.LAPIS_LAZULI,            weight = 100 }, -- Lapis Lazuli
        { item = invaderXim.item.LIGHT_OPAL,              weight = 100 }, -- Light Opal
        { item = invaderXim.item.SCROLL_OF_DISPEL,        weight = 150 }, -- Scroll Of Dispel
        { item = invaderXim.item.SCROLL_OF_ERASE,         weight = 100 }, -- Scroll Of Erase
        { item = invaderXim.item.ELM_LOG,                 weight =  90 }, -- Elm Log
        { item = invaderXim.item.MANNEQUIN_BODY,          weight =  70 }, -- Mannequin Body
    },
}

return content:register()
