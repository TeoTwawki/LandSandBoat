-----------------------------------
-- Area: Balga's Dais
-- Name: Shattering stars - Maat Fight (WHM)
-----------------------------------
local balgasID = zones[invaderXim.zone.BALGAS_DAIS]
-----------------------------------

local content = Battlefield:new({
    zoneId        = invaderXim.zone.BALGAS_DAIS,
    battlefieldId = invaderXim.battlefield.id.SHATTERING_STARS_WHM,
    maxPlayers    = 1,
    levelCap      = 99,
    allowSubjob   = false,
    timeLimit     = utils.minutes(10),
    index         = 6,
    entryNpc      = 'BC_Entrance',
    exitNpc       = 'Burning_Circle',
    requiredItems = { invaderXim.item.WHITE_MAGES_TESTIMONY, wearMessage = balgasID.text.TESTIMONY_WEARS, wornMessage = balgasID.text.TESTIMONY_IS_TORN },
})

function content:entryRequirement(player, npc, isRegistrant, trade)
    return player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.SHATTERING_STARS) >= invaderXim.questStatus.QUEST_ACCEPTED and
        player:getMainJob() == invaderXim.job.WHM and
        player:getMainLvl() >= 66
end

content.groups =
{
    {
        mobIds =
        {
            { balgasID.mob.MAAT + 3 },
            { balgasID.mob.MAAT + 4 },
            { balgasID.mob.MAAT + 5 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },
}

return content:register()
