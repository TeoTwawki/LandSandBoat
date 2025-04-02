-----------------------------------
-- Area: Cloister of Tides
-- BCNM: Trial-size Trial by Water
-----------------------------------
local cloisterOfTidesID = zones[invaderXim.zone.CLOISTER_OF_TIDES]
-----------------------------------

local content = BattlefieldQuest:new({
    zoneId           = invaderXim.zone.CLOISTER_OF_TIDES,
    battlefieldId    = invaderXim.battlefield.id.TRIAL_SIZE_TRIAL_BY_WATER,
    canLoseExp       = false,
    maxPlayers       = 1,
    levelCap         = 20,
    timeLimit        = utils.minutes(15),
    index            = 1,
    entryNpc         = 'WP_Entrance',
    exitNpc          = 'Water_Protocrystal',
    requiredItems    = { invaderXim.item.MINI_TUNING_FORK_OF_WATER },

    questArea = invaderXim.questLog.OUTLANDS,
    quest     = invaderXim.quest.id.outlands.TRIAL_SIZE_TRIAL_BY_WATER,
})

function content:entryRequirement(player, npc, isRegistrant, trade)
    return player:getMainJob() == invaderXim.job.SMN and
        player:getMainLvl() >= 20
end

function content:onEventFinishWin(player, csid, option, npc)
    if not player:hasSpell(invaderXim.magic.spell.LEVIATHAN) then
        player:addSpell(invaderXim.magic.spell.LEVIATHAN)
        player:messageSpecial(cloisterOfTidesID.text.LEVIATHAN_UNLOCKED, 0, 0, 2)
    end

    if not player:hasItem(invaderXim.item.SCROLL_OF_INSTANT_WARP) then
        npcUtil.giveItem(player, invaderXim.item.SCROLL_OF_INSTANT_WARP)
    end

    player:addFame(invaderXim.fameArea.NORG, 30)
    player:completeQuest(invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.TRIAL_SIZE_TRIAL_BY_WATER)
end

content.groups =
{
    {
        mobs = { 'Leviathan_Prime_TSTBW' },
        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },
}

return content:register()
