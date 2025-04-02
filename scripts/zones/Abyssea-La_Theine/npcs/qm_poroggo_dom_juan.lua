-----------------------------------
-- Zone: Abyssea-LaTheine
--  NPC: qm_poroggo_dom_juan (???)
-- Spawns Poroggo Dom Juan
-- !pos 405.785 26.404 -543.056 132
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_LA_THEINE]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.POROGGO_DOM_JUAN, { invaderXim.item.BUG_EATEN_HAT })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.BUG_EATEN_HAT })
end

return entity
