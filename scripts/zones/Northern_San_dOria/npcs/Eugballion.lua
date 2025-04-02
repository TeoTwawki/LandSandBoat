-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Eugballion
-- Only sells when San d'Oria controlls Qufim Region
-----------------------------------
local ID = zones[invaderXim.zone.NORTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if GetRegionOwner(invaderXim.region.QUFIMISLAND) ~= invaderXim.nation.SANDORIA then
        player:showText(npc, ID.text.EUGBALLION_CLOSED_DIALOG)
    else
        local stock =
        {
            954, 4121,    -- Magic Pot Shard
        }

        player:showText(npc, ID.text.EUGBALLION_OPEN_DIALOG)
        invaderXim.shop.general(player, stock, invaderXim.fameArea.SANDORIA)
    end
end

return entity
