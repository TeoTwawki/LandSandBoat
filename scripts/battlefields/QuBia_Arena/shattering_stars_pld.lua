-----------------------------------
-- Area: Qu'Bia Arena
-- Name: Shattering Stars - Maat Fight (PLD)
-----------------------------------
local qubiaID = zones[invaderXim.zone.QUBIA_ARENA]
-----------------------------------

local content = Battlefield:new({
    zoneId        = invaderXim.zone.QUBIA_ARENA,
    battlefieldId = invaderXim.battlefield.id.SHATTERING_STARS_PLD,
    maxPlayers    = 1,
    levelCap      = 99,
    allowSubjob   = false,
    timeLimit     = utils.minutes(10),
    index         = 5,
    entryNpc      = 'BC_Entrance',
    exitNpc       = 'Burning_Circle',
    requiredItems = { invaderXim.item.PALADINS_TESTIMONY, wearMessage = qubiaID.text.TESTIMONY_WEARS, wornMessage = qubiaID.text.TESTIMONY_IS_TORN },
})

function content:entryRequirement(player, npc, isRegistrant, trade)
    return player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.SHATTERING_STARS) >= invaderXim.questStatus.QUEST_ACCEPTED and
        player:getMainJob() == invaderXim.job.PLD and
        player:getMainLvl() >= 66
end

content.groups =
{
    {
        mobIds =
        {
            { qubiaID.mob.MAAT     },
            { qubiaID.mob.MAAT + 1 },
            { qubiaID.mob.MAAT + 2 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },
}

return content:register()
