-----------------------------------
-- Area: Cloister of Frost
-- BCNM: Trial-size Trial by Ice
-----------------------------------
local cloisterOfFrostID = zones[invaderXim.zone.CLOISTER_OF_FROST]
-----------------------------------

local content = BattlefieldQuest:new({
    zoneId           = invaderXim.zone.CLOISTER_OF_FROST,
    battlefieldId    = invaderXim.battlefield.id.TRIAL_SIZE_TRIAL_BY_ICE,
    canLoseExp       = false,
    maxPlayers       = 1,
    levelCap         = 20,
    timeLimit        = utils.minutes(15),
    index            = 2,
    entryNpc         = 'IP_Entrance',
    exitNpc          = 'Ice_Protocrystal',
    requiredItems    = { invaderXim.item.MINI_TUNING_FORK_OF_ICE },

    questArea = invaderXim.questLog.SANDORIA,
    quest     = invaderXim.quest.id.sandoria.TRIAL_SIZE_TRIAL_BY_ICE,
})

function content:entryRequirement(player, npc, isRegistrant, trade)
    return player:getMainJob() == invaderXim.job.SMN and
        player:getMainLvl() >= 20
end

function content:onEventFinishWin(player, csid, option, npc)
    if not player:hasSpell(invaderXim.magic.spell.SHIVA) then
        player:addSpell(invaderXim.magic.spell.SHIVA)
        player:messageSpecial(cloisterOfFrostID.text.SHIVA_UNLOCKED, 0, 0, 4)
    end

    if not player:hasItem(invaderXim.item.SCROLL_OF_INSTANT_WARP) then
        npcUtil.giveItem(player, invaderXim.item.SCROLL_OF_INSTANT_WARP)
    end

    player:addFame(invaderXim.fameArea.SANDORIA, 30)
    player:completeQuest(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.TRIAL_SIZE_TRIAL_BY_ICE)
end

content.groups =
{
    {
        mobs = { 'Shiva_Prime_TSTBI' },
        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },
}

return content:register()
