-----------------------------------
-- Area: Yuhtunga Jungle
--  NPC: Peddlestox
-- !pos -103.286 0.6 434.866 123
-- Active on WINDSDAY in this zone. To test on off-days, setStatus(invaderXim.status.NORMAL)
-----------------------------------
local ID = zones[invaderXim.zone.YUHTUNGA_JUNGLE]
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
