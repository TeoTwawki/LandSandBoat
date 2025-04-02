-----------------------------------
-- Area: Port Bastok
--  NPC: Ilita
-- Linkshell Merchant
--   !pos -142 -1 -25 236
-----------------------------------
local ID = zones[invaderXim.zone.PORT_BASTOK]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.NEW_LINKSHELL,   6000,
        invaderXim.item.PENDANT_COMPASS,  375,
    }

    player:showText(npc, ID.text.ILITA_SHOP_DIALOG, invaderXim.item.LINKSHELL)
    invaderXim.shop.general(player, stock)
end

return entity
