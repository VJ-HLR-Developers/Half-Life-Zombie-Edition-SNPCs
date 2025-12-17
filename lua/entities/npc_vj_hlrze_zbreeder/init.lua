AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.Model = "models/vj_hlr/hlze/breeder.mdl"
ENT.StartHealth = 180
ENT.IsHEVZombie = true
ENT.EntitiesToNoCollide = {"npc_vj_hlr1_headcrab_baby"}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.CallForHelpDistance = 4500
ENT.CallForHelpCooldown = 20

-- Melee attack
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1

-- Range attack
ENT.HasRangeAttack = true
ENT.RangeAttackProjectiles = "obj_vj_hlrze_babybarnacle"
ENT.AnimTbl_RangeAttack = ACT_SPECIAL_ATTACK2
ENT.RangeAttackMinDistance = 200
ENT.RangeAttackMaxDistance = 700
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.NextRangeAttackTime = VJ.SET(4, 10)

-- Sounds
ENT.SoundTbl_Idle = {"vj_hlr/hlze/zombie/zombie_idle1.wav","vj_hlr/hlze/zombie/zombie_voice_idle1.wav","vj_hlr/hlze/zombie/zombie_voice_idle2.wav","vj_hlr/hlze/zombie/zombie_voice_idle3.wav","vj_hlr/hlze/zombie/zombie_voice_idle4.wav","vj_hlr/hlze/zombie/zombie_voice_idle5.wav","vj_hlr/hlze/zombie/zombie_voice_idle6.wav","vj_hlr/hlze/zombie/zombie_voice_idle7.wav","vj_hlr/hlze/zombie/zombie_voice_idle8.wav","vj_hlr/hlze/zombie/zombie_voice_idle9.wav","vj_hlr/hlze/zombie/zombie_voice_idle10.wav","vj_hlr/hlze/zombie/zombie_voice_idle11.wav","vj_hlr/hlze/zombie/zombie_voice_idle12.wav","vj_hlr/hlze/zombie/zombie_voice_idle13.wav","vj_hlr/hlze/zombie/zombie_voice_idle14.wav"}
ENT.SoundTbl_Alert = {"vj_hlr/hlze/zombie/zombie_alert1.wav","vj_hlr/hlze/zombie/zombie_pain1.wav","vj_hlr/hlze/zombie/zombie_pain4.wav"}
ENT.SoundTbl_Pain = {"vj_hlr/hlze/zombie/zombie_pain2.wav","vj_hlr/hlze/zombie/zombie_pain3.wav","vj_hlr/hlze/zombie/zombie_pain4.wav","vj_hlr/hlze/zombie/zombie_pain5.wav","vj_hlr/hlze/zombie/zombie_pain6.wav"}
ENT.SoundTbl_Death = {"vj_hlr/gsrc/npc/zombie/zo_pain1.wav","vj_hlr/gsrc/npc/zombie/zo_pain2.wav"}
ENT.SoundTbl_CallForHelp = "vj_hlr/hlze/zombie/zombie_alert2.wav"

-- Custom
ENT.Breeder_AttackMode = 0 -- Attack mode of the breeder | 0 = normal, 1 = throw headcrab, 2 = shoot babycrab
ENT.Breeder_BabycrabCount = 0 -- Amount of babycrabs shot in a single attack
ENT.Breeder_HeadcrabCount = 5 -- Total amount of headcrabs we have stored in our chest inventory
//ENT.Breeder_ShotBabycrabCount = 0
ENT.Breeder_MaxBabycrabCount = 28 --M ax amount of babycrabs we are holding

-- NPC Controller hints
ENT.Breeder_NoHintHeadcrab = false
ENT.Breeder_NoHintBabycrab = false

local vj_hlrze_breeder_maxcrab = GetConVar("vj_hlrze_breeder_maxcrab")
local vj_hlrze_breeder_maxcrab_baby = GetConVar("vj_hlrze_breeder_maxcrab_baby")
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self.Breeder_NextPullHeadcrabTime = CurTime() + math.Rand(4, 15) -- Next time that we're allowed to pull out a headcrab from our chest
	self.Breeder_NextBabycrabTime = CurTime() + math.Rand(10, 30) -- Next time we can engage baby crab spew mode
	self.Breeder_HeadcrabCount = vj_hlrze_breeder_maxcrab:GetInt()
	self.Breeder_MaxBabycrabCount = vj_hlrze_breeder_maxcrab_baby:GetInt()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_Initialize(ply, controlEnt)
	ply:ChatPrint("JUMP: Detach Own Headcrab | MOUSE2: Throw Baby Barnacle")
	ply:ChatPrint("RELOAD: Pull Out Headcrab | CROUCH: Spew Baby Headcrabs")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
	if key == "event_emit step" then
		self:PlayFootstepSound()
	elseif key == "event_mattack right" or key == "event_mattack left" or key == "event_mattack both" then
		self:ExecuteMeleeAttack()
	elseif key == "mattack right" or key == "mattack left" or key == "mattack both" then
		self:ExecuteMeleeAttack()
	elseif key == "event_pulloutcrab" then
		self:SetBodygroup(2,1) -- Set headcrab hand bodygroup
		self.Breeder_HeadcrabCount = self.Breeder_HeadcrabCount - 1 -- Decrease from our stored headcrab count
		self:ChangeBreederAttackMode(1) -- Switch to headcrab attack mode
	elseif key == "event_dropcrab" then
		self:Breeder_Dropheadcrab_hand()
		if self.VJ_IsBeingControlled == true then
			self.Breeder_NextPullHeadcrabTime = CurTime() + 2 --Players get a faster cooldown than NPCs
		else
			self.Breeder_NextPullHeadcrabTime = CurTime() + math.Rand(10, 30)
		end
	elseif key == "event_pulloutbarnacle" then --barnacle code is handled in the range attack stuff
		self:SetBodygroup(2, 2) --show barnacle bodygroup
		self.CanFlinch = false --Don't interrupt
		timer.Simple(2, function() if IsValid(self) then self:SetBodygroup(2, 0) self.CanFlinch = true end end)
	elseif key == "event_throwbarnacle" then
		self:ExecuteRangeAttack()
		self:SetBodygroup(2,0) --hide barnacle bodygroup
		self.CanFlinch = true
	elseif key == "event_shootbabycrab" then
		self:Breeder_Shootbabycrab_hand()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ChangeBreederAttackMode(wepHoldType)
	self.Breeder_AttackMode = wepHoldType
	-- Normal zombie
	if wepHoldType == 0 then
		self.AnimationTranslations[ACT_IDLE] = ACT_IDLE
		self.AnimationTranslations[ACT_WALK] = ACT_WALK
		self.AnimationTranslations[ACT_RUN] = ACT_RUN
		self.AnimationTranslations[ACT_TURN_RIGHT] = ACT_TURN_RIGHT
		self.AnimationTranslations[ACT_TURN_LEFT] = ACT_TURN_LEFT
		self.CanEat = true
		self.CanFlinch = true
		self.MeleeAttackDistance = 50
		self.AnimationTranslations[ACT_MELEE_ATTACK1] = ACT_MELEE_ATTACK1
		self.MeleeAttackAnimationFaceEnemy = true
		self.NextMeleeAttackTime = 0
		self.HasMeleeAttackSounds = true
		self.HasRangeAttack = true
	-- Holding headcrab
	elseif wepHoldType == 1 then
		self.AnimationTranslations[ACT_IDLE] = ACT_IDLE_ANGRY_SHOTGUN
		self.AnimationTranslations[ACT_WALK] = ACT_WALK_AIM_SHOTGUN
		self.AnimationTranslations[ACT_RUN] = ACT_WALK_AIM_SHOTGUN
		self.CanEat = true
		self.CanFlinch = true
		self.MeleeAttackDistance = 300
		self.AnimationTranslations[ACT_MELEE_ATTACK1] = ACT_SPECIAL_ATTACK1
		self.MeleeAttackAnimationFaceEnemy = true
		self.NextMeleeAttackTime = 0
		self.HasMeleeAttackSounds = false
		self.HasRangeAttack = false
		if self.VJ_IsBeingControlled && self.Breeder_NoHintHeadcrab == false then
			self.VJ_TheController:ChatPrint("ATTACK1: Drop Held Headcrab")
			self.Breeder_NoHintHeadcrab = true
		end
	-- Shooting out baby headcrabs
	elseif wepHoldType == 2 then
		self.AnimationTranslations[ACT_IDLE] = ACT_IDLE_RIFLE
		self.AnimationTranslations[ACT_WALK] = ACT_WALK_AIM_RIFLE
		self.AnimationTranslations[ACT_RUN] = ACT_WALK_AIM_RIFLE
		self.CanEat = false
		self.CanFlinch = false
		self.MeleeAttackDistance = 200
		self.AnimationTranslations[ACT_MELEE_ATTACK1] = ACT_IDLE_RIFLE
		self.MeleeAttackAnimationFaceEnemy = false
		self.NextMeleeAttackTime = VJ.SET(0.1, 1.1)
		self.HasMeleeAttackSounds = false
		self.HasRangeAttack = false
		self.Breeder_BabycrabCount = math.random(1, 8) -- Randomize how many babycrabs we will shoot
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local posZN10 = Vector(0, 0, -10)
--
function ENT:Breeder_Dropheadcrab_hand()
	local headcrab = ents.Create("npc_vj_hlrze_headcrab")
	headcrab:SetPos(self:GetAttachment(1).Pos + posZN10)
	headcrab:SetAngles(self:GetAngles())
	headcrab:Spawn()

	self:SetBodygroup(2,0)
	self:ChangeBreederAttackMode(0)
end
---------------------------------------------------------------------------------------------------------------------------------------------
local noCollideList = {"npc_vj_hlr1_gonarch", "npc_vj_hlr1_headcrab_baby", "npc_vj_hlrze_zbreeder", "npc_vj_hlrze_headcrab"}
--
function ENT:Breeder_Shootbabycrab_hand()
	local headcrab = ents.Create("npc_vj_hlr1_headcrab_baby")
	headcrab:SetPos(self:GetAttachment(1).Pos)
	headcrab:SetAngles(self:GetAngles())
	headcrab:SetOwner(self)
	headcrab:SetLocalVelocity(Vector(self:GetForward() * math.Rand(10, 100), self:GetUp() * math.Rand(0, 5), self:GetRight() * math.Rand(-5, 5))) -- fly in a random direction
	headcrab.EntitiesToNoCollide = noCollideList
	headcrab:Spawn()

	VJ.EmitSound(self, "vj_hlr/gsrc/wep/sporelauncher/splauncher_fire.wav", 100)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Breeder_PulloutHeadcrab() -- Pull out headcrab and go into headcrab attack mode
	self:StopMoving()
	self:PlayAnim(ACT_RELOAD_SHOTGUN, true, 1.2, false)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Breeder_BeginCrabSpew() -- Aim with hand and spew out baby crabs!
	self:StopMoving()
	self:PlayAnim(ACT_RELOAD_SMG1, true, false, false)
	self:ChangeBreederAttackMode(2)
	self.Breeder_NextBabycrabTime = CurTime() + 0.5 -- Delay the spewing until our anim is finished

	if self.VJ_IsBeingControlled then
		self.VJ_TheController:ChatPrint("Spewing Baby Headcrabs")
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackProjPos(projectile)
	return self:GetAttachment(self:LookupAttachment("hand_headcrab")).Pos
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
	-- NPC Controller headcrab detaching
	if self:Alive() && self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP) then
		self.AnimTbl_Death = ACT_DIE_HEADSHOT
		self:DropHeadcrab()
		self:TakeDamage(self:Health() + 100, self, self)
	end
	
	if self.Breeder_AttackMode == 0 && !self:IsBusy() && self.Breeder_HeadcrabCount > 0 && CurTime() > self.Breeder_NextPullHeadcrabTime && ( (self.VJ_IsBeingControlled == false && IsValid(self:GetEnemy()) && (self:GetPos():Distance(self:GetEnemy():GetPos()) < 500) ) or (IsValid(self.VJ_TheController) && self.VJ_TheController:KeyDown(IN_RELOAD))) then
		--make sure we're available to pull out a crab, or if the player controller pressed R
		self:Breeder_PulloutHeadcrab()
	end
	
	if self.Breeder_AttackMode == 0 && !self:IsBusy(Activities) && self.Breeder_BabycrabCount == 0 && self.Breeder_MaxBabycrabCount > 0 && CurTime() > self.Breeder_NextBabycrabTime && ( (self.VJ_IsBeingControlled == false && IsValid(self:GetEnemy()) && (self:GetPos():Distance(self:GetEnemy():GetPos()) < 950) ) or (IsValid(self.VJ_TheController) && self.VJ_TheController:KeyDown(IN_DUCK))) then
		--begin the spewing when valid, or if the player controller pressed crouch
		self:Breeder_BeginCrabSpew()
	end
	
	-- Active spewing code
	if self.Breeder_AttackMode == 2 && self.Breeder_BabycrabCount > 0 && CurTime() > self.Breeder_NextBabycrabTime then
		--self:PlayAnim(ACT_GESTURE_RANGE_ATTACK_AR2, false, 0, false, 0, {AlwaysUseGesture = true})
		--self:PlayAnim("vjges_babycrab_shoot_gesture", false, 0, false, 0)
		--self:AddGesture(ACT_GESTURE_RANGE_ATTACK_AR2, true )
		
		--self.Breeder_ShotBabycrabCount = self.Breeder_ShotBabycrabCount + 1
		self.Breeder_MaxBabycrabCount = self.Breeder_MaxBabycrabCount - 1
		
		self:AddLayeredSequence(self:LookupSequence("babycrab_shoot_gesture"), self.Breeder_BabycrabCount + 1)
		VJ.EmitSound(self, "vj_hlr/gsrc/npc/gonarch/gon_birth1.wav", 50)
		
		--self:SetLayerSequence( self.Breeder_BabycrabCount + 1, self:LookupSequence("babycrab_shoot_gesture") )
		--self:SetLayerPriority( self.Breeder_BabycrabCount + 1, self.Breeder_BabycrabCount )
		--self:SetLayerPriority( self.Breeder_BabycrabCount + 1, 1 )
		
		if self.Breeder_BabycrabCount > 1 then nextcrabdelay = math.Rand(0.1, 1.1) else nextcrabdelay = 1.2 end
		self.Breeder_NextBabycrabTime = CurTime() + nextcrabdelay --time until shooting next babycrab
		self.Breeder_BabycrabCount = self.Breeder_BabycrabCount - 1 --decrease crab from total burst max
		
		--print("headcrabs left: ", self.Breeder_BabycrabCount, "delay: ", nextcrabdelay)

	-- Attack has ended, stop spewing
	elseif self.Breeder_AttackMode == 2 && self.Breeder_BabycrabCount <= 0 && CurTime() > self.Breeder_NextBabycrabTime then
		self:StopMoving()
		self:RemoveAllGestures() --This fixes baby crab shooting from breaking after being called 14 times
		self:PlayAnim(ACT_RELOAD_SMG1_LOW,true,false,false) --hand lower anim
		--self.Breeder_ShotBabycrabCount = 0
		self:ChangeBreederAttackMode(0)
		if self.VJ_IsBeingControlled == true then
			self.Breeder_NextBabycrabTime = CurTime() + 5
		else
			self.Breeder_NextBabycrabTime = CurTime() + math.Rand(15, 40) --big cooldown
		end
	end
	
	if self.VJ_IsBeingControlled && self.Breeder_AttackMode == 0 && self.VJ_TheController:KeyDown(IN_RELOAD) && self.Breeder_HeadcrabCount <= 0 && CurTime() > self.Breeder_NextPullHeadcrabTime then 
		self.VJ_TheController:ChatPrint("Out of Headcrabs!")
		self.Breeder_NextPullHeadcrabTime = CurTime() + 2
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkAttack(isAttacking, enemy)
	if isAttacking then return end
	if self.Breeder_AttackMode == 0 then
		if math.random(1, 2) == 1 then
			self.AnimationTranslations[ACT_MELEE_ATTACK1] = ACT_MELEE_ATTACK1
			self.MeleeAttackDamage = 20
		else
			self.AnimationTranslations[ACT_MELEE_ATTACK1] = ACT_MELEE_ATTACK2
			self.MeleeAttackDamage = 40
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local vecZ50 = Vector(0, 0, -50)
--
function ENT:OnEat(status, statusInfo)
	if status == "CheckFood" then
		if self.Breeder_AttackMode == 1 then -- if we're hungry, drop the crab we're holding
			self:PlayAnim(ACT_SPECIAL_ATTACK1, true, false, false)
		end
		return (statusInfo.owner.BloodData && statusInfo.owner.BloodData.Color == VJ.BLOOD_COLOR_RED && self.Breeder_AttackMode == 0) -- only start eating if the corpse is a human, and we're not at full health - epicplayer
	elseif status == "BeginEating" then
		self.AnimationTranslations[ACT_IDLE] = ACT_GESTURE_RANGE_ATTACK1
		return select(2, self:PlayAnim(ACT_ARM, true, false))
	elseif status == "Eat" then
		VJ.EmitSound(self, "vj_hlr/gsrc/npc/bullchicken/bc_bite"..math.random(1, 3)..".wav", 100) --more accurate to the mod - epicplayer
		-- Health changes
		local food = self.EatingData.Target
		local damage = 15 -- How much damage food will receive
		local foodHP = food:Health() -- Food's health
		self:SetHealth(math.Clamp(self:Health() + ((damage > foodHP and foodHP) or damage), self:Health(), self:GetMaxHealth() * 2)) -- Give health to the NPC, allow an overload of up to 2x max health.
		food:SetHealth(foodHP - damage) -- Decrease corpse health
		-- Blood effects
		local bloodData = food.BloodData
		if bloodData then
			local bloodPos = food:GetPos() + food:OBBCenter()
			local bloodParticle = VJ.PICK(bloodData.Particle)
			if bloodParticle then
				ParticleEffect(bloodParticle, bloodPos, self:GetAngles())
			end
			local bloodDecal = VJ.PICK(bloodData.Decal)
			if bloodDecal then
				local tr = util.TraceLine({start = bloodPos, endpos = bloodPos + vecZ50, filter = {food, self}})
				util.Decal(bloodDecal, tr.HitPos + tr.HitNormal + Vector(math.random(-45, 45), math.random(-45, 45), 0), tr.HitPos - tr.HitNormal, food)
			end
		end
		return 1
	elseif status == "StopEating" then
		if statusInfo != "Dead" && self.EatingData.AnimStatus != "None" then -- Do NOT play anim while dead or has NOT prepared to eat
			return self:PlayAnim(ACT_DISARM, true, false)
		end
	end
	return 0
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "Init" then
		if self.Breeder_AttackMode == 1 then -- If we're holding a headcrab, drop it
			self:Breeder_Dropheadcrab_hand()
		end
		self:SetBodygroup(2,0)

		if hitgroup == HITGROUP_HEAD then
			self.AnimTbl_Death = ACT_DIE_HEADSHOT
		else
			self.AnimTbl_Death = {ACT_DIEBACKWARD, ACT_DIESIMPLE}
		end
	end
end