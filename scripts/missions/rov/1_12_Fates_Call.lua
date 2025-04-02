-----------------------------------
-- Fate's Call
-- Rhapsodies of Vana'diel Mission 1-12
-----------------------------------
-- !addmission 13 28
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.FATES_CALL)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.WHAT_LIES_BEYOND },
}

-- TODO: We use this table in the first mission as well, move this.
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
        local pNation = player:getNation()

        return currentMission == mission.missionId and
            (
                player:getRank(pNation) > 5 or
                (player:getCurrentMission(pNation) == invaderXim.mission.id.nation.SHADOW_LORD and player:getMissionStatus(pNation) >= 4)
            )
    end,
}

---@type ZoneSection
local rovZoneInEvent =
{
    onZoneIn = function(player, prevZone)
        return 30036
    end,

    onEventFinish =
    {
        [30036] = function(player, csid, option, npc)
            mission:complete(player)
        end,
    },
}

for _, zoneId in ipairs(rovEntryZones) do
    mission.sections[1][zoneId] = rovZoneInEvent
end

return mission
