-----------------------------------
-- Steamed Sprouts
-- Balga's Dais BCNM40, Star Orb
-- !additem 1131
-----------------------------------
local balgasID = zones[invaderXim.zone.BALGAS_DAIS]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.BALGAS_DAIS,
    battlefieldId    = invaderXim.battlefield.id.STEAMED_SPROUTS,
    maxPlayers       = 6,
    levelCap         = 40,
    timeLimit        = utils.minutes(30),
    index            = 1,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { invaderXim.item.STAR_ORB, wearMessage = balgasID.text.A_CRACK_HAS_FORMED, wornMessage = balgasID.text.ORB_IS_CRACKED },
    armouryCrates    =
    {
        balgasID.mob.DVOROVOI + 8,
        balgasID.mob.DVOROVOI + 17,
        balgasID.mob.DVOROVOI + 26,
    },
})

content.groups =
{
    {
        mobIds =
        {
            {
                balgasID.mob.DVOROVOI,
                balgasID.mob.DVOROVOI + 1,
                balgasID.mob.DVOROVOI + 2,
                balgasID.mob.DVOROVOI + 3,
                balgasID.mob.DVOROVOI + 4,
                balgasID.mob.DVOROVOI + 5,
                balgasID.mob.DVOROVOI + 6,
                balgasID.mob.DVOROVOI + 7,
            },

            {
                balgasID.mob.DVOROVOI + 9,
                balgasID.mob.DVOROVOI + 10,
                balgasID.mob.DVOROVOI + 11,
                balgasID.mob.DVOROVOI + 12,
                balgasID.mob.DVOROVOI + 13,
                balgasID.mob.DVOROVOI + 14,
                balgasID.mob.DVOROVOI + 15,
                balgasID.mob.DVOROVOI + 16,
            },

            {
                balgasID.mob.DVOROVOI + 18,
                balgasID.mob.DVOROVOI + 19,
                balgasID.mob.DVOROVOI + 20,
                balgasID.mob.DVOROVOI + 21,
                balgasID.mob.DVOROVOI + 22,
                balgasID.mob.DVOROVOI + 23,
                balgasID.mob.DVOROVOI + 24,
                balgasID.mob.DVOROVOI + 25,
            },
        },

        allDeath = utils.bind(content.handleAllMonstersDefeated, content),
    },
}

content.loot =
{
    {
        { item = invaderXim.item.GOLD_BEASTCOIN,    weight = 500 }, -- gold_beastcoin
        { item = invaderXim.item.MYTHRIL_BEASTCOIN, weight = 500 }, -- mythril_beastcoin
    },

    {
        { item = invaderXim.item.NONE,        weight = 750 }, -- nothing
        { item = invaderXim.item.VILE_ELIXIR, weight = 250 }, -- vile_elixir
    },

    {
        { item = invaderXim.item.NONE,              weight = 600 }, -- nothing
        { item = invaderXim.item.SURVIVAL_BELT,     weight = 100 }, -- survival_belt
        { item = invaderXim.item.GUARDING_GORGET,   weight = 100 }, -- guarding_gorget
        { item = invaderXim.item.ENHANCING_EARRING, weight = 100 }, -- enhancing_earring
        { item = invaderXim.item.BALANCE_BUCKLER,   weight = 100 }, -- balance_buckler
    },

    {
        { item = invaderXim.item.WHITE_ROCK,       weight = 125 }, -- white_rock
        { item = invaderXim.item.TRANSLUCENT_ROCK, weight = 125 }, -- translucent_rock
        { item = invaderXim.item.PURPLE_ROCK,      weight = 125 }, -- purple_rock
        { item = invaderXim.item.RED_ROCK,         weight = 125 }, -- red_rock
        { item = invaderXim.item.BLUE_ROCK,        weight = 125 }, -- blue_rock
        { item = invaderXim.item.YELLOW_ROCK,      weight = 125 }, -- yellow_rock
        { item = invaderXim.item.GREEN_ROCK,       weight = 125 }, -- green_rock
        { item = invaderXim.item.BLACK_ROCK,       weight = 125 }, -- black_rock
    },

    {
        { item = invaderXim.item.GARNET,       weight =  50 }, -- garnet
        { item = invaderXim.item.BLACK_PEARL,  weight =  50 }, -- black_pearl
        { item = invaderXim.item.AMETRINE,     weight =  50 }, -- ametrine
        { item = invaderXim.item.PAINITE,      weight =  50 }, -- painite
        { item = invaderXim.item.PEARL,        weight =  50 }, -- pearl
        { item = invaderXim.item.OAK_LOG,      weight = 100 }, -- oak_log
        { item = invaderXim.item.GOSHENITE,    weight = 100 }, -- goshenite
        { item = invaderXim.item.SPHENE,       weight = 100 }, -- sphene
        { item = invaderXim.item.ROSEWOOD_LOG, weight = 100 }, -- rosewood_log
        { item = invaderXim.item.TURQUOISE,    weight = 100 }, -- turquoise
        { item = invaderXim.item.SAPPHIRE,     weight = 100 }, -- sapphire
        { item = invaderXim.item.PERIDOT,      weight = 150 }, -- peridot
    },

    {
        { item = invaderXim.item.NONE,                  weight = 125 }, -- nothing
        { item = invaderXim.item.SCROLL_OF_REFRESH,     weight = 125 }, -- scroll_of_refresh
        { item = invaderXim.item.FIRE_SPIRIT_PACT,      weight = 125 }, -- fire_spirit_pact
        { item = invaderXim.item.SCROLL_OF_ERASE,       weight = 125 }, -- scroll_of_erase
        { item = invaderXim.item.SCROLL_OF_ABSORB_STR,  weight = 125 }, -- scroll_of_absorb-str
        { item = invaderXim.item.SCROLL_OF_PHALANX,     weight = 125 }, -- scroll_of_phalanx
        { item = invaderXim.item.SCROLL_OF_ICE_SPIKES,  weight = 125 }, -- scroll_of_ice_spikes
        { item = invaderXim.item.SCROLL_OF_UTSUSEMI_NI, weight = 125 }, -- scroll_of_utsusemi_ni
    },
}

return content:register()
