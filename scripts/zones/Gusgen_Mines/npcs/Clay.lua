-----------------------------------
-- Area: Gusgen Mines
--  NPC: Clay
-- Involved in Quest: A Potter's Preference
-- !pos 117 -21 432 196
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if not player:hasItem(invaderXim.item.DISH_OF_GUSGEN_CLAY) then
        npcUtil.giveItem(player, invaderXim.item.DISH_OF_GUSGEN_CLAY)
    end
end

return entity
