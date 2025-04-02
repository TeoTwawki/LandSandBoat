-----------------------------------
-- Area: Metalworks
--  NPC: Takiyah
-- Type: Regional Merchant
-----------------------------------
local ID = zones[invaderXim.zone.METALWORKS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if GetRegionOwner(invaderXim.region.QUFIMISLAND) ~= invaderXim.nation.BASTOK then
        player:showText(npc, ID.text.TAKIYAH_CLOSED_DIALOG)
    else
        local stock =
        {
            954, 4121,    -- Magic Pot Shard
        }

        player:showText(npc, ID.text.TAKIYAH_OPEN_DIALOG)
        invaderXim.shop.general(player, stock, invaderXim.fameArea.BASTOK)
    end
end

return entity
