-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Arachagnon
-----------------------------------
local ID = zones[invaderXim.zone.NORTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.ELVAAN_JERKIN,      312,
        invaderXim.item.ELVAAN_BODICE,      312,
        invaderXim.item.ELVAAN_GLOVES,      187,
        invaderXim.item.ELVAAN_GAUNTLETS,   187,
        invaderXim.item.ELVAAN_M_CHAUSSES,  270,
        invaderXim.item.ELVAAN_F_CHAUSSES,  270,
        invaderXim.item.ELVAAN_M_LEDELSENS, 187,
        invaderXim.item.ELVAAN_F_LEDELSENS, 187,
    }

    player:showText(npc, ID.text.ARACHAGNON_SHOP_DIALOG)
    invaderXim.shop.general(player, stock, invaderXim.fameArea.SANDORIA)
end

return entity
