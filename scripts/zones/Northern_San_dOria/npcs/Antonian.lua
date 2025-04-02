-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Antonian
-- Regional Marchant NPC
-- Only sells when San d'Oria controlls Aragoneu.
-----------------------------------
local ID = zones[invaderXim.zone.NORTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.events.harvestFestival.onHalloweenTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(invaderXim.region.ARAGONEU) ~= invaderXim.nation.SANDORIA then
        player:showText(npc, ID.text.ANTONIAN_CLOSED_DIALOG)
    else
        local stock =
        {
            631,   36,    -- Horo Flour
            629,   43,    -- Millioncorn
            4415, 111,    -- Roasted Corn
            841,   36,    -- Yagudo Feather
            4505,  90,    -- Sunflower Seeds
        }

        player:showText(npc, ID.text.ANTONIAN_OPEN_DIALOG)
        invaderXim.shop.general(player, stock, invaderXim.fameArea.SANDORIA)
    end
end

return entity
