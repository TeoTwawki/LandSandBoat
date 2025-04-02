-----------------------------------
-- Drenched! It Began with a Raindrop
-- A Moogle Kupo d'Etat M2
-- !addmission 10 1
-- ORCISH_PLATE_ARMOR : !additem 2757
-- QUADAV_BACKSCALE   : !additem 2758
-- YAGUDO_CAULK       : !additem 2759
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.AMK, invaderXim.mission.id.amk.DRENCHED_IT_BEGAN_WITH_A_RAINDROP)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.AMK, invaderXim.mission.id.amk.HASTEN_IN_A_JAM_IN_JEUNO },
}

-- Since there are so many zones with interactions:
-- Populate each by hand
mission.sections = {}
mission.sections[1] = -- REMEMBER: Lua is 1-indexed!
{
    check = function(player, currentMission, missionStatus, vars)
        return currentMission == mission.missionId and
            invaderXim.moghouse.isInMogHouseInHomeNation(player)
    end,
}

---@type ZoneSection
local moogleTriggerEvent =
{
    ['Moogle'] =
    {
        onTrade = function(player, npc, trade)
            if
                npcUtil.tradeHasExactly(trade, { invaderXim.item.ORCISH_PLATE_ARMOR, invaderXim.item.QUADAV_BACKSCALE, invaderXim.item.YAGUDO_CAULK })
            then
                return mission:progressEvent(30024)
            end
        end,
    },

    onEventFinish =
    {
        [30024] = function(player, csid, option, npc)
            if mission:complete(player) then
                player:confirmTrade()
            end
        end,
    },
}

for i, zoneId in ipairs(invaderXim.moghouse.moghouseZones) do
    mission.sections[1][zoneId] = moogleTriggerEvent
end

return mission
