-----------------------------------
-- Area: Bastok Markets
--  NPC: Somn-Paemn
-- Sarutabaruta Regional Goods
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MARKETS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if GetRegionOwner(invaderXim.region.SARUTABARUTA) ~= invaderXim.nation.BASTOK then
        player:showText(npc, ID.text.SOMNPAEMN_CLOSED_DIALOG)
    else
        local stock =
        {
            invaderXim.item.RARAB_TAIL,                      24,
            invaderXim.item.LAUAN_LOG,                       37,
            invaderXim.item.POPOTO,                          49,
            invaderXim.item.SARUTA_ORANGE,                   33,
            invaderXim.item.CLUMP_OF_WINDURSTIAN_TEA_LEAVES, 20,
        }

        player:showText(npc, ID.text.SOMNPAEMN_OPEN_DIALOG)
        invaderXim.shop.general(player, stock, invaderXim.fameArea.BASTOK)
    end
end

return entity
