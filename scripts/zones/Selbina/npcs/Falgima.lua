-----------------------------------
-- Area: Selbina
--  NPC: Falgima
-----------------------------------
local ID = zones[invaderXim.zone.SELBINA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        4744,  5351,    -- Scroll of Invisible
        4745,  2325,    -- Scroll of Sneak
        4746,  1204,    -- Scroll of Deodorize
        5104, 30360,    -- Scroll of Flurry
    }

    player:showText(npc, ID.text.FALGIMA_SHOP_DIALOG)
    invaderXim.shop.general(player, stock)
end

return entity
