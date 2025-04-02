-----------------------------------
-- Area: Cloister of Flames
-- BCNM: Sugar Coated Directive (ASA-4)
-----------------------------------
local cloisterOfFlamesID = zones[invaderXim.zone.CLOISTER_OF_FLAMES]
-----------------------------------

local content = BattlefieldMission:new({
    zoneId        = invaderXim.zone.CLOISTER_OF_FLAMES,
    battlefieldId = invaderXim.battlefield.id.SUGAR_COATED_DIRECTIVE_CLOISTER_OF_FLAMES,
    canLoseExp    = false,
    isMission     = true,
    allowTrusts   = true,
    maxPlayers    = 6,
    levelCap      = 99,
    timeLimit     = utils.minutes(30),
    index         = 3,
    entryNpc      = 'FP_Entrance',
    exitNpc       = 'Fire_Protocrystal',

    requiredKeyItems = { invaderXim.ki.DOMINAS_SCARLET_SEAL, keep = true },
    missionArea      = invaderXim.mission.log_id.ASA,
    mission          = invaderXim.mission.id.asa.SUGAR_COATED_DIRECTIVE,
    requiredVar      = 'Mission[11][3]Ifrit',
    requiredValue    = 1,

    grantXP = 400,
})

content.groups =
{
    {
        mobIds =
        {
            { cloisterOfFlamesID.mob.IFRIT_PRIME_ASA     },
            { cloisterOfFlamesID.mob.IFRIT_PRIME_ASA + 1 },
            { cloisterOfFlamesID.mob.IFRIT_PRIME_ASA + 2 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },
}

return content:register()
