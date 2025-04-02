-----------------------------------
-- Area: Waughroon Shrine
-- Name: Shattering stars - Maat Fight (BST)
-----------------------------------
local waughroonID = zones[invaderXim.zone.WAUGHROON_SHRINE]
-----------------------------------

local content = Battlefield:new({
    zoneId        = invaderXim.zone.WAUGHROON_SHRINE,
    battlefieldId = invaderXim.battlefield.id.SHATTERING_STARS_BST,
    maxPlayers    = 1,
    levelCap      = 99,
    allowSubjob   = false,
    timeLimit     = utils.minutes(10),
    index         = 8,
    entryNpc      = 'BC_Entrance',
    exitNpc       = 'Burning_Circle',
    requiredItems = { invaderXim.item.BEASTMASTERS_TESTIMONY, wearMessage = waughroonID.text.TESTIMONY_WEARS, wornMessage = waughroonID.text.TESTIMONY_IS_TORN },
})

function content:entryRequirement(player, npc, isRegistrant, trade)
    return player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.SHATTERING_STARS) >= invaderXim.questStatus.QUEST_ACCEPTED and
        player:getMainJob() == invaderXim.job.BST and
        player:getMainLvl() >= 66
end

content.groups =
{
    {
        mobIds =
        {
            { waughroonID.mob.MAAT + 6 },
            { waughroonID.mob.MAAT + 8 },
            { waughroonID.mob.MAAT + 10 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },

    {
        mobIds =
        {
            { waughroonID.mob.MAAT + 7  },
            { waughroonID.mob.MAAT + 9  },
            { waughroonID.mob.MAAT + 11 },
        },

        spawned = false,
    },
}

return content:register()
