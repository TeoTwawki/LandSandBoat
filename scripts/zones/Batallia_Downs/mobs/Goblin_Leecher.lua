-----------------------------------
-- Area: Batallia Downs
--  Mob: Goblin Leecher
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 74, 2, invaderXim.regime.type.FIELDS)
    if
        invaderXim.settings.main.ENABLE_ACP == 1 and
        not player:hasKeyItem(invaderXim.ki.BOWL_OF_BLAND_GOBLIN_SALAD) and
        player:getCurrentMission(invaderXim.mission.log_id.ACP) >= invaderXim.mission.id.acp.THE_ECHO_AWAKENS
    then
        -- Guesstimating 15% chance
        if math.random(1, 100) >= 85 then
            npcUtil.giveKeyItem(player, invaderXim.ki.BOWL_OF_BLAND_GOBLIN_SALAD)
        end
    end
end

return entity
