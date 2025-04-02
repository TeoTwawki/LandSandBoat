-----------------------------------
-- Area: Al Zahbi
--  NPC: Opococo
-- Type: Item Deliverer
-- !pos -24.702 0 -139.982 48
-----------------------------------
local ID = zones[invaderXim.zone.AL_ZAHBI]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    player:showText(npc, ID.text.ITEM_DELIVERY_DIALOG)
    player:openSendBox()
end

return entity
