-----------------------------------
-- Area: Bastok Markets
--  NPC: Oggodett
-- Aragoneu Regional Goods
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MARKETS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if GetRegionOwner(invaderXim.region.ARAGONEU) ~= invaderXim.nation.BASTOK then
        player:showText(npc, ID.text.OGGODETT_CLOSED_DIALOG)
    else
        local stock =
        {
            invaderXim.item.BAG_OF_HORO_FLOUR,           41,
            invaderXim.item.EAR_OF_MILLIONCORN,          49,
            invaderXim.item.EAR_OF_ROASTED_CORN,        128,
            invaderXim.item.YAGUDO_FEATHER,              41,
            invaderXim.item.HANDFUL_OF_SUNFLOWER_SEEDS, 104,
        }

        player:showText(npc, ID.text.OGGODETT_OPEN_DIALOG)
        invaderXim.shop.general(player, stock, invaderXim.fameArea.BASTOK)
    end
end

return entity
