-----------------------------------
-- The Chamber of Oracles
-- Zilart M7
-----------------------------------
-- !addmission 3 14
-- !pos 200.3419 -2.25 37.12 168
-----------------------------------
local oraclesID = zones[invaderXim.zone.CHAMBER_OF_ORACLES]
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.ZILART, invaderXim.mission.id.zilart.THE_CHAMBER_OF_ORACLES)

mission.reward =
{
    keyItem     = invaderXim.ki.PRISMATIC_FRAGMENT,
    title       = invaderXim.title.LIGHTWEAVER,
    nextMission = { invaderXim.mission.log_id.ZILART, invaderXim.mission.id.zilart.RETURN_TO_DELKFUTTS_TOWER },
}

local function handleActiveOnTrigger(player, keyItemId, statusIncrease)
    local missionStatus = player:getMissionStatus(invaderXim.mission.log_id.ZILART)

    if player:hasKeyItem(keyItemId) then
        player:delKeyItem(keyItemId)
        player:setMissionStatus(invaderXim.mission.log_id.ZILART, missionStatus + statusIncrease)
        player:messageSpecial(oraclesID.text.YOU_PLACE_THE, keyItemId)

        if missionStatus == 255 then
            return mission:event(1)
        end
    elseif missionStatus == 255 then -- Execute cutscene if the player is interrupted.
        return mission:event(1)
    else
        return mission:messageSpecial(oraclesID.text.IS_SET_IN_THE_PEDESTAL, keyItemId)
    end
end

mission.sections =
{
    -- Section: Mission not Active or Completed
    {
        check = function(player, currentMission, missionStatus, vars)
            return not player:hasCompletedMission(mission.areaId, mission.missionId) and
                currentMission ~= mission.missionId
        end,

        [invaderXim.zone.CHAMBER_OF_ORACLES] =
        {
            ['Pedestal_of_Darkness']  = mission:messageSpecial(oraclesID.text.PLACED_INTO_THE_PEDESTAL),
            ['Pedestal_of_Earth']     = mission:messageSpecial(oraclesID.text.PLACED_INTO_THE_PEDESTAL),
            ['Pedestal_of_Fire']      = mission:messageSpecial(oraclesID.text.PLACED_INTO_THE_PEDESTAL),
            ['Pedestal_of_Ice']       = mission:messageSpecial(oraclesID.text.PLACED_INTO_THE_PEDESTAL),
            ['Pedestal_of_Light']     = mission:messageSpecial(oraclesID.text.PLACED_INTO_THE_PEDESTAL),
            ['Pedestal_of_Lightning'] = mission:messageSpecial(oraclesID.text.PLACED_INTO_THE_PEDESTAL),
            ['Pedestal_of_Water']     = mission:messageSpecial(oraclesID.text.PLACED_INTO_THE_PEDESTAL),
            ['Pedestal_of_Wind']      = mission:messageSpecial(oraclesID.text.PLACED_INTO_THE_PEDESTAL),
        },
    },

    -- Section: Mission is Active
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.CHAMBER_OF_ORACLES] =
        {
            ['Pedestal_of_Darkness'] =
            {
                onTrigger = function(player, npc)
                    return handleActiveOnTrigger(player, invaderXim.ki.DARK_FRAGMENT, 2)
                end,
            },

            ['Pedestal_of_Earth'] =
            {
                onTrigger = function(player, npc)
                    return handleActiveOnTrigger(player, invaderXim.ki.EARTH_FRAGMENT, 4)
                end,
            },

            ['Pedestal_of_Fire'] =
            {
                onTrigger = function(player, npc)
                    return handleActiveOnTrigger(player, invaderXim.ki.FIRE_FRAGMENT, 1)
                end,
            },

            ['Pedestal_of_Ice'] =
            {
                onTrigger = function(player, npc)
                    return handleActiveOnTrigger(player, invaderXim.ki.ICE_FRAGMENT, 8)
                end,
            },

            ['Pedestal_of_Light'] =
            {
                onTrigger = function(player, npc)
                    return handleActiveOnTrigger(player, invaderXim.ki.LIGHT_FRAGMENT, 16)
                end,
            },

            ['Pedestal_of_Lightning'] =
            {
                onTrigger = function(player, npc)
                    return handleActiveOnTrigger(player, invaderXim.ki.LIGHTNING_FRAGMENT, 32)
                end,
            },

            ['Pedestal_of_Water'] =
            {
                onTrigger = function(player, npc)
                    return handleActiveOnTrigger(player, invaderXim.ki.WATER_FRAGMENT, 64)
                end,
            },

            ['Pedestal_of_Wind'] =
            {
                onTrigger = function(player, npc)
                    return handleActiveOnTrigger(player, invaderXim.ki.WIND_FRAGMENT, 128)
                end,
            },

            onEventFinish =
            {
                [1] = function(player, csid, option, npc)
                    mission:complete(player)
                end,
            },
        },
    },

    -- Section: Mission has been Completed
    {
        check = function(player, currentMission, missionStatus, vars)
            return player:hasCompletedMission(mission.areaId, mission.missionId)
        end,

        [invaderXim.zone.CHAMBER_OF_ORACLES] =
        {
            ['Pedestal_of_Darkness']  = mission:messageSpecial(oraclesID.text.HAS_LOST_ITS_POWER, invaderXim.ki.DARK_FRAGMENT),
            ['Pedestal_of_Earth']     = mission:messageSpecial(oraclesID.text.HAS_LOST_ITS_POWER, invaderXim.ki.EARTH_FRAGMENT),
            ['Pedestal_of_Fire']      = mission:messageSpecial(oraclesID.text.HAS_LOST_ITS_POWER, invaderXim.ki.FIRE_FRAGMENT),
            ['Pedestal_of_Ice']       = mission:messageSpecial(oraclesID.text.HAS_LOST_ITS_POWER, invaderXim.ki.ICE_FRAGMENT),
            ['Pedestal_of_Light']     = mission:messageSpecial(oraclesID.text.HAS_LOST_ITS_POWER, invaderXim.ki.LIGHT_FRAGMENT),
            ['Pedestal_of_Lightning'] = mission:messageSpecial(oraclesID.text.HAS_LOST_ITS_POWER, invaderXim.ki.LIGHTNING_FRAGMENT),
            ['Pedestal_of_Water']     = mission:messageSpecial(oraclesID.text.HAS_LOST_ITS_POWER, invaderXim.ki.WATER_FRAGMENT),
            ['Pedestal_of_Wind']      = mission:messageSpecial(oraclesID.text.HAS_LOST_ITS_POWER, invaderXim.ki.WIND_FRAGMENT),
        },
    },
}

return mission
