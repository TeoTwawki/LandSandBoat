-----------------------------------
-- Brothers D'Aurphe
-- Qu'Bia Arena BCNM60, Moon Orb
-- !additem 1130
-----------------------------------
local qubiaID = zones[invaderXim.zone.QUBIA_ARENA]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.QUBIA_ARENA,
    battlefieldId    = invaderXim.battlefield.id.BROTHERS_D_AURPHE,
    maxPlayers       = 6,
    levelCap         = 60,
    timeLimit        = utils.minutes(30),
    index            = 11,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { invaderXim.item.MOON_ORB, wearMessage = qubiaID.text.A_CRACK_HAS_FORMED, wornMessage = qubiaID.text.ORB_IS_CRACKED },
    armouryCrates    =
    {
        qubiaID.mob.VAICOLIAUX_B_DAURPHE + 4,
        qubiaID.mob.VAICOLIAUX_B_DAURPHE + 9,
        qubiaID.mob.VAICOLIAUX_B_DAURPHE + 14,
    },
})

content.groups =
{
    {
        mobIds =
        {
            {
                qubiaID.mob.VAICOLIAUX_B_DAURPHE,
                qubiaID.mob.VAICOLIAUX_B_DAURPHE + 1,
                qubiaID.mob.VAICOLIAUX_B_DAURPHE + 2,
                qubiaID.mob.VAICOLIAUX_B_DAURPHE + 3,
            },

            {
                qubiaID.mob.VAICOLIAUX_B_DAURPHE + 5,
                qubiaID.mob.VAICOLIAUX_B_DAURPHE + 6,
                qubiaID.mob.VAICOLIAUX_B_DAURPHE + 7,
                qubiaID.mob.VAICOLIAUX_B_DAURPHE + 8,
            },

            {
                qubiaID.mob.VAICOLIAUX_B_DAURPHE + 10,
                qubiaID.mob.VAICOLIAUX_B_DAURPHE + 11,
                qubiaID.mob.VAICOLIAUX_B_DAURPHE + 12,
                qubiaID.mob.VAICOLIAUX_B_DAURPHE + 13,
            },
        },

        allDeath = utils.bind(content.handleAllMonstersDefeated, content),
    },
}

content.loot =
{
    {
        { item = invaderXim.item.CREEK_M_CLOMPS,   weight = 125 }, -- creek_m_clomps
        { item = invaderXim.item.CREEK_F_CLOMPS,   weight = 125 }, -- creek_f_clomps
        { item = invaderXim.item.MARINE_M_BOOTS,   weight = 125 }, -- marine_m_boots
        { item = invaderXim.item.MARINE_F_BOOTS,   weight = 125 }, -- marine_f_boots
        { item = invaderXim.item.WOOD_M_LEDELSENS, weight = 125 }, -- wood_m_ledelsens
        { item = invaderXim.item.WOOD_F_LEDELSENS, weight = 125 }, -- wood_f_ledelsens
        { item = invaderXim.item.DUNE_SANDALS,     weight = 125 }, -- dune_sandals
        { item = invaderXim.item.RIVER_GAITERS,    weight = 125 }, -- river_gaiters
    },

    {
        { item = invaderXim.item.CROSS_COUNTERS, weight =  43 }, -- cross-counters
        { item = invaderXim.item.CHRYSOBERYL,    weight =  10 }, -- chrysoberyl
        { item = invaderXim.item.JADEITE,        weight =  94 }, -- jadeite
        { item = invaderXim.item.SUNSTONE,       weight = 113 }, -- sunstone
        { item = invaderXim.item.ZIRCON,         weight =  75 }, -- zircon
        { item = invaderXim.item.CLEAR_CHIP,     weight =  10 }, -- clear_chip
        { item = invaderXim.item.RED_CHIP,       weight =  38 }, -- red_chip
        { item = invaderXim.item.YELLOW_CHIP,    weight =  38 }, -- yellow_chip
        { item = invaderXim.item.GOLD_INGOT,     weight = 151 }, -- gold_ingot
        { item = invaderXim.item.PURPLE_ROCK,    weight =  19 }, -- purple_rock
        { item = invaderXim.item.WHITE_ROCK,     weight =  19 }, -- white_rock
    },

    {
        { item = invaderXim.item.STEEL_INGOT,      weight = 132 }, -- steel_ingot
        { item = invaderXim.item.TRANSLUCENT_ROCK, weight = 113 }, -- translucent_rock
        { item = invaderXim.item.DARKSTEEL_INGOT,  weight = 113 }, -- darksteel_ingot
        { item = invaderXim.item.PAINITE,          weight =  50 }, -- painite
        { item = invaderXim.item.EBONY_LOG,        weight = 132 }, -- ebony_log
        { item = invaderXim.item.WHITE_CHIP,       weight =  10 }, -- white_chip
        { item = invaderXim.item.MOONSTONE,        weight = 151 }, -- moonstone
        { item = invaderXim.item.ZIRCON,           weight =  75 }, -- zircon
        { item = invaderXim.item.FLUORITE,         weight =  57 }, -- fluorite
        { item = invaderXim.item.CHRYSOBERYL,      weight =  57 }, -- chrysoberyl
        { item = invaderXim.item.GREEN_ROCK,       weight =  38 }, -- green_rock
        { item = invaderXim.item.HI_RERAISER,      weight =  38 }, -- hi-reraiser
        { item = invaderXim.item.VILE_ELIXIR_P1,   weight =  38 }, -- vile_elixir_+1
    },

    {
        { item = invaderXim.item.SCROLL_OF_FLARE,           weight = 283 }, -- scroll_of_flare
        { item = invaderXim.item.SCROLL_OF_VALOR_MINUET_IV, weight = 358 }, -- scroll_of_valor_minuet_iv
        { item = invaderXim.item.SCROLL_OF_RERAISE_II,      weight = 264 }, -- scroll_of_reraise_ii
    },

    {
        { item = invaderXim.item.NONE,        weight = 957 }, -- nothing
        { item = invaderXim.item.EURYTOS_BOW, weight =  43 }, -- eurytos_bow
    },

    {
        { item = invaderXim.item.NONE,          weight = 582 }, -- nothing
        { item = invaderXim.item.MYTHRIL_INGOT, weight = 302 }, -- mythril_ingot
        { item = invaderXim.item.BLUE_CHIP,     weight =  19 }, -- blue_chip
        { item = invaderXim.item.BLACK_CHIP,    weight =  38 }, -- black_chip
        { item = invaderXim.item.PURPLE_CHIP,   weight =  10 }, -- purple_chip
        { item = invaderXim.item.GREEN_CHIP,    weight =  19 }, -- green_chip
        { item = invaderXim.item.MAHOGANY_LOG,  weight =  10 }, -- mahogany_log
        { item = invaderXim.item.RED_ROCK,      weight =  10 }, -- red_rock
        { item = invaderXim.item.BLACK_ROCK,    weight =  10 }, -- black_rock
    },

    {
        { item = invaderXim.item.NONE,         weight = 887 }, -- nothing
        { item = invaderXim.item.HI_POTION_P3, weight = 113 }, -- hi-potion_+3
    },
}

return content:register()
