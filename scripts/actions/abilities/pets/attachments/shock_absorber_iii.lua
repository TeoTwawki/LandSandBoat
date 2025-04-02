-----------------------------------
-- Attachment: Shock Absorber III
-----------------------------------
---@type TAttachment
local attachmentObject = {}

attachmentObject.onEquip = function(pet)
    pet:setLocalVar('shockabsorber', pet:getLocalVar('shockabsorber') + 4)
    pet:addListener('AUTOMATON_ATTACHMENT_CHECK', 'ATTACHMENT_SHOCK_ABSORBER_III', function(automaton, target)
        local master = automaton:getMaster()

        if
            not automaton:hasRecast(invaderXim.recast.ABILITY, invaderXim.automaton.abilities.SHOCK_ABSORBER) and
            master and
            master:countEffect(invaderXim.effect.EARTH_MANEUVER) > 0
        then
            automaton:useMobAbility(invaderXim.automaton.abilities.SHOCK_ABSORBER, automaton)
        end
    end)
end

attachmentObject.onUnequip = function(pet)
    pet:setLocalVar('shockabsorber', pet:getLocalVar('shockabsorber') - 4)
    pet:removeListener('ATTACHMENT_SHOCK_ABSORBER_III')
end

attachmentObject.onManeuverGain = function(pet, maneuvers)
end

attachmentObject.onManeuverLose = function(pet, maneuvers)
end

return attachmentObject
