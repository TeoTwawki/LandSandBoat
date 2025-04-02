-----------------------------------
-- Area: Windurst_Woods
--  NPC: Millerovieunet
-- Only sells when Windurst controlls Qufim Region
-- Confirmed shop stock, August 2013
-----------------------------------
local ID = zones[invaderXim.zone.WINDURST_WOODS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.events.harvestFestival.onHalloweenTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(invaderXim.region.QUFIMISLAND) ~= invaderXim.nation.WINDURST then
        player:showText(npc, ID.text.MILLEROVIEUNET_CLOSED_DIALOG)
    else
        local stock =
        {
            954,  4032  -- Magic Pot Shard
        }

        player:showText(npc, ID.text.MILLEROVIEUNET_OPEN_DIALOG)
        invaderXim.shop.general(player, stock, invaderXim.fameArea.WINDURST)
    end
end

return entity
