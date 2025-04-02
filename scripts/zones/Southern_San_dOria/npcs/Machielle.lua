-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Machielle
-- Norvallen Regional Merchant
-----------------------------------
local ID = zones[invaderXim.zone.SOUTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.events.harvestFestival.onHalloweenTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(invaderXim.region.NORVALLEN) ~= invaderXim.nation.SANDORIA then
        player:showText(npc, ID.text.MACHIELLE_CLOSED_DIALOG)
    else
        local stock =
        {
            688, 18,    -- Arrowwood Log
            621, 25,    -- Crying Mustard
            618, 25,    -- Blue Peas
            698, 88,    -- Ash Log
        }

        player:showText(npc, ID.text.MACHIELLE_OPEN_DIALOG)
        invaderXim.shop.general(player, stock, invaderXim.fameArea.SANDORIA)
    end
end

return entity
