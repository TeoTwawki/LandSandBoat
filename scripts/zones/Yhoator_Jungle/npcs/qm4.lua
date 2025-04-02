-----------------------------------
-- Area: Yhoator Jungle
--  NPC: ??? (Beastmen Treasure qm4/chest0)
-- !pos -149.929 -1.148 56.761 124
-----------------------------------
local ID = zones[invaderXim.zone.YHOATOR_JUNGLE]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.beastmenTreasure.handleQmOnTrigger(player, npc, ID.text.SOMETHING_IS_BURIED_HERE, ID.text.NOTHING_OUT_OF_ORDINARY, ID.npc.BEASTMEN_TREASURE_OFFSET)
end

entity.onTrade = function(player, npc, trade)
    invaderXim.beastmenTreasure.handleQmOnTrade(player, npc, trade, ID.npc.BEASTMEN_TREASURE_OFFSET)
end

entity.onEventFinish = function(player, csid)
    invaderXim.beastmenTreasure.handleQmOnEventFinish(player, csid)
end

return entity
