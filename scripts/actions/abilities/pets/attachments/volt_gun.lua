-----------------------------------
-- Attachment: Volt Gun
-----------------------------------
---@type TAttachment
local attachmentObject = {}

local function calcEnspellDmg(pet, maneuvers)
    local skill = math.max(pet:getSkillLevel(invaderXim.skill.AUTOMATON_MELEE), pet:getSkillLevel(invaderXim.skill.AUTOMATON_RANGED), pet:getSkillLevel(invaderXim.skill.AUTOMATON_MAGIC))
    return math.floor(skill / 10 + skill * maneuvers / 20)
end

attachmentObject.onEquip = function(pet, attachment)
    pet:setMod(invaderXim.mod.ENSPELL_DMG, calcEnspellDmg(pet, 0))
    invaderXim.automaton.onAttachmentEquip(pet, attachment)
end

attachmentObject.onUnequip = function(pet, attachment)
    pet:delMod(invaderXim.mod.ENSPELL_DMG, pet:getMod(invaderXim.mod.ENSPELL_DMG))
    invaderXim.automaton.onAttachmentUnequip(pet, attachment)
end

attachmentObject.onManeuverGain = function(pet, attachment, maneuvers)
    pet:setMod(invaderXim.mod.ENSPELL_DMG, calcEnspellDmg(pet, maneuvers))
    invaderXim.automaton.onManeuverGain(pet, attachment, maneuvers)
end

attachmentObject.onManeuverLose = function(pet, attachment, maneuvers)
    pet:setMod(invaderXim.mod.ENSPELL_DMG, calcEnspellDmg(pet, maneuvers))
    invaderXim.automaton.onManeuverLose(pet, attachment, maneuvers)
end

attachmentObject.onUpdate = function(pet, attachment, maneuvers)
    attachmentObject.onManeuverGain(pet, attachment, maneuvers)
    invaderXim.automaton.updateAttachmentModifier(pet, attachment, maneuvers)
end

return attachmentObject
