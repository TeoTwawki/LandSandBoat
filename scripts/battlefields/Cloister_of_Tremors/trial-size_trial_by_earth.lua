-----------------------------------
-- Area: Cloister of Tremors
-- BCNM: Trial-size Trial by Earth
-----------------------------------
local cloisterOfTremorsID = zones[invaderXim.zone.CLOISTER_OF_TREMORS]
-----------------------------------

local content = BattlefieldQuest:new({
    zoneId           = invaderXim.zone.CLOISTER_OF_TREMORS,
    battlefieldId    = invaderXim.battlefield.id.TRIAL_SIZE_TRIAL_BY_EARTH,
    canLoseExp       = false,
    maxPlayers       = 1,
    levelCap         = 20,
    timeLimit        = utils.minutes(15),
    index            = 2,
    entryNpc         = 'EP_Entrance',
    exitNpc          = 'Earth_Protocrystal',
    requiredItems    = { invaderXim.item.MINI_TUNING_FORK_OF_EARTH },

    questArea = invaderXim.questLog.BASTOK,
    quest     = invaderXim.quest.id.bastok.TRIAL_SIZE_TRIAL_BY_EARTH,
})

function content:entryRequirement(player, npc, isRegistrant, trade)
    return player:getMainJob() == invaderXim.job.SMN and
        player:getMainLvl() >= 20
end

function content:onEventFinishWin(player, csid, option, npc)
    if not player:hasSpell(invaderXim.magic.spell.TITAN) then
        player:addSpell(invaderXim.magic.spell.TITAN)
        player:messageSpecial(cloisterOfTremorsID.text.TITAN_UNLOCKED, 0, 0, 1)
    end

    if not player:hasItem(invaderXim.item.SCROLL_OF_INSTANT_WARP) then
        npcUtil.giveItem(player, invaderXim.item.SCROLL_OF_INSTANT_WARP)
    end

    player:addFame(invaderXim.fameArea.BASTOK, 30)
    player:completeQuest(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.TRIAL_SIZE_TRIAL_BY_EARTH)
end

content.groups =
{
    {
        mobs = { 'Titan_Prime_TSTBE' },
        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },
}

return content:register()
