-----------------------------------
-- Beyond Infinity
-- Wauhroon Shrine Level Break
-----------------------------------
local waughroonID = zones[invaderXim.zone.WAUGHROON_SHRINE]
-----------------------------------

local content = BattlefieldQuest:new({
    zoneId        = invaderXim.zone.WAUGHROON_SHRINE,
    battlefieldId = invaderXim.battlefield.id.BEYOND_INFINITY_WAUGHROON_SHRINE,
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
            waughroonID.text.SOUL_GEM_REACTS,
            {
                invaderXim.ki.SOUL_GEM_CLASP,
                invaderXim.ki.SOUL_GEM,
            }
        },
        deleteMessage = waughroonID.text.LOST_KEYITEM,
    },
})

content.groups =
{
    {
        mobIds =
        {
            { waughroonID.mob.ATORI_TUTORI     },
            { waughroonID.mob.ATORI_TUTORI + 1 },
            { waughroonID.mob.ATORI_TUTORI + 2 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },
}

return content:register()
