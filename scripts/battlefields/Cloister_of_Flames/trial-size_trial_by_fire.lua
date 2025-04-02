-----------------------------------
-- Area: Cloister of Flames
-- BCNM: Trial-size Trial by Fire
-----------------------------------
local cloisterOfFlamesID = zones[invaderXim.zone.CLOISTER_OF_FLAMES]
-----------------------------------

local content = BattlefieldQuest:new({
    zoneId           = invaderXim.zone.CLOISTER_OF_FLAMES,
    battlefieldId    = invaderXim.battlefield.id.TRIAL_SIZE_TRIAL_BY_FIRE,
    canLoseExp       = false,
    maxPlayers       = 1,
    levelCap         = 20,
    timeLimit        = utils.minutes(15),
    index            = 1,
    entryNpc         = 'FP_Entrance',
    exitNpc          = 'Fire_Protocrystal',
    requiredItems    = { invaderXim.item.MINI_TUNING_FORK_OF_FIRE },

    questArea = invaderXim.questLog.OUTLANDS,
    quest     = invaderXim.quest.id.outlands.TRIAL_SIZE_TRIAL_BY_FIRE,
})

function content:entryRequirement(player, npc, isRegistrant, trade)
    return player:getMainJob() == invaderXim.job.SMN and
        player:getMainLvl() >= 20
end

function content:onEventFinishWin(player, csid, option, npc)
    if not player:hasSpell(invaderXim.magic.spell.IFRIT) then
        player:addSpell(invaderXim.magic.spell.IFRIT)
        player:messageSpecial(cloisterOfFlamesID.text.IFRIT_UNLOCKED, 0, 0, 0)
    end

    if not player:hasItem(invaderXim.item.SCROLL_OF_INSTANT_WARP) then
        npcUtil.giveItem(player, invaderXim.item.SCROLL_OF_INSTANT_WARP)
    end

    player:addFame(invaderXim.fameArea.WINDURST, 30)
    player:completeQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.TRIAL_SIZE_TRIAL_BY_FIRE)
end

content.groups =
{
    {
        mobs = { 'Ifrit_Prime_TSTBF' },
        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },
}

return content:register()
