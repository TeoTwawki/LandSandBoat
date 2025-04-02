-----------------------------------
-- Area: Bastok Markets
--  NPC: Auction Counter
-----------------------------------
require('scripts/quests/tutorial')
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.tutorial.onAuctionTrigger(player)
    player:sendMenu(invaderXim.menuType.AUCTION)
end

return entity
