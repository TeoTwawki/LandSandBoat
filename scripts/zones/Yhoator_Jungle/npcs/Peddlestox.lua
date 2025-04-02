-----------------------------------
-- Area: Yhoator Jungle
--  NPC: Peddlestox
-- !pos -499.914 1.470 -109.039 124
-- Active on LIGHTNINGDAY in this zone. To test on off-days, setStatus(invaderXim.status.NORMAL)
-----------------------------------
local ID = zones[invaderXim.zone.YHOATOR_JUNGLE]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player)
    invaderXim.beastmenTreasure.handleNpcOnTrigger(player, ID.npc.BEASTMEN_TREASURE_OFFSET)
end

entity.onTrade = function(player, npc, trade)
    invaderXim.beastmenTreasure.handleNpcOnTrade(player, trade, ID.npc.BEASTMEN_TREASURE_OFFSET)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.beastmenTreasure.handleNpcOnEventFinish(player, csid)
end

return entity
