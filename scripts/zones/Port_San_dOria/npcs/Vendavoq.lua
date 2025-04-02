-----------------------------------
-- Area: Port San d'Oria
--  NPC: Vendavoq
--  Movalpolos Regional Merchant
-----------------------------------
local ID = zones[invaderXim.zone.PORT_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if GetRegionOwner(invaderXim.region.MOVALPOLOS) ~= invaderXim.nation.SANDORIA then
        player:showText(npc, ID.text.VENDAVOQ_CLOSED_DIALOG)
    else
        local stock =
        {
            640,    11,    -- Copper Ore
            4450,  694,    -- Coral Fungus
            4375, 4032,    -- Danceshroom
            1650, 6500,    -- Kopparnickel Ore
            5165,  736,    -- Movalpolos Water
        }

        player:showText(npc, ID.text.VENDAVOQ_OPEN_DIALOG)
        invaderXim.shop.general(player, stock, invaderXim.fameArea.SANDORIA)
    end
end

return entity
