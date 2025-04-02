-----------------------------------
-- Legion XI Comitatensis
-- Chamber of Oracles BCNM60, Moon Orb
-- !additem 1130
-----------------------------------
local chamberOfOraclesID = zones[invaderXim.zone.CHAMBER_OF_ORACLES]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.CHAMBER_OF_ORACLES,
    battlefieldId    = invaderXim.battlefield.id.LEGION_IXIM_COMITATENSIS,
    maxPlayers       = 6,
    levelCap         = 60,
    timeLimit        = utils.minutes(30),
    index            = 1,
    entryNpc         = 'SC_Entrance',
    exitNpc          = 'Shimmering_Circle',
    requiredItems    = { invaderXim.item.MOON_ORB, wearMessage = chamberOfOraclesID.text.A_CRACK_HAS_FORMED, wornMessage = chamberOfOraclesID.text.ORB_IS_CRACKED },
    armouryCrates    =
    {
        chamberOfOraclesID.mob.SECUTOR_IXIM_XXXII + 4,
        chamberOfOraclesID.mob.SECUTOR_IXIM_XXXII + 9,
        chamberOfOraclesID.mob.SECUTOR_IXIM_XXXII + 14,
    },
})

content.groups =
{
    {
        mobIds =
        {
            {
                chamberOfOraclesID.mob.SECUTOR_IXIM_XXXII,
                chamberOfOraclesID.mob.SECUTOR_IXIM_XXXII + 1,
                chamberOfOraclesID.mob.SECUTOR_IXIM_XXXII + 2,
                chamberOfOraclesID.mob.SECUTOR_IXIM_XXXII + 3,
            },

            {
                chamberOfOraclesID.mob.SECUTOR_IXIM_XXXII + 5,
                chamberOfOraclesID.mob.SECUTOR_IXIM_XXXII + 6,
                chamberOfOraclesID.mob.SECUTOR_IXIM_XXXII + 7,
                chamberOfOraclesID.mob.SECUTOR_IXIM_XXXII + 8,
            },

            {
                chamberOfOraclesID.mob.SECUTOR_IXIM_XXXII + 10,
                chamberOfOraclesID.mob.SECUTOR_IXIM_XXXII + 11,
                chamberOfOraclesID.mob.SECUTOR_IXIM_XXXII + 12,
                chamberOfOraclesID.mob.SECUTOR_IXIM_XXXII + 13,
            },
        },

        allDeath = utils.bind(content.handleAllMonstersDefeated, content),
    },
}

content.loot =
{
    {
        { item = invaderXim.item.NONE,             weight = 100 }, -- nothing
        { item = invaderXim.item.EVASION_TORQUE,   weight = 150 }, -- evasion_torque
        { item = invaderXim.item.PARRYING_TORQUE,  weight = 150 }, -- parrying_torque
        { item = invaderXim.item.GUARDING_TORQUE,  weight = 150 }, -- guarding_torque
        { item = invaderXim.item.NINJUTSU_TORQUE,  weight = 150 }, -- ninjutsu_torque
        { item = invaderXim.item.WIND_TORQUE,      weight = 150 }, -- wind_torque
        { item = invaderXim.item.SUMMONING_TORQUE, weight = 150 }, -- summoning_torque
    },

    {
        { item = invaderXim.item.NONE,              weight = 100 }, -- nothing
        { item = invaderXim.item.DIVINE_TORQUE,     weight = 150 }, -- divine_torque
        { item = invaderXim.item.DARK_TORQUE,       weight = 150 }, -- dark_torque
        { item = invaderXim.item.ENHANCING_TORQUE,  weight = 150 }, -- enhancing_torque
        { item = invaderXim.item.ENFEEBLING_TORQUE, weight = 150 }, -- enfeebling_torque
        { item = invaderXim.item.ELEMENTAL_TORQUE,  weight = 150 }, -- elemental_torque
        { item = invaderXim.item.HEALING_TORQUE,    weight = 150 }, -- healing_torque
    },

    {
        { item = invaderXim.item.SUNSTONE,          weight = 100 }, -- sunstone
        { item = invaderXim.item.CHUNK_OF_GOLD_ORE, weight = 100 }, -- chunk_of_gold_ore
        { item = invaderXim.item.JADEITE,           weight = 100 }, -- jadeite
        { item = invaderXim.item.FLUORITE,          weight = 100 }, -- fluorite
        { item = invaderXim.item.DARKSTEEL_INGOT,   weight = 100 }, -- darksteel_ingot
        { item = invaderXim.item.ZIRCON,            weight = 100 }, -- zircon
        { item = invaderXim.item.CHRYSOBERYL,       weight = 100 }, -- chrysoberyl
        { item = invaderXim.item.MOONSTONE,         weight = 100 }, -- moonstone
        { item = invaderXim.item.PAINITE,           weight = 100 }, -- painite
        { item = invaderXim.item.STEEL_INGOT,       weight = 100 }, -- steel_ingot
    },

    {
        { item = invaderXim.item.NONE,               weight = 500 }, -- nothing
        { item = invaderXim.item.SCROLL_OF_RAISE_II, weight = 500 }, -- scroll_of_raise_ii
    },

    {
        { item = invaderXim.item.NONE,           weight = 950 }, -- nothing
        { item = invaderXim.item.VILE_ELIXIR_P1, weight =  50 }, -- vile_elixir_+1
    },

    {
        { item = invaderXim.item.YELLOW_ROCK,        weight =  50 }, -- yellow_rock
        { item = invaderXim.item.WHITE_ROCK,         weight =  50 }, -- white_rock
        { item = invaderXim.item.EBONY_LOG,          weight = 125 }, -- ebony_log
        { item = invaderXim.item.PLATINUM_BEASTCOIN, weight = 775 }, -- platinum_beastcoin
    },

    {
        { item = invaderXim.item.NONE,                   weight = 600 }, -- nothing
        { item = invaderXim.item.CHUNK_OF_WATER_ORE,     weight =  50 }, -- chunk_of_water_ore
        { item = invaderXim.item.CHUNK_OF_ICE_ORE,       weight =  50 }, -- chunk_of_ice_ore
        { item = invaderXim.item.CHUNK_OF_LIGHTNING_ORE, weight =  50 }, -- chunk_of_lightning_ore
        { item = invaderXim.item.CHUNK_OF_EARTH_ORE,     weight =  50 }, -- chunk_of_earth_ore
        { item = invaderXim.item.CHUNK_OF_FIRE_ORE,      weight =  50 }, -- chunk_of_fire_ore
        { item = invaderXim.item.CHUNK_OF_LIGHT_ORE,     weight =  50 }, -- chunk_of_light_ore
        { item = invaderXim.item.CHUNK_OF_DARK_ORE,      weight =  50 }, -- chunk_of_dark_ore
        { item = invaderXim.item.CHUNK_OF_WIND_ORE,      weight =  50 }, -- chunk_of_wind_ore
    },
}

return content:register()
