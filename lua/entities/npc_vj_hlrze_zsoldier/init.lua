include("entities/npc_vj_hlrze_zombie/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 90

-- Custom
ENT.Zombie_CanGrenade = false
ENT.Zombie_GrenadePulled = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetBodygroup(0, 2)
	if self.Zombie_CanGrenade then
		self:SetBodygroup(1, 3)
	else
		self:SetBodygroup(1, 2)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkActive()
	-- Pull out the grenade
	if self.Zombie_CanGrenade && !self.Zombie_GrenadePulled && !self.Zombie_Crippled then
		if self.VJ_IsBeingControlled then
			if self.VJ_TheController:KeyDown(IN_ATTACK2) then
				self.VJ_TheController:PrintMessage(HUD_PRINTCENTER, "Pulling Grenade Out!")
				self:Zombie_ActivateGrenade()
			end
		elseif IsValid(self:GetEnemy()) && self.EnemyData.Distance <= 400 && self.EnemyData.Distance >= 200 then
			self:Zombie_ActivateGrenade()
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_ActivateGrenade()
	self.Zombie_GrenadePulled = true
	self.AnimationTranslations[ACT_IDLE] = ACT_IDLE_AGITATED
	self.AnimationTranslations[ACT_RUN] = ACT_RUN_AGITATED
	self.AnimationTranslations[ACT_WALK] = ACT_RUN_AGITATED
	self.HasMeleeAttack = false
	self:PlayAnim(ACT_RANGE_ATTACK1, true, 0.6, false)
	timer.Simple(0.3, function()
		if IsValid(self) then
			self:SetBodygroup(2, 1)
			timer.Simple(5, function()
				if IsValid(self) then
					self.Zombie_GrenadePulled = false
					
					-- Grenade a grenade entity and make it explode instantly
					local grenade = ents.Create("obj_vj_hlr1_grenade")
					grenade:SetPos(self:GetPos() + self:OBBCenter())
					grenade.FuseTime = 0
					grenade.RadiusDamageRadius = 300
					grenade.RadiusDamage = 100
					grenade.PrintName = "Zombie Grenade"
					grenade:Spawn()
					grenade:Activate()
					
					-- Force kill the NPC
					local dmg = DamageInfo()
					dmg:SetDamage(self:Health() + 100)
					dmg:SetAttacker(self)
					dmg:SetInflictor(grenade)
					dmg:SetDamageType(DMG_BLAST)
					self:TakeDamageInfo(dmg)
				end
			end)
		end
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo, hitgroup, status)
	if hitgroup == HITGROUP_STOMACH && status == "PreDamage" then
		dmginfo:ScaleDamage(0.5)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local funcOnDeath = ENT.OnDeath
--
function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "Init" && self.Zombie_GrenadePulled == true then
		self:SetBodygroup(2, 0)
		local grenade = ents.Create("obj_vj_hlr1_grenade")
		grenade:SetPos(self:GetPos() + self:OBBCenter())
		grenade.RadiusDamageRadius = 300
		grenade.RadiusDamage = 100
		grenade.PrintName = "Zombie Grenade"
		grenade:Spawn()
		grenade:Activate()
	end
	funcOnDeath(self, dmginfo, hitgroup, status)
end