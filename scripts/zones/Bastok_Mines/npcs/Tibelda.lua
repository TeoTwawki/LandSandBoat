-----------------------------------
-- Area: Bastok Mines
--  NPC: Tibelda
-- Valdeaunia Regional Merchant
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MINES]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if GetRegionOwner(invaderXim.region.VALDEAUNIA) ~= invaderXim.nation.BASTOK then
        player:showText(npc, ID.text.TIBELDA_CLOSED_DIALOG)
    else
        local stock =
        {
            4382,  29, --Frost Turnip
            638,  170, --Sage
        }

        player:showText(npc, ID.text.TIBELDA_OPEN_DIALOG)
        invaderXim.shop.general(player, stock, invaderXim.fameArea.BASTOK)
    end
end

return entity
