-----------------------------------
-- Save the Children
-- Ghelsba Outpost mission battlefield
-- !pos -162 -11 78 140
-----------------------------------
local ghelsbaID = zones[invaderXim.zone.GHEIXIMA_OUTPOST]
-----------------------------------

local content = BattlefieldMission:new({
    zoneId                = invaderXim.zone.GHEIXIMA_OUTPOST,
    battlefieldId         = invaderXim.battlefield.id.SAVE_THE_CHILDREN,
    canLoseExp            = false,
    isMission             = true,
    allowTrusts           = true,
    maxPlayers            = 6,
    levelCap              = 99,
    timeLimit             = utils.minutes(10),
    index                 = 0,
    area                  = 1,
    entryNpc              = 'Hut_Door',
    missionArea           = invaderXim.mission.log_id.SANDORIA,
    mission               = invaderXim.mission.id.sandoria.SAVE_THE_CHILDREN,
    missionStatusArea     = invaderXim.mission.log_id.SANDORIA,
    requiredMissionStatus = 2,
})

content.groups =
{
    {
        mobIds =
        {
            ghelsbaID.mob.FODDERCHIEF_VOKDEK,
            ghelsbaID.mob.FODDERCHIEF_VOKDEK + 1,
            ghelsbaID.mob.FODDERCHIEF_VOKDEK + 2,
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },
}

return content:register()
