-----------------------------------
-- Area: Riverne Site #B01
-- Name: Storms of Fate
-- !pos 299 -123 345 146
-----------------------------------
local riverneID = zones[invaderXim.zone.RIVERNE_SITE_B01]
-----------------------------------

local content = BattlefieldQuest:new({
    zoneId        = invaderXim.zone.RIVERNE_SITE_B01,
    battlefieldId = invaderXim.battlefield.id.STORMS_OF_FATE,
    allowTrusts   = true,
    maxPlayers    = 18,
    timeLimit     = utils.minutes(30),
    index         = 0,
    area          = 1,
    entryNpc      = 'Unstable_Displacement',
    exitNpc       = 'SD_BCNM_Exit',
    questArea     = invaderXim.questLog.JEUNO,
    quest         = invaderXim.quest.id.jeuno.STORMS_OF_FATE,
    requiredVar   = 'Quest[3][86]Prog',
    requiredValue = 2,

    title = invaderXim.title.CONQUEROR_OF_FATE,
})

content.groups =
{
    {
        mobIds =
        {
            riverneID.mob.BAHAMUT,
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },
}

return content:register()
