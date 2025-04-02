-----------------------------------
-- Flames for the Dead
-- Bearclaw Pinnacle mission battlefield
-- !pos -720 9 -441 6
-----------------------------------

local content = BattlefieldMission:new({
    zoneId        = invaderXim.zone.BEARCLAW_PINNACLE,
    battlefieldId = invaderXim.battlefield.id.FLAMES_FOR_THE_DEAD,
    canLoseExp    = false,
    maxPlayers    = 6,
    levelCap      = 99,
    timeLimit     = utils.minutes(30),
    index         = 0,
    entryNpc      = 'Wind_Pillar_1',
    exitNpc       = 'Wind_Pillar_Exit',

    missionArea           = invaderXim.mission.log_id.COP,
    mission               = invaderXim.mission.id.cop.THREE_PATHS,
    missionStatusArea     = invaderXim.mission.log_id.COP,
    missionStatus         = invaderXim.mission.status.COP.ULMIA,
    requiredMissionStatus = 8,
    title                 = invaderXim.title.TRUE_COMPANION_OF_LOUVERANCE,
    grantXP               = 1000,
})

content:addEssentialMobs({ 'Snoll_Tzar' })

return content:register()
