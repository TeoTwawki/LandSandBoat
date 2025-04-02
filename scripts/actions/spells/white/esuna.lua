-----------------------------------
-- Spell: Esuna
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    if caster:getID() == target:getID() then -- much of this should only run once per cast, otherwise it would only delete the debuffs from the caster.

        local statusNum = -1
        local removables =
        {
            invaderXim.effect.FLASH,
            invaderXim.effect.BLINDNESS,
            invaderXim.effect.PARALYSIS,
            invaderXim.effect.POISON,
            invaderXim.effect.CURSE_I,
            invaderXim.effect.CURSE_II,
            invaderXim.effect.DISEASE,
            invaderXim.effect.PLAGUE,
        }

        -- add extra statuses to the list of removables. Elegy and Requiem are specifically absent.
        if caster:hasStatusEffect(invaderXim.effect.AFFLATUS_MISERY) then
            removables =
            {
                invaderXim.effect.FLASH,
                invaderXim.effect.BLINDNESS,
                invaderXim.effect.PARALYSIS,
                invaderXim.effect.POISON,
                invaderXim.effect.CURSE_I,
                invaderXim.effect.CURSE_II,
                invaderXim.effect.DISEASE,
                invaderXim.effect.PLAGUE,
                invaderXim.effect.WEIGHT,
                invaderXim.effect.BIND,
                invaderXim.effect.BIO,
                invaderXim.effect.DIA,
                invaderXim.effect.BURN,
                invaderXim.effect.FROST,
                invaderXim.effect.CHOKE,
                invaderXim.effect.RASP,
                invaderXim.effect.SHOCK,
                invaderXim.effect.DROWN,
                invaderXim.effect.STR_DOWN,
                invaderXim.effect.DEX_DOWN,
                invaderXim.effect.VIT_DOWN,
                invaderXim.effect.AGI_DOWN,
                invaderXim.effect.INT_DOWN,
                invaderXim.effect.MND_DOWN,
                invaderXim.effect.CHR_DOWN,
                invaderXim.effect.ADDLE,
                invaderXim.effect.SLOW,
                invaderXim.effect.HELIX,
                invaderXim.effect.ACCURACY_DOWN,
                invaderXim.effect.ATTACK_DOWN,
                invaderXim.effect.EVASION_DOWN,
                invaderXim.effect.DEFENSE_DOWN,
                invaderXim.effect.MAGIC_ACC_DOWN,
                invaderXim.effect.MAGIC_ATK_DOWN,
                invaderXim.effect.MAGIC_EVASION_DOWN,
                invaderXim.effect.MAGIC_DEF_DOWN,
                invaderXim.effect.MAX_TP_DOWN,
                invaderXim.effect.MAX_MP_DOWN,
                invaderXim.effect.MAX_HP_DOWN,
            }
        end

        local has = {}

        -- collect a list of what caster currently has
        for i, effect in ipairs(removables) do
            if caster:hasStatusEffect(effect) then
                statusNum = statusNum + 1
                has[statusNum] = removables[i]
            end
        end

        local delEff = 0
        if statusNum >= 0 then -- make sure this happens once instead of for every target
            delEff = math.random(0, statusNum) -- pick a random status to delete
            caster:setLocalVar('esunaDelEff', has[delEff]) -- this can't be a local because it would only delete from the caster if it were.
        else -- clear it if the caster has no eligible statuses, otherwise it will remove the status from others if it was previously removed.
            caster:setLocalVar('esunaDelEff', 0)
            caster:setLocalVar('esunaDelEffMis', 0)  -- again, this can't be a local because it would only delete from the caster if it were. For extra status deletion under Misery
        end

        if statusNum >= 1 and caster:hasStatusEffect(invaderXim.effect.AFFLATUS_MISERY) then -- Misery second status removal.
            caster:delStatusEffect(has[delEff]) -- delete the first selected effect so it doesn't get selected again. Won't impact the ability to delete it from others at this point.
            local statusNumMis =  - 1 -- need a new var to track the amount of debuffs for the array

            -- collect a list of what caster currently has, again.
            has = {}
            for i, effect in ipairs(removables) do
                if caster:hasStatusEffect(effect) then
                    statusNumMis = statusNumMis + 1
                    has[statusNumMis] = removables[i]
                end
            end

            local delEffMis = math.random(0, statusNumMis) -- pick another random status to delete
            caster:setLocalVar('esunaDelEffMis', has[delEffMis])
        else
            caster:setLocalVar('esunaDelEffMis', 0)
        end
    end

    local statusDel = caster:getLocalVar('esunaDelEff')
    local statusDelMis = caster:getLocalVar('esunaDelEffMis')

    if statusDel == 0 then -- this gets set to 0 if there's no status to delete.
        spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT) -- no effect
    elseif statusDelMis ~= 0 then -- no need to check for statusDelMis because it can't be 0 if this isn't
        target:delStatusEffect(statusDel)
        target:delStatusEffect(statusDelMis)
    else
        target:delStatusEffect(statusDel)
    end

    return statusDel
end

return spellObject
