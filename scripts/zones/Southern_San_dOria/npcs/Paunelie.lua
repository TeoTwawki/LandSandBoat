-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Ilita
--  Linkshell Merchant
-- !pos -142 -1 -25 236
-----------------------------------
local ID = zones[invaderXim.zone.SOUTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.NEW_LINKSHELL,   6000,
        invaderXim.item.PENDANT_COMPASS,  375,
    }

    player:showText(npc, ID.text.PAUNELIE_SHOP_DIALOG, 513)
    invaderXim.shop.general(player, stock)
end

return entity
