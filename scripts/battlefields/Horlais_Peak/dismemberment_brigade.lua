-----------------------------------
-- Dismemberment Brigade
-- Horlais Peak BCNM60, Moon Orb
-- !additem 1130
-----------------------------------
local horlaisID = zones[invaderXim.zone.HORLAIS_PEAK]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.HORLAIS_PEAK,
    battlefieldId    = invaderXim.battlefield.id.DISMEMBERMENT_BRIGADE,
    maxPlayers       = 6,
    levelCap         = 60,
    timeLimit        = utils.minutes(30),
    index            = 2,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { invaderXim.item.MOON_ORB, wearMessage = horlaisID.text.A_CRACK_HAS_FORMED, wornMessage = horlaisID.text.ORB_IS_CRACKED },
    armouryCrates    =
    {
        horlaisID.mob.ARMSMASTER_DEKBUK + 6,
        horlaisID.mob.ARMSMASTER_DEKBUK + 13,
        horlaisID.mob.ARMSMASTER_DEKBUK + 20,
    },
})

content.groups =
{
    {
        mobIds =
        {
            {
                horlaisID.mob.ARMSMASTER_DEKBUK,
                horlaisID.mob.ARMSMASTER_DEKBUK + 1,
                horlaisID.mob.ARMSMASTER_DEKBUK + 2,
                horlaisID.mob.ARMSMASTER_DEKBUK + 3,
                horlaisID.mob.ARMSMASTER_DEKBUK + 4,
                horlaisID.mob.ARMSMASTER_DEKBUK + 5,
            },

            {
                horlaisID.mob.ARMSMASTER_DEKBUK + 7,
                horlaisID.mob.ARMSMASTER_DEKBUK + 8,
                horlaisID.mob.ARMSMASTER_DEKBUK + 9,
                horlaisID.mob.ARMSMASTER_DEKBUK + 10,
                horlaisID.mob.ARMSMASTER_DEKBUK + 11,
                horlaisID.mob.ARMSMASTER_DEKBUK + 12,
            },

            {
                horlaisID.mob.ARMSMASTER_DEKBUK + 14,
                horlaisID.mob.ARMSMASTER_DEKBUK + 15,
                horlaisID.mob.ARMSMASTER_DEKBUK + 16,
                horlaisID.mob.ARMSMASTER_DEKBUK + 17,
                horlaisID.mob.ARMSMASTER_DEKBUK + 18,
                horlaisID.mob.ARMSMASTER_DEKBUK + 19,
            },
        },

        allDeath = utils.bind(content.handleAllMonstersDefeated, content),
    },
}

content.loot =
{
    {
        { item = invaderXim.item.KABRAKANS_AXE, weight = 250 }, -- kabrakans_axe
        { item = invaderXim.item.SARNGA,        weight = 250 }, -- sarnga
        { item = invaderXim.item.DRAGVANDIL,    weight = 250 }, -- dragvandil
        { item = invaderXim.item.HAMELIN_FLUTE, weight = 250 }, -- hamelin_flute
    },

    {
        { item = invaderXim.item.NONE,            weight = 400 }, -- nothing
        { item = invaderXim.item.SPECTACLES,      weight = 200 }, -- spectacles
        { item = invaderXim.item.ASSAULT_EARRING, weight = 200 }, -- assault_earring
        { item = invaderXim.item.PEACE_RING,      weight = 200 }, -- peace_ring
    },

    {
        { item = invaderXim.item.NONE,             weight = 200 }, -- nothing
        { item = invaderXim.item.TRANSLUCENT_ROCK, weight = 200 }, -- translucent_rock
        { item = invaderXim.item.GREEN_ROCK,       weight = 200 }, -- green_rock
        { item = invaderXim.item.YELLOW_ROCK,      weight = 200 }, -- yellow_rock
        { item = invaderXim.item.PURPLE_ROCK,      weight = 200 }, -- purple_rock
    },

    {
        { item = invaderXim.item.PAINITE,         weight = 100 }, -- painite
        { item = invaderXim.item.JADEITE,         weight = 100 }, -- jadeite
        { item = invaderXim.item.MYTHRIL_INGOT,   weight = 100 }, -- mythril_ingot
        { item = invaderXim.item.STEEL_INGOT,     weight = 100 }, -- steel_ingot
        { item = invaderXim.item.FLUORITE,        weight = 100 }, -- fluorite
        { item = invaderXim.item.GOLD_INGOT,      weight = 100 }, -- gold_ingot
        { item = invaderXim.item.ZIRCON,          weight = 100 }, -- zircon
        { item = invaderXim.item.CHRYSOBERYL,     weight = 100 }, -- chrysoberyl
        { item = invaderXim.item.DARKSTEEL_INGOT, weight = 100 }, -- darksteel_ingot
        { item = invaderXim.item.MOONSTONE,       weight = 100 }, -- moonstone
    },

    {
        { item = invaderXim.item.NONE,           weight =  900 }, -- nothing
        { item = invaderXim.item.VILE_ELIXIR_P1, weight =  100 }, -- vile_elixir_+1
    },
}

return content:register()
