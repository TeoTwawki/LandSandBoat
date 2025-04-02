-----------------------------------
-- The Worm's Turn
-- Waughroon Shrine BCNM40, Star Orb
-- !additem 1131
-----------------------------------
local waughroonID = zones[invaderXim.zone.WAUGHROON_SHRINE]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.WAUGHROON_SHRINE,
    battlefieldId    = invaderXim.battlefield.id.WORMS_TURN,
    maxPlayers       = 6,
    levelCap         = 40,
    timeLimit        = utils.minutes(30),
    index            = 1,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { invaderXim.item.STAR_ORB, wearMessage = waughroonID.text.A_CRACK_HAS_FORMED, wornMessage = waughroonID.text.ORB_IS_CRACKED },
    armouryCrates    =
    {
        waughroonID.mob.FLAYER_FRANZ + 16,
        waughroonID.mob.FLAYER_FRANZ + 33,
        waughroonID.mob.FLAYER_FRANZ + 50,
    },
})

content.groups =
{
    {
        mobIds =
        {
            {
                waughroonID.mob.FLAYER_FRANZ,
                waughroonID.mob.FLAYER_FRANZ + 1,
                waughroonID.mob.FLAYER_FRANZ + 2,
                waughroonID.mob.FLAYER_FRANZ + 3,
                waughroonID.mob.FLAYER_FRANZ + 4,
                waughroonID.mob.FLAYER_FRANZ + 5,
                waughroonID.mob.FLAYER_FRANZ + 6,
                waughroonID.mob.FLAYER_FRANZ + 7,
                waughroonID.mob.FLAYER_FRANZ + 8,
                waughroonID.mob.FLAYER_FRANZ + 9,
                waughroonID.mob.FLAYER_FRANZ + 10,
                waughroonID.mob.FLAYER_FRANZ + 11,
                waughroonID.mob.FLAYER_FRANZ + 12,
                waughroonID.mob.FLAYER_FRANZ + 13,
                waughroonID.mob.FLAYER_FRANZ + 14,
                waughroonID.mob.FLAYER_FRANZ + 15,
            },

            {
                waughroonID.mob.FLAYER_FRANZ + 17,
                waughroonID.mob.FLAYER_FRANZ + 18,
                waughroonID.mob.FLAYER_FRANZ + 19,
                waughroonID.mob.FLAYER_FRANZ + 20,
                waughroonID.mob.FLAYER_FRANZ + 21,
                waughroonID.mob.FLAYER_FRANZ + 22,
                waughroonID.mob.FLAYER_FRANZ + 23,
                waughroonID.mob.FLAYER_FRANZ + 24,
                waughroonID.mob.FLAYER_FRANZ + 25,
                waughroonID.mob.FLAYER_FRANZ + 26,
                waughroonID.mob.FLAYER_FRANZ + 27,
                waughroonID.mob.FLAYER_FRANZ + 28,
                waughroonID.mob.FLAYER_FRANZ + 29,
                waughroonID.mob.FLAYER_FRANZ + 30,
                waughroonID.mob.FLAYER_FRANZ + 31,
                waughroonID.mob.FLAYER_FRANZ + 32,
            },

            {
                waughroonID.mob.FLAYER_FRANZ + 34,
                waughroonID.mob.FLAYER_FRANZ + 35,
                waughroonID.mob.FLAYER_FRANZ + 36,
                waughroonID.mob.FLAYER_FRANZ + 37,
                waughroonID.mob.FLAYER_FRANZ + 38,
                waughroonID.mob.FLAYER_FRANZ + 39,
                waughroonID.mob.FLAYER_FRANZ + 40,
                waughroonID.mob.FLAYER_FRANZ + 41,
                waughroonID.mob.FLAYER_FRANZ + 42,
                waughroonID.mob.FLAYER_FRANZ + 43,
                waughroonID.mob.FLAYER_FRANZ + 44,
                waughroonID.mob.FLAYER_FRANZ + 45,
                waughroonID.mob.FLAYER_FRANZ + 46,
                waughroonID.mob.FLAYER_FRANZ + 47,
                waughroonID.mob.FLAYER_FRANZ + 48,
                waughroonID.mob.FLAYER_FRANZ + 49,
            },
        },

        allDeath = utils.bind(content.handleAllMonstersDefeated, content),
    },
}

content.loot =
{
    {
        { item = invaderXim.item.NONE,                  weight = 125 }, -- nothing
        { item = invaderXim.item.FIRE_SPIRIT_PACT,      weight = 125 }, -- fire_spirit_pact
        { item = invaderXim.item.SCROLL_OF_PHALANX,     weight = 125 }, -- scroll_of_phalanx
        { item = invaderXim.item.SCROLL_OF_UTSUSEMI_NI, weight = 125 }, -- scroll_of_utsusemi_ni
        { item = invaderXim.item.SCROLL_OF_ERASE,       weight = 125 }, -- scroll_of_erase
        { item = invaderXim.item.SCROLL_OF_ICE_SPIKES,  weight = 125 }, -- scroll_of_ice_spikes
        { item = invaderXim.item.SCROLL_OF_ABSORB_STR,  weight = 125 }, -- scroll_of_absorb-str
        { item = invaderXim.item.SCROLL_OF_REFRESH,     weight = 125 }, -- scroll_of_refresh
    },

    {
        { item = invaderXim.item.NONE,              weight = 125 }, -- nothing
        { item = invaderXim.item.ENHANCING_EARRING, weight = 125 }, -- enhancing_earring
        { item = invaderXim.item.SPIRIT_TORQUE,     weight = 125 }, -- spirit_torque
        { item = invaderXim.item.GUARDING_GORGET,   weight = 125 }, -- guarding_gorget
        { item = invaderXim.item.NEMESIS_EARRING,   weight = 125 }, -- nemesis_earring
        { item = invaderXim.item.EARTH_MANTLE,      weight = 125 }, -- earth_mantle
        { item = invaderXim.item.STRIKE_SHIELD,     weight = 125 }, -- strike_shield
        { item = invaderXim.item.SHIKAR_BOW,        weight = 125 }, -- shikar_bow
    },

    {
        { item = invaderXim.item.OAK_LOG,      weight = 500 }, -- oak_log
        { item = invaderXim.item.ROSEWOOD_LOG, weight = 500 }, -- rosewood_log
    },

    {
        { item = invaderXim.item.GOLD_BEASTCOIN,    weight = 500 }, -- gold_beastcoin
        { item = invaderXim.item.MYTHRIL_BEASTCOIN, weight = 500 }, -- mythril_beastcoin
    },

    {
        { item = invaderXim.item.BLACK_PEARL, weight = 200 }, -- black_pearl
        { item = invaderXim.item.AMETRINE,    weight = 200 }, -- ametrine
        { item = invaderXim.item.YELLOW_ROCK, weight = 200 }, -- yellow_rock
        { item = invaderXim.item.PERIDOT,     weight = 200 }, -- peridot
        { item = invaderXim.item.TURQUOISE,   weight = 200 }, -- turquoise
    },

    {
        { item = invaderXim.item.NONE,     weight = 800 }, -- nothing
        { item = invaderXim.item.RERAISER, weight = 200 }, -- reraiser
    },
}

return content:register()
