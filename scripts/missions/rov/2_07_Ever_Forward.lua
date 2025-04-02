-----------------------------------
-- Ever Forward
-- Rhapsodies of Vana'diel Mission 2-7
-----------------------------------
-- !addmission 13 56
-----------------------------------
local whitegateID = zones[invaderXim.zone.AHT_URHGAN_WHITEGATE]
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.EVER_FORWARD)

mission.reward =
{
    item = invaderXim.item.CIPHER_OF_NASHMEIRAS_ALTER_EGO_II,
    nextMission = { invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.REUNITED },
}

local nationZones =
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

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Imperial_Whitegate'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:getCurrentMission(invaderXim.mission.log_id.TOAU) >= invaderXim.mission.id.toau.ROYAL_PUPPETEER
                    then
                        -- NOTE: The first 4 parameters for this event change the available dialogue.  This remains all zeroes
                        -- until the player has progressed at least past TOAU21.  No changes are implemented at this time until
                        -- viable captures are obtained.

                        return mission:progressEvent(166, { text_table = 0 })
                    else
                        return mission:messageSpecial(whitegateID.text.UNABLE_TO_PROGRESS_ROV)
                    end
                end,
            },

            onEventFinish =
            {
                [166] = function(player, csid, option, npc)
                    if mission:complete(player) then
                        player:completeMission(invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.APHMAUS_LIGHT)
                        player:addMission(invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.REUNITED)
                    end
                end,
            },
        },
    },
}

mission.sections[2] =
{
    check = function(player, currentMission, missionStatus, vars)
        return currentMission == mission.missionId and
            player:getCurrentMission(invaderXim.mission.log_id.TOAU) >= invaderXim.mission.id.toau.ROYAL_PUPPETEER
    end,
}

---@type ZoneSection
local rovZoneInEvent =
{
    onZoneIn = function(player, prevZone)
        return 30039
    end,

    onEventFinish =
    {
        [30039] = function(player, csid, option, npc)
            player:completeMission(mission.areaId, mission.missionId)
            player:addMission(invaderXim.mission.log_id.ROV, invaderXim.mission.id.rov.APHMAUS_LIGHT)
        end,
    },
}

for _, zoneId in ipairs(nationZones) do
    mission.sections[2][zoneId] = rovZoneInEvent
end

return mission
