-----------------------------------
--  MOB: Vouivre
-- Area: Nyzul Isle
-- Info: NM
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    -- Set Immunities.
    -- mob:addImmunity(invaderXim.immunity.TERROR)

    -- Set Modifiers.
    mob:setMod(invaderXim.mod.REGEN, 5)
    mob:setMod(invaderXim.mod.DOUBLE_ATTACK, 40)
    mob:setMod(invaderXim.mod.TRIPLE_ATTACK, 35)
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        invaderXim.nyzul.spawnChest(mob, player)
        invaderXim.nyzul.eliminateAllKill(mob)
    end
end

return entity
