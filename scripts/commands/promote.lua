-----------------------------------
-- func: promote
-- desc: Promotes the player to a new GM level.
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'si'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!promote <player> <level>')
end

commandObj.onTrigger = function(player, target, level)
    -- determine maximum level player can promote to
    local maxLevel = player:getGMLevel() - 1
    if maxLevel < 1 then
        maxLevel = 0
    end

    -- validate target
    local targ
    if target == nil then
        error(player, 'You must provide a player name.')
        return
    else
        targ = GetPlayerByName(target)
        if targ == nil then
            error(player, string.format('Player named "%s" not found!', target))
            return
        end
    end

    -- catch players trying to change level of equal or higher tiered GMs.
    if targ:getGMLevel() >= player:getGMLevel() then
        printf('%s attempting to adjust same or higher tier GM %s.', player:getName(), targ:getName())
        targ:printToPlayer(string.format('%s attempted to adjust your GM rank.', player:getName()))
        error(player, 'You can not use this command on same or higher tiered GMs.')
        return
    end

    -- validate level
    if level == nil or level < 0 or level > maxLevel then
        error(player, string.format('Invalid level.  Must be 0 to %i.', maxLevel))
        return
    end

    -- change target gm level
    targ:setGMLevel(level)

    -- if target is being set to non-GM, remove active GM priveleges, which they will no longer be able to remove themselves
    if level == 0 then
        -- remove god mode
        if targ:getCharVar('GodMode') == 1 then
            targ:setCharVar('GodMode', 0)
            targ:delStatusEffect(invaderXim.effect.MAX_HP_BOOST)
            targ:delStatusEffect(invaderXim.effect.MAX_MP_BOOST)
            targ:delStatusEffect(invaderXim.effect.MIGHTY_STRIKES)
            targ:delStatusEffect(invaderXim.effect.HUNDRED_FISTS)
            targ:delStatusEffect(invaderXim.effect.CHAINSPELL)
            targ:delStatusEffect(invaderXim.effect.PERFECT_DODGE)
            targ:delStatusEffect(invaderXim.effect.INVINCIBLE)
            targ:delStatusEffect(invaderXim.effect.ELEMENTAL_SFORZO)
            targ:delStatusEffect(invaderXim.effect.MANAFONT)
            targ:delStatusEffect(invaderXim.effect.REGAIN)
            targ:delStatusEffect(invaderXim.effect.REFRESH)
            targ:delStatusEffect(invaderXim.effect.REGEN)
            targ:delMod(invaderXim.mod.RACC, 2500)
            targ:delMod(invaderXim.mod.RATT, 2500)
            targ:delMod(invaderXim.mod.ACC, 2500)
            targ:delMod(invaderXim.mod.ATT, 2500)
            targ:delMod(invaderXim.mod.MATT, 2500)
            targ:delMod(invaderXim.mod.MACC, 2500)
            targ:delMod(invaderXim.mod.RDEF, 2500)
            targ:delMod(invaderXim.mod.DEF, 2500)
            targ:delMod(invaderXim.mod.MDEF, 2500)
        end

        -- See https://github.com/atom0s/XiPackets/tree/main/world/server/0x0037, flags0_t GmLevel
        player:setVisibleGMLevel(0)

        -- remove hidden
        if targ:getCharVar('GMHidden') == 1 then
            targ:setCharVar('GMHidden', 0)
            targ:setGMHidden(false)
        end

        -- remove costume
        targ:setCostume(0)

        -- remove wallhack
        targ:setWallhack(false)
    end

    player:printToPlayer(string.format('%s set to tier %i.', targ:getName(), level))
    targ:printToPlayer(string.format('You have been set to tier %i.', level))
end

return commandObj
