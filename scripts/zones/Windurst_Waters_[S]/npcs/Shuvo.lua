-----------------------------------
-- Area: Windurst Waters [S]
--  NPC: Shuvo
-- Type: Alter Ego Extravaganza
-- !gotoid 17163023
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local notes = player:getCurrency('allied_notes')

    invaderXim.extravaganza.shadowEraTrigger(player, npc, notes)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.extravaganza.shadowEraFinish(player, csid, option, npc)
end

return entity
