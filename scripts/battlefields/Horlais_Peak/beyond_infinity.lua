-----------------------------------
-- Beyond Infinity
-- Horlais Peak Level Break
-----------------------------------
local horlaisID = zones[invaderXim.zone.HORLAIS_PEAK]
-----------------------------------

local content = BattlefieldQuest:new({
    zoneId        = invaderXim.zone.HORLAIS_PEAK,
    battlefieldId = invaderXim.battlefield.id.BEYOND_INFINITY_HORLAIS_PEAK,
    canLoseExp    = false,
    allowTrusts   = true,
    maxPlayers    = 6,
    levelCap      = 99,
    timeLimit     = utils.minutes(10),
    index         = 20,
    entryNpc      = 'BC_Entrance',
    exitNpc       = 'Burning_Circle',

    questArea = invaderXim.questLog.JEUNO,
    quest     = invaderXim.quest.id.jeuno.BEYOND_INFINITY,

    requiredKeyItems =
    {
        invaderXim.ki.SOUL_GEM_CLASP,
        onlyInitiator = true,
        message =
        {
            horlaisID.text.SOUL_GEM_REACTS,
            {
                invaderXim.ki.SOUL_GEM_CLASP,
                invaderXim.ki.SOUL_GEM,
            }
        },
        deleteMessage = horlaisID.text.LOST_KEYITEM,
    },
})

content.groups =
{
    {
        mobIds =
        {
            { horlaisID.mob.ATORI_TUTORI     },
            { horlaisID.mob.ATORI_TUTORI + 1 },
            { horlaisID.mob.ATORI_TUTORI + 2 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },
}

return content:register()
