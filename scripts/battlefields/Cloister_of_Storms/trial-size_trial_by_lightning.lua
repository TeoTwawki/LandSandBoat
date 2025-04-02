-----------------------------------
-- Area: Cloister of Storms
-- BCNM: Trial-size Trial by Lightning
-----------------------------------
local cloisterOfStormsID = zones[invaderXim.zone.CLOISTER_OF_STORMS]
-----------------------------------

local content = BattlefieldQuest:new({
    zoneId           = invaderXim.zone.CLOISTER_OF_STORMS,
    battlefieldId    = invaderXim.battlefield.id.TRIAL_SIZE_TRIAL_BY_LIGHTNING,
    canLoseExp       = false,
    maxPlayers       = 1,
    levelCap         = 20,
    timeLimit        = utils.minutes(15),
    index            = 2,
    entryNpc         = 'LP_Entrance',
    exitNpc          = 'Lightning_Protocrystal',
    requiredItems    = { invaderXim.item.MINI_TUNING_FORK_OF_LIGHTNING },

    questArea = invaderXim.questLog.OTHER_AREAS,
    quest     = invaderXim.quest.id.otherAreas.TRIAL_SIZE_TRIAL_BY_LIGHTNING,
})

function content:entryRequirement(player, npc, isRegistrant, trade)
    return player:getMainJob() == invaderXim.job.SMN and
        player:getMainLvl() >= 20
end

function content:onEventFinishWin(player, csid, option, npc)
    if not player:hasSpell(invaderXim.magic.spell.RAMUH) then
        player:addSpell(invaderXim.magic.spell.RAMUH)
        player:messageSpecial(cloisterOfStormsID.text.RAMUH_UNLOCKED, 0, 0, 5)
    end

    if not player:hasItem(invaderXim.item.SCROLL_OF_INSTANT_WARP) then
        npcUtil.giveItem(player, invaderXim.item.SCROLL_OF_INSTANT_WARP)
    end

    player:addFame(invaderXim.fameArea.WINDURST, 30)
    player:completeQuest(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.TRIAL_SIZE_TRIAL_BY_LIGHTNING)
end

content.groups =
{
    {
        mobs = { 'Ramuh_Prime_TSTBL' },
        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },
}

return content:register()
