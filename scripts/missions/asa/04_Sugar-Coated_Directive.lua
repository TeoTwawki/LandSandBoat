-----------------------------------
-- A Shantotto Ascension
-- A Shantotto Ascension M4
-----------------------------------
-- !addmission 11 3
-- Trodden Snow  : !pos -19.7 -17.3 104.4 126
-----------------------------------
local flamesID  = zones[invaderXim.zone.CLOISTER_OF_FLAMES]
local frostID   = zones[invaderXim.zone.CLOISTER_OF_FROST]
local galesID   = zones[invaderXim.zone.CLOISTER_OF_GALES]
local stormsID  = zones[invaderXim.zone.CLOISTER_OF_STORMS]
local tidesID   = zones[invaderXim.zone.CLOISTER_OF_TIDES]
local tremorsID = zones[invaderXim.zone.CLOISTER_OF_TREMORS]
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.ASA, invaderXim.mission.id.asa.SUGAR_COATED_DIRECTIVE)

mission.reward =
{
    nextMission = { invaderXim.mission.log_id.ASA, invaderXim.mission.id.asa.ENEMY_OF_THE_EMPIRE_I },
}

local counterseals =
{
    invaderXim.ki.AMBER_COUNTERSEAL,
    invaderXim.ki.AZURE_COUNTERSEAL,
    invaderXim.ki.CERULEAN_COUNTERSEAL,
    invaderXim.ki.EMERALD_COUNTERSEAL,
    invaderXim.ki.SCARLET_COUNTERSEAL,
    invaderXim.ki.VIOLET_COUNTERSEAL,
}

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.CLOISTER_OF_FLAMES] =
        {
            ['FP_Entrance'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:hasKeyItem(invaderXim.ki.DOMINAS_SCARLET_SEAL) and
                        mission:getVar(player, 'Ifrit') == 0
                    then
                        mission:setVar(player, 'Ifrit', 1)
                        return mission:messageSpecial(flamesID.text.POWER_STYMIES, invaderXim.keyItem.DOMINAS_SCARLET_SEAL)
                    elseif
                        player:hasKeyItem(invaderXim.ki.DOMINAS_SCARLET_SEAL) and
                        player:getLocalVar('battlefieldWin') == invaderXim.battlefield.id.SUGAR_COATED_DIRECTIVE_CLOISTER_OF_FLAMES
                    then
                        return mission:progressEvent(2)
                    end
                end,

                onEventFinish =
                {
                    [2] = function(player, csid, option, npc)
                        player:delKeyItem(invaderXim.ki.DOMINAS_SCARLET_SEAL)
                        player:messageSpecial(flamesID.text.ATTACH_SEAL, invaderXim.ki.DOMINAS_SCARLET_SEAL)
                        npcUtil.giveKeyItem(player, invaderXim.ki.SCARLET_COUNTERSEAL)
                    end,
                }
            },
        },

        [invaderXim.zone.CLOISTER_OF_FROST] =
        {
            ['IP_Entrance'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:hasKeyItem(invaderXim.ki.DOMINAS_AZURE_SEAL) and
                        mission:getVar(player, 'Shiva') == 0
                    then
                        mission:setVar(player, 'Shiva', 1)
                        return mission:messageSpecial(frostID.text.POWER_STYMIES, invaderXim.keyItem.DOMINAS_AZURE_SEAL)
                    elseif
                        player:hasKeyItem(invaderXim.ki.DOMINAS_AZURE_SEAL) and
                        player:getLocalVar('battlefieldWin') == invaderXim.battlefield.id.SUGAR_COATED_DIRECTIVE_CLOISTER_OF_FROST
                    then
                        return mission:progressEvent(2)
                    end
                end,

                onEventFinish =
                {
                    [2] = function(player, csid, option, npc)
                        player:delKeyItem(invaderXim.ki.DOMINAS_AZURE_SEAL)
                        player:messageSpecial(frostID.text.ATTACH_SEAL, invaderXim.ki.DOMINAS_AZURE_SEAL)
                        npcUtil.giveKeyItem(player, invaderXim.ki.AZURE_COUNTERSEAL)
                    end,
                }
            },
        },

        [invaderXim.zone.CLOISTER_OF_GALES] =
        {
            ['WP_Entrance'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:hasKeyItem(invaderXim.ki.DOMINAS_EMERALD_SEAL) and
                        mission:getVar(player, 'Garuda') == 0
                    then
                        mission:setVar(player, 'Garuda', 1)
                        return mission:messageSpecial(galesID.text.POWER_STYMIES, invaderXim.keyItem.DOMINAS_EMERALD_SEAL)
                    elseif
                        player:hasKeyItem(invaderXim.ki.DOMINAS_EMERALD_SEAL) and
                        player:getLocalVar('battlefieldWin') == invaderXim.battlefield.id.SUGAR_COATED_DIRECTIVE_CLOISTER_OF_GALES
                    then
                        return mission:progressEvent(2)
                    end
                end,

                onEventFinish =
                {
                    [2] = function(player, csid, option, npc)
                        player:delKeyItem(invaderXim.ki.DOMINAS_EMERALD_SEAL)
                        player:messageSpecial(galesID.text.ATTACH_SEAL, invaderXim.ki.DOMINAS_EMERALD_SEAL)
                        npcUtil.giveKeyItem(player, invaderXim.ki.EMERALD_COUNTERSEAL)
                    end,
                }
            },
        },

        [invaderXim.zone.CLOISTER_OF_STORMS] =
        {
            ['LP_Entrance'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:hasKeyItem(invaderXim.ki.DOMINAS_VIOLET_SEAL) and
                        mission:getVar(player, 'Ramuh') == 0
                    then
                        mission:setVar(player, 'Ramuh', 1)
                        return mission:messageSpecial(stormsID.text.POWER_STYMIES, invaderXim.keyItem.DOMINAS_VIOLET_SEAL)
                    elseif
                        player:hasKeyItem(invaderXim.ki.DOMINAS_VIOLET_SEAL) and
                        player:getLocalVar('battlefieldWin') == invaderXim.battlefield.id.SUGAR_COATED_DIRECTIVE_CLOISTER_OF_STORMS
                    then
                        return mission:progressEvent(2)
                    end
                end,

                onEventFinish =
                {
                    [2] = function(player, csid, option, npc)
                        player:delKeyItem(invaderXim.ki.DOMINAS_VIOLET_SEAL)
                        player:messageSpecial(stormsID.text.ATTACH_SEAL, invaderXim.ki.DOMINAS_VIOLET_SEAL)
                        npcUtil.giveKeyItem(player, invaderXim.ki.VIOLET_COUNTERSEAL)
                    end,
                }
            },
        },

        [invaderXim.zone.CLOISTER_OF_TIDES] =
        {
            ['WP_Entrance'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:hasKeyItem(invaderXim.ki.DOMINAS_CERULEAN_SEAL) and
                        mission:getVar(player, 'Leviathan') == 0
                    then
                        mission:setVar(player, 'Leviathan', 1)
                        return mission:messageSpecial(tidesID.text.POWER_STYMIES, invaderXim.keyItem.DOMINAS_CERULEAN_SEAL)
                    elseif
                        player:hasKeyItem(invaderXim.ki.DOMINAS_CERULEAN_SEAL) and
                        player:getLocalVar('battlefieldWin') == invaderXim.battlefield.id.SUGAR_COATED_DIRECTIVE_CLOISTER_OF_TIDES
                    then
                        return mission:progressEvent(2)
                    end
                end,

                onEventFinish =
                {
                    [2] = function(player, csid, option, npc)
                        player:delKeyItem(invaderXim.ki.DOMINAS_CERULEAN_SEAL)
                        player:messageSpecial(tidesID.text.ATTACH_SEAL, invaderXim.ki.DOMINAS_CERULEAN_SEAL)
                        npcUtil.giveKeyItem(player, invaderXim.ki.CERULEAN_COUNTERSEAL)
                    end,
                }
            },
        },

        [invaderXim.zone.CLOISTER_OF_TREMORS] =
        {
            ['EP_Entrance'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:hasKeyItem(invaderXim.ki.DOMINAS_AMBER_SEAL) and
                        mission:getVar(player, 'Titan') == 0
                    then
                        mission:setVar(player, 'Titan', 1)
                        return mission:messageSpecial(tremorsID.text.POWER_STYMIES, invaderXim.keyItem.DOMINAS_AMBER_SEAL)
                    elseif
                        player:hasKeyItem(invaderXim.ki.DOMINAS_AMBER_SEAL) and
                        player:getLocalVar('battlefieldWin') == invaderXim.battlefield.id.SUGAR_COATED_DIRECTIVE_CLOISTER_OF_TREMORS
                    then
                        return mission:progressEvent(2)
                    end
                end,

                onEventFinish =
                {
                    [2] = function(player, csid, option, npc)
                        player:delKeyItem(invaderXim.ki.DOMINAS_AMBER_SEAL)
                        player:messageSpecial(tremorsID.text.ATTACH_SEAL, invaderXim.ki.DOMINAS_AMBER_SEAL)
                        npcUtil.giveKeyItem(player, invaderXim.ki.AMBER_COUNTERSEAL)
                    end,
                }
            },
        },

        [invaderXim.zone.QUFIM_ISLAND] =
        {
            ['Trodden_Snow'] =
            {
                onTrigger = function(player, npc)
                    --ASA 4 CS: Triggers With At Least 3 Counterseals.
                    local completedSeals = 0
                    for _, ki in pairs(counterseals) do
                        if player:hasKeyItem(ki) then
                            completedSeals = completedSeals + 1
                        end
                    end

                    if completedSeals >= 3 then
                        return mission:progressEvent(45)
                    end
                end,
            },

            onEventFinish =
            {
                [45] = function(player, csid, option, npc)
                    local completedSeals = 0
                    for _, ki in pairs(counterseals) do
                        if player:hasKeyItem(ki) then
                            completedSeals = completedSeals + 1
                        end
                    end

                    -- Calculate Reward
                    local gilRewards =
                    {
                        { 3, 3000 },
                        { 4, 10000 },
                        { 5, 30000 },
                        { 6, 50000 },
                    }

                    for _, v in pairs(gilRewards) do
                        if completedSeals == v[1] then
                            npcUtil.giveCurrency(player, 'gil', v[2])
                        end
                    end

                    -- Clean Up Remaining Key Items
                    local keyItems =
                    {
                        invaderXim.ki.DOMINAS_SCARLET_SEAL,
                        invaderXim.ki.DOMINAS_CERULEAN_SEAL,
                        invaderXim.ki.DOMINAS_EMERALD_SEAL,
                        invaderXim.ki.DOMINAS_AMBER_SEAL,
                        invaderXim.ki.DOMINAS_VIOLET_SEAL,
                        invaderXim.ki.DOMINAS_AZURE_SEAL,
                        invaderXim.ki.SCARLET_COUNTERSEAL,
                        invaderXim.ki.CERULEAN_COUNTERSEAL,
                        invaderXim.ki.EMERALD_COUNTERSEAL,
                        invaderXim.ki.AMBER_COUNTERSEAL,
                        invaderXim.ki.VIOLET_COUNTERSEAL,
                        invaderXim.ki.AZURE_COUNTERSEAL
                    }

                    for _, v in pairs(keyItems) do
                        player:delKeyItem(v)
                    end

                    mission:complete(player)
                end,
            },
        },
    },

    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission > mission.missionId
        end,

        [invaderXim.zone.CLOISTER_OF_FLAMES] =
        {
            ['FP_Entrance'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:hasKeyItem(invaderXim.ki.DOMINAS_SCARLET_SEAL) and
                        mission:getVar(player, 'Ifrit') == 0
                    then
                        mission:setVar(player, 'Ifrit', 1)
                        return mission:messageSpecial(flamesID.text.POWER_STYMIES, invaderXim.keyItem.DOMINAS_SCARLET_SEAL)
                    elseif
                        player:hasKeyItem(invaderXim.ki.DOMINAS_SCARLET_SEAL) and
                        player:getLocalVar('battlefieldWin') == invaderXim.battlefield.id.SUGAR_COATED_DIRECTIVE_CLOISTER_OF_FLAMES
                    then
                        return mission:progressEvent(2)
                    end
                end,

                onEventFinish =
                {
                    [2] = function(player, csid, option, npc)
                        player:delKeyItem(invaderXim.ki.DOMINAS_SCARLET_SEAL)
                        player:messageSpecial(flamesID.text.ATTACH_SEAL, invaderXim.ki.DOMINAS_SCARLET_SEAL)
                        npcUtil.giveKeyItem(player, invaderXim.ki.SCARLET_COUNTERSEAL)
                    end,
                }
            },
        },

        [invaderXim.zone.CLOISTER_OF_FROST] =
        {
            ['IP_Entrance'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:hasKeyItem(invaderXim.ki.DOMINAS_AZURE_SEAL) and
                        mission:getVar(player, 'Shiva') == 0
                    then
                        mission:setVar(player, 'Shiva', 1)
                        return mission:messageSpecial(frostID.text.POWER_STYMIES, invaderXim.keyItem.DOMINAS_AZURE_SEAL)
                    elseif
                        player:hasKeyItem(invaderXim.ki.DOMINAS_AZURE_SEAL) and
                        player:getLocalVar('battlefieldWin') == invaderXim.battlefield.id.SUGAR_COATED_DIRECTIVE_CLOISTER_OF_FROST
                    then
                        return mission:progressEvent(2)
                    end
                end,

                onEventFinish =
                {
                    [2] = function(player, csid, option, npc)
                        player:delKeyItem(invaderXim.ki.DOMINAS_AZURE_SEAL)
                        player:messageSpecial(frostID.text.ATTACH_SEAL, invaderXim.ki.DOMINAS_AZURE_SEAL)
                        npcUtil.giveKeyItem(player, invaderXim.ki.AZURE_COUNTERSEAL)
                    end,
                }
            },
        },

        [invaderXim.zone.CLOISTER_OF_GALES] =
        {
            ['WP_Entrance'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:hasKeyItem(invaderXim.ki.DOMINAS_EMERALD_SEAL) and
                        mission:getVar(player, 'Garuda') == 0
                    then
                        mission:setVar(player, 'Garuda', 1)
                        return mission:messageSpecial(galesID.text.POWER_STYMIES, invaderXim.keyItem.DOMINAS_EMERALD_SEAL)
                    elseif
                        player:hasKeyItem(invaderXim.ki.DOMINAS_EMERALD_SEAL) and
                        player:getLocalVar('battlefieldWin') == invaderXim.battlefield.id.SUGAR_COATED_DIRECTIVE_CLOISTER_OF_GALES
                    then
                        return mission:progressEvent(2)
                    end
                end,

                onEventFinish =
                {
                    [2] = function(player, csid, option, npc)
                        player:delKeyItem(invaderXim.ki.DOMINAS_EMERALD_SEAL)
                        player:messageSpecial(galesID.text.ATTACH_SEAL, invaderXim.ki.DOMINAS_EMERALD_SEAL)
                        npcUtil.giveKeyItem(player, invaderXim.ki.EMERALD_COUNTERSEAL)
                    end,
                }
            },
        },

        [invaderXim.zone.CLOISTER_OF_STORMS] =
        {
            ['LP_Entrance'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:hasKeyItem(invaderXim.ki.DOMINAS_VIOLET_SEAL) and
                        mission:getVar(player, 'Ramuh') == 0
                    then
                        mission:setVar(player, 'Ramuh', 1)
                        return mission:messageSpecial(stormsID.text.POWER_STYMIES, invaderXim.keyItem.DOMINAS_VIOLET_SEAL)
                    elseif
                        player:hasKeyItem(invaderXim.ki.DOMINAS_VIOLET_SEAL) and
                        player:getLocalVar('battlefieldWin') == invaderXim.battlefield.id.SUGAR_COATED_DIRECTIVE_CLOISTER_OF_STORMS
                    then
                        return mission:progressEvent(2)
                    end
                end,

                onEventFinish =
                {
                    [2] = function(player, csid, option, npc)
                        player:delKeyItem(invaderXim.ki.DOMINAS_VIOLET_SEAL)
                        player:messageSpecial(stormsID.text.ATTACH_SEAL, invaderXim.ki.DOMINAS_VIOLET_SEAL)
                        npcUtil.giveKeyItem(player, invaderXim.ki.VIOLET_COUNTERSEAL)
                    end,
                }
            },
        },

        [invaderXim.zone.CLOISTER_OF_TIDES] =
        {
            ['WP_Entrance'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:hasKeyItem(invaderXim.ki.DOMINAS_CERULEAN_SEAL) and
                        mission:getVar(player, 'Leviathan') == 0
                    then
                        mission:setVar(player, 'Leviathan', 1)
                        return mission:messageSpecial(tidesID.text.POWER_STYMIES, invaderXim.keyItem.DOMINAS_CERULEAN_SEAL)
                    elseif
                        player:hasKeyItem(invaderXim.ki.DOMINAS_CERULEAN_SEAL) and
                        player:getLocalVar('battlefieldWin') == invaderXim.battlefield.id.SUGAR_COATED_DIRECTIVE_CLOISTER_OF_TIDES
                    then
                        return mission:progressEvent(2)
                    end
                end,

                onEventFinish =
                {
                    [2] = function(player, csid, option, npc)
                        player:delKeyItem(invaderXim.ki.DOMINAS_CERULEAN_SEAL)
                        player:messageSpecial(tidesID.text.ATTACH_SEAL, invaderXim.ki.DOMINAS_CERULEAN_SEAL)
                        npcUtil.giveKeyItem(player, invaderXim.ki.CERULEAN_COUNTERSEAL)
                    end,
                }
            },
        },

        [invaderXim.zone.CLOISTER_OF_TREMORS] =
        {
            ['EP_Entrance'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:hasKeyItem(invaderXim.ki.DOMINAS_AMBER_SEAL) and
                        mission:getVar(player, 'Titan') == 0
                    then
                        mission:setVar(player, 'Titan', 1)
                        return mission:messageSpecial(tremorsID.text.POWER_STYMIES, invaderXim.keyItem.DOMINAS_AMBER_SEAL)
                    elseif
                        player:hasKeyItem(invaderXim.ki.DOMINAS_AMBER_SEAL) and
                        player:getLocalVar('battlefieldWin') == invaderXim.battlefield.id.SUGAR_COATED_DIRECTIVE_CLOISTER_OF_TREMORS
                    then
                        return mission:progressEvent(2)
                    end
                end,

                onEventFinish =
                {
                    [2] = function(player, csid, option, npc)
                        player:delKeyItem(invaderXim.ki.DOMINAS_AMBER_SEAL)
                        player:messageSpecial(tremorsID.text.ATTACH_SEAL, invaderXim.ki.DOMINAS_AMBER_SEAL)
                        npcUtil.giveKeyItem(player, invaderXim.ki.AMBER_COUNTERSEAL)
                    end,
                }
            },
        },
    },
}

return mission
