-----------------------------------
-- Area: Rolanberry Fields
--  Mob: Goblin Furrier
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 86, 2, invaderXim.regime.type.FIELDS)

    if
        invaderXim.settings.main.ENABLE_ACP == 1 and
        player:getCurrentMission(invaderXim.mission.log_id.ACP) >= invaderXim.mission.id.acp.THE_ECHO_AWAKENS and
        not player:hasKeyItem(invaderXim.ki.JUG_OF_GREASY_GOBLIN_JUICE)
    then
        -- Guesstimating 15% chance
        if math.random(1, 100) <= 15 then
            npcUtil.giveKeyItem(player, invaderXim.ki.JUG_OF_GREASY_GOBLIN_JUICE)
        end
    end
end

return entity
