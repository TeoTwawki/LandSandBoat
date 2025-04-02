-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Goggehn
-- Involved in Mission: Bastok 3-3, 4-1
-- !pos 3 9 -76 243
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local pNation = player:getNation()

    if pNation == invaderXim.nation.BASTOK then
        if player:hasKeyItem(invaderXim.ki.MESSAGE_TO_JEUNO_BASTOK) then
            player:startEvent(55)
        else
            player:startEvent(101)
        end
    elseif pNation == invaderXim.nation.SANDORIA then
        player:startEvent(1)
    elseif pNation == invaderXim.nation.WINDURST then
        player:startEvent(2)
    end
end

return entity
