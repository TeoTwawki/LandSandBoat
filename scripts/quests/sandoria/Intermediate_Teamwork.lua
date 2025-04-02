-----------------------------------
-- Intermediate Teamwork
-----------------------------------
-- Log ID: 0, Quest ID: 64
-----------------------------------
-- Vilatroire : !pos -260 -70 423 100
-----------------------------------

local quest = Quest:new(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.INTERMEDIATE_TEAMWORK)

quest.reward =
{
    item  = invaderXim.item.SCROLL_OF_MAGES_BALLAD,
    fame  = 80,
    title = invaderXim.title.SECOND_RATE_ORGANIZER,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getQuestStatus(invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.INTRODUCTION_TO_TEAMWORK) == invaderXim.questStatus.QUEST_COMPLETED
        end,

        [invaderXim.zone.WEST_RONFAURE] =
        {
            ['Vilatroire'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:getFameLevel(invaderXim.fameArea.SANDORIA) >= 3 and
                        player:getMainLvl() >= 10
                    then
                        return quest:progressEvent(133)
                    else
                        return quest:event(132):replaceDefault()
                    end
                end,
            },

            onEventFinish =
            {
                [133] = function(player, csid, option, npc)
                    if option == 1 then
                        quest:begin(player)
                    end
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED
        end,

        [invaderXim.zone.WEST_RONFAURE] =
        {
            ['Vilatroire'] =
            {
                onTrigger = function(player, npc)
                    local party = player:getParty()

                    if #party > 1 then
                        return quest:progressEvent(129, { [1] = 2 })
                    end
                end,
            },

            onEventUpdate =
            {
                [129] = function(player, csid, option, npc)
                    local partySizeRequirement = 2
                    local party = player:getParty()
                    local partySameRaceCount = 0

                    if #party >= partySizeRequirement then
                        for key, member in pairs(party) do
                            if
                                member:getZoneID() ~= player:getZoneID() or
                                member:checkDistance(player) > 15
                            then
                                player:updateEvent(1)
                                return
                            else
                                local pRace = player:getRace()
                                local mRace = member:getRace()

                                if
                                    (pRace == invaderXim.race.HUME_M or pRace == invaderXim.race.HUME_F) and
                                    (mRace == invaderXim.race.HUME_M or mRace == invaderXim.race.HUME_F)
                                then
                                    partySameRaceCount = partySameRaceCount + 1
                                elseif
                                    (pRace == invaderXim.race.ELVAAN_M or pRace == invaderXim.race.ELVAAN_F) and
                                    (mRace == invaderXim.race.ELVAAN_M or mRace == invaderXim.race.ELVAAN_F)
                                then
                                    partySameRaceCount = partySameRaceCount + 1
                                elseif
                                    (pRace == invaderXim.race.TARU_M or pRace == invaderXim.race.TARU_F) and
                                    (mRace == invaderXim.race.TARU_M or mRace == invaderXim.race.TARU_F)
                                then
                                    partySameRaceCount = partySameRaceCount + 1
                                elseif pRace == invaderXim.race.GALKA and mRace == invaderXim.race.GALKA then
                                    partySameRaceCount = partySameRaceCount + 1
                                elseif pRace == invaderXim.race.MITHRA and mRace == invaderXim.race.MITHRA then
                                    partySameRaceCount = partySameRaceCount + 1
                                end
                            end
                        end
                    else
                        player:updateEvent(1)
                        return
                    end

                    if partySameRaceCount >= partySizeRequirement then
                        quest:setLocalVar(player, 'Prog', 1)
                        player:updateEvent(15, 2)
                        return
                    else
                        player:updateEvent(4, 2)
                        return
                    end
                end,
            },

            onEventFinish =
            {
                [129] = function(player, csid, option, npc)
                    if option == 0 and quest:getLocalVar(player, 'Prog') == 1 then
                        if quest:complete(player) then
                            quest:setLocalVar(player, 'Prog', 0)
                        end
                    end
                end,
            },
        },
    },
}

return quest
