-----------------------------------
-- Area: Maze of Shakhrami
--  NPC: Excavation Point
-- Used in Quest: The Holy Crest
-- !pos 234 0.1 -110 198
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        player:getCharVar('TheHolyCrest_Event') == 3 and
        not player:hasItem(invaderXim.item.WYVERN_EGG) and
        npcUtil.tradeHas(trade, invaderXim.item.PICKAXE)
    then
        if npcUtil.giveItem(player, invaderXim.item.WYVERN_EGG) then
            player:confirmTrade()
        end
    else
        invaderXim.helm.onTrade(player, npc, trade, invaderXim.helmType.EXCAVATION, 60)
    end
end

entity.onTrigger = function(player, npc)
    invaderXim.helm.onTrigger(player, invaderXim.helmType.EXCAVATION)
end

return entity
