-----------------------------------
-- Attachment: Smoke Screen
-----------------------------------
---@type TAttachment
local attachmentObject = {}

attachmentObject.onEquip = function(pet)
    pet:addMod(invaderXim.mod.EVA, 20)
    pet:addMod(invaderXim.mod.ACC, -20)
end

attachmentObject.onUnequip = function(pet)
    pet:delMod(invaderXim.mod.EVA, 20)
    pet:delMod(invaderXim.mod.ACC, -20)
end

attachmentObject.onManeuverGain = function(pet, maneuvers)
    if maneuvers == 1 then
        pet:addMod(invaderXim.mod.EVA, 20)
        pet:addMod(invaderXim.mod.ACC, -20)
    elseif maneuvers == 2 then
        pet:addMod(invaderXim.mod.EVA, 40)
        pet:addMod(invaderXim.mod.ACC, -40)
    elseif maneuvers == 3 then
        pet:addMod(invaderXim.mod.EVA, 80)
        pet:addMod(invaderXim.mod.ACC, -80)
    end
end

attachmentObject.onManeuverLose = function(pet, maneuvers)
    if maneuvers == 1 then
        pet:delMod(invaderXim.mod.EVA, 20)
        pet:delMod(invaderXim.mod.ACC, -20)
    elseif maneuvers == 2 then
        pet:delMod(invaderXim.mod.EVA, 40)
        pet:delMod(invaderXim.mod.ACC, -40)
    elseif maneuvers == 3 then
        pet:delMod(invaderXim.mod.EVA, 80)
        pet:delMod(invaderXim.mod.ACC, -80)
    end
end

return attachmentObject
