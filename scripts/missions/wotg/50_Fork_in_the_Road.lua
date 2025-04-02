-----------------------------------
-- Fork in the Road
-- Wings of the Goddess Mission 50
-----------------------------------
-- !addmission 5 49
-- Jugner Forest (S)       : !pos 46.333 0.189 309.025
-- La Vaule (S)            : !pos 294.982 3.497 -217.001
-- Southern San d'Oria (S) : !pos 89.343 0.999 99.789
-- Beaucedine Glacier (S)  : !pos -69.917 -39.928 -192.761
-- Xarcabard (S)           : !pos -108.315 -25.605 -52.978
-- Throne Room (S)         : !pos 19.003 0 -4.487
-- Walk of Echoes          : !pos -702.325 0.399 -481.664
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.WOTG, invaderXim.mission.id.wotg.FORK_IN_THE_ROAD)

mission.reward =
{
    keyItem     = invaderXim.ki.PRIMAL_GLOW,
    nextMission = { invaderXim.mission.log_id.WOTG, invaderXim.mission.id.wotg.MAIDEN_OF_THE_DUSK },
}

local zoneEventInfo =
{
--  Zone                               Rewarded KI                      Event #, Parameters
    [invaderXim.zone.JUGNER_FOREST_S]      = { invaderXim.ki.JUGNER_DAWNDROP,         {   7,  82,     0,    0,    0,        0, 7340037,    0, 0 } },
    [invaderXim.zone.LA_VAULE_S]           = { invaderXim.ki.LA_VAULE_DAWNDROP,       {   5,  85,    23, 1756,    0,       85,       1,    0, 0 } },
    [invaderXim.zone.SOUTHERN_SAN_DORIA_S] = { invaderXim.ki.SAN_DORIA_DAWNDROP,      { 176,  80,    23, 1756, 2000,        0,       0,    0, 0 } },
    [invaderXim.zone.BEAUCEDINE_GLACIER_S] = { invaderXim.ki.BEAUCEDINE_DAWNDROP,     {  29, 136,    23, 1756,    0,        0, 6357002,    0, 0 } },
    [invaderXim.zone.XARCABARD_S]          = { invaderXim.ki.XARCABARD_DAWNDROP,      {  42, 137,    23, 2964, 2000, 66584575, 5941395, 4095, 0 } },
    [invaderXim.zone.THRONE_ROOM_S]        = { invaderXim.ki.THRONE_ROOM_DAWNDROP,    {  15, 156,    23, 1756,    0,      156,       2,    0, 0 } },
    [invaderXim.zone.WALK_OF_ECHOES]       = { invaderXim.ki.WALK_OF_ECHOES_DAWNDROP, {  10, 182,    23, 1756,    0,        0,       0, 1984, 1 } },
}

local dawndropOnTrigger = function(player, npc)
    local zoneId = player:getZoneID()

    if not player:hasKeyItem(zoneEventInfo[zoneId][1]) then
        return mission:progressEvent(unpack(zoneEventInfo[zoneId][2]))
    end
end

local dawndropOnEventFinish = function(player, csid, option, npc)
    local numDawndrops = 0

    for _, zoneInfoTable in pairs(zoneEventInfo) do
        if player:hasKeyItem(zoneInfoTable[1]) then
            numDawndrops = numDawndrops + 1
        end
    end

    npcUtil.giveKeyItem(player, zoneEventInfo[player:getZoneID()][1])

    if numDawndrops == 6 then
        local ID = zones[player:getZoneID()]

        player:messageSpecial(ID.text.GATHERED_DAWNDROPS_LIGHT, invaderXim.ki.PRIMAL_GLOW)
        player:messageName(ID.text.RETRACED_ALL_JUNCTIONS, nil)

        for _, zoneInfoTable in pairs(zoneEventInfo) do
            if player:hasKeyItem(zoneInfoTable[1]) then
                player:delKeyItem(zoneInfoTable[1])
            end
        end

        player:delKeyItem(invaderXim.ki.RONFAURE_DAWNDROP)

        mission:complete(player)
    end
end

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.JUGNER_FOREST_S] =
        {
            ['blank_fork'] =
            {
                onTrigger = dawndropOnTrigger,
            },

            onEventFinish =
            {
                [7] = dawndropOnEventFinish,
            },
        },

        [invaderXim.zone.LA_VAULE_S] =
        {
            ['blank_fork'] =
            {
                onTrigger = dawndropOnTrigger,
            },

            onEventFinish =
            {
                [5] = dawndropOnEventFinish,
            },
        },

        [invaderXim.zone.SOUTHERN_SAN_DORIA_S] =
        {
            ['blank_fork'] =
            {
                onTrigger = dawndropOnTrigger,
            },

            onEventFinish =
            {
                [176] = dawndropOnEventFinish,
            },
        },

        [invaderXim.zone.BEAUCEDINE_GLACIER_S] =
        {
            ['blank_fork'] =
            {
                onTrigger = dawndropOnTrigger,
            },

            onEventFinish =
            {
                [29] = dawndropOnEventFinish,
            },
        },

        [invaderXim.zone.XARCABARD_S] =
        {
            ['blank_fork'] =
            {
                onTrigger = dawndropOnTrigger,
            },

            onEventFinish =
            {
                [42] = dawndropOnEventFinish,
            },
        },

        [invaderXim.zone.THRONE_ROOM_S] =
        {
            ['blank_fork'] =
            {
                onTrigger = dawndropOnTrigger,
            },

            onEventFinish =
            {
                [15] = dawndropOnEventFinish,
            },
        },

        [invaderXim.zone.WALK_OF_ECHOES] =
        {
            ['blank_fork'] =
            {
                onTrigger = dawndropOnTrigger,
            },

            onEventFinish =
            {
                [10] = dawndropOnEventFinish,
            },
        },
    },
}

return mission
