/*--------------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
VJ.AddPlugin("Half-Life Resurgence: Zombie Edition", "NPC")

local spawnCategory = "VJ Dummy Category" -- Category, you can also set a category individually by replacing the spawnCategory with a string value
	
	local vCat = "HL Resurgence: HLZE"
	VJ.AddCategoryInfo(vCat, {Icon = "vj_hl/icons/hlze.png"})

	VJ.AddNPC("Human Grunt","npc_vj_hlrze_hgrunt",vCat)
	VJ.AddNPC("Barney","npc_vj_hlrze_barney",vCat)
	VJ.AddNPC("Scientist","npc_vj_hlrze_scientist",vCat)
	VJ.AddNPC("Zombie","npc_vj_hlrze_zombie",vCat)
	VJ.AddNPC("Zombie Barney","npc_vj_hlrze_zombie_barney",vCat)
	VJ.AddNPC("Zombie Soldier","npc_vj_hlrze_zsoldier",vCat)
	VJ.AddNPC("Zombie Soldier (Grenade)","npc_vj_hlrze_zsoldier_grenade",vCat)
	VJ.AddNPC("Zombie Male Assassin","npc_vj_hlrze_zmassassin",vCat)
	VJ.AddNPC("Zombie Female Assassin","npc_vj_hlrze_zfassassin",vCat)
	VJ.AddNPC("Zombie Gordon","npc_vj_hlrze_zombie_hev",vCat)
	VJ.AddNPC("Zombie Crasher","npc_vj_hlrze_zcrasher",vCat)
	VJ.AddNPC("Zombie Rusher","npc_vj_hlrze_zrusher",vCat)
	VJ.AddNPC("Zombie Rusher Scientist","npc_vj_hlrze_zrusher_scientist",vCat)
	VJ.AddNPC("Zombie Breeder","npc_vj_hlrze_zbreeder",vCat)
	VJ.AddNPC("Headcrab","npc_vj_hlrze_headcrab",vCat)
	
	VJ.AddNPC("Random Zombie (Black Mesa Staff)","sent_vj_hlrze_randomzombie_bm",vCat)
	VJ.AddNPC("Random Zombie (HECU)","sent_vj_hlrze_randomzombie_grunt",vCat)
	VJ.AddNPC("Random Zombie (Military)","sent_vj_hlrze_randomzombie_military",vCat)
	VJ.AddNPC("Random Zombie (Mutations)","sent_vj_hlrze_randomzombie_mutation",vCat)
	VJ.AddNPC("Random Zombie (All Standard)","sent_vj_hlrze_randomzombie_allcommon",vCat)
	VJ.AddNPC("Random Zombie (All)","sent_vj_hlrze_randomzombie_all",vCat)
	
	-- ====== NPC Weapons ====== ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	VJ.AddNPCWeapon("Beretta (HL Zombie Edition)", "weapon_vj_hlrze_beretta")
	VJ.AddNPCWeapon("M16 (HL Zombie Edition)", "weapon_vj_hlrze_m16")
	VJ.AddNPCWeapon("SPAS 12 (HL Zombie Edition)", "weapon_vj_hlrze_spas12")
	VJ.AddNPCWeapon("M249 SAW (HL Zombie Edition)", "weapon_vj_hlrze_m249")
