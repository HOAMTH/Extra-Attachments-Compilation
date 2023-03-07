Hooks:PostHook(WeaponFactoryTweakData, "init", "EAC_additions", function(self, tweak_data)
local m4_grips = {}
local m4_stocks = {}
local m4_butt = {}
local ak_stocks = {}
local ak_grips = {}

for i, part_ids in pairs(self.wpn_fps_ass_m4.uses_parts) do
	if self.parts[part_ids].type == "grip" and self.parts[part_ids].pcs then 
	-- log(tostring(part_ids) .. " is a M4 type grip.")
		table.insert(m4_grips, part_ids)
	end
	if self.parts[part_ids].type == "stock" and self.parts[part_ids].pcs and self.parts[part_ids].adds_type then 
	-- log(tostring(part_ids) .. " is a M4 type stock.")
		table.insert(m4_stocks, part_ids)
		table.insert(m4_stocks, "wpn_fps_upg_m4_s_standard")		
	end
	if self.parts[part_ids].type == "stock" and self.parts[part_ids].pcs and not self.parts[part_ids].adds_type then 
	-- log(tostring(part_ids) .. " is a M4 butt plate stock.")
		table.insert(m4_butt, part_ids)
		table.insert(m4_butt, "wpn_fps_upg_m4_s_solid")
		table.insert(m4_butt, "wpn_fps_ass_tecci_s_short")
		table.insert(m4_butt, "wpn_fps_smg_olympic_s_short")
		table.insert(m4_butt, "wpn_fps_upg_m4_s_contender")
	end
end

for i, part_ids in pairs(self.wpn_fps_ass_akm.uses_parts) do
	if self.parts[part_ids].type == "stock" and self.parts[part_ids].pcs and not self.parts[part_ids].adds_type then 
	-- log(tostring(part_ids) .. " is a AK type stock.")
		table.insert(ak_stocks, part_ids)
		table.insert(ak_stocks, "wpn_upg_ak_s_folding")		
		table.insert(ak_stocks, "wpn_fps_lmg_rpk_s_standard")		
	end
end
for i, part_ids in pairs(self.wpn_fps_ass_galil.uses_parts) do
	if self.parts[part_ids].type == "stock" and self.parts[part_ids].pcs and not self.parts[part_ids].adds_type then 
	-- log(tostring(part_ids) .. " is a Galil stock.")
		table.insert(ak_stocks, part_ids)
	end
end
for i, part_ids in pairs(self.wpn_fps_ass_akm.uses_parts) do
	if self.parts[part_ids].type == "grip" and self.parts[part_ids].pcs then 
	-- log(tostring(part_ids) .. " is a AK type grip.")
		table.insert(ak_grips, part_ids)
		table.insert(ak_grips, "wpn_fps_upg_galil_g_sniper")	
	end
end

local m4_g_seed = {
"wpn_fps_lmg_m249",
"wpn_fps_ass_tecci",
"wpn_fps_ass_contraband",
"wpn_fps_smg_shepheard",
"wpn_fps_smg_x_shepheard"
}
for g, wpn in ipairs(m4_g_seed) do
	table.list_append(self[wpn].uses_parts, {"wpn_fps_upg_m4_g_ergo"})
end

local m4_s_seed = {
"wpn_fps_ass_contraband",
"wpn_fps_ass_asval",
"wpn_fps_ass_galil",
"wpn_fps_smg_x_akmsu",
"wpn_fps_smg_coal",
"wpn_fps_smg_x_coal",
"wpn_fps_smg_vityaz",
"wpn_fps_smg_x_vityaz",
"wpn_fps_sho_m590",
"wpn_fps_sho_x_sko12",
"wpn_fps_smg_cobray",
"wpn_fps_smg_x_cobray",
"wpn_fps_smg_hajk",
"wpn_fps_smg_x_hajk",
"wpn_fps_smg_mac10",
"wpn_fps_smg_x_mac10",
"wpn_fps_smg_olympic",
"wpn_fps_smg_x_olympic",
"wpn_fps_smg_thompson",
"wpn_fps_smg_x_m1928",
"wpn_fps_smg_polymer",
"wpn_fps_smg_x_polymer",
"wpn_fps_smg_shepheard",
"wpn_fps_smg_x_shepheard",
"wpn_fps_smg_x_416"
}
for h, wpn in ipairs(m4_s_seed) do
	table.list_append(self[wpn].uses_parts, {"wpn_fps_upg_m4_s_crane"})
end

local m4_s_butt_seed = {
"wpn_fps_ass_contraband",
"wpn_fps_smg_olympic",
"wpn_fps_smg_x_olympic",
"wpn_fps_smg_hajk",
"wpn_fps_smg_x_hajk",
"wpn_fps_ass_amcar",
"wpn_fps_ass_x_amcar",
"wpn_fps_ass_m16",
"wpn_fps_snp_tti",
"wpn_fps_snp_victor",
"wpn_fps_snp_contender",
"wpn_fps_ass_m4",
"wpn_fps_sho_sko12",
"wpn_fps_sho_x_sko12"
}
for f, wpn in ipairs(m4_s_butt_seed) do
	table.list_append(self[wpn].uses_parts, {"wpn_fps_m4_uupg_s_fold"})
end

local ak_s_seed = {
"wpn_fps_ass_74",
"wpn_fps_smg_x_akmsu",
"wpn_fps_ass_flint",
"wpn_fps_smg_coal",
"wpn_fps_smg_x_coal",
"wpn_fps_ass_asval",
"wpn_fps_lmg_rpk",
"wpn_fps_ass_galil",
"wpn_fps_smg_x_vityaz",
"wpn_fps_smg_vityaz"
}
for f, wpn in ipairs(ak_s_seed) do
	table.list_append(self[wpn].uses_parts, {"wpn_upg_ak_s_skfoldable"})
end


for k, wpn_id in pairs(self) do
	if self[k] and not (string.match(k, "_npc") or string.match(k, "_primary") or string.match(k, "parts") or string.match(k, "aaaaa") or string.match(k, "_secondary") and not string.match(k, "saw_secondary")) then
		-- log(tostring(k))	
		for l, grip_ad in ipairs(m4_grips) do
			if table.contains(self[k].uses_parts, "wpn_fps_upg_m4_g_ergo") and not table.contains(self[k].uses_parts, grip_ad) then
				table.insert(self[k].uses_parts, grip_ad)
				-- log(tostring(k) .." "..  tostring(grip_ad))
			end
		end
		for m, stock_ad in ipairs(m4_stocks) do
			if self[k] and table.contains(self[k].uses_parts, "wpn_fps_upg_m4_s_crane") and not table.contains(self[k].uses_parts, stock_ad) then
				table.insert(self[k].uses_parts, stock_ad)
				-- log(tostring(k) .." "..  tostring(stock_ad))
			end
		end
		for n, butt_stock_ad in ipairs(m4_butt) do
			if self[k] and table.contains(self[k].uses_parts, "wpn_fps_m4_uupg_s_fold") and not table.contains(self[k].uses_parts, butt_stock_ad) then
				table.insert(self[k].uses_parts, butt_stock_ad)
				-- log(tostring(k) .." ".. tostring(butt_stock_ad))
			end
		end
		for o, stock_ad in ipairs(ak_stocks) do
			if self[k] and table.contains(self[k].uses_parts, "wpn_upg_ak_s_skfoldable") and not table.contains(self[k].uses_parts, stock_ad) then
				if string.match(k, "asval") and string.match(stock_ad, "psl") then
				else
					table.insert(self[k].uses_parts, stock_ad)
					-- log(tostring(k) .." "..  tostring(stock_ad))
				end
			end
		end
		for p, grip_ad in ipairs(ak_grips) do
			if self[k] and table.contains(self[k].uses_parts, "wpn_fps_upg_ak_g_hgrip") and not table.contains(self[k].uses_parts, grip_ad) then
				table.insert(self[k].uses_parts, grip_ad)
				-- log(tostring(k) .." ".. tostring(butt_stock_ad))
			end
		end
	end
end

-- Gecko
for i, grips in ipairs(ak_grips) do
	if not string.match(grips, "galil") then -- Add all the AK grips to the Galil except the copied Galil Sniper grip.
		table.list_append(self.wpn_fps_ass_galil.uses_parts, { grips })
		table.list_append(self.wpn_fps_ass_ak5.uses_parts, { grips })
	end
end
-- AK5 & M249 grips
table.list_append(self.wpn_fps_ass_ak5.default_blueprint, { "wpn_fps_ass_ak5_g_standard" })
table.list_append(self.wpn_fps_ass_ak5.uses_parts       , { "wpn_fps_ass_ak5_g_standard", "wpn_fps_ass_scar_s_sniper"})
table.list_append(self.wpn_fps_lmg_m249.default_blueprint, { "wpn_fps_lmg_m249_g_standard" })
table.list_append(self.wpn_fps_lmg_m249.uses_parts       , { "wpn_fps_lmg_m249_g_standard" })

-- Chimano
table.list_append(self.wpn_fps_pis_g17.uses_parts, {
	"wpn_fps_pis_g18c_g_ergo"   ,
	"wpn_fps_pis_g18c_s_stock"  
})
table.list_append(self.wpn_fps_pis_x_g17.uses_parts, {
	"wpn_fps_pis_g18c_g_ergo"   ,
    "wpn_fps_pis_g18c_s_stock"  
})
table.list_append(self.wpn_fps_pis_x_g18c.uses_parts, {"wpn_fps_pis_g18c_s_stock"})
table.list_append(self.wpn_fps_pis_g22c.uses_parts  , {"wpn_fps_pis_g18c_s_stock"})
table.list_append(self.wpn_fps_pis_x_g22c.uses_parts, {"wpn_fps_pis_g18c_s_stock"})
table.list_append(self.wpn_fps_pis_g26.uses_parts   , {"wpn_fps_pis_g18c_s_stock"})
table.list_append(self.wpn_fps_jowi.uses_parts      , {"wpn_fps_pis_g18c_s_stock"})
--Flamethrower
table.list_append(self.wpn_fps_fla_mk2.uses_parts, {
	"wpn_fps_upg_fl_ass_laser",
	"wpn_fps_upg_fl_ass_smg_sho_peqbox",
	"wpn_fps_upg_fl_ass_peq15",
	"wpn_fps_upg_fl_ass_utg",
	"wpn_fps_upg_fl_ass_smg_sho_surefire"
})
--Akimbo Pistols
table.list_append(self.wpn_fps_x_1911.uses_parts,  { "wpn_upg_o_marksmansight_rear"})
table.list_append(self.wpn_fps_x_b92fs.uses_parts, { "wpn_upg_o_marksmansight_rear"})
table.list_append(self.wpn_fps_x_deagle.uses_parts,{ "wpn_upg_o_marksmansight_rear"})
--Eagle Heavy
table.list_append(self.wpn_fps_ass_scar.uses_parts, {
	"wpn_fps_ass_ak5_s_ak5b",
	"wpn_fps_ass_ak5_s_ak5c"
})
--Judge
table.list_append(self.wpn_fps_pis_judge.uses_parts,   {"wpn_fps_pis_rage_g_ergo"})
table.list_append(self.wpn_fps_pis_x_judge.uses_parts, {"wpn_fps_pis_rage_g_ergo"})
--Compact-5
table.list_append(self.wpn_fps_smg_mp5.uses_parts, {"wpn_fps_smg_mp5_s_proper"})
table.list_append(self.wpn_fps_smg_x_mp5.uses_parts, {
	"wpn_fps_smg_mp5_s_proper",
	"wpn_fps_smg_mp5_s_adjust",
	"wpn_fps_smg_x_mp5_s_solid"
})
--AK Family Rifles
table.list_append(self.wpn_fps_ass_74.uses_parts, {
	"wpn_fps_lmg_rpk_fg_standard",
	"wpn_fps_lmg_rpk_fg_combo1"
})
table.list_append(self.wpn_fps_ass_akm.uses_parts, {
	"wpn_fps_lmg_rpk_fg_standard",
	"wpn_fps_lmg_rpk_fg_combo1"
})
table.list_append(self.wpn_fps_ass_akm_gold.uses_parts, {
 "wpn_fps_lmg_rpk_fg_standard",
 "wpn_fps_lmg_rpk_fg_combo1"
})
--RPK
table.list_append(self.wpn_fps_lmg_rpk.uses_parts, {
 "wpn_upg_ak_fg_combo3",
 "wpn_fps_upg_ak_fg_tapco",
 "wpn_fps_upg_ak_fg_krebs",
 "wpn_fps_upg_ak_fg_trax",
 "wpn_fps_upg_fg_midwest",
 "wpn_fps_upg_rpk_b_ak105",
 "wpn_fps_upg_ak_body_upperreceiver_zenitco",
 "wpn_fps_upg_rpk_b_zastava"
})
--IZHMA
table.list_append(self.wpn_fps_shot_saiga.uses_parts, {
 "wpn_upg_ak_fg_combo2",
 "wpn_fps_lmg_rpk_fg_combo1",
 "wpn_upg_ak_fg_combo3",
 "wpn_fps_upg_ak_fg_tapco",
 "wpn_fps_upg_ak_fg_krebs",
 "wpn_fps_upg_ak_fg_trax"
})
--JP36
table.list_append(self.wpn_fps_ass_g36.uses_parts, {
 "wpn_fps_upg_o_leupold",
 "wpn_fps_snp_msr_ns_suppressor"
})

table.list_append(self.wpn_fps_lmg_hk51b.uses_parts, {
"wpn_fps_upg_bp_lmg_lionbipod"
})
-- self.wpn_fps_lmg_hk51b.override.wpn_fps_upg_bp_lmg_lionbipod = {a_obj = "a_vg"}
--Parabellum
table.list_append(self.wpn_fps_pis_breech.uses_parts, {
	"wpn_fps_upg_pis_ns_flash"
})
--AUG
table.list_append(self.wpn_fps_ass_aug.uses_parts, {
 "wpn_fps_ass_l85a2_m_emag",
 "wpn_fps_upg_m4_m_l5"
})
--CR 805B
table.list_append(self.wpn_fps_smg_hajk.uses_parts, {
	"wpn_fps_upg_m4_s_adapter",
	"wpn_fps_ass_scar_s_sniper",
	"wpn_fps_ass_ak5_s_ak5b",
	"wpn_fps_ass_ak5_s_ak5c"
})
table.list_append(self.wpn_fps_smg_x_hajk.uses_parts, {
	"wpn_fps_upg_m4_s_adapter",
	"wpn_fps_ass_scar_s_sniper",
	"wpn_fps_ass_ak5_s_ak5b",
	"wpn_fps_ass_ak5_s_ak5c"
})
-- HK416/AR-15
local m4_fg = {
 "wpn_fps_m16_fg_railed",
 "wpn_fps_m4_uupg_fg_lr300",
 "wpn_fps_upg_ass_m16_fg_stag",
 "wpn_fps_upg_ass_m4_fg_lvoa",
 "wpn_fps_upg_ass_m4_fg_moe",
 "wpn_fps_upg_fg_smr",
 "wpn_fps_uupg_fg_radian"
}
local rif = {
"wpn_fps_ass_contraband",
"wpn_fps_ass_tecci",
"wpn_fps_ass_m4",
"wpn_fps_ass_m16",
"wpn_fps_ass_amcar",
"wpn_fps_snp_tti",
"wpn_fps_snp_victor"
}
for i, wpn in ipairs(rif) do
	for j, fg in ipairs(m4_fg) do
		if not table.contains(self[wpn].uses_parts, fg) then
			if not (string.match(wpn, "contraband") or string.match(wpn, "tecci")) then
				table.insert(self[wpn].uses_parts, "wpn_fps_m16_fg_vietnam")
			end
			table.insert(self[wpn].uses_parts, fg)
		end 
	end 
end
table.list_append(self.wpn_fps_ass_contraband.uses_parts, {
 -- "wpn_fps_m16_fg_railed",
 -- "wpn_fps_m16_fg_vietnam",
 -- "wpn_fps_upg_ass_m16_fg_stag",
 -- "wpn_fps_upg_ass_m4_fg_lvoa",
 -- "wpn_fps_upg_fg_smr"
})
table.list_append(self.wpn_fps_snp_tti.uses_parts, {
 "wpn_fps_m4_upper_reciever_edge",
 "wpn_fps_upg_ass_m4_upper_reciever_ballos",
 "wpn_fps_m4_uupg_draghandle_ballos",
 "wpn_fps_upg_ass_m4_upper_reciever_core",
 "wpn_fps_m4_uupg_draghandle_core",
 "wpn_fps_upg_ass_m4_lower_reciever_core",
 "wpn_fps_m4_uupg_upper_radian",
 "wpn_fps_m4_uupg_lower_radian"
})
table.list_append(self.wpn_fps_snp_victor.uses_parts, {
 "wpn_fps_m4_upper_reciever_edge",
 "wpn_fps_upg_ass_m4_upper_reciever_ballos",
 "wpn_fps_m4_uupg_draghandle_ballos",
 "wpn_fps_upg_ass_m4_upper_reciever_core",
 "wpn_fps_m4_uupg_draghandle_core",
 "wpn_fps_upg_ass_m4_lower_reciever_core",
 "wpn_fps_m4_uupg_upper_radian",
 "wpn_fps_m4_uupg_lower_radian"
})
table.list_append(self.wpn_fps_ass_tecci.uses_parts, {
 -- "wpn_fps_m4_uupg_fg_rail",
 -- "wpn_fps_m4_uupg_fg_lr300",
 -- "wpn_fps_upg_fg_jp",
 -- "wpn_fps_upg_fg_smr",
 -- "wpn_fps_upg_ass_m4_fg_moe",
 -- "wpn_fps_upg_ass_m4_fg_lvoa",
 -- "wpn_fps_uupg_fg_radian",
 -- "wpn_fps_m16_fg_railed",
 -- "wpn_fps_m16_fg_vietnam",
 -- "wpn_fps_upg_ass_m16_fg_stag",
 "wpn_fps_m4_upper_reciever_edge",
 "wpn_fps_upg_ass_m4_upper_reciever_ballos",
 "wpn_fps_m4_uupg_draghandle_ballos",
 "wpn_fps_upg_ass_m4_upper_reciever_core",
 "wpn_fps_m4_uupg_draghandle_core",
 "wpn_fps_upg_ass_m4_lower_reciever_core",
 "wpn_fps_m4_uupg_upper_radian",
 "wpn_fps_m4_uupg_lower_radian"
})
table.list_append(self.wpn_fps_ass_m4.uses_parts, {
 -- "wpn_fps_upg_m4_s_standard",
 -- "wpn_fps_smg_olympic_s_short",
 -- "wpn_fps_m16_fg_railed",
 -- "wpn_fps_m16_fg_vietnam",
 -- "wpn_fps_upg_ass_m16_fg_stag"
})
table.list_append(self.wpn_fps_smg_olympic.uses_parts, {
 "wpn_fps_m4_upg_b_long",
 "wpn_fps_m4_upg_b_sd"
})
table.list_append(self.wpn_fps_smg_x_olympic.uses_parts, {
 "wpn_fps_m4_uupg_s_fold",
 "wpn_fps_m4_upg_b_long",
 "wpn_fps_m4_upg_b_sd"
})
table.list_append(self.wpn_fps_ass_m16.uses_parts, {
 -- "wpn_fps_m4_uupg_m_std_vanilla",
 -- "wpn_fps_m4_uupg_s_fold",
 "wpn_fps_m4_upg_b_sd",
 -- "wpn_fps_m4_uupg_fg_lr300",
 -- "wpn_fps_upg_ass_m4_fg_moe",
 -- "wpn_fps_upg_ass_m4_fg_lvoa",
 -- "wpn_fps_upg_fg_jp",
 -- "wpn_fps_upg_fg_smr",
 -- "wpn_fps_smg_olympic_s_short",
 "wpn_fps_m4_upg_b_short"
})
table.list_append(self.wpn_fps_ass_amcar.uses_parts, {
 -- "wpn_fps_m4_uupg_s_fold",
 -- "wpn_fps_m4_uupg_fg_rail",
 -- "wpn_fps_m4_uupg_fg_lr300",
 -- "wpn_fps_upg_fg_jp",
 -- "wpn_fps_upg_fg_smr",
 -- "wpn_fps_upg_ass_m4_fg_moe",
 -- "wpn_fps_upg_ass_m4_fg_lvoa",
 -- "wpn_fps_smg_olympic_s_short",
 -- "wpn_fps_m16_fg_railed",
 -- "wpn_fps_m16_fg_vietnam",
 -- "wpn_fps_upg_ass_m16_fg_stag",
 "wpn_fps_m4_upg_b_long",
 "wpn_fps_m4_upg_b_short",
 "wpn_fps_m4_upg_b_sd",
 "wpn_fps_m4_upper_reciever_edge",
 "wpn_fps_upg_ass_m4_upper_reciever_ballos",
 "wpn_fps_m4_uupg_draghandle_ballos",
 "wpn_fps_upg_ass_m4_upper_reciever_core",
 "wpn_fps_m4_uupg_draghandle_core",
 "wpn_fps_upg_ass_m4_lower_reciever_core",
 "wpn_fps_m4_uupg_upper_radian",
 "wpn_fps_m4_uupg_lower_radian"
})
--M308
table.list_append(self.wpn_fps_ass_m14.uses_parts, {
 "wpn_fps_upg_o_leupold",
 "wpn_fps_upg_o_45iron",
 "wpn_fps_snp_msr_ns_suppressor"
})
--Gewehr 3
table.list_append(self.wpn_fps_ass_g3.uses_parts, {
 "wpn_fps_upg_o_leupold",
 "wpn_fps_upg_o_45iron",
 "wpn_fps_smg_mp5_s_adjust",
 "wpn_fps_snp_msr_ns_suppressor"
})
--Bronco
table.list_append(self.wpn_fps_pis_rage.uses_parts, {
 "wpn_fps_upg_ns_pis_meatgrinder",
 "wpn_fps_upg_ns_pis_ipsccomp",
 "wpn_fps_upg_ns_ass_filter",
 "wpn_fps_upg_ns_pis_jungle",
 "wpn_fps_upg_ns_pis_medium_gem",
 "wpn_fps_upg_ns_pis_large_kac",
 "wpn_fps_upg_ns_pis_small",
 "wpn_fps_upg_ns_pis_medium",
 "wpn_fps_upg_ns_pis_large",
 "wpn_fps_upg_ns_pis_medium_slim"
})
table.list_append(self.wpn_fps_pis_rsh12.uses_parts, {
 -- "wpn_fps_upg_ns_pis_meatgrinder",
 -- "wpn_fps_upg_ns_pis_ipsccomp",
 -- "wpn_fps_upg_ns_ass_filter",
 -- "wpn_fps_upg_ns_pis_jungle",
 -- "wpn_fps_upg_ns_pis_medium_gem",
 -- "wpn_fps_upg_ns_pis_large_kac",
 -- "wpn_fps_upg_ns_pis_small",
 -- "wpn_fps_upg_ns_pis_medium",
 -- "wpn_fps_upg_ns_pis_large",
 -- "wpn_fps_upg_ns_pis_medium_slim"
})
table.list_append(self.wpn_fps_pis_x_rage.uses_parts, {
 "wpn_fps_upg_ns_pis_meatgrinder",
 "wpn_fps_upg_ns_pis_ipsccomp",
 "wpn_fps_upg_ns_ass_filter",
 "wpn_fps_upg_ns_pis_jungle",
 "wpn_fps_upg_ns_pis_medium_gem",
 "wpn_fps_upg_ns_pis_large_kac",
 "wpn_fps_upg_ns_pis_small",
 "wpn_fps_upg_ns_pis_medium",
 "wpn_fps_upg_ns_pis_large",
 "wpn_fps_upg_ns_pis_medium_slim"
})
--Brenner
table.list_append(self.wpn_fps_lmg_hk21.uses_parts, {
 "wpn_fps_ass_g3_g_sniper",
 "wpn_fps_ass_g3_g_retro",
 "wpn_fps_smg_mp5_s_adjust"
})
-- Jacket's Piece
table.list_append(self.wpn_fps_smg_x_cobray.uses_parts, {
 "wpn_fps_smg_cobray_s_m4adapter"
})
-- Thompson 1928
table.list_append(self.wpn_fps_smg_thompson.uses_parts, {
 "wpn_fps_smg_cobray_s_m4adapter"
})
table.list_append(self.wpn_fps_smg_x_m1928.uses_parts, {
 "wpn_fps_smg_thompson_stock_discrete",
 "wpn_fps_smg_cobray_s_m4adapter"
})
-- Mac 10
table.list_append(self.wpn_fps_smg_mac10.uses_parts, {
 "wpn_fps_smg_cobray_s_m4adapter"
})
table.list_append(self.wpn_fps_smg_x_mac10.uses_parts, {
 "wpn_fps_smg_cobray_s_m4adapter"
})
-- Micro Uzi
table.list_append(self.wpn_fps_smg_x_baka.uses_parts, {
 "wpn_fps_smg_baka_s_standard",
 "wpn_fps_smg_baka_s_unfolded"
})
-- MP9
table.list_append(self.wpn_fps_smg_x_mp9.uses_parts, {
 "wpn_fps_smg_mp9_s_skel"
})
-- Jackal
table.list_append(self.wpn_fps_smg_x_schakal.uses_parts, {
 "wpn_fps_smg_schakal_s_civil"
})
-- Blaster
table.list_append(self.wpn_fps_smg_x_tec9.uses_parts, {
 "wpn_fps_smg_tec9_s_unfolded"
})
-- Vertex
-- Sterling
table.list_append(self.wpn_fps_smg_x_sterling.uses_parts, {
 "wpn_fps_smg_sterling_s_nostock",
 "wpn_fps_smg_sterling_s_solid"
})
-- Uzi
table.list_append(self.wpn_fps_smg_x_uzi.uses_parts, {
 "wpn_fps_smg_uzi_s_leather",
 "wpn_fps_smg_uzi_s_solid",
 "wpn_fps_smg_uzi_s_unfolded"
})
-- Scorpion
table.list_append(self.wpn_fps_smg_x_scorpion.uses_parts, {
 "wpn_fps_smg_scorpion_s_nostock",
 "wpn_fps_smg_scorpion_s_unfolded"
})
-- Signature SMG
table.list_append(self.wpn_fps_smg_shepheard.uses_parts, {
 "wpn_fps_m4_uupg_s_fold"
})
table.list_append(self.wpn_fps_smg_x_shepheard.uses_parts, {
 "wpn_fps_m4_uupg_s_fold"
})
-- Mosconi 12G Tactical
table.list_append(self.wpn_fps_sho_m590.uses_parts, {
 "wpn_fps_shot_r870_fg_wood"
})
-- Autopistols
table.list_append(self.wpn_fps_pis_stech.uses_parts, {
"wpn_fps_upg_i_singlefire"
})
table.list_append(self.wpn_fps_pis_x_stech.uses_parts, {
"wpn_fps_upg_i_singlefire",
"wpn_fps_pis_stech_s_standard"
})

table.list_append(self.wpn_fps_pis_czech.uses_parts, {
"wpn_fps_upg_i_singlefire"
})
table.list_append(self.wpn_fps_pis_x_czech.uses_parts, {
"wpn_fps_upg_i_singlefire",
"wpn_fps_pis_czech_s_standard"
})

table.list_append(self.wpn_fps_pis_beer.uses_parts, {
"wpn_fps_upg_i_singlefire"
})
table.list_append(self.wpn_fps_pis_x_beer.uses_parts, {
"wpn_fps_upg_i_singlefire",
"wpn_fps_pis_beer_s_std"
})
table.list_append(self.wpn_fps_gre_ms3gl.uses_parts, {
"wpn_fps_upg_i_singlefire"
})

-- Miyaka 10 SMG
local pm9_o = {
"wpn_fps_upg_o_aimpoint",
"wpn_fps_upg_o_aimpoint_2",
"wpn_fps_upg_o_acog",
"wpn_fps_upg_o_eotech",
"wpn_fps_upg_o_cmore",
"wpn_fps_upg_o_cs",
"wpn_fps_upg_o_rx01",
"wpn_fps_upg_o_rx30",
"wpn_fps_upg_o_specter",
"wpn_fps_upg_o_spot",
"wpn_fps_upg_o_tf90",
"wpn_fps_upg_o_uh",
"wpn_fps_upg_o_bmg"
}
for z, part_id in ipairs(pm9_o) do 
table.list_append(self.wpn_fps_smg_pm9.uses_parts, { part_id })
if not self.wpn_fps_smg_pm9.adds[part_id] then self.wpn_fps_smg_pm9.adds[part_id] = {"wpn_fps_smg_pm9_o_adapter","wpn_fps_smg_erma_extra_rail"} end
end
local pm9_fl = {
	"wpn_fps_upg_fl_ass_smg_sho_peqbox",
	"wpn_fps_upg_fl_ass_smg_sho_surefire",
	"wpn_fps_upg_fl_ass_utg",
	"wpn_fps_upg_fl_ass_peq15",
	"wpn_fps_upg_fl_ass_laser"
}
for y, part_id in ipairs(pm9_fl) do 
table.list_append(self.wpn_fps_smg_pm9.uses_parts, { part_id })
table.list_append(self.wpn_fps_smg_x_pm9.uses_parts, { part_id })
if not self.wpn_fps_smg_pm9.adds[part_id] then self.wpn_fps_smg_pm9.adds[part_id] = {} end
self.wpn_fps_smg_pm9.adds[part_id] = {"wpn_fps_smg_pm9_fl_adapter"}
self.wpn_fps_smg_pm9.override[part_id] = {a_obj = "a_fl2"}
self.wpn_fps_smg_x_pm9.override[part_id] = {a_obj = "a_fl2"}
end

--VD-12
table.list_append(self.wpn_fps_sho_x_sko12.uses_parts, {
 "wpn_fps_sho_sko12_s_adapter"
})

self.parts.wpn_fps_smg_pm9_body_standard.forbids = {"wpn_fps_addon_ris"}
table.list_append(self.wpn_fps_snp_qbu88.uses_parts, { "wpn_fps_snp_msr_ns_suppressor" })

table.list_append(self.wpn_fps_pis_peacemaker.uses_parts, {"wpn_fps_upg_pis_ns_flash"})
table.list_append(self.wpn_fps_pis_2006m.uses_parts     , {"wpn_fps_upg_pis_ns_flash"})
table.list_append(self.wpn_fps_pis_chinchilla.uses_parts, {"wpn_fps_upg_pis_ns_flash"})
table.list_append(self.wpn_fps_pis_model3.uses_parts    , {"wpn_fps_upg_pis_ns_flash"})
table.list_append(self.wpn_fps_pis_x_2006m.uses_parts     , {"wpn_fps_upg_pis_ns_flash"})
table.list_append(self.wpn_fps_pis_x_chinchilla.uses_parts, {"wpn_fps_upg_pis_ns_flash"})
table.list_append(self.wpn_fps_pis_x_model3.uses_parts    , {"wpn_fps_upg_pis_ns_flash"})




-- Custom Akimbos
table.list_append(self.wpn_fps_ass_x_ak74.uses_parts, {
 "wpn_fps_lmg_rpk_s_standard"
})
table.list_append(self.wpn_fps_ass_x_akm.uses_parts, {
 "wpn_fps_lmg_rpk_s_standard"
})
table.list_append(self.wpn_fps_ass_x_akm_gold.uses_parts, {
 "wpn_fps_lmg_rpk_s_standard"
})
table.list_append(self.wpn_fps_lmg_x_rpk.uses_parts, {
 "wpn_upg_ak_fg_combo3",
 "wpn_fps_upg_ak_fg_tapco",
 "wpn_fps_upg_ak_fg_krebs",
 "wpn_fps_upg_ak_fg_trax",
 "wpn_fps_upg_fg_midwest"
})
table.list_append(self.wpn_fps_smg_x_416.uses_parts, {
 "wpn_fps_upg_m4_s_standard",
 "wpn_fps_m4_uupg_fg_rail",
 "wpn_fps_m4_uupg_fg_lr300",
 "wpn_fps_upg_fg_jp",
 "wpn_fps_upg_fg_smr",
 "wpn_fps_upg_ass_m4_fg_moe",
 "wpn_fps_upg_ass_m4_fg_lvoa",
 "wpn_fps_upg_ass_m4_upper_reciever_ballos",
 "wpn_fps_upg_ass_m4_upper_reciever_core",
 "wpn_fps_upg_ass_m4_lower_reciever_core",
 "wpn_fps_m4_upper_reciever_edge",
 "wpn_fps_m4_uupg_draghandle_ballos",
 "wpn_fps_m4_uupg_draghandle_core"
})
table.list_append(self.wpn_fps_ass_x_amcar.uses_parts, {
 "wpn_fps_m4_uupg_s_fold",
 "wpn_fps_upg_ass_m4_upper_reciever_ballos",
 "wpn_fps_upg_ass_m4_upper_reciever_core",
 "wpn_fps_upg_ass_m4_lower_reciever_core",
 "wpn_fps_m4_upper_reciever_edge",
 "wpn_fps_m4_uupg_fg_rail",
 "wpn_fps_m4_uupg_fg_lr300",
 "wpn_fps_upg_fg_jp",
 "wpn_fps_upg_fg_smr",
 "wpn_fps_upg_ass_m4_fg_moe",
 "wpn_fps_upg_ass_m4_fg_lvoa",
 "wpn_fps_smg_olympic_s_short",
 "wpn_fps_m4_upg_b_long",
 "wpn_fps_m4_upg_b_short",
 "wpn_fps_m4_upg_b_sd",
 "wpn_fps_m16_fg_railed",
 "wpn_fps_m16_fg_vietnam",
 "wpn_fps_upg_ass_m16_fg_stag"
})

local no_stock = {
		"wpn_fps_ass_74",
		"wpn_fps_ass_ak5",
		"wpn_fps_ass_akm",
		"wpn_fps_ass_akm_gold",
		"wpn_fps_ass_asval",
		"wpn_fps_ass_fal",
		"wpn_fps_ass_flint",
		"wpn_fps_ass_g36",
		"wpn_fps_ass_galil",
		"wpn_fps_ass_s552",
		"wpn_fps_ass_scar",
		"wpn_fps_lmg_rpk",
		"wpn_fps_shot_saiga",
		"wpn_fps_sho_sko12",
		"wpn_fps_smg_akmsu",
		"wpn_fps_smg_coal",
		"wpn_fps_smg_cobray",
		"wpn_fps_smg_hajk",
		"wpn_fps_smg_mac10",
		"wpn_fps_smg_mp7",
		"wpn_fps_smg_mp9",
		"wpn_fps_smg_polymer",
		"wpn_fps_smg_schakal",
		"wpn_fps_smg_sr2",
		"wpn_fps_smg_uzi",
		"wpn_fps_smg_x_coal",
		"wpn_fps_smg_x_cobray",
		"wpn_fps_smg_x_erma",
		"wpn_fps_smg_x_hajk",
		"wpn_fps_smg_x_m45",
		"wpn_fps_smg_x_mac10",
		"wpn_fps_smg_x_mp7",
		"wpn_fps_smg_x_mp9",
		"wpn_fps_smg_x_polymer",
		"wpn_fps_smg_x_schakal",
		"wpn_fps_smg_x_sr2",
		"wpn_fps_smg_x_uzi",
		"wpn_fps_lmg_m249",
		"wpn_fps_lmg_par",
		"wpn_fps_sho_sko12",
		"wpn_fps_snp_contender",
		-- custom
	"wpn_fps_ass_x_g36",
	"wpn_fps_ass_x_s552"

}
for i, weapon_id in ipairs(no_stock) do
table.list_append(self[weapon_id].uses_parts, { "wpn_fps_upg_s_none" })
end
local no_stock_1 = {
	"wpn_fps_ass_74",
	"wpn_fps_ass_ak5",
	"wpn_fps_ass_akm",
	"wpn_fps_ass_akm_gold",
	"wpn_fps_ass_asval",
	"wpn_fps_ass_flint",
	"wpn_fps_ass_galil",
	"wpn_fps_ass_s552",
	"wpn_fps_ass_scar",
	"wpn_fps_lmg_rpk",
	"wpn_fps_shot_saiga",
	"wpn_fps_smg_akmsu",
	"wpn_fps_smg_coal",
	"wpn_fps_smg_hajk",
	"wpn_fps_smg_polymer",
	"wpn_fps_smg_schakal",
	"wpn_fps_smg_x_akmsu",
	"wpn_fps_smg_x_coal",
	"wpn_fps_smg_x_hajk",
	-- custom
	"wpn_fps_ass_x_s552"
}
for i, weapon_id in ipairs(no_stock_1) do
self[weapon_id].override.wpn_fps_upg_s_none = {stats = {concealment = 3, recoil = -3, spread = -2}}
end
local no_stock_2 = {
	"wpn_fps_smg_mac10",
	"wpn_fps_smg_mp7",
	"wpn_fps_smg_mp9",
	"wpn_fps_smg_sr2",
	"wpn_fps_smg_x_erma",
	"wpn_fps_smg_x_m45",
	"wpn_fps_smg_x_mac10",
	"wpn_fps_smg_x_mp7",
	"wpn_fps_smg_x_mp9",
	"wpn_fps_smg_x_polymer",
	"wpn_fps_smg_x_schakal",
	"wpn_fps_smg_x_sr2",
	"wpn_fps_smg_x_uzi"
}
for i, weapon_id in ipairs(no_stock_2) do
self[weapon_id].override.wpn_fps_upg_s_none = {stats = {concealment = 1, recoil = -2, spread = 0}}
end
local no_stock_3 = {
	"wpn_fps_ass_g36",
	"wpn_fps_smg_cobray",
	"wpn_fps_smg_x_cobray",
	-- custom
	"wpn_fps_ass_x_g36"
}
for i, weapon_id in ipairs(no_stock_3) do
self[weapon_id].override.wpn_fps_upg_s_none = {stats = {concealment = 3, recoil = -2, spread = 0}}
end
self.wpn_fps_smg_uzi.override.wpn_fps_upg_s_none = {stats = {concealment = 5, recoil = -3, spread = -2}}
self.wpn_fps_ass_fal.override.wpn_fps_upg_s_none = {stats = {concealment = 6, recoil = -3, spread = -2}}
self.wpn_fps_sho_sko12.override.wpn_fps_upg_s_none = {unit = "units/pd2_dlc_pxp2/weapons/wpn_fps_sho_sko12_pts/wpn_fps_sho_sko12_s_adapter_short"}
self.wpn_fps_ass_g36.adds.wpn_fps_upg_s_none = {"wpn_fps_ass_g36_body_standard", "wpn_fps_ass_g36_g_standard"}
local no_sight = {
	"wpn_fps_ass_amcar",
	"wpn_fps_ass_contraband",
	"wpn_fps_ass_vhs",
	"wpn_fps_ass_flint",
	"wpn_fps_ass_l85a2",
	"wpn_fps_ass_m16",
	"wpn_fps_ass_m4",
	"wpn_fps_ass_scar",
	"wpn_fps_ass_tecci",
	"wpn_fps_sho_aa12",
	"wpn_fps_sho_basset",
	"wpn_fps_sho_ksg",
	"wpn_fps_sho_rota",
	"wpn_fps_sho_sko12",
	"wpn_fps_sho_x_basset",
	"wpn_fps_sho_x_rota",
	"wpn_fps_smg_hajk",
	"wpn_fps_smg_olympic",
	"wpn_fps_smg_polymer",
	"wpn_fps_smg_x_hajk",
	"wpn_fps_smg_x_olympic",
	"wpn_fps_smg_x_polymer",
	"wpn_fps_smg_shepheard",
	"wpn_fps_smg_x_shepheard",
	"wpn_fps_ass_komodo",
	"wpn_fps_ass_shak12",
	-- custom
	"wpn_fps_ass_x_amcar"
}
for i, weapon_id in ipairs(no_sight) do
table.list_append(self[weapon_id].uses_parts, { "wpn_fps_ass_l85a2_o_none" })
end

-- Vertical Grips
local vg_flat = {
	"wpn_fps_ass_74",
	"wpn_fps_ass_ak5",
	"wpn_fps_ass_akm",
	"wpn_fps_ass_akm_gold",
	"wpn_fps_ass_famas",
	"wpn_fps_ass_g3",
	"wpn_fps_ass_g36",
	"wpn_fps_ass_komodo",
	"wpn_fps_ass_m16",
	"wpn_fps_ass_m4",
	"wpn_fps_ass_s552",
	"wpn_fps_ass_scar",
	"wpn_fps_ass_vhs",
	"wpn_fps_sho_x_rota",
	"wpn_fps_shot_saiga",
	"wpn_fps_smg_akmsu",
	"wpn_fps_smg_mp5",
	"wpn_fps_smg_olympic",
	"wpn_fps_smg_shepheard",
	"wpn_fps_smg_x_akmsu",
	"wpn_fps_smg_x_hajk",
	"wpn_fps_smg_x_mp5",
	"wpn_fps_smg_x_mp7",
	"wpn_fps_smg_x_mp9",
	"wpn_fps_smg_x_olympic",
	"wpn_fps_smg_x_schakal",
	"wpn_fps_smg_x_shepheard",
	"wpn_fps_smg_x_sr2",
	"wpn_fps_smg_x_uzi",
	"wpn_fps_snp_desertfox",
	"wpn_fps_snp_tti",
	-- custom
	"wpn_fps_ass_x_ak74",
	"wpn_fps_ass_x_akm",
	"wpn_fps_ass_x_akm_gold",
	"wpn_fps_ass_x_amcar",
	"wpn_fps_ass_x_g36",
	"wpn_fps_ass_x_s552"
}
for i, weapon_id in ipairs(vg_flat) do
	table.list_append(self[weapon_id].uses_parts, {
		"wpn_fps_upg_vg_afg",
		"wpn_fps_upg_vg_cobra"
	})
end

end)