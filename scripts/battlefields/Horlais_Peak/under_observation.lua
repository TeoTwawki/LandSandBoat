-----------------------------------
-- Under Observation
-- Horlais Peak BCNM40, Star Orb
-- !additem 1131
-----------------------------------
local horlaisID = zones[invaderXim.zone.HORLAIS_PEAK]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.HORLAIS_PEAK,
    battlefieldId    = invaderXim.battlefield.id.UNDER_OBSERVATION,
    maxPlayers       = 3,
    levelCap         = 40,
    timeLimit        = utils.minutes(15),
    index            = 12,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { invaderXim.item.STAR_ORB, wearMessage = horlaisID.text.A_CRACK_HAS_FORMED, wornMessage = horlaisID.text.ORB_IS_CRACKED },
})

content:addEssentialMobs({ 'Sobbing_Eyes', 'Compound_Eyes' })

content.loot =
{
    {
        { item = invaderXim.item.NONE,          weight = 910 }, -- Nothing
        { item = invaderXim.item.PEACOCK_CHARM, weight =  90 }, -- Peacock Charm
    },

    {
        { item = invaderXim.item.NONE,          weight = 467 }, -- Nothing
        { item = invaderXim.item.BEHOURD_LANCE, weight =  48 }, -- Behourd Lance
        { item = invaderXim.item.MUTILATOR,     weight =  61 }, -- Mutilator
        { item = invaderXim.item.RAIFU,         weight =  46 }, -- Raifu
        { item = invaderXim.item.TILT_BELT,     weight = 302 }, -- Tilt Belt
        { item = invaderXim.item.TOURNEY_PATAS, weight =  76 }, -- Tourney Patas
    },

    {
        { item = invaderXim.item.NONE,                  weight = 413 }, -- Nothing
        { item = invaderXim.item.BUZZARD_TUCK,          weight =  42 }, -- Buzzard Tuck
        { item = invaderXim.item.DE_SAINTRES_AXE,       weight =  77 }, -- De Saintres Axe
        { item = invaderXim.item.GRUDGE_SWORD,          weight =  73 }, -- Grudge Sword
        { item = invaderXim.item.MANTRA_BELT,           weight = 258 }, -- Mantra Belt
        { item = invaderXim.item.SCROLL_OF_REFRESH,     weight =  68 }, -- Scroll Of Refresh
        { item = invaderXim.item.SCROLL_OF_UTSUSEMI_NI, weight =  55 }, -- Scroll Of Utsusemi Ni
        { item = invaderXim.item.SCROLL_OF_ICE_SPIKES,  weight =  14 }, -- Scroll Of Ice Spikes
    },

    {
        { item = invaderXim.item.SCROLL_OF_ICE_SPIKES,  weight = 114 }, -- Scroll Of Ice Spikes
        { item = invaderXim.item.SCROLL_OF_REFRESH,     weight = 174 }, -- Scroll Of Refresh
        { item = invaderXim.item.SCROLL_OF_UTSUSEMI_NI, weight = 138 }, -- Scroll Of Utsusemi Ni
        { item = invaderXim.item.RED_ROCK,              weight =  16 }, -- Red Rock
        { item = invaderXim.item.BLUE_ROCK,             weight =  17 }, -- Blue Rock
        { item = invaderXim.item.YELLOW_ROCK,           weight =  17 }, -- Yellow Rock
        { item = invaderXim.item.GREEN_ROCK,            weight =  18 }, -- Green Rock
        { item = invaderXim.item.TRANSLUCENT_ROCK,      weight =  17 }, -- Translucent Rock
        { item = invaderXim.item.PURPLE_ROCK,           weight =  16 }, -- Purple Rock
        { item = invaderXim.item.BLACK_ROCK,            weight =  18 }, -- Black Rock
        { item = invaderXim.item.WHITE_ROCK,            weight =  16 }, -- White Rock
        { item = invaderXim.item.MYTHRIL_BEASTCOIN,     weight = 102 }, -- Mythril Beastcoin
        { item = invaderXim.item.GOLD_BEASTCOIN,        weight = 120 }, -- Gold Beastcoin
        { item = invaderXim.item.OAK_LOG,               weight =  22 }, -- Oak Log
        { item = invaderXim.item.AMETRINE,              weight =  18 }, -- Ametrine
        { item = invaderXim.item.BLACK_PEARL,           weight =  18 }, -- Black Pearl
        { item = invaderXim.item.GARNET,                weight =  20 }, -- Garnet
        { item = invaderXim.item.GOSHENITE,             weight =  19 }, -- Goshenite
        { item = invaderXim.item.PEARL,                 weight =  21 }, -- Pearl
        { item = invaderXim.item.PERIDOT,               weight =  35 }, -- Peridot
        { item = invaderXim.item.SPHENE,                weight =  17 }, -- Sphene
        { item = invaderXim.item.TURQUOISE,             weight =  23 }, -- Turquoise
        { item = invaderXim.item.RERAISER,              weight =  21 }, -- Reraiser
        { item = invaderXim.item.VILE_ELIXIR,           weight =  16 }, -- Vile Elixir
    },

    {
        { item = invaderXim.item.FIRE_SPIRIT_PACT,     weight = 116 }, -- Fire Spirit Pact
        { item = invaderXim.item.SCROLL_OF_ABSORB_STR, weight = 113 }, -- Scroll Of Absorb-str
        { item = invaderXim.item.SCROLL_OF_ERASE,      weight = 137 }, -- Scroll Of Erase
        { item = invaderXim.item.SCROLL_OF_ICE_SPIKES, weight =  67 }, -- Scroll Of Ice Spikes
        { item = invaderXim.item.SCROLL_OF_PHALANX,    weight =  99 }, -- Scroll Of Phalanx
        { item = invaderXim.item.AMETRINE,             weight =  58 }, -- Ametrine
        { item = invaderXim.item.BLACK_PEARL,          weight =  52 }, -- Black Pearl
        { item = invaderXim.item.GARNET,               weight =  51 }, -- Garnet
        { item = invaderXim.item.GOSHENITE,            weight =  65 }, -- Goshenite
        { item = invaderXim.item.PEARL,                weight =  61 }, -- Pearl
        { item = invaderXim.item.PERIDOT,              weight =  63 }, -- Peridot
        { item = invaderXim.item.SPHENE,               weight =  55 }, -- Sphene
        { item = invaderXim.item.TURQUOISE,            weight =  62 }, -- Turquoise
    },

    {
        { item = invaderXim.item.HECTEYES_EYE, weight = 1000 }, -- Hecteyes Eye
    },

    {
        { item = invaderXim.item.VIAL_OF_MERCURY, weight = 1000 }, -- Vial Of Mercury
    },
}

return content:register()
