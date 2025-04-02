-----------------------------------
-- Area: Cloister of Frost
-- BCNM: Sugar Coated Directive (ASA-4)
-----------------------------------
local cloisterOfFrostID = zones[invaderXim.zone.CLOISTER_OF_FROST]
-----------------------------------

local content = BattlefieldMission:new({
    zoneId        = invaderXim.zone.CLOISTER_OF_FROST,
    battlefieldId = invaderXim.battlefield.id.SUGAR_COATED_DIRECTIVE_CLOISTER_OF_FROST,
    canLoseExp    = false,
    isMission     = true,
    allowTrusts   = true,
    maxPlayers    = 6,
    levelCap      = 99,
    timeLimit     = utils.minutes(30),
    index         = 4,
    entryNpc      = 'IP_Entrance',
    exitNpc       = 'Ice_Protocrystal',

    requiredKeyItems = { invaderXim.ki.DOMINAS_AZURE_SEAL, keep = true },
    missionArea      = invaderXim.mission.log_id.ASA,
    mission          = invaderXim.mission.id.asa.SUGAR_COATED_DIRECTIVE,
    requiredVar      = 'Mission[11][3]Shiva',
    requiredValue    = 1,

    grantXP = 400,
})

content.groups =
{
    {
        mobIds =
        {
            { cloisterOfFrostID.mob.SHIVA_PRIME_ASA     },
            { cloisterOfFrostID.mob.SHIVA_PRIME_ASA + 1 },
            { cloisterOfFrostID.mob.SHIVA_PRIME_ASA + 2 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(invaderXim.battlefield.status.WON)
        end,
    },
}

return content:register()
