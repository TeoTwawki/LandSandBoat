-----------------------------------
-- Give a Moogle a Break
-----------------------------------
-- Log ID: 4, Quest ID: 100
-- Moogle : (Mog House, Home Nation)
-----------------------------------

local quest = Quest:new(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.GIVE_A_MOOGLE_A_BREAK)

quest.reward =
{
    title = invaderXim.title.MOGS_KIND_MASTER,
}

-- Since there are so many zones with interactions:
quest.sections = {}

quest.sections[1] =
{
    check = function(player, status, vars)
        local bedPlacedTime = quest:getVar(player, 'bedPlacedTime')

        return status == invaderXim.questStatus.QUEST_AVAILABLE and
            invaderXim.moghouse.isInMogHouseInHomeNation(player) and
            player:getFameLevel(player:getNation()) >= 3 and
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
            return quest:progressEvent(30005, 0, 0, 0, 5, 0, invaderXim.item.POWER_BOW, invaderXim.item.BEETLE_RING)
        end,
    },

    onEventFinish =
    {
        [30005] = function(player, csid, option, npc)
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
            if npcUtil.tradeHasExactly(trade, { invaderXim.item.POWER_BOW, invaderXim.item.BEETLE_RING }) then
                return quest:progressEvent(30007)
            end
        end,

        onTrigger = function(player, npc)
            local questProgress = quest:getVar(player, 'Prog')
            local questSeen = quest:getLocalVar(player, 'questSeen')

            if questSeen ~= 0 then
                return nil
            end

            if questProgress == 0 then
                return quest:progressEvent(30006, 0, 0, 0, 0, 0, invaderXim.item.POWER_BOW, invaderXim.item.BEETLE_RING)
            elseif
                questProgress == 1 and
                quest:getVar(player, 'Timer') < os.time()
            then
                return quest:progressEvent(30008)
            end
        end,
    },

    onEventFinish =
    {
        [30006] = function(player, csid, option, npc)
            quest:setLocalVar(player, 'questSeen', 1)
        end,

        [30007] = function(player, csid, option, npc)
            player:confirmTrade()
            quest:setVar(player, 'Prog', 1)
            quest:setVar(player, 'Timer', os.time() + 60)
        end,

        [30008] = function(player, csid, option, npc)
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
