-----------------------------------
-- Area: Qu'Bia Arena
-- Name: Shattering Stars - Maat Fight (DRK)
-----------------------------------
local qubiaID = zones[invaderXim.zone.QUBIA_ARENA]
-----------------------------------

local content = Battlefield:new({
    zoneId        = invaderXim.zone.QUBIA_ARENA,
    battlefieldId = invaderXim.battlefield.id.SHATTERING_STARS_DRK,
    maxPlayers    = 1,
    levelCap      = 99,
    allowSubjob   = false,
    timeLimit     = utils.minutes(10),
    index         = 6,
    entryNpc      = 'BC_Entrance',
    exitNpc       = 'Burning_Circle',
    requiredItems = { invaderXim.item.DARK_KNIGHTS_TESTIMONY, wearMessage = qubiaID.text.TESTIMONY_WEARS, wornMessage = qubiaID.text.TESTIMONY_IS_TORN },
})

function content:entryRequirement(player, npc, isRegistrant, trade)
    return player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.SHATTERING_STARS) >= invaderXim.questStatus.QUEST_ACCEPTED and
        player:getMainJob() == invaderXim.job.DRK and
        player:getMainLvl() >= 66
end

content.groups =
{
    {
        mobIds =
        {
            { qubiaID.mob.MAAT + 3 },
            { qubiaID.mob.MAAT + 4 },
            { qubiaID.mob.MAAT + 5 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },
}

return content:register()
