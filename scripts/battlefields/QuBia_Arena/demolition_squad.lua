-----------------------------------
-- Demolition Squad
-- Qu'Bia Arena BCNM60, Moon Orb
-- !additem 1130
-----------------------------------
local qubiaID = zones[invaderXim.zone.QUBIA_ARENA]
-----------------------------------

local content = Battlefield:new({
    zoneId        = invaderXim.zone.QUBIA_ARENA,
    battlefieldId = invaderXim.battlefield.id.DEMOLITION_SQUAD,
    maxPlayers    = 6,
    levelCap      = 60,
    timeLimit     = utils.minutes(30),
    index         = 8,
    entryNpc      = 'BC_Entrance',
    exitNpc       = 'Burning_Circle',
    requiredItems = { invaderXim.item.MOON_ORB, wearMessage = qubiaID.text.A_CRACK_HAS_FORMED, wornMessage = qubiaID.text.ORB_IS_CRACKED },
    armouryCrates =
    {
        qubiaID.mob.NEPHIYL_RAMPARTBREACHER + 4,
        qubiaID.mob.NEPHIYL_RAMPARTBREACHER + 9,
        qubiaID.mob.NEPHIYL_RAMPARTBREACHER + 14,
    },
})

content.groups =
{
    {
        mobIds =
        {
            {
                qubiaID.mob.NEPHIYL_RAMPARTBREACHER,
                qubiaID.mob.NEPHIYL_RAMPARTBREACHER + 1,
                qubiaID.mob.NEPHIYL_RAMPARTBREACHER + 2,
                qubiaID.mob.NEPHIYL_RAMPARTBREACHER + 3,
            },

            {
                qubiaID.mob.NEPHIYL_RAMPARTBREACHER + 5,
                qubiaID.mob.NEPHIYL_RAMPARTBREACHER + 6,
                qubiaID.mob.NEPHIYL_RAMPARTBREACHER + 7,
                qubiaID.mob.NEPHIYL_RAMPARTBREACHER + 8,
            },

            {
                qubiaID.mob.NEPHIYL_RAMPARTBREACHER + 10,
                qubiaID.mob.NEPHIYL_RAMPARTBREACHER + 11,
                qubiaID.mob.NEPHIYL_RAMPARTBREACHER + 12,
                qubiaID.mob.NEPHIYL_RAMPARTBREACHER + 13,
            },
        },

        allDeath  = utils.bind(content.handleAllMonstersDefeated, content),
        superlink = true,
    },
}

content.loot =
{
    {
        { item = invaderXim.item.MARINE_M_GLOVES, weight = 125 }, -- marine_m_gloves
        { item = invaderXim.item.MARINE_F_GLOVES, weight = 125 }, -- marine_f_gloves
        { item = invaderXim.item.WOOD_GAUNTLETS,  weight = 125 }, -- wood_gauntlets
        { item = invaderXim.item.WOOD_GLOVES,     weight = 125 }, -- wood_gloves
        { item = invaderXim.item.CREEK_M_MITTS,   weight = 125 }, -- creek_m_mitts
        { item = invaderXim.item.CREEK_F_MITTS,   weight = 125 }, -- creek_f_mitts
        { item = invaderXim.item.RIVER_GAUNTLETS, weight = 125 }, -- river_gauntlets
        { item = invaderXim.item.DUNE_BRACERS,    weight = 125 }, -- dune_bracers
    },

    {
        { item = invaderXim.item.RED_CHIP,    weight = 125 }, -- red_chip
        { item = invaderXim.item.BLUE_CHIP,   weight = 125 }, -- blue_chip
        { item = invaderXim.item.YELLOW_CHIP, weight = 125 }, -- yellow_chip
        { item = invaderXim.item.GREEN_CHIP,  weight = 125 }, -- green_chip
        { item = invaderXim.item.CLEAR_CHIP,  weight = 125 }, -- clear_chip
        { item = invaderXim.item.PURPLE_CHIP, weight = 125 }, -- purple_chip
        { item = invaderXim.item.WHITE_CHIP,  weight = 125 }, -- white_chip
        { item = invaderXim.item.BLACK_CHIP,  weight = 125 }, -- black_chip
    },

    {
        { item = invaderXim.item.NONE,          weight = 125 }, -- nothing
        { item = invaderXim.item.MYTHRIL_INGOT, weight = 125 }, -- mythril_ingot
        { item = invaderXim.item.EBONY_LOG,     weight = 125 }, -- ebony_log
        { item = invaderXim.item.PETRIFIED_LOG, weight = 125 }, -- petrified_log
        { item = invaderXim.item.AQUAMARINE,    weight = 125 }, -- aquamarine
        { item = invaderXim.item.PAINITE,       weight = 125 }, -- painite
        { item = invaderXim.item.CHRYSOBERYL,   weight = 125 }, -- chrysoberyl
        { item = invaderXim.item.MOONSTONE,     weight = 125 }, -- moonstone
    },

    {
        { item = invaderXim.item.NONE,                      weight = 625 }, -- nothing
        { item = invaderXim.item.SCROLL_OF_RERAISE_II,      weight = 125 }, -- scroll_of_reraise_ii
        { item = invaderXim.item.SCROLL_OF_FLARE,           weight = 125 }, -- scroll_of_flare
        { item = invaderXim.item.SCROLL_OF_VALOR_MINUET_IV, weight = 125 }, -- scroll_of_valor_minuet_iv
    },

    {
        { item = invaderXim.item.NONE,           weight = 700 }, -- nothing
        { item = invaderXim.item.HI_POTION_P3,   weight =  75 }, -- hi-potion_+3
        { item = invaderXim.item.HI_RERAISER,    weight = 150 }, -- hi-reraiser
        { item = invaderXim.item.VILE_ELIXIR,    weight =  50 }, -- vile_elixir
        { item = invaderXim.item.VILE_ELIXIR_P1, weight =  25 }, -- vile_elixir_+1
    },
}

return content:register()
