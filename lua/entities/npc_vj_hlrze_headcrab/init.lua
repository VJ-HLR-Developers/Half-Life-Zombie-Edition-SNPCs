AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_hlr/hlze/headcrab.mdl"
ENT.StartHealth = 10
ENT.HullType = HULL_TINY
ENT.ControllerParams = {
	ThirdP_Offset = Vector(0, 0, 0),
	FirstP_Bone = "Bip01 Spine",
	FirstP_Offset = Vector(2, 0, 1),
}
ENT.EntitiesToNoCollide = {"npc_vj_hlr1_gonarch","npc_vj_hlrze_headcrab","npc_vj_hlrze_zombie","npc_vj_hlrze_zombie_barney","npc_vj_hlrze_zfassassin","npc_vj_hlrze_zombie_hev","npc_vj_hlrze_zmassassin","npc_vj_hlrze_zrusher","npc_vj_hlrze_zrusher_scientist","npc_vj_hlrze_zsoldier","npc_vj_hlrze_zsoldier_grenade","npc_vj_hlrze_zcrasher","npc_vj_hlrze_zbreeder"}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
ENT.BloodColor = VJ.BLOOD_COLOR_YELLOW
ENT.BloodParticle = {"vj_hlr_blood_yellow"}
ENT.BloodDecal = {"VJ_HLR1_Blood_Yellow"}
ENT.HasBloodPool = false
ENT.HasMeleeAttack = false

-- Leap attack
ENT.HasLeapAttack = true
ENT.LeapAttackDamage = 10
ENT.AnimTbl_LeapAttack = ACT_RANGE_ATTACK1
ENT.LeapAttackMinDistance = 1
ENT.LeapAttackMaxDistance = 256
ENT.LeapAttackDamageDistance = 50
ENT.TimeUntilLeapAttackDamage = 0.4
ENT.TimeUntilLeapAttackVelocity = 0.4
ENT.NextLeapAttackTime = 1
ENT.LeapAttackExtraTimers = {0.6, 0.8, 1, 1.2, 1.4}
ENT.NextAnyAttackTime_Leap = 3
ENT.LeapAttackStopOnHit = true

ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = ACT_DIESIMPLE

-- Sounds
ENT.SoundTbl_Idle = {"vj_hlr/gsrc/npc/headcrab/hc_idle1.wav","vj_hlr/gsrc/npc/headcrab/hc_idle2.wav","vj_hlr/gsrc/npc/headcrab/hc_idle3.wav","vj_hlr/gsrc/npc/headcrab/hc_idle4.wav","vj_hlr/gsrc/npc/headcrab/hc_idle5.wav"}
ENT.SoundTbl_Alert = {"vj_hlr/gsrc/npc/headcrab/hc_alert1.wav","vj_hlr/gsrc/npc/headcrab/hc_alert2.wav"}
ENT.SoundTbl_LeapAttackJump = {"vj_hlr/gsrc/npc/headcrab/hc_attack1.wav","vj_hlr/gsrc/npc/headcrab/hc_attack2.wav","vj_hlr/gsrc/npc/headcrab/hc_attack3.wav"}
ENT.SoundTbl_LeapAttackDamage = {"vj_hlr/gsrc/npc/headcrab/hc_headbite.wav"}
ENT.SoundTbl_Pain = {"vj_hlr/gsrc/npc/headcrab/hc_pain1.wav","vj_hlr/gsrc/npc/headcrab/hc_pain2.wav","vj_hlr/gsrc/npc/headcrab/hc_pain3.wav"}
ENT.SoundTbl_Death = {"vj_hlr/gsrc/npc/headcrab/hc_die1.wav","vj_hlr/gsrc/npc/headcrab/hc_die2.wav"}

ENT.MainSoundPitch = 100

local vj_npc_anim_death = GetConVar("vj_npc_anim_death")
local vj_hlrze_latching = GetConVar("vj_hlrze_latching")
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(10, 10, 18), Vector(-10, -10, 0))
	-- Is latching enabled?
	if vj_npc_anim_death:GetInt() != 1 or vj_hlrze_latching:GetInt() != 1 then
		self.Headcrabbed = true
	else
		self.Headcrabbed = false
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
	-- When in deep water, drown by slowly taking damage
	if self:WaterLevel() > 2 then
		self:SetHealth(self:Health() - 1)
		if self:Health() <= 0 then
			self.Bleeds = false
			self:TakeDamage(1, self, self)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnAlert(ent)
	if self.VJ_IsBeingControlled then return end
	if math.random(1, 2) == 1 then
		self:PlayAnim("angry", true, false, true)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnLeapAttack(status, enemy)
	if status == "Jump" then
		return VJ.CalculateTrajectory(self, NULL, "Curve", self:GetPos() + self:OBBCenter(), self:GetEnemy():EyePos(), 1) + self:GetForward() * 80 - self:GetUp() * 30
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local infectionClasses = {
	npc_vj_hlrze_scientist = true,
	npc_vj_hlrze_barney = true,
	npc_vj_hlrze_hgrunt = true,
}
--
function ENT:OnLeapAttackExecute(status, ent)
	if status == "PreDamage" then
		local playercontroller = self.VJ_TheControllerEntity
		local cameramode = self.VJ_TheControllerEntity.VJC_Camera_Mode
		if self.Headcrabbed then return end
		if ent.Headcrabbed then return true end
		if ent:IsNPC() && infectionClasses[ent:GetClass()] && ent:Health() > 0 then -- make sure our ent is a valid infection target
			self.Headcrabbed = true
			ent.Headcrabbed = true
			ent.DeathAnimationTime = 60 --Stop corpse from despawning too soon
			ent.AnimTbl_Death = {"zombify_begin"}
			ent.TurningSpeed = 0
			VJ.EmitSound(ent,"vj_hlr/gsrc/npc/headcrab/hc_headbite.wav")
			if self.VJ_IsBeingControlled == true then --If a player controls us, make them control the ent and then the zombie
			local orgThink = playercontroller.Think
				function playercontroller:Think() --don't kick the player out of controlling our ent
					if IsValid(ent) && ent:Health() <= 0 then return end
					return orgThink(self)
				end
				
				self.VJ_TheController:ChatPrint("Transforming ent in 30 seconds...")
				
				playercontroller:SetControlledNPC(ent) -- Control the ent
				playercontroller:StartControlling()

			end
			SafeRemoveEntity(self) --Remove headcrab

			local zClass = "npc_vj_hlrze_zombie" --Fallback class for the zombie NPC we will spawn
			local zOffset = 50
			local zAnimT = 3.01 --Duration of the "I got crabbed!" animation
			local zPos = ent:GetPos()
			ent:TakeDamage(1000,self,self) --Kill the ent
			ent.VJ_NPC_Class = {nil} --Stop NPCs from attacking ent
			ent.BringFriendsOnDeath = false
			local fakedamage = DamageInfo() --Fake damage, needed to make ent drop his weapon
			fakedamage:SetDamage(0)
			fakedamage:SetAttacker(ent)
			fakedamage:SetDamageType(DMG_GENERIC) 
			ent.AnimTbl_WeaponAttack = {"zombify_continues"} 
			if ent:GetClass() == "npc_vj_hlrze_barney" then
				ent:SetSkin(1)
				ent:CreateGibEntity("prop_physics","models/vj_hlr/hlze/barney_helmet.mdl",{Pos = ent:GetPos() + ent:GetUp() * 50})
				ent:DeathWeaponDrop(fakedamage,1)
				ent:SetBodygroup(1,2)
				ent:SetBodygroup(2,2)
				zClass = "npc_vj_hlrze_zombie_barney"
			elseif ent:GetClass() == "npc_vj_hlrze_scientist" then
				ent:SetSkin(2)
				ent:SetBodygroup(1,4)
				ent.IsMedic = false
				if ent:GetActiveWeapon() then ent:DeathWeaponDrop(fakedamage,1) ent:SetBodygroup(3,0) end
			elseif ent:GetClass() == "npc_vj_hlrze_hgrunt" then
				ent:SetBodygroup(2,3)
				ent:SetSkin(2)
				zAnimT = 1.61
				zOffset = 30
				zClass = "npc_vj_hlrze_zsoldier"
				if ent:GetBodygroup(1) == 0 then --If ent has a mask then make a grenade zombie
					ent:SetBodygroup(1,5)
					zClass = "npc_vj_hlrze_zsoldier_grenade"
				else ent:SetBodygroup(1,4) zClass = "npc_vj_hlrze_zsoldier"
				end
			end

			timer.Simple(1,function() -- random extra check
				if IsValid(ent) then
					ent.CanTurnWhileStationary = false
					ent:DoChangeMovementType(VJ_MOVETYPE_STATIONARY)
				end
			end)
			timer.Simple(zAnimT,function()
				if IsValid(ent) then
					ent:PlayAnim("zombify_continues",true,false,false)
				end
			end)
			timer.Simple(30,function() -- Overridden to 30 seconds because Barney's infection animation loops instead of lasting a long time.
				if IsValid(ent) then
					local tr = util.TraceHull{ -- Trace forwards and make sure the zombie doesn't spawn into a wall
						start = ent:GetPos() +ent:GetUp() *5,
						endpos = ent:GetPos() +ent:GetUp() *5 +ent:GetForward() *zOffset,
						mins = ent:GetCollisionBounds().mins,
						maxs = ent:GetCollisionBounds().maxs,
						ignoreworld = false,
						filter = {ent}
					}
				
					if tr.Hit then
						zPos = tr.HitPos +ent:GetForward() *-14
					else
						zPos = ent:GetPos() +ent:GetForward() *zOffset
					end
				
					local zombie = ents.Create(zClass)
					zombie:SetPos(zPos)
					zombie:SetAngles(ent:GetAngles())
					zombie:SetColor(ent:GetColor())
					zombie:SetMaterial(ent:GetMaterial())
					zombie:Spawn()
					zombie:PlayAnim("getup",true,false,false)
					zombie:AddEffects(32) -- hide zombie
					if IsValid(ent) then
						undo.ReplaceEntity(ent,zombie)
					end
					timer.Simple(0.2,function() --The zombie actually spawns in early and is hidden, this is to move the getup animation in place before showing the zombie model
						if IsValid(zombie) then
							if ent.VJ_IsBeingControlled == true then
								-- Set the player controller to control the zombie instead of the ent
								ent.VJ_TheControllerEntity:SetControlledNPC(zombie)
								ent.VJ_TheControllerEntity:StartControlling()
								ent.VJ_TheControllerEntity.VJC_Camera_Mode = cameramode -- Set camera mode that the headcrab was using
							end
							
							SafeRemoveEntity(ent)
							zombie:SetPos(zPos)
							zombie:PlayAnim("getup",true,false,false)
							zombie:RemoveEffects(32)
						end
					end)
				end
			end)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:HandleGibOnDeath(dmginfo, hitgroup)
	self.HasDeathSounds = false
	if self.HasGibOnDeathEffects == true then
		local bloodeffect = EffectData()
		bloodeffect:SetOrigin(self:GetPos() +self:OBBCenter())
		bloodeffect:SetColor(VJ.Color2Byte(Color(255,221,35)))
		bloodeffect:SetScale(120)
		util.Effect("VJ_Blood1",bloodeffect)
		
		local bloodspray = EffectData()
		bloodspray:SetOrigin(self:GetPos() +self:OBBCenter())
		bloodspray:SetScale(8)
		bloodspray:SetFlags(3)
		bloodspray:SetColor(1)
		util.Effect("bloodspray",bloodspray)
		util.Effect("bloodspray",bloodspray)
		
		local effectdata = EffectData()
		effectdata:SetOrigin(self:GetPos() +self:OBBCenter())
		effectdata:SetScale(1)
		util.Effect("StriderBlood",effectdata)
		util.Effect("StriderBlood",effectdata)
	end
	
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib5.mdl",{BloodType = "Yellow",CollisionDecal = "VJ_HLR1_Blood_Yellow",Pos = self:LocalToWorld(Vector(0,0,5))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib7.mdl",{BloodType = "Yellow",CollisionDecal = "VJ_HLR1_Blood_Yellow",Pos = self:LocalToWorld(Vector(0,0,5))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib9.mdl",{BloodType = "Yellow",CollisionDecal = "VJ_HLR1_Blood_Yellow",Pos = self:LocalToWorld(Vector(0,0,5))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib10.mdl",{BloodType = "Yellow",CollisionDecal = "VJ_HLR1_Blood_Yellow",Pos = self:LocalToWorld(Vector(0,0,5))})
	self:PlaySoundSystem("Gib", "vj_base/gib/splat.wav")
	return true
end
---------------------------------------------------------------------------------------------------------------------------------------------
local gibs1 = {"models/vj_hlr/gibs/agib1.mdl", "models/vj_hlr/gibs/agib2.mdl", "models/vj_hlr/gibs/agib3.mdl", "models/vj_hlr/gibs/agib4.mdl","models/vj_hlr/gibs/agib5.mdl","models/vj_hlr/gibs/agib6.mdl","models/vj_hlr/gibs/agib7.mdl","models/vj_hlr/gibs/agib8.mdl","models/vj_hlr/gibs/agib9.mdl","models/vj_hlr/gibs/agib10.mdl"}
--
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpse)
	VJ.HLR_ApplyCorpseSystem(self, corpse, gibs1)
end