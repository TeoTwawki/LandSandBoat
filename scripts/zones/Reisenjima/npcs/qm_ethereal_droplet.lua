-----------------------------------
-- Area: Reisenjima (291)
-- NPC: ???
-- Notes: Grants "Ethereal droplet" temporary item.
-----------------------------------
local ID = zones[invaderXim.zone.REISENJIMA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if player:hasItem(invaderXim.item.ETHEREAL_DROPLET, invaderXim.inv.TEMPITEMS) then
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    else
        player:addTempItem(invaderXim.item.ETHEREAL_DROPLET, 1)
        player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.ETHEREAL_DROPLET)
    end
end

return entity
