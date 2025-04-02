-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Nomad Moogle
-----------------------------------
local ID = zones[invaderXim.zone.TAVNAZIAN_SAFEHOLD]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    player:showText(npc, ID.text.NOMAD_MOOGLE_DIALOG)
    player:sendMenu(invaderXim.menuType.MOOGLE)
end

return entity
