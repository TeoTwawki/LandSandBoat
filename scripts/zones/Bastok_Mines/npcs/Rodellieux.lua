-----------------------------------
-- Area: Bastok_Mines
--  NPC: Rodellieux
-- Fauregandi Regional Merchant
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MINES]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if GetRegionOwner(invaderXim.region.FAUREGANDI) ~= invaderXim.nation.BASTOK then
        player:showText(npc, ID.text.RODELLIEUX_CLOSED_DIALOG)
    else
        local stock =
        {
            4571, 90, -- Beaugreens
            4363, 39, -- Faerie Apple
            691,  54, -- Maple Log
        }

        player:showText(npc, ID.text.RODELLIEUX_OPEN_DIALOG)
        invaderXim.shop.general(player, stock, invaderXim.fameArea.BASTOK)
    end
end

return entity
