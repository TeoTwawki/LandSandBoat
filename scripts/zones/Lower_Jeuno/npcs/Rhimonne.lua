-----------------------------------
-- Area: Lower Jeuno
--  NPC: Rhimonne
-----------------------------------
local ID = zones[invaderXim.zone.LOWER_JEUNO]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        4545, 62, -- Gysahl Greens
        840,   4, -- Chocobo Feather
        17307, 9, -- Dart
    }

    player:showText(npc, ID.text.RHIMONNE_SHOP_DIALOG)
    invaderXim.shop.general(player, stock)
end

return entity
