-----------------------------------
-- Area: Port Bastok
--  NPC: Evelyn
-- Gustaberg Regional Merchant
-----------------------------------
local ID = zones[invaderXim.zone.PORT_BASTOK]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if GetRegionOwner(invaderXim.region.GUSTABERG) ~= invaderXim.nation.BASTOK then
        player:showText(npc, ID.text.EVELYN_CLOSED_DIALOG)
    else
        local stock =
        {
            invaderXim.item.PINCH_OF_SULFUR,  795,
            invaderXim.item.POPOTO,            49,
            invaderXim.item.BAG_OF_RYE_FLOUR,  41,
            invaderXim.item.EGGPLANT,          45,
        }

        player:showText(npc, ID.text.EVELYN_OPEN_DIALOG)
        invaderXim.shop.general(player, stock, invaderXim.fameArea.BASTOK)
    end
end

return entity
