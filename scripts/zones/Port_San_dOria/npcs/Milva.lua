-----------------------------------
-- Area: Port San d'Oria
--  NPC: Milva
-- Sarutabaruta Regional Merchant
-----------------------------------
local ID = zones[invaderXim.zone.PORT_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if GetRegionOwner(invaderXim.region.SARUTABARUTA) ~= invaderXim.nation.SANDORIA then
        player:showText(npc, ID.text.MILVA_CLOSED_DIALOG)
    else
        local stock =
        {
            4444, 22,    -- Rarab Tail
            689,  33,    -- Lauan Log
            619,  43,    -- Popoto
            4392, 29,    -- Saruta Orange
            635,  18,    -- Windurstian Tea Leaves
        }

        player:showText(npc, ID.text.MILVA_OPEN_DIALOG)
        invaderXim.shop.general(player, stock, invaderXim.fameArea.SANDORIA)
    end
end

return entity
