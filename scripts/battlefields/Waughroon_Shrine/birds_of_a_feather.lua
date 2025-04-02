-----------------------------------
-- Birds of a Feather
-- Waughroon Shrine BCNM30, Sky Orb
-- !additem 1552
-----------------------------------
local waughroonID = zones[invaderXim.zone.WAUGHROON_SHRINE]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.WAUGHROON_SHRINE,
    battlefieldId    = invaderXim.battlefield.id.BIRDS_OF_A_FEATHER,
    maxPlayers       = 3,
    levelCap         = 30,
    timeLimit        = utils.minutes(15),
    index            = 9,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { invaderXim.item.SKY_ORB, wearMessage = waughroonID.text.A_CRACK_HAS_FORMED, wornMessage = waughroonID.text.ORB_IS_CRACKED },
})

content:addEssentialMobs({ 'Macha', 'Neman' })

content.loot =
{
    {
        { item = invaderXim.item.BIRD_FEATHER, weight = 1000 }, -- Bird Feather
    },

    {
        { item = invaderXim.item.ASHIGARU_EARRING,   weight = 125 }, -- Ashigaru Earring
        { item = invaderXim.item.TRIMMERS_EARRING,   weight = 125 }, -- Trimmers Earring
        { item = invaderXim.item.BEATERS_EARRING,    weight = 125 }, -- Beaters Earring
        { item = invaderXim.item.HEALERS_EARRING,    weight = 125 }, -- Healers Earring
        { item = invaderXim.item.MERCENARYS_EARRING, weight = 125 }, -- Mercenarys Earring
        { item = invaderXim.item.SINGERS_EARRING,    weight = 125 }, -- Singers Earring
        { item = invaderXim.item.WIZARDS_EARRING,    weight = 125 }, -- Wizards Earring
        { item = invaderXim.item.WRESTLERS_EARRING,  weight = 125 }, -- Wrestlers Earring
    },

    {
        { item = invaderXim.item.NONE,        weight = 125 }, -- nothing
        { item = invaderXim.item.AVATAR_BELT, weight = 125 }, -- Avatar Belt
        { item = invaderXim.item.DAGGER_BELT, weight = 125 }, -- Dagger Belt
        { item = invaderXim.item.LANCE_BELT,  weight = 125 }, -- Lance Belt
        { item = invaderXim.item.RAPIER_BELT, weight = 125 }, -- Rapier Belt
        { item = invaderXim.item.SARASHI,     weight = 125 }, -- Sarashi
        { item = invaderXim.item.SCYTHE_BELT, weight = 125 }, -- Scythe Belt
        { item = invaderXim.item.SHIELD_BELT, weight = 125 }, -- Shield Belt
    },

    {
        { item = invaderXim.item.NONE,                   weight = 500 }, -- nothing
        { item = invaderXim.item.SCROLL_OF_DISPEL,       weight = 125 }, -- Scroll Of Dispel
        { item = invaderXim.item.SCROLL_OF_ERASE,        weight = 125 }, -- Scroll Of Erase
        { item = invaderXim.item.SCROLL_OF_MAGIC_FINALE, weight = 125 }, -- Scroll Of Magic Finale
        { item = invaderXim.item.SCROLL_OF_UTSUSEMI_NI,  weight = 125 }, -- Scroll Of Utsusemi Ni
    },

    {
        { item = invaderXim.item.NONE,         weight = 136 }, -- nothing
        { item = invaderXim.item.BIRD_EGG,     weight = 125 }, -- Bird Egg
        { item = invaderXim.item.BIRD_FEATHER, weight =  50 }, -- Bird Feather
        { item = invaderXim.item.CHESTNUT_LOG, weight = 125 }, -- Chestnut Log
        { item = invaderXim.item.ELM_LOG,      weight = 188 }, -- Elm Log
        { item = invaderXim.item.HI_ETHER,     weight =  63 }, -- Hi-ether
        { item = invaderXim.item.HORN_QUIVER,  weight = 313 }, -- Horn Quiver
    },

    {
        { item = invaderXim.item.NONE,                 weight = 123 }, -- nothing
        { item = invaderXim.item.IRON_INGOT,           weight =  63 }, -- Iron Ingot
        { item = invaderXim.item.LAPIS_LAZULI,         weight = 125 }, -- Lapis Lazuli
        { item = invaderXim.item.LIGHT_OPAL,           weight = 125 }, -- Light Opal
        { item = invaderXim.item.MYTHRIL_INGOT,        weight =  63 }, -- Mythril Ingot
        { item = invaderXim.item.CHUNK_OF_MYTHRIL_ORE, weight =  63 }, -- Chunk Of Mythril Ore
        { item = invaderXim.item.ONYX,                 weight = 250 }, -- Onyx
        { item = invaderXim.item.CHUNK_OF_SILVER_ORE,  weight =  63 }, -- Chunk Of Silver Ore
        { item = invaderXim.item.SILVER_INGOT,         weight = 125 }, -- Silver Ingot
    },
}

return content:register()
