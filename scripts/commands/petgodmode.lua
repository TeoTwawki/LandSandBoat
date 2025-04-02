-----------------------------------
-- func: petgodmode
-- desc: Toggles god mode on the player's pet, granting them several special abilities.
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = ''
}

commandObj.onTrigger = function(player)
    local pet = player:getPet()
    if not pet then
        return
    end

    if pet:getLocalVar('GodMode') == 0 then
        -- Toggle GodMode on..
        pet:setLocalVar('GodMode', 1)

        -- Add bonus effects to the pet..
        pet:addStatusEffect(invaderXim.effect.MAX_HP_BOOST, 1000, 0, 0)
        pet:addStatusEffect(invaderXim.effect.MAX_MP_BOOST, 1000, 0, 0)
        pet:addStatusEffect(invaderXim.effect.SENTINEL, 100, 0, 0)
        pet:addStatusEffect(invaderXim.effect.MIGHTY_STRIKES, 1, 0, 0)
        pet:addStatusEffect(invaderXim.effect.HUNDRED_FISTS, 1, 0, 0)
        pet:addStatusEffect(invaderXim.effect.CHAINSPELL, 1, 0, 0)
        pet:addStatusEffect(invaderXim.effect.PERFECT_DODGE, 1, 0, 0)
        pet:addStatusEffect(invaderXim.effect.INVINCIBLE, 1, 0, 0)
        pet:addStatusEffect(invaderXim.effect.MANAFONT, 1, 0, 0)
        pet:addStatusEffect(invaderXim.effect.REGAIN, 150, 1, 0)
        pet:addStatusEffect(invaderXim.effect.REFRESH, 99, 0, 0)
        pet:addStatusEffect(invaderXim.effect.REGEN, 99, 0, 0)

        -- Add bonus mods to the pet..
        pet:addMod(invaderXim.mod.RACC, 2500)
        pet:addMod(invaderXim.mod.RATT, 2500)
        pet:addMod(invaderXim.mod.ACC, 2500)
        pet:addMod(invaderXim.mod.ATT, 2500)
        pet:addMod(invaderXim.mod.MATT, 2500)
        pet:addMod(invaderXim.mod.MACC, 2500)
        pet:addMod(invaderXim.mod.RDEF, 2500)
        pet:addMod(invaderXim.mod.DEF, 2500)
        pet:addMod(invaderXim.mod.MDEF, 2500)

        -- Heal the pet from the new buffs..
        pet:addHP(50000)
        pet:setMP(50000)
    else
        -- Toggle GodMode off..
        pet:setLocalVar('GodMode', 0)

        -- Remove bonus effects..
        pet:delStatusEffect(invaderXim.effect.MAX_HP_BOOST)
        pet:delStatusEffect(invaderXim.effect.MAX_MP_BOOST)
        pet:delStatusEffect(invaderXim.effect.SENTINEL)
        pet:delStatusEffect(invaderXim.effect.MIGHTY_STRIKES)
        pet:delStatusEffect(invaderXim.effect.HUNDRED_FISTS)
        pet:delStatusEffect(invaderXim.effect.CHAINSPELL)
        pet:delStatusEffect(invaderXim.effect.PERFECT_DODGE)
        pet:delStatusEffect(invaderXim.effect.INVINCIBLE)
        pet:delStatusEffect(invaderXim.effect.MANAFONT)
        pet:delStatusEffect(invaderXim.effect.REGAIN)
        pet:delStatusEffect(invaderXim.effect.REFRESH)
        pet:delStatusEffect(invaderXim.effect.REGEN)

        -- Remove bonus mods..
        pet:delMod(invaderXim.mod.RACC, 2500)
        pet:delMod(invaderXim.mod.RATT, 2500)
        pet:delMod(invaderXim.mod.ACC, 2500)
        pet:delMod(invaderXim.mod.ATT, 2500)
        pet:delMod(invaderXim.mod.MATT, 2500)
        pet:delMod(invaderXim.mod.MACC, 2500)
        pet:delMod(invaderXim.mod.RDEF, 2500)
        pet:delMod(invaderXim.mod.DEF, 2500)
        pet:delMod(invaderXim.mod.MDEF, 2500)
    end
end

return commandObj
