-----------------------------------
-- Attachment: Arcanic Cell
-----------------------------------
---@type TAttachment
local attachmentObject = {}

attachmentObject.onEquip = function(pet, attachment)
    invaderXim.automaton.onAttachmentEquip(pet, attachment)
end

attachmentObject.onUnequip = function(pet, attachment)
    invaderXim.automaton.onAttachmentUnequip(pet, attachment)
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
