-----------------------------------
-- Area: Port Bastok
--  NPC: Vattian
-- Kuzotz Regional Merchant
-----------------------------------
local ID = zones[invaderXim.zone.PORT_BASTOK]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if GetRegionOwner(invaderXim.region.KUZOTZ) ~= invaderXim.nation.BASTOK then
        player:showText(npc, ID.text.VATTIAN_CLOSED_DIALOG)
    else
        local stock =
        {
            916,  855,    -- Cactuar Needle
            4412, 299,    -- Thundermelon
            4491, 184,    -- Watermelon
        }

        player:showText(npc, ID.text.VATTIAN_OPEN_DIALOG)
        invaderXim.shop.general(player, stock, invaderXim.fameArea.BASTOK)
    end
end

return entity
