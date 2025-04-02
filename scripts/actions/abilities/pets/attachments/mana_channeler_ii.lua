-----------------------------------
-- Attachment: Mana Channeler II
-----------------------------------
---@type TAttachment
local attachmentObject = {}

attachmentObject.onEquip = function(pet)
    pet:addMod(invaderXim.mod.MATT, 20)  -- Values unknown, best guess based on other attachment methods
    pet:addMod(invaderXim.mod.AUTO_MAGIC_DELAY, -3)
end

attachmentObject.onUnequip = function(pet)
    pet:delMod(invaderXim.mod.MATT, 20)
    pet:delMod(invaderXim.mod.AUTO_MAGIC_DELAY, -3)
end

attachmentObject.onManeuverGain = function(pet, maneuvers)
    if maneuvers == 1 then
        pet:addMod(invaderXim.mod.MATT, 10)
        pet:addMod(invaderXim.mod.AUTO_MAGIC_DELAY, -3)
    elseif maneuvers == 2 then
        pet:addMod(invaderXim.mod.MATT, 10)
        pet:addMod(invaderXim.mod.AUTO_MAGIC_DELAY, -3)
    elseif maneuvers == 3 then
        pet:addMod(invaderXim.mod.MATT, 10)
        pet:addMod(invaderXim.mod.AUTO_MAGIC_DELAY, -3)
    end
end

attachmentObject.onManeuverLose = function(pet, maneuvers)
    if maneuvers == 1 then
        pet:delMod(invaderXim.mod.MATT, 10)
        pet:delMod(invaderXim.mod.AUTO_MAGIC_DELAY, -3)
    elseif maneuvers == 2 then
        pet:delMod(invaderXim.mod.MATT, 10)
        pet:delMod(invaderXim.mod.AUTO_MAGIC_DELAY, -3)
    elseif maneuvers == 3 then
        pet:delMod(invaderXim.mod.MATT, 10)
        pet:delMod(invaderXim.mod.AUTO_MAGIC_DELAY, -3)
    end
end

return attachmentObject
