-----------------------------------
-- Area: Cloister of Flames
-- BCNM: Trial by Fire
-----------------------------------

local content = BattlefieldQuest:new({
    zoneId           = invaderXim.zone.CLOISTER_OF_FLAMES,
    battlefieldId    = invaderXim.battlefield.id.TRIAL_BY_FIRE,
    canLoseExp       = false,
    maxPlayers       = 6,
    timeLimit        = utils.minutes(30),
    index            = 0,
    entryNpc         = 'FP_Entrance',
    exitNpc          = 'Fire_Protocrystal',
    requiredKeyItems = { invaderXim.ki.TUNING_FORK_OF_FIRE },

    questArea = invaderXim.questLog.OUTLANDS,
    quest     = invaderXim.quest.id.outlands.TRIAL_BY_FIRE,
})

function content:onEventFinishWin(player, csid, option, npc)
    player:addTitle(invaderXim.title.HEIR_OF_THE_GREAT_FIRE)
    npcUtil.giveKeyItem(player, invaderXim.ki.WHISPER_OF_FLAMES)
end

content.groups =
{
    {
        mobs = { 'Ifrit_Prime_TBF' },
        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },
}

return content:register()
