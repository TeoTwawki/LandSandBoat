-----------------------------------
-- Area: Yuhtunga Jungle
--  NPC: ??? (Beastmen Treasure qm8/chest5)
-- !pos -361.835 15.695 -399.517 123
-----------------------------------
local ID = zones[invaderXim.zone.YUHTUNGA_JUNGLE]
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
