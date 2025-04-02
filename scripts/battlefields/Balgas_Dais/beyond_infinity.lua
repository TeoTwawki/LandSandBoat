-----------------------------------
-- Beyond Infinity
-- Balgas Dais Level Break
-----------------------------------
local balgasID = zones[invaderXim.zone.BALGAS_DAIS]
-----------------------------------

local content = BattlefieldQuest:new({
    zoneId        = invaderXim.zone.BALGAS_DAIS,
    battlefieldId = invaderXim.battlefield.id.BEYOND_INFINITY_BALGAS_DAIS,
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
            balgasID.text.SOUL_GEM_REACTS,
            {
                invaderXim.ki.SOUL_GEM_CLASP,
                invaderXim.ki.SOUL_GEM,
            }
        },
        deleteMessage = balgasID.text.LOST_KEYITEM,
    },
})

content.groups =
{
    {
        mobIds =
        {
            { balgasID.mob.ATORI_TUTORI     },
            { balgasID.mob.ATORI_TUTORI + 1 },
            { balgasID.mob.ATORI_TUTORI + 2 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },
}

return content:register()
