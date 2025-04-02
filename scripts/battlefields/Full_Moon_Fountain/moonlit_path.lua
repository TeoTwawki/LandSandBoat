-----------------------------------
-- Area: Full Moon Fountain
-- Name: The Moonlit Path
-----------------------------------
local fullMoonFountainID = zones[invaderXim.zone.FULL_MOON_FOUNTAIN]
-----------------------------------

local content = BattlefieldQuest:new({
    zoneId           = invaderXim.zone.FULL_MOON_FOUNTAIN,
    battlefieldId    = invaderXim.battlefield.id.MOONLIT_PATH,
    canLoseExp       = false,
    maxPlayers       = 6,
    timeLimit        = utils.minutes(30),
    index            = 0,
    entryNpc         = 'MS_Entrance',
    exitNpc          = 'Moon_Spiral',
    requiredKeyItems = { invaderXim.ki.MOON_BAUBLE, keep = true },

    questArea = invaderXim.questLog.WINDURST,
    quest     = invaderXim.quest.id.windurst.THE_MOONLIT_PATH,
})

function content:onEventFinishWin(player, csid, option, npc)
    player:delKeyItem(invaderXim.ki.MOON_BAUBLE)
    npcUtil.giveKeyItem(player, invaderXim.ki.WHISPER_OF_THE_MOON)
end

content.groups =
{
    {
        mobIds =
        {
            { fullMoonFountainID.mob.FENRIR_PRIME     },
            { fullMoonFountainID.mob.FENRIR_PRIME + 1 },
            { fullMoonFountainID.mob.FENRIR_PRIME + 2 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },
}

return content:register()
