-----------------------------------
-- Edge of Existence
-- Wings of the Goddess Mission 40
-----------------------------------
-- !addmission 5 39
-- Cavernous Maws:
-- Batallia Downs           : !pos -48 0.1 435 105
-- Rolanberry Fields        : !pos -198 8 361 110
-- Sauromugue Champaign     : !pos 369 8 -227 120
-- Batallia Downs [S]       : !pos -48 0 435 84
-- Rolanberry Fields [S]    : !pos -198 8 360 91
-- Sauromugue Champaign [S] : !pos 369 8 -227 98
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.WOTG, invaderXim.mission.id.wotg.EDGE_OF_IXIMSTENCE)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.WOTG, invaderXim.mission.id.wotg.HER_MEMORIES },
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.BATALLIA_DOWNS] =
        {
            ['Cavernous_Maw'] = mission:progressEvent(3, 0, 0, 0, 0, 0, 0, 0, 1),

            onEventFinish =
            {
                [3] = function(player, csid, option, npc)
                    if mission:complete(player) then
                        invaderXim.maws.goToMaw(player, invaderXim.zone.BATALLIA_DOWNS)
                    end
                end,
            },
        },

        [invaderXim.zone.ROLANBERRY_FIELDS] =
        {
            ['Cavernous_Maw'] = mission:progressEvent(502, 1, 26, 83764, 22093, 466180, 1822, 648024, 0),

            onEventFinish =
            {
                [502] = function(player, csid, option, npc)
                    if mission:complete(player) then
                        invaderXim.maws.goToMaw(player, invaderXim.zone.ROLANBERRY_FIELDS)
                    end
                end,
            },
        },

        [invaderXim.zone.SAUROMUGUE_CHAMPAIGN] =
        {
            ['Cavernous_Maw'] = mission:progressEvent(502, 2, 0, 0, 0, 0, 0, 0, 1),

            onEventFinish =
            {
                [502] = function(player, csid, option, npc)
                    if mission:complete(player) then
                        invaderXim.maws.goToMaw(player, invaderXim.zone.SAUROMUGUE_CHAMPAIGN)
                    end
                end,
            },
        },

        [invaderXim.zone.BATALLIA_DOWNS_S] =
        {
            ['Cavernous_Maw'] = mission:progressEvent(7, 0, 0, 0, 0, 0, 0, 3, 1),

            onEventFinish =
            {
                [7] = function(player, csid, option, npc)
                    if mission:complete(player) then
                        invaderXim.maws.goToMaw(player, invaderXim.zone.BATALLIA_DOWNS_S)
                    end
                end,
            },
        },

        [invaderXim.zone.ROLANBERRY_FIELDS_S] =
        {
            ['Cavernous_Maw'] = mission:progressEvent(702, 1, 0, 0, 0, 0, 0, 3, 1),

            onEventFinish =
            {
                [702] = function(player, csid, option, npc)
                    if mission:complete(player) then
                        invaderXim.maws.goToMaw(player, invaderXim.zone.ROLANBERRY_FIELDS_S)
                    end
                end,
            },
        },

        [invaderXim.zone.SAUROMUGUE_CHAMPAIGN_S] =
        {
            ['Cavernous_Maw'] = mission:progressEvent(702, 2, utils.MAX_UINT32 - 7, utils.MAX_UINT32 - 1, utils.MAX_UINT32 - 1, 0, 0, 0, 1),

            onEventFinish =
            {
                [702] = function(player, csid, option, npc)
                    if mission:complete(player) then
                        invaderXim.maws.goToMaw(player, invaderXim.zone.SAUROMUGUE_CHAMPAIGN_S)
                    end
                end,
            },
        },
    },
}

return mission
