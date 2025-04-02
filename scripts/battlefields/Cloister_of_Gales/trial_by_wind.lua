-----------------------------------
-- Area: Cloister of Gales
-- BCNM: Trial by Wind
-----------------------------------

local content = BattlefieldQuest:new({
    zoneId           = invaderXim.zone.CLOISTER_OF_GALES,
    battlefieldId    = invaderXim.battlefield.id.TRIAL_BY_WIND,
    canLoseExp       = false,
    maxPlayers       = 6,
    timeLimit        = utils.minutes(30),
    index            = 0,
    entryNpc         = 'WP_Entrance',
    exitNpc          = 'Wind_Protocrystal',
    requiredKeyItems = { invaderXim.ki.TUNING_FORK_OF_WIND },

    questArea = invaderXim.questLog.OUTLANDS,
    quest     = invaderXim.quest.id.outlands.TRIAL_BY_WIND,
})

function content:onEventFinishWin(player, csid, option, npc)
    player:addTitle(invaderXim.title.HEIR_OF_THE_GREAT_WIND)
    npcUtil.giveKeyItem(player, invaderXim.ki.WHISPER_OF_GALES)
end

content.groups =
{
    {
        mobs = { 'Garuda_Prime_TBW' },
        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },
}

return content:register()
