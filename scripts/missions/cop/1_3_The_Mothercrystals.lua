-----------------------------------
-- The Mothercrystals
-- Promathia 1-3
-----------------------------------
-- !addmission 6 128
-- Shattered Telepoint (Konschtat) : !pos 135 19 220 108
-- Shattered Telepoint (La Theine) : !pos 334 19 -60 102
-- Shattered Telepoint (Tahrongi)  : !pos 179 35 255 117
-----------------------------------
require('scripts/missions/cop/helpers')
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.COP, invaderXim.mission.id.cop.THE_MOTHERCRYSTALS)

mission.reward =
{
    title = invaderXim.title.ANCIENT_FLAME_FOLLOWER,
    nextMission = { invaderXim.mission.log_id.COP, invaderXim.mission.id.cop.AN_INVITATION_WEST },
}

-- Some helper functions require access to this mission class in order to operate.  The below
-- functions wrap the helper to ensure that value gets to them.
local shatteredTelepointSealMemory = function(player, csid, option, npc)
    invaderXim.cop.helpers.shatteredTelepointSealMemory(mission, player, csid, option, npc)
end

local largeApparatusOnTrigger = function(player, npc)
    return invaderXim.cop.helpers.largeApparatusOnTrigger(mission, player, npc)
end

local largeApparatusOnEventFinish = function(player, csid, option, npc)
    invaderXim.cop.helpers.largeApparatusOnEventFinish(mission, player, csid, option, npc)
end

local spireEventFinish = function(player, csid, option, npc)
    invaderXim.cop.helpers.spireEventFinish(mission, player, csid, option, npc)
end

local shatteredTelepointOnTrigger = function(player, npc)
    if
        invaderXim.cop.helpers.numPromyvionCompleted(player) == 1 and
        not invaderXim.cop.helpers.hasCompletedPromyvion(player, player:getZoneID()) and
        mission:getVar(player, 'Option') == 0
    then
        local zoneId = player:getZoneID()

        player:setLocalVar('toPromyvion', invaderXim.cop.helpers.shatteredTelepointInfo[zoneId][1])
        return mission:progressEvent(invaderXim.cop.helpers.shatteredTelepointInfo[zoneId][2] - 1)
    else
        return invaderXim.cop.helpers.shatteredTelepointOnTrigger(mission, player, npc)
    end
end

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.KONSCHTAT_HIGHLANDS] =
        {
            ['Shattered_Telepoint'] =
            {
                onTrigger = shatteredTelepointOnTrigger,
            },

            onEventFinish =
            {
                [912] = invaderXim.cop.helpers.sendToZoneOnFinish,
                [913] = invaderXim.cop.helpers.shatteredTelepointEntry,
                [918] = shatteredTelepointSealMemory,
            },
        },

        [invaderXim.zone.LA_THEINE_PLATEAU] =
        {
            ['Shattered_Telepoint'] =
            {
                onTrigger = shatteredTelepointOnTrigger,
            },

            onEventFinish =
            {
                [201] = invaderXim.cop.helpers.sendToZoneOnFinish,
                [202] = invaderXim.cop.helpers.shatteredTelepointEntry,
                [212] = shatteredTelepointSealMemory,
            },
        },

        [invaderXim.zone.TAHRONGI_CANYON] =
        {
            ['Shattered_Telepoint'] =
            {
                onTrigger = shatteredTelepointOnTrigger,
            },

            onEventFinish =
            {
                [912] = invaderXim.cop.helpers.sendToZoneOnFinish,
                [913] = invaderXim.cop.helpers.shatteredTelepointEntry,
                [918] = shatteredTelepointSealMemory,
            },
        },

        [invaderXim.zone.HALL_OF_TRANSFERENCE] =
        {
            ['_0e3'] =
            {
                onTrigger = largeApparatusOnTrigger,
            },

            ['_0e5'] =
            {
                onTrigger = largeApparatusOnTrigger,
            },

            ['_0e7'] =
            {
                onTrigger = largeApparatusOnTrigger,
            },

            onZoneIn = function(player, prevZone)
                if
                    invaderXim.cop.helpers.numPromyvionCompleted(player) == 2 and
                    not invaderXim.cop.helpers.hasCompletedPromyvion(player, prevZone) and
                    mission:getVar(player, 'Status') == 0
                then
                    player:setLocalVar('toPromyvion', invaderXim.cop.helpers.shatteredTelepointInfo[prevZone][1])
                    return 155
                end
            end,

            onEventFinish =
            {
                [122] = largeApparatusOnEventFinish,
                [125] = largeApparatusOnEventFinish,
                [128] = largeApparatusOnEventFinish,

                [155] = function(player, csid, option, npc)
                    -- This event only happens once since there is no sealing component.
                    mission:setVar(player, 'Status', 1)
                    invaderXim.cop.helpers.sendToPromyvionZone(player:getLocalVar('toPromyvion'))
                end,
            },
        },

        [invaderXim.zone.PROMYVION_DEM] =
        {
            onZoneIn = invaderXim.cop.helpers.promyvionOnZoneIn,

            onEventFinish =
            {
                [51] = function(player, csid, option, npc)
                    mission:setVar(player, 'Option', invaderXim.cop.helpers.promyvionCrags.DEM)
                end,

                [52] = function(player, csid, option, npc)
                    mission:setVar(player, 'Option', invaderXim.cop.helpers.promyvionCrags.DEM)
                end,
            },
        },

        [invaderXim.zone.SPIRE_OF_DEM] =
        {
            onEventFinish =
            {
                [32001] = spireEventFinish,
            },
        },

        [invaderXim.zone.PROMYVION_HOLLA] =
        {
            onZoneIn = invaderXim.cop.helpers.promyvionOnZoneIn,

            onEventFinish =
            {
                [51] = function(player, csid, option, npc)
                    mission:setVar(player, 'Option', invaderXim.cop.helpers.promyvionCrags.HOLLA)
                end,

                [52] = function(player, csid, option, npc)
                    mission:setVar(player, 'Option', invaderXim.cop.helpers.promyvionCrags.HOLLA)
                end,
            },
        },

        [invaderXim.zone.SPIRE_OF_HOLLA] =
        {
            onEventFinish =
            {
                [32001] = spireEventFinish,
            },
        },

        [invaderXim.zone.PROMYVION_MEA] =
        {
            onZoneIn = invaderXim.cop.helpers.promyvionOnZoneIn,

            onEventFinish =
            {
                [51] = function(player, csid, option, npc)
                    mission:setVar(player, 'Option', invaderXim.cop.helpers.promyvionCrags.MEA)
                end,

                [52] = function(player, csid, option, npc)
                    mission:setVar(player, 'Option', invaderXim.cop.helpers.promyvionCrags.MEA)
                end,
            },
        },

        [invaderXim.zone.SPIRE_OF_MEA] =
        {
            onEventFinish =
            {
                [32001] = spireEventFinish,
            },
        },
    },

    {
        check = function(player, currentMission, missionStatus, vars)
            return player:hasCompletedMission(mission.areaId, mission.missionId)
        end,

        [invaderXim.zone.KONSCHTAT_HIGHLANDS] =
        {
            ['Shattered_Telepoint'] = mission:event(913):replaceDefault(),

            onEventFinish =
            {
                [913] = function(player, csid, option, npc)
                    if option == 0 then
                        player:setPos(-267.194, -40.634, -280.019, 0, 14) -- To Hall of Transference (R)
                    end
                end,
            },
        },

        [invaderXim.zone.TAHRONGI_CANYON] =
        {
            ['Shattered_Telepoint'] = mission:event(913):replaceDefault(),

            onEventFinish =
            {
                [913] = function(player, csid, option, npc)
                    if option == 0 then
                        player:setPos(280.066, -80.635, -67.096, 191, 14)
                    end
                end,
            },
        },

        [invaderXim.zone.LA_THEINE_PLATEAU] =
        {
            ['Shattered_Telepoint'] = mission:event(202):replaceDefault(),

            onEventFinish =
            {
                [202] = function(player, csid, option, npc)
                    if option == 0 then
                        player:setPos(-266.76, -0.635, 280.058, 0, 14) -- To Hall of Transference (R)
                    end
                end,
            },
        },
    },
}

return mission
