-----------------------------------
-- Rhapsodies of Vana'diel
-- Rhapsodies of Vana'diel Mission 1-1
-----------------------------------
-- NOTE: invaderXim.mission.id.rov.RHAPSODIES_OF_VANADIEL is set by default
-- !addmission 13 0
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.RHAPSODIES_OF_VANADIEL)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.RESONACE },
}

local rovEntryZones =
{
    invaderXim.zone.BASTOK_MARKETS,
    invaderXim.zone.BASTOK_MINES,
    invaderXim.zone.NORTHERN_SAN_DORIA,
    invaderXim.zone.PORT_BASTOK,
    invaderXim.zone.PORT_SAN_DORIA,
    invaderXim.zone.PORT_WINDURST,
    invaderXim.zone.SOUTHERN_SAN_DORIA,
    invaderXim.zone.WINDURST_WALLS,
    invaderXim.zone.WINDURST_WATERS,
    invaderXim.zone.WINDURST_WOODS,
}

mission.sections    = {}
mission.sections[1] =
{
    check = function(player, currentMission, missionStatus, vars)
        return currentMission == mission.missionId and
            invaderXim.settings.main.ENABLE_ROV == 1 and
            player:getMainLvl() >= 3 and
            not player:isInMogHouse()
    end,
}

---@type ZoneSection
local rovZoneInEvent =
{
    onZoneIn = function(player, prevZone)
        return 30035
    end,

    onEventFinish =
    {
        [30035] = function(player, csid, option, npc)
            mission:complete(player)
        end,
    },
}

for _, zoneId in ipairs(rovEntryZones) do
    mission.sections[1][zoneId] = rovZoneInEvent
end

return mission
