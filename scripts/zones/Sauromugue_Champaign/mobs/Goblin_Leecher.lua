-----------------------------------
-- Area: Sauromugue Champaign
--  Mob: Goblin Leecher
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 97, 2, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 98, 2, invaderXim.regime.type.FIELDS)

    if
        invaderXim.settings.main.ENABLE_ACP == 1 and
        not player:hasKeyItem(invaderXim.ki.CHUNK_OF_SMOKED_GOBLIN_GRUB) and
        player:getCurrentMission(invaderXim.mission.log_id.ACP) >= invaderXim.mission.id.acp.THE_ECHO_AWAKENS
    then
        -- Guesstimating 15% chance
        if math.random(1, 100) <= 15 then
            npcUtil.giveKeyItem(player, invaderXim.ki.CHUNK_OF_SMOKED_GOBLIN_GRUB)
        end
    end
end

return entity
