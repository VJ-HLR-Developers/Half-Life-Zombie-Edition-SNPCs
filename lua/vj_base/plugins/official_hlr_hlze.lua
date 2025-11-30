/*--------------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
VJ.AddPlugin("Half-Life Resurgence: Zombie Edition", "NPC", "2.2.0")

local spawnCategory = "HL Resurgence: HLZE"
VJ.AddCategoryInfo(spawnCategory, {Icon = "vj_hl/icons/hlze.png"})

-- NPCs
VJ.AddNPC("Human Grunt", "npc_vj_hlrze_hgrunt", spawnCategory)
VJ.AddNPC("Barney", "npc_vj_hlrze_barney", spawnCategory)
VJ.AddNPC("Scientist", "npc_vj_hlrze_scientist", spawnCategory)
VJ.AddNPC("Zombie", "npc_vj_hlrze_zombie", spawnCategory)
VJ.AddNPC("Zombie Barney", "npc_vj_hlrze_zombie_barney", spawnCategory)
VJ.AddNPC("Zombie Soldier", "npc_vj_hlrze_zsoldier", spawnCategory)
VJ.AddNPC("Zombie Soldier (Grenade)", "npc_vj_hlrze_zsoldier_grenade", spawnCategory)
VJ.AddNPC("Zombie Male Assassin", "npc_vj_hlrze_zmassassin", spawnCategory)
VJ.AddNPC("Zombie Female Assassin", "npc_vj_hlrze_zfassassin", spawnCategory)
VJ.AddNPC("Zombie Gordon Freeman", "npc_vj_hlrze_zombie_hev", spawnCategory)
VJ.AddNPC("Zombie Crasher", "npc_vj_hlrze_zcrasher", spawnCategory)
VJ.AddNPC("Zombie Rusher", "npc_vj_hlrze_zrusher", spawnCategory)
VJ.AddNPC("Zombie Rusher Scientist", "npc_vj_hlrze_zrusher_scientist", spawnCategory)
VJ.AddNPC("Zombie Breeder", "npc_vj_hlrze_zbreeder", spawnCategory)
VJ.AddNPC("Headcrab", "npc_vj_hlrze_headcrab", spawnCategory)

-- NPC Spawners
VJ.AddNPC("Random Zombie (All)", "sent_vj_hlrze_randomzombie_all", spawnCategory)
VJ.AddNPC("Random Zombie (All Standard)", "sent_vj_hlrze_randomzombie_allcommon", spawnCategory)
VJ.AddNPC("Random Zombie (Black Mesa Staff)", "sent_vj_hlrze_randomzombie_bm", spawnCategory)
VJ.AddNPC("Random Zombie (HECU)", "sent_vj_hlrze_randomzombie_grunt", spawnCategory)
VJ.AddNPC("Random Zombie (Military)", "sent_vj_hlrze_randomzombie_military", spawnCategory)
VJ.AddNPC("Random Zombie (Mutations)", "sent_vj_hlrze_randomzombie_mutation", spawnCategory)

-- NPC Weapons
VJ.AddNPCWeapon("Beretta (HL Zombie Edition)", "weapon_vj_hlrze_beretta", spawnCategory)
VJ.AddNPCWeapon("M16 (HL Zombie Edition)", "weapon_vj_hlrze_m16", spawnCategory)
VJ.AddNPCWeapon("SPAS 12 (HL Zombie Edition)", "weapon_vj_hlrze_spas12", spawnCategory)
VJ.AddNPCWeapon("M249 SAW (HL Zombie Edition)", "weapon_vj_hlrze_m249", spawnCategory)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Convars & Menu ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
VJ.AddConVar("vj_hlrze_latching", 1, FCVAR_ARCHIVE)
VJ.AddConVar("vj_hlrze_breeder_maxcrab", 5, FCVAR_ARCHIVE)
VJ.AddConVar("vj_hlrze_breeder_maxcrab_baby", 28, FCVAR_ARCHIVE)

if CLIENT then
	hook.Add("PopulateToolMenu", "VJ_ADDTOMENU_HLRZE", function()
		spawnmenu.AddToolMenuOption("DrVrej", "SNPC Configures", "HLR - Zombie Edition", "HLR - Zombie Edition", "", "", function(panel)
			if !game.SinglePlayer() && !LocalPlayer():IsAdmin() then
				panel:Help("#vjbase.menu.general.admin.not")
				panel:Help("#vjbase.menu.general.admin.only")
				return
			end
			panel:Help("#vjbase.menu.general.admin.only")
			panel:AddControl("Button", {Text = "#vjbase.menu.general.reset.everything", Command = "vj_hlrze_latching 1\nvj_hlrze_breeder_maxcrab 5\nvj_hlrze_breeder_maxcrab_baby 28"})
			panel:CheckBox("Enable Headcrab Latching", "vj_hlrze_latching")
			panel:ControlHelp("Disabling VJ Base death animations will also disable headcrab latching!")
			panel:NumSlider("Breeder Max Headcrabs", "vj_hlrze_breeder_maxcrab", 0, 100, 0)
			panel:NumSlider("Breeder Max Baby Headcrabs", "vj_hlrze_breeder_maxcrab_baby", 0, 100, 0)
		end)
	end)
end