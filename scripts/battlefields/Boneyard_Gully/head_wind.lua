-----------------------------------
-- Head Wind
-- Boneyard Gully mission battlefield
-----------------------------------
local boneyardGullyID = zones[invaderXim.zone.BONEYARD_GULLY]
-----------------------------------

local content = BattlefieldMission:new({
    zoneId        = invaderXim.zone.BONEYARD_GULLY,
    battlefieldId = invaderXim.battlefield.id.HEAD_WIND,
    canLoseExp    = false,
    isMission     = true,
    allowTrusts   = true,
    maxPlayers    = 6,
    levelCap      = 50,
    timeLimit     = utils.minutes(30),
    index         = 0,
    entryNpc      = '_081',
    exitNpcs      = { '_082', '_084', '_086' },

    missionArea           = invaderXim.mission.log_id.COP,
    mission               = invaderXim.mission.id.cop.THREE_PATHS,
    missionStatus         = invaderXim.mission.status.COP.ULMIA,
    missionStatusArea     = invaderXim.mission.log_id.COP,
    requiredMissionStatus = 7,

    grantXP = 1000,
    title   = invaderXim.title.DELTA_ENFORCER,
})

content.groups =
{
    {
        mobIds =
        {
            {
                boneyardGullyID.mob.SHIKAREE_Z,
                boneyardGullyID.mob.SHIKAREE_Z + 1,
                boneyardGullyID.mob.SHIKAREE_Z + 2,
            },

            {
                boneyardGullyID.mob.SHIKAREE_Z + 5,
                boneyardGullyID.mob.SHIKAREE_Z + 6,
                boneyardGullyID.mob.SHIKAREE_Z + 7,
            },

            {
                boneyardGullyID.mob.SHIKAREE_Z + 10,
                boneyardGullyID.mob.SHIKAREE_Z + 11,
                boneyardGullyID.mob.SHIKAREE_Z + 12,
            },
        },

        superlinkGroup = 1,
        allDeath       = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },

    {
        mobIds =
        {
            { boneyardGullyID.mob.SHIKAREE_Z + 4   },
            { boneyardGullyID.mob.SHIKAREE_Z + 9,  },
            { boneyardGullyID.mob.SHIKAREE_Z + 14, },
        },

        superlinkGroup = 1,
    },

    -- NOTE: Rabbit is spawned on start, but wyvern is a result of an on engage action.
    {
        mobIds =
        {
            { boneyardGullyID.mob.SHIKAREE_Z + 3  },
            { boneyardGullyID.mob.SHIKAREE_Z + 8  },
            { boneyardGullyID.mob.SHIKAREE_Z + 13 },
        },

        superlinkGroup = 1,
        spawned        = false,
    },
}

return content:register()
