-----------------------------------
-- Area: Cloister of Frost
-- BCNM: Trial by Ice
-----------------------------------

local content = BattlefieldQuest:new({
    zoneId           = invaderXim.zone.CLOISTER_OF_FROST,
    battlefieldId    = invaderXim.battlefield.id.TRIAL_BY_ICE,
    canLoseExp       = false,
    maxPlayers       = 6,
    timeLimit        = utils.minutes(30),
    index            = 0,
    entryNpc         = 'IP_Entrance',
    exitNpc          = 'Ice_Protocrystal',
    requiredKeyItems = { invaderXim.ki.TUNING_FORK_OF_ICE },

    questArea = invaderXim.questLog.SANDORIA,
    quest     = invaderXim.quest.id.sandoria.TRIAL_BY_ICE,
})

function content:onEventFinishWin(player, csid, option, npc)
    player:addTitle(invaderXim.title.HEIR_OF_THE_GREAT_ICE)
    npcUtil.giveKeyItem(player, invaderXim.ki.WHISPER_OF_FROST)
end

content.groups =
{
    {
        mobs = { 'Shiva_Prime_TBI' },
        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },
}

return content:register()
