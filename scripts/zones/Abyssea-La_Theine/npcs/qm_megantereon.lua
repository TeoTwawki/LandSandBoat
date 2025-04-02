-----------------------------------
-- Zone: Abyssea-LaTheine
--  NPC: qm_megantereon (???)
-- Spawns Megantereon
-- !pos -764 -8 121 132
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_LA_THEINE]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.abyssea.qmOnTrade(player, npc, trade, ID.mob.MEGANTEREON, { invaderXim.item.GARGANTUAN_BLACK_TIGER_FANG })
end

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, 0, 0, { invaderXim.item.GARGANTUAN_BLACK_TIGER_FANG })
end

return entity
