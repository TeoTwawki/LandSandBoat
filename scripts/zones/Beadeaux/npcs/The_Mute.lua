-----------------------------------
-- Area: Beadeaux
--  NPC: ???
-- !pos -166.230 -1 -73.685 147
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local duration = math.random(600, 900)

    npc:entityAnimationPacket(invaderXim.animationString.EFFECT_SILENCE, player)
    player:addStatusEffect(invaderXim.effect.SILENCE, 0, 0, duration)
end

return entity
