-----------------------------------
-- Area: Empyreal_Paradox
-- Name: Apocalypse Nigh
-----------------------------------
local empyrealParadoxID = zones[invaderXim.zone.EMPYREAL_PARADOX]
-----------------------------------

local content = BattlefieldQuest:new({
    zoneId        = invaderXim.zone.EMPYREAL_PARADOX,
    battlefieldId = invaderXim.battlefield.id.APOCALYPSE_NIGH,
    allowTrusts   = true,
    maxPlayers    = 6,
    timeLimit     = utils.minutes(30),
    index         = 1,
    entryNpc      = 'TR_Entrance',
    exitNpc       = 'Transcendental_Radiance',
    questArea     = invaderXim.questLog.JEUNO,
    quest         = invaderXim.quest.id.jeuno.APOCALYPSE_NIGH,
    requiredVar   = 'Quest[3][89]Prog',
    requiredValue = 3,
})

function content:onEventFinishWin(player, csid, option, npc)
    player:setPos(540, 0, -514, 63, invaderXim.zone.EMPYREAL_PARADOX)
end

content.groups =
{
    {
        mobIds =
        {
            {
                empyrealParadoxID.mob.KAMLANAUT,
                empyrealParadoxID.mob.KAMLANAUT + 1,
            },

            {
                empyrealParadoxID.mob.KAMLANAUT + 2,
                empyrealParadoxID.mob.KAMLANAUT + 3,
            },

            {
                empyrealParadoxID.mob.KAMLANAUT + 4,
                empyrealParadoxID.mob.KAMLANAUT + 5,
            },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },
}

return content:register()
