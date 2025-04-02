-----------------------------------
-- Rank 5 Mission
-- Qu'Bia Arena mission battlefield
-----------------------------------
local qubiaID = zones[invaderXim.zone.QUBIA_ARENA]
-----------------------------------

local content = BattlefieldMission:new({
    zoneId                = invaderXim.zone.QUBIA_ARENA,
    battlefieldId         = invaderXim.battlefield.id.RANK_5_MISSION,
    canLoseExp            = false,
    isMission             = true,
    allowTrusts           = true,
    maxPlayers            = 6,
    levelCap              = 50,
    timeLimit             = utils.minutes(30),
    index                 = 0,
    entryNpc              = 'BC_Entrance',
    exitNpc               = 'Burning_Circle',
    mission               = invaderXim.mission.id.nation.ARCHLICH,
    requiredMissionStatus = 11,
    title                 = invaderXim.title.ARCHMAGE_ASSASSIN,
})

content.groups =
{
    {
        mobIds =
        {
            { qubiaID.mob.ARCHLICH_TABERQUOAN      },
            { qubiaID.mob.ARCHLICH_TABERQUOAN + 7  },
            { qubiaID.mob.ARCHLICH_TABERQUOAN + 14 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,

        superlinkGroup = 1,
    },

    -- Sorcerers
    {
        mobIds =
        {
            {
                qubiaID.mob.ARCHLICH_TABERQUOAN + 1,
                qubiaID.mob.ARCHLICH_TABERQUOAN + 2,
            },

            {
                qubiaID.mob.ARCHLICH_TABERQUOAN + 8,
                qubiaID.mob.ARCHLICH_TABERQUOAN + 9,
            },

            {
                qubiaID.mob.ARCHLICH_TABERQUOAN + 15,
                qubiaID.mob.ARCHLICH_TABERQUOAN + 16,
            },
        },

        superlinkGroup = 1,
    },

    -- Warriors
    {
        mobIds =
        {
            {
                qubiaID.mob.ARCHLICH_TABERQUOAN + 3,
                qubiaID.mob.ARCHLICH_TABERQUOAN + 4,
                qubiaID.mob.ARCHLICH_TABERQUOAN + 5,
                qubiaID.mob.ARCHLICH_TABERQUOAN + 6,
            },

            {
                qubiaID.mob.ARCHLICH_TABERQUOAN + 10,
                qubiaID.mob.ARCHLICH_TABERQUOAN + 11,
                qubiaID.mob.ARCHLICH_TABERQUOAN + 12,
                qubiaID.mob.ARCHLICH_TABERQUOAN + 13,
            },

            {
                qubiaID.mob.ARCHLICH_TABERQUOAN + 17,
                qubiaID.mob.ARCHLICH_TABERQUOAN + 18,
                qubiaID.mob.ARCHLICH_TABERQUOAN + 19,
                qubiaID.mob.ARCHLICH_TABERQUOAN + 20,
            },
        },

        spawned        = false,
        superlinkGroup = 1,
    },
}

return content:register()
