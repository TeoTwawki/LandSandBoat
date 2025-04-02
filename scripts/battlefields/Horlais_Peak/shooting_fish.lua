-----------------------------------
-- Shooting Fish
-- Horlais Peak BCNM20, Cloudy Orb
-- !additem 1551
-----------------------------------
local horlaisID = zones[invaderXim.zone.HORLAIS_PEAK]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.HORLAIS_PEAK,
    battlefieldId    = invaderXim.battlefield.id.SHOOTING_FISH,
    maxPlayers       = 3,
    levelCap         = 20,
    timeLimit        = utils.minutes(15),
    index            = 9,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { invaderXim.item.CLOUDY_ORB, wearMessage = horlaisID.text.A_CRACK_HAS_FORMED, wornMessage = horlaisID.text.ORB_IS_CRACKED },

    experimental = true,
})

content:addEssentialMobs({ 'Sniper_Pugil', 'Archer_Pugil' })

content.loot =
{
    {
        { item = invaderXim.item.MANNEQUIN_HEAD, weight = 1000 }, -- mannequin_head
    },

    {
        { item = invaderXim.item.SHALL_SHELL, weight = 1000 }, -- shall_shell
    },

    {
        { item = invaderXim.item.MYTHRIL_BEASTCOIN, weight = 300 }, -- mythril_beastcoin
        { item = invaderXim.item.BLACK_ROCK,        weight =  70 }, -- black_rock
        { item = invaderXim.item.PURPLE_ROCK,       weight =  30 }, -- purple_rock
        { item = invaderXim.item.WHITE_ROCK,        weight = 100 }, -- white_rock
        { item = invaderXim.item.PLATOON_BOW,       weight = 100 }, -- platoon_bow
        { item = invaderXim.item.PLATOON_MACE,      weight = 100 }, -- platoon_mace
        { item = invaderXim.item.PLATOON_DISC,      weight = 150 }, -- platoon_disc
        { item = invaderXim.item.PLATOON_GUN,       weight = 150 }, -- platoon_gun
    },

    {
        { item = invaderXim.item.MYTHRIL_BEASTCOIN, weight = 310 }, -- mythril_beastcoin
        { item = invaderXim.item.GREEN_ROCK,        weight =  50 }, -- green_rock
        { item = invaderXim.item.YELLOW_ROCK,       weight =  40 }, -- yellow_rock
        { item = invaderXim.item.BLUE_ROCK,         weight =  40 }, -- blue_rock
        { item = invaderXim.item.RED_ROCK,          weight =  40 }, -- red_rock
        { item = invaderXim.item.TRANSLUCENT_ROCK,  weight = 110 }, -- translucent_rock
        { item = invaderXim.item.PLATOON_CESTI,     weight = 130 }, -- platoon_cesti
        { item = invaderXim.item.PLATOON_CUTTER,    weight = 100 }, -- platoon_cutter
        { item = invaderXim.item.PLATOON_SPATHA,    weight =  80 }, -- platoon_spatha
        { item = invaderXim.item.PLATOON_ZAGHNAL,   weight = 100 }, -- platoon_zaghnal
    },

    {
        { item = invaderXim.item.NONE,                    weight = 670 }, -- nothing
        { item = invaderXim.item.HANDFUL_OF_PUGIL_SCALES, weight = 190 }, -- handful_of_pugil_scales
        { item = invaderXim.item.SHALL_SHELL,             weight = 140 }, -- shall_shell
    },

    {
        { item = invaderXim.item.NONE,           weight = 930 }, -- nothing
        { item = invaderXim.item.MANNEQUIN_BODY, weight =  70 }, -- mannequin_body
    },

    {
        { item = invaderXim.item.SCROLL_OF_BLAZE_SPIKES,  weight = 180 }, -- scroll_of_blaze_spikes
        { item = invaderXim.item.SCROLL_OF_HORDE_LULLABY, weight = 510 }, -- scroll_of_horde_lullaby
        { item = invaderXim.item.THUNDER_SPIRIT_PACT,     weight = 280 }, -- thunder_spirit_pact
        { item = invaderXim.item.SCROLL_OF_WARP,          weight =  30 }, -- scroll_of_warp
    },
}

return content:register()
