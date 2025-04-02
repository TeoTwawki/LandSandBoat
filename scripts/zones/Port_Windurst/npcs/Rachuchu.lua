-----------------------------------
-- Area: Port Windurst
--  NPC: Rachuchu
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onSpawn = function(npc)
    npcUtil.castingAnimation(npc, invaderXim.magic.spellGroup.WHITE, 10.5)
end

return entity
