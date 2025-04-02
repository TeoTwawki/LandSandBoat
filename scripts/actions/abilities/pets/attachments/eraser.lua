-----------------------------------
-- Attachment: Eraser
-----------------------------------
---@type TAttachment
local attachmentObject = {}

local removable =
{
    invaderXim.effect.PETRIFICATION,
    invaderXim.effect.SILENCE,
    invaderXim.effect.BANE,
    invaderXim.effect.CURSE_II,
    invaderXim.effect.CURSE_I,
    invaderXim.effect.PARALYSIS,
    invaderXim.effect.PLAGUE,
    invaderXim.effect.POISON,
    invaderXim.effect.DISEASE,
    invaderXim.effect.BLINDNESS
}

attachmentObject.onEquip = function(pet)
    pet:addListener('AUTOMATON_ATTACHMENT_CHECK', 'ATTACHMENT_ERASER', function(automaton, target)
        local master = automaton:getMaster()
        if
            not automaton:hasRecast(invaderXim.recast.ABILITY, invaderXim.automaton.abilities.ERASER) and
            master and
            master:countEffect(invaderXim.effect.LIGHT_MANEUVER) > 0
        then
            local erasetarget = false

            local function checkEffects(entity)
                for _, status in pairs(removable) do
                    if entity:hasStatusEffect(status) then
                        return true
                    end
                end

                return false
            end

            if
                automaton:hasStatusEffectByFlag(invaderXim.effectFlag.ERASABLE) or
                checkEffects(automaton)
            then
                erasetarget = automaton
            elseif
                (automaton:checkDistance(master) - master:getModelSize()) < 7 and
                (master:hasStatusEffectByFlag(invaderXim.effectFlag.ERASABLE) or checkEffects(master))
            then
                erasetarget = master
            end

            if not erasetarget then
                return
            end

            automaton:useMobAbility(invaderXim.automaton.abilities.ERASER, erasetarget)
        end
    end)
end

attachmentObject.onUnequip = function(pet)
    pet:removeListener('ATTACHMENT_ERASER')
end

attachmentObject.onManeuverGain = function(pet, maneuvers)
end

attachmentObject.onManeuverLose = function(pet, maneuvers)
end

return attachmentObject
