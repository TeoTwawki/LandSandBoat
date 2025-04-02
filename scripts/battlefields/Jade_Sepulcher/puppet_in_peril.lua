-----------------------------------
-- Area: Jade Sepulcher
-- BCNM: TOAU-29 Puppet in Peril
-----------------------------------
local jadeSepulcherID = zones[invaderXim.zone.JADE_SEPULCHER]
-----------------------------------

local content = BattlefieldMission:new({
    zoneId                = invaderXim.zone.JADE_SEPULCHER,
    battlefieldId         = invaderXim.battlefield.id.PUPPET_IN_PERIL,
    canLoseExp            = false,
    isMission             = true,
    allowTrusts           = true,
    maxPlayers            = 6,
    levelCap              = 99,
    timeLimit             = utils.minutes(30),
    index                 = 4,
    allowedAreas          = set{ 1 },
    entryNpc              = '_1v0',
    exitNpcs              = { '_1v1', '_1v2', '_1v3' },
    missionArea           = invaderXim.mission.log_id.TOAU,
    mission               = invaderXim.mission.id.toau.PUPPET_IN_PERIL,
    missionStatusArea     = invaderXim.mission.log_id.TOAU,
    requiredMissionStatus = 1,
})

content.groups =
{
    {
        mobIds =
        {
            -- TODO: Lancelord Gaheel Ja is missing logic in its mob script for text
            -- displayed throughout the fight at minimum and may be missing additional
            -- mob mechanics.

            { jadeSepulcherID.mob.LANCELORD_GAHEEL_JA     },
            { jadeSepulcherID.mob.LANCELORD_GAHEEL_JA + 1 },
            { jadeSepulcherID.mob.LANCELORD_GAHEEL_JA + 2 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },
}

return content:register()
