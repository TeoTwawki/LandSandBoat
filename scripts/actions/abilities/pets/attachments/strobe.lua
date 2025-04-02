-----------------------------------
-- Attachment: Strobe
-- http://forum.square-enix.com/ffxi/threads/49065?p=565264#post565264
-----------------------------------
---@type TAttachment
local attachmentObject = {}

attachmentObject.onEquip = function(pet, attachment)
    invaderXim.automaton.onAttachmentEquip(pet, attachment)
    pet:addListener('AUTOMATON_ATTACHMENT_CHECK', 'ATTACHMENT_STROBE', function(automaton, target)
        local master = automaton:getMaster()

        if
            master and
            master:countEffect(invaderXim.effect.FIRE_MANEUVER) > 0 and
            (automaton:checkDistance(target) - target:getModelSize()) <= 15
        then
            automaton:useMobAbility(invaderXim.automaton.abilities.PROVOKE)
        end
    end)
end

attachmentObject.onUnequip = function(pet, attachment)
    invaderXim.automaton.onAttachmentUnequip(pet, attachment)
    pet:removeListener('ATTACHMENT_STROBE')
end

attachmentObject.onManeuverGain = function(pet, attachment, maneuvers)
    invaderXim.automaton.onManeuverGain(pet, attachment, maneuvers)
end

attachmentObject.onManeuverLose = function(pet, attachment, maneuvers)
    invaderXim.automaton.onManeuverLose(pet, attachment, maneuvers)
end

attachmentObject.onUpdate = function(pet, attachment, maneuvers)
    invaderXim.automaton.updateAttachmentModifier(pet, attachment, maneuvers)
end

return attachmentObject
