Hooks:PostHook(WeaponFactoryTweakData, "init", "EACInit", function(self)
--AMCAR Preparation
table.insert(self.wpn_fps_ass_amcar.default_blueprint, "wpn_fps_m4_uupg_draghandle")
table.insert(self.wpn_fps_ass_amcar.default_blueprint, "wpn_fps_m4_upper_reciever_round")
table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_m4_uupg_draghandle")
table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_m4_upper_reciever_round")
self.parts.wpn_fps_amcar_uupg_body_upperreciever.override = {
	wpn_fps_m4_uupg_draghandle = {unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"},
	wpn_fps_m4_upper_reciever_round = {unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"}
}
self.parts.wpn_fps_amcar_uupg_body_upperreciever.forbids = {}
self.parts.wpn_fps_uupg_fg_radian.forbids = {}
for i, upg_id in ipairs(self.wpn_fps_ass_m4.uses_parts) do
	if self.parts[upg_id].type == "upper_reciever" and self.parts[upg_id].pcs then
		self.parts[upg_id].override.wpn_fps_amcar_uupg_body_upperreciever = {
			unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_ass_m16_o_handle_sight",
			a_obj = "a_o",
			override = {}
		}
	end
	if self.parts[upg_id].type == "sight" then
		table.insert(self.wpn_fps_shot_m37.uses_parts, upg_id)
		self.wpn_fps_ass_amcar.adds[upg_id] = {"wpn_fps_m4_uupg_fg_rail_ext"}
	end
	if self.parts[upg_id].type == "second_sight" and self.parts[upg_id].stats.gadget_zoom and self.parts[upg_id].stats.gadget_zoom == 9 then
		table.insert(self.parts.wpn_fps_amcar_uupg_body_upperreciever.forbids, upg_id)
	end
	if self.parts[upg_id].type == "foregrip" and self.parts[upg_id].pcs then
		if not self.parts[upg_id].forbids then self.parts[upg_id].forbids = {} end
		table.insert(self.parts[upg_id].forbids, "wpn_fps_m4_uupg_fg_rail_ext")
	end
end

self.wpn_fps_ass_amcar.override.wpn_fps_m4_upg_b_sd = {a_obj = "a_b_sd"}
self.wpn_fps_smg_x_olympic.override.wpn_fps_m4_upg_b_sd = {a_obj = "a_b_sd"}
self.wpn_fps_smg_olympic.override.wpn_fps_m4_upg_b_sd = {a_obj = "a_b_sd"}
-- Misc AK stuff
self.wpn_fps_smg_x_akmsu.stock_adapter = "wpn_upg_ak_s_adapter"
self.wpn_fps_smg_coal.stock_adapter = "wpn_upg_ak_s_adapter"
self.wpn_fps_smg_x_coal.stock_adapter = "wpn_upg_ak_s_adapter"
self.wpn_fps_ass_galil.stock_adapter = "wpn_upg_ak_s_adapter"
self.wpn_fps_smg_vityaz.stock_adapter = "wpn_upg_ak_s_adapter"
self.wpn_fps_smg_x_vityaz.stock_adapter = "wpn_upg_ak_s_adapter"
self.wpn_fps_ass_74.override.wpn_fps_lmg_rpk_fg_standard = {adds = {}}
self.wpn_fps_ass_akm.override.wpn_fps_lmg_rpk_fg_standard = {adds = {}}
self.wpn_fps_ass_akm_gold.override.wpn_fps_lmg_rpk_fg_standard = {adds = {}}
-- AK STOCKS
self.parts.wpn_upg_ak_s_psl.forbids = {}
self.parts.wpn_upg_ak_s_psl.override = {
	wpn_upg_ak_g_standard = {unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"},
	wpn_fps_ass_flint_g_standard = {unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"},
	wpn_fps_smg_coal_g_standard = {unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"},
	wpn_fps_ass_galil_g_standard = {unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"},
	wpn_fps_upg_galil_g_standard = {unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"},
	wpn_fps_smg_vityaz_g_standard = {unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"}
}
local m4_stocks = {}
local ak_grips = {}
for i, part_id in ipairs(self.wpn_fps_ass_74.uses_parts) do
	if self.parts[part_id].adds and table.contains(self.parts[part_id].adds, "wpn_upg_ak_g_standard") then
	-- log(tostring(part_id) .. " tried to add the default AK grip.")
		table.remove(self.parts[part_id].adds, 1)
	end
	if self.parts[part_id].type == "grip" and part_id ~= "wpn_upg_ak_g_standard" then
		-- log(tostring(part_id) .. " is incompatible with the Wooden Sniper Stock.")
		if not self.parts[part_id].forbids then self.parts[part_id].forbids = {} end
		self.parts[part_id].forbids = {}
		table.insert(self.parts.wpn_upg_ak_s_psl.forbids, part_id)
		table.insert(ak_grips, part_id)
	end
	if self.parts[part_id].type == "stock" and self.parts[part_id].pcs and self.parts[part_id].adds_type then
		table.insert(m4_stocks, part_id)
	end
end
	self.wpn_fps_ass_74.adds.wpn_fps_upg_ak_s_zenitco = {}
	self.wpn_fps_ass_akm.adds.wpn_fps_upg_ak_s_zenitco = {}
	self.wpn_fps_ass_akm_gold.adds.wpn_fps_upg_ak_s_zenitco = {}
	self.wpn_fps_smg_akmsu.adds.wpn_fps_upg_ak_s_zenitco = {}
	self.wpn_fps_shot_saiga.adds.wpn_fps_upg_ak_s_zenitco = {}
	self.parts.wpn_upg_ak_s_adapter.adds = {}
	self.parts.wpn_upg_ak_s_folding.adds = {}
	self.parts.wpn_upg_ak_s_folding_vanilla_gold.adds = {}
	self.parts.wpn_upg_ak_s_folding_vanilla.adds = {}
	self.parts.wpn_upg_ak_s_skfoldable.adds = {}
	self.parts.wpn_upg_ak_s_skfoldable_vanilla.adds = {}
table.insert(self.wpn_fps_ass_74.default_blueprint, "wpn_upg_ak_g_standard")

self.parts.wpn_fps_upg_ak_s_zenitco.forbids = {}
self.parts.wpn_fps_upg_ak_fg_zenitco.forbids = {}
self.parts.wpn_fps_upg_ak_ns_zenitco.forbids = {}
self.parts.wpn_fps_upg_ak_dh_zenitco.forbids = {}
self.parts.wpn_fps_upg_ak_body_upperreceiver_zenitco.forbids = {}
-- AK12
self.parts.wpn_fps_snp_flint_s_adapter.unit = "units/mods/weapons/wpn_fps_ass_flint_s_adapter/wpn_fps_ass_flint_s_adapter"
self.parts.wpn_fps_ass_flint_s_standard.adds = {"wpn_fps_snp_flint_s_adapter"}
-- Galil
-- self.parts.wpn_fps_ass_galil_g_sniper.stats = {spread = 2, concealment = -2, recoil = 0}
for i, grips in ipairs(ak_grips) do
self.wpn_fps_ass_galil.override[grips] = {a_obj = "a_g_ak"}
end
-- Gen 21
for i, stocks in pairs(self.wpn_fps_smg_vityaz.uses_parts) do
	if self.parts[stocks].type == "stock" and not (stocks == "wpn_fps_smg_vityaz_s_standard" or stocks == "wpn_fps_smg_vityaz_s_short") then
		self.wpn_fps_smg_vityaz.override[stocks] = { a_obj = "a_s_2" }
		self.wpn_fps_smg_x_vityaz.override[stocks] = { a_obj = "a_s_2" }
	end
end
self.wpn_fps_smg_vityaz.override.wpn_upg_ak_s_adapter = { a_obj = "a_s_2" }
self.wpn_fps_smg_x_vityaz.override.wpn_upg_ak_s_adapter = { a_obj = "a_s_2" }


self.wpn_fps_smg_hajk.stock_adapter = "wpn_fps_upg_m4_s_adapter"
self.wpn_fps_smg_x_hajk.stock_adapter = "wpn_fps_upg_m4_s_adapter"
self.wpn_fps_ass_contraband.stock_adapter = "wpn_fps_upg_m4_s_adapter"
self.wpn_fps_smg_x_cobray.stock_adapter = "wpn_fps_smg_cobray_s_m4adapter"
self.wpn_fps_smg_thompson.stock_adapter = "wpn_fps_smg_cobray_s_m4adapter"
self.wpn_fps_smg_x_m1928.stock_adapter = "wpn_fps_smg_cobray_s_m4adapter"
self.wpn_fps_smg_mac10.stock_adapter = "wpn_fps_smg_cobray_s_m4adapter"
self.wpn_fps_smg_x_mac10.stock_adapter = "wpn_fps_smg_cobray_s_m4adapter"
self.wpn_fps_smg_x_polymer.stock_adapter = "wpn_fps_smg_polymer_s_adapter"
self.wpn_fps_smg_x_shepheard.stock_adapter = "wpn_fps_smg_shepheard_s_adapter"
self.wpn_fps_sho_m590.stock_adapter = "wpn_fps_upg_m590_s_adapter"
self.wpn_fps_sho_x_sko12.stock_adapter = "wpn_fps_sho_sko12_s_adapter"
local st_ad_added = {
"wpn_fps_smg_thompson",
"wpn_fps_smg_x_m1928",
"wpn_fps_smg_mac10",
"wpn_fps_smg_x_mac10",
"wpn_fps_sho_m590"
}
for s, wpn_id in ipairs(st_ad_added) do
	for t, stocks in ipairs(m4_stocks) do
		self[wpn_id].override[stocks] = { a_obj = "a_s_2" }
	end
end
--ASVAL
table.insert(self.wpn_fps_ass_asval.default_blueprint, "wpn_fps_ass_asval_g_standard")
self.parts.wpn_fps_ass_asval_s_solid.forbids = {}
self.parts.wpn_fps_ass_asval_s_solid.override = {wpn_fps_ass_asval_g_standard = {unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"}}
self.parts.wpn_fps_ass_asval_s_standard.adds = {}
self.wpn_fps_ass_asval.stock_adapter = "wpn_upg_ak_s_adapter"
self.wpn_fps_ass_asval.override = {
	wpn_upg_ak_s_folding = { 
		stats = {
			value = 3,
			spread = 0,
			spread_moving = 0,
			recoil = -4,
			concealment = 2
		}
	},
	wpn_fps_upg_ak_s_solidstock = { 
		stats = {
			value = 1,
			recoil = 3,
			concealment = -4,
			spread = 1
		}
	},	
	wpn_upg_ak_s_skfoldable = { 
		stats = {
			value = 3,
			spread_moving = 2,
			recoil = -2,
			spread = -1,
			concealment = 1
		}
	}
}
-- RPK barrels
self.parts.wpn_fps_upg_rpk_b_ak105.stats = {
		damage = -5,
		recoil = -2,
		spread = -2,
		concealment = 4
	}
self.parts.wpn_fps_upg_rpk_b_ak105.forbids = {"wpn_fps_upg_bp_lmg_lionbipod"}
if not self.parts.wpn_fps_upg_rpk_b_ak105.override then self.parts.wpn_fps_upg_rpk_b_ak105.override = {} end
self.parts.wpn_fps_upg_rpk_b_ak105.override.wpn_fps_ak_extra_ris = {a_obj = "a_fl_eac"}
self.parts.wpn_fps_upg_rpk_b_ak105.override.wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_eac"}
self.parts.wpn_fps_upg_rpk_b_ak105.override.wpn_fps_upg_fl_ass_smg_sho_surefire = {a_obj = "a_fl_eac"}
self.parts.wpn_fps_upg_rpk_b_ak105.override.wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_eac"}
self.parts.wpn_fps_upg_rpk_b_ak105.override.wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_eac"}
self.parts.wpn_fps_upg_rpk_b_ak105.override.wpn_fps_upg_fl_ass_utg = {a_obj = "a_fl_eac"}

self.parts.wpn_fps_upg_rpk_b_zastava.stats = {
		damage = 0,
		recoil = 1,
		spread = 1,
		concealment = -1
	}
self.parts.wpn_fps_upg_rpk_b_zastava.override = {
		wpn_fps_ak_extra_ris = {a_obj = "a_fl_eac"},
		wpn_fps_upg_fl_ass_smg_sho_peqbox = {a_obj = "a_fl_eac"},
		wpn_fps_upg_fl_ass_smg_sho_surefire = {a_obj = "a_fl_eac"},
		wpn_fps_upg_fl_ass_peq15 = {a_obj = "a_fl_eac"},
		wpn_fps_upg_fl_ass_laser = {a_obj = "a_fl_eac"},
		wpn_fps_upg_fl_ass_utg = {a_obj = "a_fl_eac"}
}
self.parts.wpn_fps_upg_rpk_b_zastava.forbids = {"wpn_fps_upg_bp_lmg_lionbipod"}
-- Bronco Silencers
self.wpn_fps_pis_rage.override.wpn_fps_upg_ns_ass_filter = { 
	stats = {
		value = 0,
		suppression = 15,
		alert_size = 12,
		damage = -33,
		spread = -1,
		spread_moving = -2,
		concealment = -3
	},
	sound_switch = {
		suppressed = "suppressed_c"
	}
}	
self.wpn_fps_pis_rage.override.wpn_fps_upg_ns_pis_jungle = { 
	stats = {
		value = 5,
		suppression = 15,
		alert_size = 12,
		damage = -30,
		spread = 1,
		recoil = 2,
		concealment = -5
	},
	sound_switch = {
		suppressed = "suppressed_c"
	}
}
self.wpn_fps_pis_rage.override.wpn_fps_upg_ns_pis_medium_gem = { 
	stats = {
		value = 4,
		suppression = 15,
		alert_size = 12,
		recoil = 1,
		spread = 0,
		concealment = -1,
		damage = -33
	},
	sound_switch = {
		suppressed = "suppressed_c"
	}
}
self.wpn_fps_pis_rage.override.wpn_fps_upg_ns_pis_large_kac = { 
	stats = {
		value = 6,
		suppression = 15,
		alert_size = 12,
		recoil = -2,
		spread = 1,
		concealment = -2,
		damage = -31
	},
	sound_switch = {
		suppressed = "suppressed_c"
	}
}
self.wpn_fps_pis_rage.override.wpn_fps_upg_ns_pis_small = { 
	stats = {
		value = 3,
		suppression = 15,
		alert_size = 12,
		damage = -34,
		recoil = 0,
		spread_moving = -1,
		concealment = 0
	},
	sound_switch = {
		suppressed = "suppressed_c"
	}
}
self.wpn_fps_pis_rage.override.wpn_fps_upg_ns_pis_medium = { 
	stats = {
		value = 1,
		suppression = 15,
		alert_size = 12,
		damage = -32,
		recoil = 1,
		spread_moving = -2,
		concealment = -2
	},
	sound_switch = {
		suppressed = "suppressed_c"
	}
}
self.wpn_fps_pis_rage.override.wpn_fps_upg_ns_pis_large = { 
	stats = {
		value = 5,
		suppression = 15,
		alert_size = 12,
		damage = -31,
		recoil = 2,
		spread_moving = -2,
		concealment = -3
	},
	sound_switch = {
		suppressed = "suppressed_c"
	}
}
self.wpn_fps_pis_rage.override.wpn_fps_upg_ns_pis_medium_slim = { 
	stats = {
		value = 1,
		suppression = 15,
		alert_size = 12,
		spread = -2,
		recoil = -1,
		spread_moving = 2,
		damage = -30,
		concealment = -2
	},
	sound_switch = {
		suppressed = "suppressed_c"
	}
}

self.parts.wpn_fps_ass_m14_sniper_kit.override_weapon = {
		categories = { "snp" }
	}

-- Drum Mags
self.parts.wpn_fps_smg_mp5_m_drum.stats = {
	value = 5,
	extra_ammo = 10,
	spread = -1,
	recoil = 1,
	concealment = -3
}
self.wpn_fps_smg_x_mp5.override.wpn_fps_smg_mp5_m_drum = {
		stats = {
			value = 4,
			extra_ammo = 20,
			spread_moving = 1,
			recoil = 1,
			spread = -1,
			concealment = -3
		}
	}
self.wpn_fps_smg_x_mp5.override.wpn_fps_upg_mp5_m_drum = {
		stats = {
			value = 4,
			extra_ammo = 20,
			spread_moving = 1,
			recoil = 1,
			spread = -1,
			concealment = -3
		}
	}
self.parts.wpn_upg_ak_m_drum.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_lmg_rpk_pts/wpn_lmg_rpk_m_drum"
self.parts.wpn_upg_ak_m_drum.stats = {
	value = 5,
	extra_ammo = 35,
	spread = -2,
	recoil = -2,
	concealment = -4
}
self.wpn_fps_smg_x_akmsu.override.wpn_upg_ak_m_drum = {
		stats = {
			value = 4,
			extra_ammo = 45,
			spread_moving = 1,
			recoil = 1,
			spread = -1,
			concealment = -3
		}
	}
self.wpn_fps_smg_x_akmsu.override.wpn_fps_upg_ak_m_drum = {
		stats = {
			value = 4,
			extra_ammo = 50,
			spread_moving = 1,
			recoil = 1,
			spread = -1,
			concealment = -3
		}
	}
self.parts.wpn_fps_upg_m4_m_drum.unit = "units/pd2_dlc_opera/weapons/wpn_fps_ass_tecci_pts/wpn_fps_ass_tecci_m_drum"
self.parts.wpn_fps_upg_m4_m_drum.stats = {
			extra_ammo = 35,
			value = 9,
			concealment = -5
}
self.parts.wpn_fps_upg_m4_m_drum.bullet_objects = {
			amount = 100,
			prefix = "g_bullet_"
		}
self.wpn_fps_smg_x_olympic.override.wpn_fps_upg_m4_m_drum = {stats = {
			extra_ammo = 50,
			value = 9,
			concealment = -5
}}
self.wpn_fps_ass_amcar.override.wpn_fps_upg_m4_m_drum = {stats = {
			extra_ammo = 40,
			value = 9,
			concealment = -5
}}
self.wpn_fps_smg_x_olympic.override.wpn_fps_ass_upg_m4_m_drum = {stats = {
			extra_ammo = 50,
			value = 9,
			concealment = -5
}}
self.wpn_fps_ass_amcar.override.wpn_fps_ass_upg_m4_m_drum = {stats = {
			extra_ammo = 40,
			value = 9,
			concealment = -5
}}
-- G3
self.wpn_fps_ass_g3.adds.wpn_fps_upg_o_leupold = {"wpn_fps_ass_g3_body_rail"}
self.wpn_fps_ass_g3.adds.wpn_fps_upg_o_45iron  = {"wpn_fps_ass_g3_body_rail"}
self.wpn_fps_ass_g3.override.wpn_fps_smg_mp5_s_adjust = { stats = { value = 3, spread = -1, recoil = -2, concealment = 2}}
self.wpn_fps_ass_g3.override.wpn_fps_upg_o_leupold = { stance_mod = { wpn_fps_ass_g3 = { translation = Vector3(0.0275, -31.1, -4.31)}}}	
self.wpn_fps_ass_g3.override.wpn_fps_upg_o_45iron = { stance_mod = { wpn_fps_ass_g3 = {	translation = Vector3(-0.7, 8, -12.4), rotation = Rotation(0, 0, -45)}}}
self.parts.wpn_fps_ass_g3_sniper_kit.perks = {"fire_mode_single"}
self.parts.wpn_fps_ass_g3_sniper_kit.forbids = {"wpn_fps_ass_g3_b_sniper", "wpn_fps_ass_g3_b_short"}
self.parts.wpn_fps_ass_g3_b_sniper.forbids = {"wpn_fps_ass_g3_sniper_kit"}
table.insert(self.parts.wpn_fps_ass_g3_b_short.forbids, "wpn_fps_ass_g3_sniper_kit")
-- Tecci
self.parts.wpn_fps_snp_tti_body_standard.type = "lower_reciever"
self.parts.wpn_fps_snp_victor_body_receiver_lower.type = "lower_reciever"
self.wpn_fps_ass_tecci.adds.wpn_fps_m4_upper_reciever_edge           = {"wpn_fps_ass_g3_body_rail"}
self.wpn_fps_ass_tecci.adds.wpn_fps_upg_ass_m4_upper_reciever_core   = {"wpn_fps_ass_g3_body_rail"}	
self.wpn_fps_ass_tecci.adds.wpn_fps_upg_ass_m4_upper_reciever_ballos = {"wpn_fps_ass_g3_body_rail"}
self.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.override.wpn_fps_ass_tecci_dh_standard = {unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_m4_uupg_draghandle_ballos/wpn_fps_m4_uupg_draghandle_ballos"}
self.parts.wpn_fps_upg_ass_m4_upper_reciever_core.override.wpn_fps_ass_tecci_dh_standard = {unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_m4_uupg_draghandle_core/wpn_fps_m4_uupg_draghandle_core"}
-- M4 FGs
local smol_bd = {
"wpn_fps_m16_fg_vietnam",
"wpn_fps_upg_ass_m16_fg_stag",
"wpn_fps_upg_fg_smr",
"wpn_fps_uupg_fg_radian"
}
for i, fg in ipairs(smol_bd) do
if not self.parts[fg].override then self.parts[fg].override = {} end
self.parts[fg].override.wpn_fps_m4_upg_b_sd = {
		third_unit = "units/pd2_dlc_gage_jobs/weapons/wpn_third_upg_fg_smr/wpn_third_m4_upg_b_sd_smr",
		unit = "units/pd2_dlc_gage_jobs/weapons/wpn_fps_upg_fg_smr/wpn_fps_m4_upg_b_sd_smr"
	}
end
-- Iron Sights
self.parts.wpn_fps_upg_o_iron.stance_mod = {
	wpn_fps_sho_boot = {
		translation = Vector3(0, -5, -1.5)
	},
	wpn_fps_shot_r870 = {
		translation = Vector3(0.01, -13, -0.96)
	},
	wpn_fps_shot_serbu = {
		translation = Vector3(0, -13, -0.96)
	},
	wpn_fps_shot_m37 = {
		translation = Vector3(0, 0, -1.2)
	},	
	wpn_fps_snp_msr = {
		translation = Vector3(0.09, -10, -1.75)
	},
	wpn_fps_snp_winchester = {
		translation = Vector3(-0.08, 0, -0.65)
	}
}
self.parts.wpn_fps_upg_o_iron.forbids = {"wpn_fps_sho_boot_b_short"}
self.wpn_fps_snp_msr.override.wpn_fps_upg_o_iron = {
	stats = {recoil = -2, concealment = 2},
	a_obj = "a_o_eac"
}
self.parts.wpn_fps_ass_amcar_o_flipup.stance_mod = {
	wpn_fps_ass_amcar = {
		translation = Vector3(0, 0, 0.58)
	},
	wpn_fps_ass_m16 = {
		translation = Vector3(0, 0, 0.58)
	},
	wpn_fps_ass_contraband = {
		translation = Vector3(0, 0, -1)			
	},
	wpn_fps_snp_tti = {
		translation = Vector3(0, 0, 0.5)			
	}
}
self.parts.wpn_fps_ass_amcar_o_flipup.forbids = {"wpn_fps_upg_o_xpsg33_magnifier"}
self.parts.wpn_fps_upg_ass_m4_fg_moe.override.wpn_fps_ass_amcar_o_flipup = {
	third_unit = "units/payday2/weapons/wpn_third_ass_m4_pts/wpn_third_m4_uupg_o_flipup_emo",
	unit = "units/payday2/weapons/wpn_fps_ass_m4_pts/wpn_fps_m4_uupg_o_flipup_emo"
}
-- Contender
table.insert(self.wpn_fps_snp_contender.default_blueprint, "wpn_fps_upg_m4_s_standard_vanilla")
self.parts.wpn_fps_upg_m4_g_contender.adds = {}
self.parts.wpn_fps_snp_contender_grip_standard.override = {wpn_fps_upg_m4_s_standard_vanilla = {unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"}}
table.remove(self.parts.wpn_fps_snp_contender_grip_standard.forbids, 2)
for i, st_id in ipairs(self.wpn_fps_snp_contender.uses_parts) do
	if self.parts[st_id].type == "stock" and not table.contains(self.parts.wpn_fps_snp_contender_grip_standard.forbids, st_id) then
		table.insert(self.parts.wpn_fps_snp_contender_grip_standard.forbids, st_id)
	end
end

-- Ammo Kits
self.parts.wpn_fps_ass_g3_b_short.custom_stats = {
		ammo_pickup_min_mul = 1.55,
		ammo_pickup_max_mul = 2.1
}
self.parts.wpn_fps_ass_scar_assault_kit.custom_stats = {
		ammo_pickup_min_mul = 1.65,
		ammo_pickup_max_mul = 2.4
}
self.parts.wpn_fps_ass_amcar_assault_kit.custom_stats = {
		ammo_pickup_min_mul = 0.9,
		ammo_pickup_max_mul = 0.9
}
self.parts.wpn_fps_ass_m16_assault_kit.custom_stats = {
		ammo_pickup_min_mul = 5,
		ammo_pickup_max_mul = 5
}
self.parts.wpn_fps_ass_akm_assault_kit.custom_stats = {
		ammo_pickup_min_mul = 5,
		ammo_pickup_max_mul = 5
}
self.parts.wpn_fps_ass_fal_assault_kit.custom_stats = {
		ammo_pickup_min_mul = 1.4,
		ammo_pickup_max_mul = 1.5
}
self.parts.wpn_fps_ass_flint_assault_kit.custom_stats = {
		ammo_pickup_min_mul = 3,
		ammo_pickup_max_mul = 2.5
}
self.parts.wpn_fps_ass_g3_sniper_kit.custom_stats = {			
	armor_piercing_add = 1,
	can_shoot_through_shield =  true,
	can_shoot_through_wall = true,
	can_shoot_through_enemy = true,
	ammo_pickup_min_mul = 2,
	ammo_pickup_max_mul = 0.85
}
self.parts.wpn_fps_ass_m14_sniper_kit.custom_stats = {			
	armor_piercing_add = 1,
	can_shoot_through_shield =  true,
	can_shoot_through_wall = true,
	can_shoot_through_enemy = true,
	ammo_pickup_min_mul = 2,
	ammo_pickup_max_mul = 1.2
}
self.parts.wpn_fps_ass_m14_sniper_kit.perks = {"fire_mode_single"}
self.parts.wpn_fps_ass_g36_sniper_kit.custom_stats = {			
	armor_piercing_add = 1,
	can_shoot_through_shield =  true,
	can_shoot_through_wall = true,
	can_shoot_through_enemy = true,
	ammo_pickup_min_mul = 0.3,
	ammo_pickup_max_mul = 0.2
}
self.parts.wpn_fps_ass_g36_sniper_kit.perks = {"fire_mode_single"}
self.wpn_fps_ass_famas.override.wpn_fps_ass_g36_sniper_kit = {
	custom_stats = {			
		armor_piercing_add = 1,
		can_shoot_through_shield =  true,
		can_shoot_through_wall = true,
		can_shoot_through_enemy = true,
		ammo_pickup_min_mul = 0.3,
		ammo_pickup_max_mul = 0.2,
		rof_mult = 0.5
	}
}
self.parts.wpn_fps_ass_contraband_assault_kit.custom_stats = {
		ammo_pickup_min_mul = 10,
		ammo_pickup_max_mul = 10
}
self.parts.wpn_fps_ass_sub2000_assault_kit.custom_stats = {
		ammo_pickup_min_mul = 2,
		ammo_pickup_max_mul = 3
}
-- Misc Overrides
self.wpn_fps_smg_x_mp5.override.wpn_fps_smg_mp5_s_adjust = {
		stats = {
			value = 4,
			spread_moving = 1,
			recoil = 1,
			spread = 2,
			concealment = -2
		}
	}
self.wpn_fps_smg_x_akmsu.override.wpn_upg_ak_s_skfoldable = {
		stats = {
			value = 3,
			spread_moving = 2,
			spread = 1,
			recoil = 1,
			concealment = -2
		}
	}
self.wpn_fps_smg_x_akmsu.override.wpn_upg_ak_s_folding = {
		stats = {
			value = 3,
			spread_moving = 2,
			recoil = 1,
			concealment = -2
		}
	}
self.wpn_fps_ass_amcar.override.wpn_fps_upg_m4_m_quad = {
		stats = {
			value = 3,
			spread_moving = -2,
			extra_ammo = 20,
			recoil = 1,
			concealment = -3,
			spread = -1
		}
	}
self.wpn_fps_ass_amcar.override.wpn_fps_upg_m4_m_pmag = {
		stats = {
			value = 3,
			spread_moving = 1,
			concealment = -2,
			extra_ammo = 7
		}
	}
self.wpn_fps_ass_amcar.override.wpn_fps_m4_uupg_m_std = {
		stats = {
			value = 1,
			extra_ammo = 5,
			concealment = -1
		}
	}
self.wpn_fps_ass_amcar.override.wpn_fps_ass_l85a2_m_emag = {
		stats = {
			value = 1,
			recoil = 1,
			concealment = -2,
			extra_ammo = 7
		}
	}
self.wpn_fps_ass_amcar.override.wpn_fps_upg_m4_m_l5 = {
		stats = {
			value = 1,
			extra_ammo = 7,
			concealment = -2,
			recoil = 1
		}
	}

self.wpn_fps_smg_olympic.override.wpn_fps_upg_m4_m_quad = {
		stats = {
			value = 3,
			spread_moving = -2,
			extra_ammo = 20,
			recoil = 1,
			concealment = -3,
			spread = -1
		}
	}
self.wpn_fps_smg_olympic.override.wpn_fps_upg_m4_m_pmag = {
		stats = {
			value = 3,
			spread_moving = 1,
			concealment = -2,
			extra_ammo = 7
		}
	}
self.wpn_fps_smg_olympic.override.wpn_fps_m4_uupg_m_std = {
		stats = {
			value = 1,
			extra_ammo = 5,
			concealment = -1
		}
	}
self.wpn_fps_smg_olympic.override.wpn_fps_ass_l85a2_m_emag = {
		stats = {
			value = 1,
			recoil = 1,
			concealment = -2,
			extra_ammo = 7
		}
	}
self.wpn_fps_smg_olympic.override.wpn_fps_upg_m4_m_l5 = {
		stats = {
			value = 1,
			extra_ammo = 7,
			concealment = -2,
			recoil = 1
		}
	}
self.parts.wpn_fps_saw_body_silent.perks = {"silencer"}
self.parts.wpn_fps_pis_g18c_co_1.stats = {
	concealment = -1,
	damage = 1,
	suppression = -5,
	value = 4,
	spread = 4,
	recoil = -2
}
self.parts.wpn_fps_upg_o_shortdot.name_id = "bm_wp_upg_o_shortdot"
self.wpn_fps_ass_sub2000.override.wpn_fps_addon_ris = {parent = "foregrip"}
self.parts.wpn_fps_upg_m4_m_l5.override = {
	wpn_fps_aug_m_pmag = { 
	unit = "units/pd2_dlc_akm4_modpack/weapons/wpn_fps_upg_m4_m_l5/wpn_fps_upg_m4_m_l5"
	}			
}
self.parts.wpn_fps_ass_l85a2_m_emag.override = {
	wpn_fps_aug_m_pmag = { 
		unit = "units/pd2_dlc_clover/weapons/wpn_fps_ass_l85a2_pts/wpn_fps_ass_l85a2_m_emag"
	}			
}
self.parts.wpn_upg_ak_fg_combo4.stats = {recoil = 1}
self.wpn_fps_ass_g36.override.wpn_fps_upg_o_leupold = {	stance_mod = { wpn_fps_ass_g36 = { translation = Vector3(0.0, -24, -3.76)}}}	
self.wpn_fps_ass_m14.override.wpn_fps_upg_o_leupold = { stance_mod = { wpn_fps_ass_m14 = { translation = Vector3(0.01, -36.3, -4.745)}}}
self.wpn_fps_ass_m14.override.wpn_fps_upg_o_45iron = { stance_mod = { wpn_fps_ass_m14 = { translation = Vector3(-2.05, 0, -13.85),rotation = Rotation(0.3, -0.3, -45)}}}	
self.parts.wpn_fps_upg_o_m14_scopemount.override.wpn_fps_upg_o_leupold = {a_obj = "a_o_sm", stance_mod = {wpn_fps_ass_m14 = {translation = Vector3(-0.03, -30, -6.07)}}}
self.wpn_fps_pis_g18c.override.wpn_fps_pis_g17_b_custom = {a_obj = "a_b_eac"}
self.wpn_fps_pis_g18c.override.wpn_fps_pis_g17_b_g22c = {a_obj = "a_b_eac"}
self.wpn_fps_pis_g18c.override.wpn_fps_pis_g17_b_long = {a_obj = "a_b_eac"}
self.wpn_fps_pis_x_g18c.override.wpn_fps_pis_g17_b_custom = {a_obj = "a_b_eac"}
self.wpn_fps_pis_x_g18c.override.wpn_fps_pis_g17_b_g22c = {a_obj = "a_b_eac"}
self.wpn_fps_pis_x_g18c.override.wpn_fps_pis_g17_b_long = {a_obj = "a_b_eac"}
self.wpn_fps_pis_shrew.override.wpn_fps_pis_1911_co_1 	= {parent = "barrel", a_obj = "a_ns"}
self.wpn_fps_pis_shrew.override.wpn_fps_pis_1911_co_2 	= {parent = "barrel", a_obj = "a_ns"}
self.wpn_fps_pis_x_shrew.override.wpn_fps_pis_1911_co_1 = {parent = "barrel", a_obj = "a_ns"}
self.wpn_fps_pis_x_shrew.override.wpn_fps_pis_1911_co_2 = {parent = "barrel", a_obj = "a_ns"}
self.wpn_fps_smg_x_m1928.override.wpn_fps_smg_thompson_stock_discrete = {stats = {recoil = 1, concealment = -1}}
self.wpn_fps_smg_thompson.override.wpn_fps_smg_cobray_s_m4adapter = { a_obj = "a_s_2" }
self.wpn_fps_smg_thompson.override.wpn_fps_upg_m4_s_standard      = { a_obj = "a_s_2" }
self.wpn_fps_smg_thompson.override.wpn_fps_upg_m4_s_pts           = { a_obj = "a_s_2" }
self.wpn_fps_smg_thompson.override.wpn_fps_upg_m4_s_crane         = { a_obj = "a_s_2" }
self.wpn_fps_smg_thompson.override.wpn_fps_upg_m4_s_mk46          = { a_obj = "a_s_2" }
self.wpn_fps_smg_thompson.override.wpn_fps_upg_m4_s_ubr           = { a_obj = "a_s_2" }
self.wpn_fps_smg_thompson.override.wpn_fps_snp_tti_s_vltor        = { a_obj = "a_s_2" }
self.wpn_fps_smg_x_m1928.override.wpn_fps_smg_cobray_s_m4adapter = { a_obj = "a_s_2" }
self.wpn_fps_smg_x_m1928.override.wpn_fps_upg_m4_s_standard      = { a_obj = "a_s_2" }
self.wpn_fps_smg_x_m1928.override.wpn_fps_upg_m4_s_pts           = { a_obj = "a_s_2" }
self.wpn_fps_smg_x_m1928.override.wpn_fps_upg_m4_s_crane         = { a_obj = "a_s_2" }
self.wpn_fps_smg_x_m1928.override.wpn_fps_upg_m4_s_mk46          = { a_obj = "a_s_2" }
self.wpn_fps_smg_x_m1928.override.wpn_fps_upg_m4_s_ubr           = { a_obj = "a_s_2" }
self.wpn_fps_smg_x_m1928.override.wpn_fps_snp_tti_s_vltor        = { a_obj = "a_s_2" }
self.wpn_fps_smg_mac10.override.wpn_fps_smg_cobray_s_m4adapter = { a_obj = "a_s_2" }
self.wpn_fps_smg_mac10.override.wpn_fps_upg_m4_s_standard      = { a_obj = "a_s_2" }
self.wpn_fps_smg_mac10.override.wpn_fps_upg_m4_s_pts           = { a_obj = "a_s_2" }
self.wpn_fps_smg_mac10.override.wpn_fps_upg_m4_s_crane         = { a_obj = "a_s_2" }
self.wpn_fps_smg_mac10.override.wpn_fps_upg_m4_s_mk46          = { a_obj = "a_s_2" }
self.wpn_fps_smg_mac10.override.wpn_fps_upg_m4_s_ubr           = { a_obj = "a_s_2" }
self.wpn_fps_smg_mac10.override.wpn_fps_snp_tti_s_vltor        = { a_obj = "a_s_2" }
self.wpn_fps_smg_x_mac10.override.wpn_fps_smg_cobray_s_m4adapter = { a_obj = "a_s_2" }
self.wpn_fps_smg_x_mac10.override.wpn_fps_upg_m4_s_standard      = { a_obj = "a_s_2" }
self.wpn_fps_smg_x_mac10.override.wpn_fps_upg_m4_s_pts           = { a_obj = "a_s_2" }
self.wpn_fps_smg_x_mac10.override.wpn_fps_upg_m4_s_crane         = { a_obj = "a_s_2" }
self.wpn_fps_smg_x_mac10.override.wpn_fps_upg_m4_s_mk46          = { a_obj = "a_s_2" }
self.wpn_fps_smg_x_mac10.override.wpn_fps_upg_m4_s_ubr           = { a_obj = "a_s_2" }
self.wpn_fps_smg_x_mac10.override.wpn_fps_snp_tti_s_vltor        = { a_obj = "a_s_2" }
self.wpn_fps_sho_m590.override.wpn_fps_upg_m4_s_standard      = { a_obj = "a_s_2" }
self.wpn_fps_sho_m590.override.wpn_fps_upg_m4_s_pts           = { a_obj = "a_s_2" }
self.wpn_fps_sho_m590.override.wpn_fps_upg_m4_s_crane         = { a_obj = "a_s_2" }
self.wpn_fps_sho_m590.override.wpn_fps_upg_m4_s_mk46          = { a_obj = "a_s_2" }
self.wpn_fps_sho_m590.override.wpn_fps_upg_m4_s_ubr           = { a_obj = "a_s_2" }
self.wpn_fps_sho_m590.override.wpn_fps_snp_tti_s_vltor        = { a_obj = "a_s_2" }
self.wpn_fps_sho_m590.override.wpn_fps_shot_r870_fg_wood      = { a_obj = "a_fg_2" }
-- table.list_append(self.wpn_fps_smg_akmsu.uses_parts, {"wpn_fps_upg_ak_b_ak105", "wpn_fps_upg_ak_b_draco"})
-- if not self.parts.wpn_fps_upg_ak_b_ak105.override then self.parts.wpn_fps_upg_ak_b_ak105.override = {} end
-- self.parts.wpn_fps_upg_ak_b_ak105.override.wpn_fps_smg_akmsu_body_lowerreceiver = {unit = "wpn_fps_ass_ak_body_lowerreceiver"}
end )                              
-- end