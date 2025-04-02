-----------------------------------
-- Area: Qu'Bia Arena
-- Name: Shattering Stars - Maat Fight (BRD)
-----------------------------------
local qubiaID = zones[invaderXim.zone.QUBIA_ARENA]
-----------------------------------

local content = Battlefield:new({
    zoneId        = invaderXim.zone.QUBIA_ARENA,
    battlefieldId = invaderXim.battlefield.id.SHATTERING_STARS_BRD,
    maxPlayers    = 1,
    levelCap      = 99,
    allowSubjob   = false,
    timeLimit     = utils.minutes(10),
    index         = 7,
    entryNpc      = 'BC_Entrance',
    exitNpc       = 'Burning_Circle',
    requiredItems = { invaderXim.item.BARDS_TESTIMONY, wearMessage = qubiaID.text.TESTIMONY_WEARS, wornMessage = qubiaID.text.TESTIMONY_IS_TORN },
})

function content:entryRequirement(player, npc, isRegistrant, trade)
    return player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.SHATTERING_STARS) >= invaderXim.questStatus.QUEST_ACCEPTED and
        player:getMainJob() == invaderXim.job.BRD and
        player:getMainLvl() >= 66
end

content.groups =
{
    {
        mobIds =
        {
            { qubiaID.mob.MAAT + 6 },
            { qubiaID.mob.MAAT + 7 },
            { qubiaID.mob.MAAT + 8 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },
}

return content:register()
