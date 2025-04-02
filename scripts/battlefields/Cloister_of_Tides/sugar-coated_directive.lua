-----------------------------------
-- Area: Cloister of Tides
-- BCNM: Sugar Coated Directive (ASA-4)
-----------------------------------
local cloisterOfTidesID = zones[invaderXim.zone.CLOISTER_OF_TIDES]
-----------------------------------

local content = BattlefieldMission:new({
    zoneId        = invaderXim.zone.CLOISTER_OF_TIDES,
    battlefieldId = invaderXim.battlefield.id.SUGAR_COATED_DIRECTIVE_CLOISTER_OF_TIDES,
    canLoseExp    = false,
    isMission     = true,
    allowTrusts   = true,
    maxPlayers    = 6,
    levelCap      = 99,
    timeLimit     = utils.minutes(30),
    index         = 3,
    entryNpc      = 'WP_Entrance',
    exitNpc       = 'Water_Protocrystal',

    requiredKeyItems = { invaderXim.ki.DOMINAS_CERULEAN_SEAL, keep = true },
    missionArea      = invaderXim.mission.log_id.ASA,
    mission          = invaderXim.mission.id.asa.SUGAR_COATED_DIRECTIVE,
    requiredVar      = 'Mission[11][3]Leviathan',
    requiredValue    = 1,

    grantXP = 400,
})

content.groups =
{
    {
        mobIds =
        {
            { cloisterOfTidesID.mob.LEVIATHAN_PRIME_ASA     },
            { cloisterOfTidesID.mob.LEVIATHAN_PRIME_ASA + 1 },
            { cloisterOfTidesID.mob.LEVIATHAN_PRIME_ASA + 2 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },
}

return content:register()
