-----------------------------------
-- Area: Cloister of Gales
-- BCNM: Trial-size Trial by Wind
-----------------------------------
local cloisterOfGalesID = zones[invaderXim.zone.CLOISTER_OF_GALES]
-----------------------------------

local content = BattlefieldQuest:new({
    zoneId           = invaderXim.zone.CLOISTER_OF_GALES,
    battlefieldId    = invaderXim.battlefield.id.TRIAL_SIZE_TRIAL_BY_WIND,
    canLoseExp       = false,
    maxPlayers       = 1,
    levelCap         = 20,
    timeLimit        = utils.minutes(15),
    index            = 2,
    entryNpc         = 'WP_Entrance',
    exitNpc          = 'Wind_Protocrystal',
    requiredItems    = { invaderXim.item.MINI_TUNING_FORK_OF_WIND },

    questArea = invaderXim.questLog.OUTLANDS,
    quest     = invaderXim.quest.id.outlands.TRIAL_SIZE_TRIAL_BY_WIND,
})

function content:entryRequirement(player, npc, isRegistrant, trade)
    return player:getMainJob() == invaderXim.job.SMN and
        player:getMainLvl() >= 20
end

function content:onEventFinishWin(player, csid, option, npc)
    if not player:hasSpell(invaderXim.magic.spell.GARUDA) then
        player:addSpell(invaderXim.magic.spell.GARUDA)
        player:messageSpecial(cloisterOfGalesID.text.GARUDA_UNLOCKED, 0, 0, 3)
    end

    if not player:hasItem(invaderXim.item.SCROLL_OF_INSTANT_WARP) then
        npcUtil.giveItem(player, invaderXim.item.SCROLL_OF_INSTANT_WARP)
    end

    player:addFame(invaderXim.fameArea.SELBINA_RABAO, 30)
    player:completeQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.TRIAL_SIZE_TRIAL_BY_WIND)
end

content.groups =
{
    {
        mobs = { 'Garuda_Prime_TSTBW' },
        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },
}

return content:register()
