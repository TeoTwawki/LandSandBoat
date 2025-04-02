-----------------------------------
-- func: godmode
-- desc: Toggles god mode on the player, granting them several special abilities.
-- Pass variable of 1 to command to enable a 'soft' god mode.
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'i'
}

local godModeOn = function(player)
    -- Add bonus effects to the player..
    player:addStatusEffect(invaderXim.effect.MAX_HP_BOOST, 1000, 0, 0)
    player:addStatusEffect(invaderXim.effect.MAX_MP_BOOST, 1000, 0, 0)
    player:addStatusEffect(invaderXim.effect.MIGHTY_STRIKES, 1, 0, 0)
    player:addStatusEffect(invaderXim.effect.HUNDRED_FISTS, 1, 0, 0)
    player:addStatusEffect(invaderXim.effect.CHAINSPELL, 1, 0, 0)
    player:addStatusEffect(invaderXim.effect.PERFECT_DODGE, 1, 0, 0)
    player:addStatusEffect(invaderXim.effect.INVINCIBLE, 1, 0, 0)
    player:addStatusEffect(invaderXim.effect.ELEMENTAL_SFORZO, 1, 0, 0)
    player:addStatusEffect(invaderXim.effect.MANAFONT, 1, 0, 0)
    player:addStatusEffect(invaderXim.effect.REGAIN, 300, 0, 0)
    player:addStatusEffect(invaderXim.effect.REFRESH, 99, 0, 0)
    player:addStatusEffect(invaderXim.effect.REGEN, 99, 0, 0)

    -- Add bonus mods to the player..
    player:addMod(invaderXim.mod.RACC, 2500)
    player:addMod(invaderXim.mod.RATT, 2500)
    player:addMod(invaderXim.mod.ACC, 2500)
    player:addMod(invaderXim.mod.ATT, 2500)
    player:addMod(invaderXim.mod.MATT, 2500)
    player:addMod(invaderXim.mod.MACC, 2500)
    player:addMod(invaderXim.mod.RDEF, 2500)
    player:addMod(invaderXim.mod.DEF, 2500)
    player:addMod(invaderXim.mod.MDEF, 2500)

    -- Heal the player from the new buffs..
    player:addHP(50000)
    player:setMP(50000)
end

local godModeOff = function(player)
    -- Remove bonus effects..
    player:delStatusEffect(invaderXim.effect.MAX_HP_BOOST)
    player:delStatusEffect(invaderXim.effect.MAX_MP_BOOST)
    player:delStatusEffect(invaderXim.effect.MIGHTY_STRIKES)
    player:delStatusEffect(invaderXim.effect.HUNDRED_FISTS)
    player:delStatusEffect(invaderXim.effect.CHAINSPELL)
    player:delStatusEffect(invaderXim.effect.PERFECT_DODGE)
    player:delStatusEffect(invaderXim.effect.INVINCIBLE)
    player:delStatusEffect(invaderXim.effect.ELEMENTAL_SFORZO)
    player:delStatusEffect(invaderXim.effect.MANAFONT)
    player:delStatusEffect(invaderXim.effect.REGAIN)
    player:delStatusEffect(invaderXim.effect.REFRESH)
    player:delStatusEffect(invaderXim.effect.REGEN)

    -- Remove bonus mods..
    player:delMod(invaderXim.mod.RACC, 2500)
    player:delMod(invaderXim.mod.RATT, 2500)
    player:delMod(invaderXim.mod.ACC, 2500)
    player:delMod(invaderXim.mod.ATT, 2500)
    player:delMod(invaderXim.mod.MATT, 2500)
    player:delMod(invaderXim.mod.MACC, 2500)
    player:delMod(invaderXim.mod.RDEF, 2500)
    player:delMod(invaderXim.mod.DEF, 2500)
    player:delMod(invaderXim.mod.MDEF, 2500)
end

local godModeTierOneOn = function(player)
    -- Add bonus effects to the player..
    player:addStatusEffect(invaderXim.effect.MAX_HP_BOOST, 200, 0, 0)
    player:addStatusEffect(invaderXim.effect.REGAIN, 50, 0, 0)
    player:addStatusEffect(invaderXim.effect.REFRESH, 999, 0, 0)
    player:addStatusEffect(invaderXim.effect.REGEN, 999, 0, 0)
    player:addStatusEffect(invaderXim.effect.CHAINSPELL, 1, 0, 0)
    player:addStatusEffect(invaderXim.effect.MANAFONT, 1, 0, 0)

    -- Heal the player from the new buffs..
    player:addHP(50000)
    player:setMP(50000)
end

local godModeTierOneOff = function(player)
    -- Remove bonus effects..
    player:delStatusEffect(invaderXim.effect.MAX_HP_BOOST)
    player:delStatusEffect(invaderXim.effect.REGAIN)
    player:delStatusEffect(invaderXim.effect.REFRESH)
    player:delStatusEffect(invaderXim.effect.REGEN)
    player:delStatusEffect(invaderXim.effect.CHAINSPELL)
    player:delStatusEffect(invaderXim.effect.MANAFONT)
end

commandObj.onTrigger = function(player, tier)
    local mode = utils.clamp(tier or 0, 0, 2)
    local state = player:getCharVar('GodMode')

    if mode == 0 and state == 0 then
        player:setCharVar('GodMode', 1)
        godModeOn(player)
        player:printToPlayer('God Mode enabled.')
    elseif mode == 0 and state == 1 then
        player:setCharVar('GodMode', 0)
        godModeOff(player)
        player:printToPlayer('God Mode disabled.')
    elseif mode == 0 and state == 2 then
        player:setCharVar('GodMode', 1)
        godModeTierOneOff(player)
        godModeOn(player)
        player:printToPlayer('God Mode enabled.')
    end

    -- Enables a toned down version of god mode
    if mode == 1 and state == 0 then
        player:setCharVar('GodMode', 2)
        godModeTierOneOn(player)
        player:printToPlayer('God Mode Tier 1 enabled.')
    elseif mode == 1 and state == 2 then
        player:setCharVar('GodMode', 0)
        godModeTierOneOff(player)
        player:printToPlayer('God Mode Tier 1 disabled.')
    elseif mode == 1 and state == 1 then
        player:setCharVar('GodMode', 2)
        godModeOff(player)
        godModeTierOneOn(player)
        player:printToPlayer('God Mode Tier 1 enabled.')
    end
end

return commandObj
