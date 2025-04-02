-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Nelcabrit
-- Involved in Mission: San d'Oria 3-3, 4-1
-- !pos -32 9 -49 243
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local pNation = player:getNation()

    if pNation == invaderXim.nation.SANDORIA then
        if player:hasKeyItem(invaderXim.ki.MESSAGE_TO_JEUNO_SANDORIA) then
            player:startEvent(56)
        else
            player:startEvent(102)
        end
    elseif pNation == invaderXim.nation.WINDURST then
        player:startEvent(47)
    elseif pNation == invaderXim.nation.BASTOK then
        player:startEvent(46)
    end
end

return entity
