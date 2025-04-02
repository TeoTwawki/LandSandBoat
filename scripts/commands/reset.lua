-----------------------------------
-- func: reset <player>
-- desc: If no name is specified, resets your own JA timers.
-- If a player name is specified, resets all of that players JA timers.
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 's'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!reset (player)')
end

commandObj.onTrigger = function(player, target)
    -- validate target
    local targ
    if not target then
        targ = player
    else
        targ = GetPlayerByName(target)
        if targ == nil then
            error(player, string.format('Player named "%s" not found!', target))
            return
        end
    end

    -- reset target recasts
    targ:resetRecasts()
    if targ:getID() ~= player:getID() then
        player:printToPlayer(string.format('Reset %s\'s recast timers.', targ:getName()))
    end

    -- Clear debilitating effects from player
    player:eraseAllStatusEffect()

    -- Table of non-erasable effects
    local effects =
    {
        invaderXim.effect.TERROR,
        invaderXim.effect.SLEEP_I,
        invaderXim.effect.SLEEP_II,
        invaderXim.effect.LULLABY,
        invaderXim.effect.STUN,
        invaderXim.effect.SILENCE,
        invaderXim.effect.WEAKNESS,
        invaderXim.effect.PARALYSIS,
        invaderXim.effect.BLINDNESS,
        invaderXim.effect.AMNESIA,
        invaderXim.effect.CHARM_I,
        invaderXim.effect.CHARM_II,
        invaderXim.effect.POISON,
        invaderXim.effect.PETRIFICATION,
        invaderXim.effect.DOOM,
        invaderXim.effect.CURSE_I,
        invaderXim.effect.CURSE_II,
    }

    for _, v in pairs(effects) do
        player:delStatusEffect(v)
    end
end

return commandObj
