-----------------------------------
-- Area: Qulun Dome
--  NPC: The Mute
-- !zone 148
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local duration = math.random(600, 900)

    if not player:hasStatusEffect(invaderXim.effect.SILENCE) then
        player:addStatusEffect(invaderXim.effect.SILENCE, 0, 0, duration)
    end
end

return entity
