-----------------------------------
-- Area: Port Bastok
--  NPC: Belka
-- Derfland Regional Merchant
-----------------------------------
local ID = zones[invaderXim.zone.PORT_BASTOK]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if GetRegionOwner(invaderXim.region.DERFLAND) ~= invaderXim.nation.BASTOK then
        player:showText(npc, ID.text.BELKA_CLOSED_DIALOG)
    else
        local stock =
        {
            4352,  128,    -- Derfland Pear
            617,   142,    -- Ginger
            4545,   62,    -- Gysahl Greens
            1412, 1656,    -- Olive Flower
            633,    14,    -- Olive Oil
            951,   110,    -- Wijnruit
        }

        player:showText(npc, ID.text.BELKA_OPEN_DIALOG)
        invaderXim.shop.general(player, stock, invaderXim.fameArea.BASTOK)
    end
end

return entity
