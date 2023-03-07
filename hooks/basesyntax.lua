Hooks:PostHook(WeaponFactoryTweakData, "init", "EAC_basesyntax", function(self)

for _, weapon in pairs(self) do
    if weapon.default_blueprint then
        if not weapon.adds then   weapon.adds = {} end
        if not weapon.override then weapon.override = {}   end
        if not weapon.uses_parts then weapon.uses_parts = {}   end
    end
end
-- Customs
local custom_weapons = {
"wpn_fps_smg_x_416",
"wpn_fps_ass_x_ak74",
"wpn_fps_ass_x_akm",
"wpn_fps_ass_x_akm_gold",
"wpn_fps_lmg_x_rpk",
"wpn_fps_lmg_x_m249",
"wpn_fps_smg_x_ump",
"wpn_fps_ass_x_amcar",
"wpn_fps_ass_x_g36",
"wpn_fps_ass_x_s552",
"wpn_fps_ass_x_asval",
}
for i, weapon_id in ipairs(custom_weapons) do
	if not self[weapon_id] 				then self[weapon_id] = {}				end
	if not self[weapon_id].override 	then self[weapon_id].override = {}		end
	if not self[weapon_id].adds 		then self[weapon_id].adds = {}			end
	if not self[weapon_id].uses_parts 	then self[weapon_id].uses_parts = {}	end
end
end)