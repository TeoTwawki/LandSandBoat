-----------------------------------
-- Area: Port San d'Oria
--  NPC: Nimia
-- Elshimo Lowlands Regional Merchant
-----------------------------------
local ID = zones[invaderXim.zone.PORT_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if GetRegionOwner(invaderXim.region.ELSHIMOLOWLANDS) ~= invaderXim.nation.SANDORIA then
        player:showText(npc, ID.text.NIMIA_CLOSED_DIALOG)
    else
        local stock =
        {
            invaderXim.item.BUNCH_OF_KAZHAM_PEPPERS,   62,
            invaderXim.item.KAZHAM_PINEAPPLE,          62,
            invaderXim.item.MITHRAN_TOMATO,            41,
            invaderXim.item.PINCH_OF_BLACK_PEPPER,    265,
            invaderXim.item.OGRE_PUMPKIN,              99,
            invaderXim.item.KUKURU_BEAN,              124,
            invaderXim.item.PHALAENOPSIS,            1872,
        }

        player:showText(npc, ID.text.NIMIA_OPEN_DIALOG)
        invaderXim.shop.general(player, stock, invaderXim.fameArea.SANDORIA)
    end
end

return entity
