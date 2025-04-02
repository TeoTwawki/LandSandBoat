-----------------------------------
-- Area: Bastok Mines
--  NPC: Galdeo
--  Li'Telor Regional Merchant
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MINES]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if GetRegionOwner(invaderXim.region.LITELOR) ~= invaderXim.nation.BASTOK then
        player:showText(npc, ID.text.GALDEO_CLOSED_DIALOG)
    else
        local stock =
        {
            623,   119,    -- Bay Leaves
            4154, 6440,    -- Holy Water
        }

        player:showText(npc, ID.text.GALDEO_OPEN_DIALOG)
        invaderXim.shop.general(player, stock, invaderXim.fameArea.BASTOK)
    end
end

return entity
