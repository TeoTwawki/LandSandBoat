-----------------------------------
-- Let Sleeping Dogs Die
-- Qu'Bia Arena BCNM30, Sky Orb
-- !additem 1552
-----------------------------------
local qubiaID = zones[invaderXim.zone.QUBIA_ARENA]
-----------------------------------

local content = Battlefield:new({
    zoneId        = invaderXim.zone.QUBIA_ARENA,
    battlefieldId = invaderXim.battlefield.id.LET_SLEEPING_DOGS_DIE,
    maxPlayers    = 6,
    levelCap      = 30,
    timeLimit     = utils.minutes(30),
    index         = 10,
    entryNpc      = 'BC_Entrance',
    exitNpc       = 'Burning_Circle',
    requiredItems = { invaderXim.item.SKY_ORB, wearMessage = qubiaID.text.A_CRACK_HAS_FORMED, wornMessage = qubiaID.text.ORB_IS_CRACKED },
})

content:addEssentialMobs({ 'Capelthwaite', 'Freybug', 'Rongeur_Dos', 'Guytrash' })

content.loot =
{
    {
        { item = invaderXim.item.WOLF_HIDE, weight = 1000 },
    },

    {
        { item = invaderXim.item.REVIVAL_TREE_ROOT, weight = 1000 },
    },

    {
        { item = invaderXim.item.NONE,            weight = 100 },
        { item = invaderXim.item.MANNEQUIN_HEAD,  weight = 300 },
        { item = invaderXim.item.MANNEQUIN_BODY,  weight = 300 },
        { item = invaderXim.item.MANNEQUIN_HANDS, weight = 300 },
    },

    {
        { item = invaderXim.item.NONE,                  weight = 250 },
        { item = invaderXim.item.SCROLL_OF_ABSORB_AGI,  weight = 125 },
        { item = invaderXim.item.SCROLL_OF_ABSORB_INT,  weight = 125 },
        { item = invaderXim.item.SCROLL_OF_ABSORB_VIT,  weight = 125 },
        { item = invaderXim.item.SCROLL_OF_ERASE,       weight = 125 },
        { item = invaderXim.item.SCROLL_OF_UTSUSEMI_NI, weight = 125 },
        { item = invaderXim.item.SCROLL_OF_DISPEL,      weight = 125 },
    },

    {
        { item = invaderXim.item.NONE,             weight = 100 },
        { item = invaderXim.item.SINGERS_SHIELD,   weight = 150 },
        { item = invaderXim.item.WARLOCKS_SHIELD,  weight = 150 },
        { item = invaderXim.item.MAGICIANS_SHIELD, weight = 150 },
        { item = invaderXim.item.ASHIGARU_MANTLE,  weight = 150 },
        { item = invaderXim.item.WIZARDS_MANTLE,   weight = 150 },
        { item = invaderXim.item.KILLER_MANTLE,    weight = 150 },
    },
}

return content:register()
