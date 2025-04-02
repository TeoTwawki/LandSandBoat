-----------------------------------
-- Beyond Infinity
-- Qu'Bia Arena Level Break
-----------------------------------
local qubiaID = zones[invaderXim.zone.QUBIA_ARENA]
-----------------------------------

local content = BattlefieldQuest:new({
    zoneId        = invaderXim.zone.QUBIA_ARENA,
    battlefieldId = invaderXim.battlefield.id.BEYOND_INFINITY,
    canLoseExp    = false,
    allowTrusts   = true,
    maxPlayers    = 6,
    levelCap      = 99,
    timeLimit     = utils.minutes(10),
    index         = 21,
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
            qubiaID.text.SOUL_GEM_REACTS,
            {
                invaderXim.ki.SOUL_GEM_CLASP,
                invaderXim.ki.SOUL_GEM,
            }
        },
        deleteMessage = qubiaID.text.LOST_KEYITEM,
    },
})

content.groups =
{
    {
        mobIds =
        {
            { qubiaID.mob.ATORI_TUTORI     },
            { qubiaID.mob.ATORI_TUTORI + 1 },
            { qubiaID.mob.ATORI_TUTORI + 2 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },
}

return content:register()
