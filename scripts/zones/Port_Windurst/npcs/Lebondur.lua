-----------------------------------
-- Area: Port Windurst
--  NPC: Lebondur
-- Vollbow Regional Merchant
-----------------------------------
local ID = zones[invaderXim.zone.PORT_WINDURST]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if GetRegionOwner(invaderXim.region.VOLLBOW) ~= invaderXim.nation.WINDURST then
        player:showText(npc, ID.text.LEBONDUR_CLOSED_DIALOG)
    else
        local stock =
        {
            636,   119,    -- Chamomile
            864,    88,    -- Fish Scales
            936,    14,    -- Rock Salt
            1410, 1656,    -- Sweet William
        }

        player:showText(npc, ID.text.LEBONDUR_OPEN_DIALOG)
        invaderXim.shop.general(player, stock, invaderXim.fameArea.WINDURST)
    end
end

return entity
