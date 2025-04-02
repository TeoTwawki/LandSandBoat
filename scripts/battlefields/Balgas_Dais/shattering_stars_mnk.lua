-----------------------------------
-- Area: Balga's Dais
-- Name: Shattering stars - Maat Fight (MNK)
-----------------------------------
local balgasID = zones[invaderXim.zone.BALGAS_DAIS]
-----------------------------------

local content = Battlefield:new({
    zoneId        = invaderXim.zone.BALGAS_DAIS,
    battlefieldId = invaderXim.battlefield.id.SHATTERING_STARS_MNK,
    maxPlayers    = 1,
    levelCap      = 99,
    allowSubjob   = false,
    timeLimit     = utils.minutes(10),
    index         = 5,
    entryNpc      = 'BC_Entrance',
    exitNpc       = 'Burning_Circle',
    requiredItems = { invaderXim.item.MONKS_TESTIMONY, wearMessage = balgasID.text.TESTIMONY_WEARS, wornMessage = balgasID.text.TESTIMONY_IS_TORN },
})

function content:entryRequirement(player, npc, isRegistrant, trade)
    return player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.SHATTERING_STARS) >= invaderXim.questStatus.QUEST_ACCEPTED and
        player:getMainJob() == invaderXim.job.MNK and
        player:getMainLvl() >= 66
end

content.groups =
{
    {
        mobIds =
        {
            { balgasID.mob.MAAT     },
            { balgasID.mob.MAAT + 1 },
            { balgasID.mob.MAAT + 2 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },
}

return content:register()
