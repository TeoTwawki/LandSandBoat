-----------------------------------
-- Die by the Sword
-- Qu'Bia Arena BCNM30, Sky Orb
-- !additem 1552
-----------------------------------
local qubiaID = zones[invaderXim.zone.QUBIA_ARENA]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.QUBIA_ARENA,
    battlefieldId    = invaderXim.battlefield.id.DIE_BY_THE_SWORD,
    maxPlayers       = 3,
    levelCap         = 30,
    timeLimit        = utils.minutes(15),
    index            = 9,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { invaderXim.item.SKY_ORB, wearMessage = qubiaID.text.A_CRACK_HAS_FORMED, wornMessage = qubiaID.text.ORB_IS_CRACKED },

    experimental = true,
})

content:addEssentialMobs({ 'Gladiatorial_Weapon' })

content.loot =
{
    {
        { item = invaderXim.item.RUSTY_PICK, weight = 1000 }, -- rusty_pick
    },

    {
        { item = invaderXim.item.ASHIGARU_EARRING,   weight = 71 }, -- ashigaru_earring
        { item = invaderXim.item.ESQUIRES_EARRING,   weight = 71 }, -- esquires_earring
        { item = invaderXim.item.MAGICIANS_EARRING,  weight = 72 }, -- magicians_earring
        { item = invaderXim.item.MERCENARYS_EARRING, weight = 72 }, -- mercenarys_earring
        { item = invaderXim.item.PILFERERS_EARRING,  weight = 72 }, -- pilferers_earring
        { item = invaderXim.item.SINGERS_EARRING,    weight = 71 }, -- singers_earring
        { item = invaderXim.item.TRIMMERS_EARRING,   weight = 71 }, -- trimmers_earring
        { item = invaderXim.item.WARLOCKS_EARRING,   weight = 72 }, -- warlocks_earring
        { item = invaderXim.item.WIZARDS_EARRING,    weight = 72 }, -- wizards_earring
        { item = invaderXim.item.WRESTLERS_EARRING,  weight = 72 }, -- wrestlers_earring
        { item = invaderXim.item.WYVERN_EARRING,     weight = 71 }, -- wyvern_earring
        { item = invaderXim.item.BEATERS_EARRING,    weight = 71 }, -- beaters_earring
        { item = invaderXim.item.GENIN_EARRING,      weight = 71 }, -- genin_earring
        { item = invaderXim.item.KILLER_EARRING,     weight = 71 }, -- killer_earring
    },

    {
        { item = invaderXim.item.AVATAR_BELT, weight = 71 }, -- avatar_belt
        { item = invaderXim.item.AXE_BELT,    weight = 71 }, -- axe_belt
        { item = invaderXim.item.CESTUS_BELT, weight = 72 }, -- cestus_belt
        { item = invaderXim.item.DAGGER_BELT, weight = 72 }, -- dagger_belt
        { item = invaderXim.item.GUN_BELT,    weight = 72 }, -- gun_belt
        { item = invaderXim.item.KATANA_OBI,  weight = 71 }, -- katana_obi
        { item = invaderXim.item.LANCE_BELT,  weight = 71 }, -- lance_belt
        { item = invaderXim.item.SARASHI,     weight = 72 }, -- sarashi
        { item = invaderXim.item.SCYTHE_BELT, weight = 72 }, -- scythe_belt
        { item = invaderXim.item.SHIELD_BELT, weight = 72 }, -- shield_belt
        { item = invaderXim.item.SONG_BELT,   weight = 71 }, -- song_belt
        { item = invaderXim.item.STAFF_BELT,  weight = 71 }, -- staff_belt
        { item = invaderXim.item.PICK_BELT,   weight = 71 }, -- pick_belt
        { item = invaderXim.item.RAPIER_BELT, weight = 71 }, -- rapier_belt
    },

    {
        { item = invaderXim.item.SCROLL_OF_ERASE,        weight = 200 }, -- scroll_of_erase
        { item = invaderXim.item.SCROLL_OF_REPRISAL,     weight = 200 }, -- scroll_of_reprisal
        { item = invaderXim.item.SCROLL_OF_DISPEL,       weight = 200 }, -- scroll_of_dispel
        { item = invaderXim.item.SCROLL_OF_MAGIC_FINALE, weight = 200 }, -- scroll_of_magic_finale
        { item = invaderXim.item.SCROLL_OF_UTSUSEMI_NI,  weight = 200 }, -- gscroll_of_utsusemi_nin_belt
    },

    {
        { item = invaderXim.item.NONE,             weight = 775 }, -- nothing
        { item = invaderXim.item.GOLD_INGOT,       weight =  50 }, -- gold_ingot
        { item = invaderXim.item.PLATINUM_INGOT,   weight =  50 }, -- platinum_ingot
        { item = invaderXim.item.PETRIFIED_LOG,    weight =  50 }, -- petrified_log
        { item = invaderXim.item.RUSTY_GREATSWORD, weight =  75 }, -- rusty_greatsword
    },

    {
        { item = invaderXim.item.NONE,            weight = 250 }, -- nothing
        { item = invaderXim.item.MANNEQUIN_HEAD,  weight = 250 }, -- mannequin_head
        { item = invaderXim.item.MANNEQUIN_BODY,  weight = 250 }, -- mannequin_body
        { item = invaderXim.item.MANNEQUIN_HANDS, weight = 250 }, -- mannequin_hands
    },

    {
        { item = invaderXim.item.NONE,     weight = 667 }, -- nothing
        { item = invaderXim.item.HI_ETHER, weight = 333 }, -- hi-ether
    },
}

return content:register()
