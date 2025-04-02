-----------------------------------
-- Area: Cloister of Storms
-- BCNM: Trial by Lightning
-----------------------------------

local content = BattlefieldQuest:new({
    zoneId           = invaderXim.zone.CLOISTER_OF_STORMS,
    battlefieldId    = invaderXim.battlefield.id.TRIAL_BY_LIGHTNING,
    canLoseExp       = false,
    maxPlayers       = 6,
    timeLimit        = utils.minutes(30),
    index            = 0,
    entryNpc         = 'LP_Entrance',
    exitNpc          = 'Lightning_Protocrystal',
    requiredKeyItems = { invaderXim.ki.TUNING_FORK_OF_LIGHTNING },

    questArea = invaderXim.questLog.OTHER_AREAS,
    quest     = invaderXim.quest.id.otherAreas.TRIAL_BY_LIGHTNING,
})

function content:onEventFinishWin(player, csid, option, npc)
    player:addTitle(invaderXim.title.HEIR_OF_THE_GREAT_LIGHTNING)
    npcUtil.giveKeyItem(player, invaderXim.ki.WHISPER_OF_STORMS)
end

content.groups =
{
    {
        mobs = { 'Ramuh_Prime_TBL' },
        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },
}

return content:register()
