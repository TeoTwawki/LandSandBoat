-----------------------------------
-- A Moogle Kupo d'Etat
-- A Moogle Kupo d'Etat M1
-- !addmission 10 0
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.AMK, invaderXim.mission.id.amk.A_MOOGLE_KUPO_DETAT)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.AMK, invaderXim.mission.id.amk.DRENCHED_IT_BEGAN_WITH_A_RAINDROP },
}

-- Since there are so many zones with interactions:
-- Populate each by hand
mission.sections = {}
mission.sections[1] = -- REMEMBER: Lua is 1-indexed!
{
    check = function(player, currentMission, missionStatus, vars)
        return currentMission == mission.missionId and
            invaderXim.settings.main.ENABLE_AMK == 1 and
            invaderXim.moghouse.isInMogHouseInHomeNation(player) and
            player:getMainLvl() >= 10 and
            player:getCharVar('HQuest[moghouseExpo]notSeen') == 0
    end,
}

---@type ZoneSection
local moogleTriggerEvent =
{
    -- TODO: Does there need to be onZoneIn here?

    ['Moogle'] =
    {
        onTrigger = function(player, npc)
            return mission:progressEvent(30023)
        end,
    },

    onEventFinish =
    {
        [30023] = function(player, csid, option, npc)
            mission:complete(player)
        end,
    },
}

for i, zoneId in ipairs(invaderXim.moghouse.moghouseZones) do
    mission.sections[1][zoneId] = moogleTriggerEvent
end

return mission
