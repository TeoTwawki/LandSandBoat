-----------------------------------
-- The Moogle's Picnic!
-----------------------------------
-- Log ID: 4, Quest ID: 101
-- Moogle : (Mog House, Home Nation)
-----------------------------------

local quest = Quest:new(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.THE_MOOGLE_PICNIC)

quest.reward =
{
    title = invaderXim.title.MOGS_EXCEPTIONALLY_KIND_MASTER,
}

-- Since there are so many zones with interactions:
quest.sections = {}

quest.sections[1] =
{
    check = function(player, status, vars)
        local bedPlacedTime = quest:getVar(player, 'bedPlacedTime')

        return status == invaderXim.questStatus.QUEST_AVAILABLE and
            player:hasCompletedQuest(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.GIVE_A_MOOGLE_A_BREAK) and
            invaderXim.moghouse.isInMogHouseInHomeNation(player) and
            player:getFameLevel(player:getNation()) >= 5 and
            not quest:getMustZone(player) and
            quest:getLocalVar(player, 'questSeen') == 0 and
            bedPlacedTime ~= 0 and
            os.time() > bedPlacedTime + 60
    end
}

---@type ZoneSection
local questAvailable =
{
    ['Moogle'] =
    {
        onTrigger = function(player, npc)
            return quest:progressEvent(30009, 0, 0, 0, 4, 0, invaderXim.item.SHRIMP_LURE, invaderXim.item.STICK_OF_SELBINA_BUTTER)
        end,
    },

    onEventFinish =
    {
        [30009] = function(player, csid, option, npc)
            quest:setLocalVar(player, 'questSeen', 1)

            if option == 1 then
                quest:begin(player)
            end
        end,
    },
}

quest.sections[2] =
{
    check = function(player, status, vars)
        return status == invaderXim.questStatus.QUEST_ACCEPTED
    end
}

---@type ZoneSection
local questAccepted =
{
    ['Moogle'] =
    {
        onTrade = function(player, npc, trade)
            if npcUtil.tradeHasExactly(trade, { invaderXim.item.SHRIMP_LURE, invaderXim.item.STICK_OF_SELBINA_BUTTER }) then
                return quest:progressEvent(30011)
            end
        end,

        onTrigger = function(player, npc)
            local questProgress = quest:getVar(player, 'Prog')
            local questSeen = quest:getLocalVar(player, 'questSeen')

            if questSeen ~= 0 then
                return nil
            end

            if questProgress == 0 then
                return quest:progressEvent(30010, 0, 0, 0, 0, 0, invaderXim.item.SHRIMP_LURE, invaderXim.item.STICK_OF_SELBINA_BUTTER)
            elseif
                questProgress == 1 and
                quest:getVar(player, 'Timer') < os.time()
            then
                return quest:progressEvent(30012)
            end
        end,
    },

    onEventFinish =
    {
        [30010] = function(player, csid, option, npc)
            quest:setLocalVar(player, 'questSeen', 1)
        end,

        [30011] = function(player, csid, option, npc)
            player:confirmTrade()
            quest:setVar(player, 'Prog', 1)
            quest:setVar(player, 'Timer', os.time() + 60)
        end,

        [30012] = function(player, csid, option, npc)
            if quest:complete(player) then
                player:changeContainerSize(invaderXim.inv.MOGSAFE, 10)
                player:changeContainerSize(invaderXim.inv.MOGSAFE2, 10)
            end
        end,
    },
}

for _, zoneId in ipairs(invaderXim.moghouse.moghouseZones) do
    quest.sections[1][zoneId] = questAvailable
    quest.sections[2][zoneId] = questAccepted
end

return quest
