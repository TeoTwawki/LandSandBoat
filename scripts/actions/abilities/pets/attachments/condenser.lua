-----------------------------------
-- Attachment: Condenser
-----------------------------------
---@type TAttachment
local attachmentObject = {}

attachmentObject.onEquip = function(pet)
    pet:addMod(invaderXim.mod.PREVENT_OVERLOAD, 1)
end

attachmentObject.onUnequip = function(pet)
    pet:delMod(invaderXim.mod.PREVENT_OVERLOAD, 1)
end

attachmentObject.onManeuverGain = function(pet, maneuvers)
end

attachmentObject.onManeuverLose = function(pet, maneuvers)
end

return attachmentObject
