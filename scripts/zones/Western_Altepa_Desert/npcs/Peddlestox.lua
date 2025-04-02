-----------------------------------
-- Area: Western Altepa Desert
--  NPC: Peddlestox
-- !pos 512.374 0.019 10.57 125
-- Active on EARTHSDAY in this zone. To test on off-days, setStatus(invaderXim.status.NORMAL)
-----------------------------------
local ID = zones[invaderXim.zone.WESTERN_ALTEPA_DESERT]
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
