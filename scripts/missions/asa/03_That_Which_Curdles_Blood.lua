-----------------------------------
-- A Shantotto Ascension
-- A Shantotto Ascension M3
-----------------------------------
-- !addmission 11 2
-- Kuroido-Moido : !pos -113.78 -3.25 105.40 240
-- Faulpie       : !pos -178.88 -1 9.89 230
-- Abd-al-Raziq  : !pos 126.7 2.0 -0.23 234
-- Trodden Snow  : !pos -19.7 -17.3 104.4 126
-----------------------------------

local mission = Mission:new(invaderXim.mission.log_id.ASA, invaderXim.mission.id.asa.THAT_WHICH_CURDLES_BLOOD)

mission.reward =
{
    keyItem          =
    {
        invaderXim.ki.DOMINAS_SCARLET_SEAL,
        invaderXim.ki.DOMINAS_CERULEAN_SEAL,
        invaderXim.ki.DOMINAS_EMERALD_SEAL,
        invaderXim.ki.DOMINAS_AMBER_SEAL,
        invaderXim.ki.DOMINAS_VIOLET_SEAL,
        invaderXim.ki.DOMINAS_AZURE_SEAL
    },
    nextMission = { invaderXim.mission.log_id.ASA, invaderXim.mission.id.asa.SUGAR_COATED_DIRECTIVE },
}

local function handleTradeEvent(player, trade, firstId)
    local asaKit = mission:getVar(player, 'Option')
    if npcUtil.tradeHasExactly(trade, asaKit) then
        return mission:progressEvent(firstId)
    end
end

local handleTradeEventFinish = function(player, csid, option, npc)
    if mission:complete(player) then
        player:confirmTrade()
    end
end

mission.sections =
{
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId
        end,

        [invaderXim.zone.PORT_WINDURST] =
        {
            ['Kuroido-Moido'] =
            {
                onTrigger = function(player, npc)
                    local potionInfo =
                    {
                        { invaderXim.item.ENFEEBLEMENT_KIT_OF_POISON,    invaderXim.item.FLASK_OF_POISON_POTION    },
                        { invaderXim.item.ENFEEBLEMENT_KIT_OF_BLINDNESS, invaderXim.item.FLASK_OF_BLINDNESS_POTION },
                        { invaderXim.item.ENFEEBLEMENT_KIT_OF_SLEEP,     invaderXim.item.FLASK_OF_SLEEPING_POTION  },
                        { invaderXim.item.ENFEEBLEMENT_KIT_OF_SILENCE,   invaderXim.item.FLASK_OF_SILENCING_POTION }
                    }

                    local kit = mission:getVar(player, 'Option')

                    for _, potionData in ipairs(potionInfo) do
                        if kit == potionData[1] then
                            return mission:progressEvent(858, kit, invaderXim.item.SHEET_OF_BAST_PARCHMENT, 0, invaderXim.item.INFERIOR_COCOON, potionData[2], invaderXim.item.EARTH_CRYSTAL)
                        end
                    end
                end,
            },
        },

        [invaderXim.zone.SOUTHERN_SAN_DORIA] =
        {
            ['Faulpie'] =
            {
                onTrigger = function(player, npc)
                    local kit = mission:getVar(player, 'Option')

                    return mission:progressEvent(944, kit, invaderXim.item.SHEET_OF_FINE_PARCHMENT, invaderXim.item.SHEET_OF_PARCHMENT, invaderXim.item.SHEET_OF_PARCHMENT, invaderXim.item.PUMICE_STONE, invaderXim.item.DARK_CRYSTAL)
                end,
            },
        },

        [invaderXim.zone.BASTOK_MINES] =
        {
            ['Abd-al-Raziq'] =
            {
                onTrigger = function(player, npc)
                    local kit = mission:getVar(player, 'Option')

                    return mission:progressEvent(590, kit, invaderXim.item.JAR_OF_ENCHANTED_INK, invaderXim.item.JAR_OF_BLACK_INK, invaderXim.item.DARK_CRYSTAL, invaderXim.item.VIAL_OF_MAGICKED_BLOOD, invaderXim.item.DARK_CRYSTAL)
                end,
            },
        },

        [invaderXim.zone.QUFIM_ISLAND] =
        {
            ['Trodden_Snow'] =
            {
                onTrade = function(player, npc, trade)
                    return handleTradeEvent(player, trade, 44)
                end,
            },
            onEventFinish =
            {
                [44] = handleTradeEventFinish,
            },
        },
    },
}

return mission
