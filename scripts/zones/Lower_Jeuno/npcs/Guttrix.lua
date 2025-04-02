-----------------------------------
-- Area: Lower Jeuno
--  NPC: Guttrix
-- Starts and Finishes Quest: The Goblin Tailor
-- !pos -36.010 4.499 -139.714 245
-----------------------------------
---@type TNpcEntity
local entity = {}

---@class rseMap : { [invaderXim.race] : invaderXim.item[] }
local rseMap =
{
    -- [race] = { body, hands, legs, feet }
    [invaderXim.race.HUME_M  ] = { invaderXim.item.CUSTOM_TUNIC,     invaderXim.item.CUSTOM_M_GLOVES,  invaderXim.item.CUSTOM_SLACKS,    invaderXim.item.CUSTOM_M_BOOTS    },
    [invaderXim.race.HUME_F  ] = { invaderXim.item.CUSTOM_VEST,      invaderXim.item.CUSTOM_F_GLOVES,  invaderXim.item.CUSTOM_PANTS,     invaderXim.item.CUSTOM_F_BOOTS    },
    [invaderXim.race.ELVAAN_M] = { invaderXim.item.MAGNA_JERKIN,     invaderXim.item.MAGNA_GAUNTLETS,  invaderXim.item.MAGNA_M_CHAUSSES, invaderXim.item.MAGNA_M_LEDELSENS },
    [invaderXim.race.ELVAAN_F] = { invaderXim.item.MAGNA_BODICE,     invaderXim.item.MAGNA_GLOVES,     invaderXim.item.MAGNA_F_CHAUSSES, invaderXim.item.MAGNA_F_LEDELSENS },
    [invaderXim.race.TARU_M  ] = { invaderXim.item.WONDER_KAFTAN,    invaderXim.item.WONDER_MITTS,     invaderXim.item.WONDER_BRACCAE,   invaderXim.item.WONDER_CLOMPS     },
    [invaderXim.race.TARU_F  ] = { invaderXim.item.WONDER_KAFTAN,    invaderXim.item.WONDER_MITTS,     invaderXim.item.WONDER_BRACCAE,   invaderXim.item.WONDER_CLOMPS     },
    [invaderXim.race.MITHRA  ] = { invaderXim.item.SAVAGE_SEPARATES, invaderXim.item.SAVAGE_GAUNTLETS, invaderXim.item.SAVAGE_LOINCLOTH, invaderXim.item.SAVAGE_GAITERS    },
    [invaderXim.race.GALKA   ] = { invaderXim.item.ELDERS_SURCOAT,   invaderXim.item.ELDERS_BRACERS,   invaderXim.item.ELDERS_BRAGUETTE, invaderXim.item.ELDERS_SANDALS    },
}

local function hasRSE(player)
    local mask = 0
    local rse = rseMap[player:getRace()]

    for i = 1, #rse do
        if player:hasItem(rse[i]) then
            mask = mask + 2 ^ (i - 1)
        end
    end

    return mask
end

entity.onTrigger = function(player, npc)
    local questStatus = player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.THE_GOBLIN_TAILOR)
    local rseGear     = hasRSE(player)
    local rseRace     = VanadielRSERace()
    local rseLocation = VanadielRSELocation()

    if
        player:getMainLvl() >= 10 and
        player:getFameLevel(invaderXim.fameArea.JEUNO) >= 3
    then
        if rseGear < 15 then
            if questStatus == invaderXim.questStatus.QUEST_AVAILABLE then
                player:startEvent(10016, rseLocation, rseRace)
            elseif
                questStatus >= invaderXim.questStatus.QUEST_ACCEPTED and
                player:hasKeyItem(invaderXim.ki.MAGICAL_PATTERN)
            then
                player:startEvent(10018, rseGear)
            else
                player:startEvent(10017, rseLocation, rseRace)
            end
        else
            player:startEvent(10019)
        end
    else
        player:startEvent(10020)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    local questStatus = player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.THE_GOBLIN_TAILOR)

    if csid == 10016 then
        player:addQuest(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.THE_GOBLIN_TAILOR)
    elseif
        csid == 10018 and
        option >= 1 and
        option <= 4 and
        questStatus >= invaderXim.questStatus.QUEST_ACCEPTED and
        player:hasKeyItem(invaderXim.ki.MAGICAL_PATTERN)
    then
        if npcUtil.giveItem(player, rseMap[player:getRace()][option]) then
            if questStatus == invaderXim.questStatus.QUEST_ACCEPTED then
                player:addFame(invaderXim.fameArea.JEUNO, 30)
                player:completeQuest(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.THE_GOBLIN_TAILOR)
            end

            player:delKeyItem(invaderXim.ki.MAGICAL_PATTERN)
        end
    end
end

return entity
