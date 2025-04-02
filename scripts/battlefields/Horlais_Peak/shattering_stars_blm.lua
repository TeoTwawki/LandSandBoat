-----------------------------------
-- Area: Horlais Peak
-- Name: Shattering stars - Maat Fight (BLM)
-----------------------------------
local horlaisID = zones[invaderXim.zone.HORLAIS_PEAK]
-----------------------------------

local content = Battlefield:new({
    zoneId        = invaderXim.zone.HORLAIS_PEAK,
    battlefieldId = invaderXim.battlefield.id.SHATTERING_STARS_BLM,
    maxPlayers    = 1,
    levelCap      = 99,
    allowSubjob   = false,
    timeLimit     = utils.minutes(10),
    index         = 6,
    entryNpc      = 'BC_Entrance',
    exitNpc       = 'Burning_Circle',
    requiredItems = { invaderXim.item.BLACK_MAGES_TESTIMONY, wearMessage = horlaisID.text.TESTIMONY_WEARS, wornMessage = horlaisID.text.TESTIMONY_IS_TORN },
})

function content:entryRequirement(player, npc, isRegistrant, trade)
    return player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.SHATTERING_STARS) >= invaderXim.questStatus.QUEST_ACCEPTED and
        player:getMainJob() == invaderXim.job.BLM and
        player:getMainLvl() >= 66
end

content.groups =
{
    {
        mobIds =
        {
            { horlaisID.mob.MAAT + 3 },
            { horlaisID.mob.MAAT + 4 },
            { horlaisID.mob.MAAT + 5 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },
}

return content:register()
