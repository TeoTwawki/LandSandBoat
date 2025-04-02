-----------------------------------
-- Area: Port Windurst
--  NPC: Posso Ruhbini
-- Norvallen Regional Merchant
-----------------------------------
local ID = zones[invaderXim.zone.PORT_WINDURST]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if GetRegionOwner(invaderXim.region.NORVALLEN) ~= invaderXim.nation.WINDURST then
        player:showText(npc, ID.text.POSSORUHBINI_CLOSED_DIALOG)
    else
        local stock =
        {
            688, 18,    -- Arrowwood Log
            698, 87,    -- Ash Log
            618, 25,    -- Blue Peas
            621, 25,    -- Crying Mustard
        }

        player:showText(npc, ID.text.POSSORUHBINI_OPEN_DIALOG)
        invaderXim.shop.general(player, stock, invaderXim.fameArea.WINDURST)
    end
end

return entity
