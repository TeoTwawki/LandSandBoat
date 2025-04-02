-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Palguevion
-- Only sells when San d'Oria controlls Valdeaunia Region
-----------------------------------
local ID = zones[invaderXim.zone.NORTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if GetRegionOwner(invaderXim.region.VALDEAUNIA) ~= invaderXim.nation.SANDORIA then
        player:showText(npc, ID.text.PALGUEVION_CLOSED_DIALOG)
    else
        local stock =
        {
            invaderXim.item.SPRIG_OF_SAGE, 192,
            invaderXim.item.FROST_TURNIP,   33,
        }

        player:showText(npc, ID.text.PALGUEVION_OPEN_DIALOG)
        invaderXim.shop.general(player, stock, invaderXim.fameArea.SANDORIA)
    end
end

return entity
