-----------------------------------
-- Area: Port Windurst
--  NPC: Sheia Pohrichamaha
-- Fauregandi Regional Merchant
-----------------------------------
local ID = zones[invaderXim.zone.PORT_WINDURST]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if GetRegionOwner(invaderXim.region.FAUREGANDI) ~= invaderXim.nation.WINDURST then
        player:showText(npc, ID.text.SHEIAPOHRICHAMAHA_CLOSED_DIALOG)
    else
        local stock =
        {
            4571, 90,    -- Beaugreens
            4363, 39,    -- Faerie Apple
            691,  54,    -- Maple Log
        }

        player:showText(npc, ID.text.SHEIAPOHRICHAMAHA_OPEN_DIALOG)
        invaderXim.shop.general(player, stock, invaderXim.fameArea.WINDURST)
    end
end

return entity
