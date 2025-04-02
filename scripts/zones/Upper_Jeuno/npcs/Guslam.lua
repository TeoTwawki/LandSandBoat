-----------------------------------
-- Area: Upper Jeuno
--  NPC: Guslam
-- Starts Quest: Borghertz's Hands (AF Hands, Many job)
-- !pos -5 1 48 244
-----------------------------------
---@type TNpcEntity
local entity = {}

local prerequisites =
{
    [invaderXim.job.WAR] = { log = invaderXim.questLog.BASTOK,   quest = invaderXim.quest.id.bastok.THE_TALEKEEPERS_TRUTH        },
    [invaderXim.job.MNK] = { log = invaderXim.questLog.BASTOK,   quest = invaderXim.quest.id.bastok.THE_FIRST_MEETING            },
    [invaderXim.job.WHM] = { log = invaderXim.questLog.SANDORIA, quest = invaderXim.quest.id.sandoria.PRELUDE_OF_BLACK_AND_WHITE },
    [invaderXim.job.BLM] = { log = invaderXim.questLog.WINDURST, quest = invaderXim.quest.id.windurst.RECOLLECTIONS              },
    [invaderXim.job.RDM] = { log = invaderXim.questLog.SANDORIA, quest = invaderXim.quest.id.sandoria.ENVELOPED_IN_DARKNESS      },
    [invaderXim.job.THF] = { log = invaderXim.questLog.WINDURST, quest = invaderXim.quest.id.windurst.AS_THICK_AS_THIEVES        },
    [invaderXim.job.PLD] = { log = invaderXim.questLog.SANDORIA, quest = invaderXim.quest.id.sandoria.A_BOYS_DREAM               },
    [invaderXim.job.DRK] = { log = invaderXim.questLog.BASTOK,   quest = invaderXim.quest.id.bastok.DARK_PUPPET                  },
    [invaderXim.job.BST] = { log = invaderXim.questLog.JEUNO,    quest = invaderXim.quest.id.jeuno.SCATTERED_INTO_SHADOW         },
    [invaderXim.job.BRD] = { log = invaderXim.questLog.JEUNO,    quest = invaderXim.quest.id.jeuno.THE_REQUIEM                   },
    [invaderXim.job.RNG] = { log = invaderXim.questLog.WINDURST, quest = invaderXim.quest.id.windurst.FIRE_AND_BRIMSTONE         },
    [invaderXim.job.SAM] = { log = invaderXim.questLog.OUTLANDS, quest = invaderXim.quest.id.outlands.YOMI_OKURI                 },
    [invaderXim.job.NIN] = { log = invaderXim.questLog.OUTLANDS, quest = invaderXim.quest.id.outlands.I_LL_TAKE_THE_BIG_BOX      },
    [invaderXim.job.DRG] = { log = invaderXim.questLog.SANDORIA, quest = invaderXim.quest.id.sandoria.CHASING_QUOTAS             },
    [invaderXim.job.SMN] = { log = invaderXim.questLog.WINDURST, quest = invaderXim.quest.id.windurst.CLASS_REUNION              },
}

local function isFirstHandsQuest(player)
    for i = 0, 14 do
        if player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.BORGHERTZS_WARRING_HANDS + i) == invaderXim.questStatus.QUEST_COMPLETED then
            return false
        end
    end

    return true
end

entity.onTrigger = function(player, npc)
    local mJob = player:getMainJob()
    local prereq = prerequisites[mJob]

    -- HANDS QUEST
    if
        prereq and
        player:getMainLvl() >= 50 and
        player:getCharVar('BorghertzAlreadyActiveWithJob') == 0 and
        player:getQuestStatus(prereq.log, prereq.quest) ~= invaderXim.questStatus.QUEST_AVAILABLE and
        player:getQuestStatus(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.BORGHERTZS_WARRING_HANDS + mJob - 1) == invaderXim.questStatus.QUEST_AVAILABLE
    then
        player:startEvent(155)
    elseif
        player:getCharVar('BorghertzAlreadyActiveWithJob') >= 1 and
        not player:hasKeyItem(invaderXim.ki.OLD_GAUNTLETS)
    then
        player:startEvent(43)
    elseif player:hasKeyItem(invaderXim.ki.OLD_GAUNTLETS) then
        player:startEvent(26)

        if player:getCharVar('BorghertzCS') == 0 then
            if isFirstHandsQuest(player) then
                if player:getCharVar('BorghertzHandsFirstTime') == 0 then
                    player:setCharVar('BorghertzHandsFirstTime', 1)
                end
            else
                player:setCharVar('BorghertzCS', 1)
            end
        end

    -- DEFAULT DIALOG
    else
        player:startEvent(154)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 155 then
        local mJob = player:getMainJob()

        player:addQuest(invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.BORGHERTZS_WARRING_HANDS + mJob - 1)
        player:setCharVar('BorghertzAlreadyActiveWithJob', mJob)
    end
end

return entity
