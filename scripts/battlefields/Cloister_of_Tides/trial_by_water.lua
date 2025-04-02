-----------------------------------
-- Area: Cloister of Tides
-- BCNM: Trial by Water
-----------------------------------

local content = BattlefieldQuest:new({
    zoneId           = invaderXim.zone.CLOISTER_OF_TIDES,
    battlefieldId    = invaderXim.battlefield.id.TRIAL_BY_WATER,
    canLoseExp       = false,
    maxPlayers       = 6,
    timeLimit        = utils.minutes(30),
    index            = 0,
    entryNpc         = 'WP_Entrance',
    exitNpc          = 'Water_Protocrystal',
    requiredKeyItems = { invaderXim.ki.TUNING_FORK_OF_WATER },

    questArea = invaderXim.questLog.OUTLANDS,
    quest     = invaderXim.quest.id.outlands.TRIAL_BY_WATER,
})

function content:onEventFinishWin(player, csid, option, npc)
    player:addTitle(invaderXim.title.HEIR_OF_THE_GREAT_WATER)
    npcUtil.giveKeyItem(player, invaderXim.ki.WHISPER_OF_TIDES)
end

content.groups =
{
    {
        mobs = { 'Leviathan_Prime_TBW' },
        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },
}

return content:register()
