-----------------------------------
-- Area: Port Windurst
--  NPC: Zoreen
-- Valdeaunia Regional Merchant
-----------------------------------
local ID = zones[invaderXim.zone.PORT_WINDURST]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if GetRegionOwner(invaderXim.region.VALDEAUNIA) ~= invaderXim.nation.WINDURST then
        player:showText(npc, ID.text.ZOREEN_CLOSED_DIALOG)
    else
        local stock =
        {
            4382, 29,    -- Frost Turnip
            638, 170,    -- Sage
        }

        player:showText(npc, ID.text.ZOREEN_OPEN_DIALOG)
        invaderXim.shop.general(player, stock, invaderXim.fameArea.WINDURST)
    end
end

return entity
