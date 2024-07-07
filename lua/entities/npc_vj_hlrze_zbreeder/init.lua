AddCSLuaFile("shared.lua")
include('shared.lua')
ENT.Model = {"models/vj_hlr/hlze/breeder.mdl"}
ENT.StartHealth = 180
ENT.IsHEVZombie = true
ENT.EntitiesToNoCollide = {"npc_vj_hlr1_headcrab_baby"}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Range Attack Variables ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.RangeAttackEntityToSpawn = "obj_vj_hlrze_babybarnacle" -- Entities that it can spawn when range attacking | If set as a table, it picks a random entity
	-- ====== Animation Variables ====== --
ENT.AnimTbl_RangeAttack = ACT_SPECIAL_ATTACK2 -- Range Attack Animations
ENT.RangeAttackAnimationDelay = 0 -- It will wait certain amount of time before playing the animation
ENT.RangeAttackAnimationFaceEnemy = true -- Should it face the enemy while playing the range attack animation?
ENT.RangeAttackAnimationDecreaseLengthAmount = 0 -- This will decrease the time until starts chasing again. Use it to fix animation pauses until it chases the enemy.
ENT.RangeAttackAnimationStopMovement = true -- Should it stop moving when performing a range attack?
	-- ====== Distance Variables ====== --
ENT.RangeDistance = 700 -- This is how far away it can shoot
ENT.RangeToMeleeDistance = 200 -- How close does it have to be until it uses melee?
ENT.RangeAttackAngleRadius = 100 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
	-- ====== Timer Variables ====== --
	-- Set this to false to make the attack event-based:
--ENT.TimeUntilRangeAttackProjectileRelease = 1.4166
ENT.TimeUntilRangeAttackProjectileRelease = false -- How much time until the projectile code is ran?
ENT.NextRangeAttackTime = 4 -- How much time until it can use a range attack?
ENT.NextRangeAttackTime_DoRand = 10 -- False = Don't use random time | Number = Picks a random number between the regular timer and this timer
	-- To let the base automatically detect the attack duration, set this to false:
ENT.NextAnyAttackTime_Range = false -- How much time until it can use any attack again? | Counted in Seconds
ENT.NextAnyAttackTime_Range_DoRand = false -- False = Don't use random time | Number = Picks a random number between the regular timer and this timer
	-- ====== Projectile Spawn Position Variables ====== --
ENT.RangeUseAttachmentForPos = true -- Should the projectile spawn on a attachment?
ENT.RangeUseAttachmentForPosID = "hand_headcrab" -- The attachment used on the range attack if RangeUseAttachmentForPos is set to true

	-- ====== Call For Help Variables ====== --
ENT.CallForHelp = true -- Can the NPC request allies for help while in combat?
ENT.CallForHelpDistance = 4500 -- -- How far away the SNPC's call for help goes | Counted in World Units
ENT.NextCallForHelpTime = 20 -- Time until it calls for help again
ENT.HasCallForHelpAnimation = false -- if true, it will play the call for help animation

ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1

ENT.SoundTbl_Idle = {"vj_hlr/hlze/zombie/zombie_idle1.wav","vj_hlr/hlze/zombie/zombie_voice_idle1.wav","vj_hlr/hlze/zombie/zombie_voice_idle2.wav","vj_hlr/hlze/zombie/zombie_voice_idle3.wav","vj_hlr/hlze/zombie/zombie_voice_idle4.wav","vj_hlr/hlze/zombie/zombie_voice_idle5.wav","vj_hlr/hlze/zombie/zombie_voice_idle6.wav","vj_hlr/hlze/zombie/zombie_voice_idle7.wav","vj_hlr/hlze/zombie/zombie_voice_idle8.wav","vj_hlr/hlze/zombie/zombie_voice_idle9.wav","vj_hlr/hlze/zombie/zombie_voice_idle10.wav","vj_hlr/hlze/zombie/zombie_voice_idle11.wav","vj_hlr/hlze/zombie/zombie_voice_idle12.wav","vj_hlr/hlze/zombie/zombie_voice_idle13.wav","vj_hlr/hlze/zombie/zombie_voice_idle14.wav"}
ENT.SoundTbl_Alert = {"vj_hlr/hlze/zombie/zombie_alert1.wav","vj_hlr/hlze/zombie/zombie_pain1.wav","vj_hlr/hlze/zombie/zombie_pain4.wav"}
ENT.SoundTbl_Pain = {"vj_hlr/hlze/zombie/zombie_pain2.wav","vj_hlr/hlze/zombie/zombie_pain3.wav","vj_hlr/hlze/zombie/zombie_pain4.wav","vj_hlr/hlze/zombie/zombie_pain5.wav","vj_hlr/hlze/zombie/zombie_pain6.wav"}
ENT.SoundTbl_Death = {"vj_hlr/hl1_npc/zombie/zo_pain1.wav","vj_hlr/hl1_npc/zombie/zo_pain2.wav"}
ENT.SoundTbl_CallForHelp = {"vj_hlr/hlze/zombie/zombie_alert2.wav"}

ENT.BreederAttackMode = 0 --Attack mode of the breeder. 0 = normal, 1 = throw headcrab, 2 = shoot babycrab
ENT.BreederBabycrabCount = 0 -- Amount of babycrabs shot in a single attack
ENT.BreederHeadcrabCount = 5 -- Total amount of headcrabs we have stored in our chest inventory
--ENT.BreederShotBabycrabCount = 0
ENT.BreederMaxBabycrabCount = 28 --Max amount of babycrabs we are holding

ENT.ShownFirstHint_Headcrabs = false
ENT.ShownFirstHint_Babycrabs = false

function ENT:CustomOnInitialize()
	self.Breeder_NextPullHeadcrabTime = CurTime() + math.Rand(4,15) --The next time that we're allowed to pull out a headcrab from our chest
	self.Breeder_NextBabycrabTime = CurTime() + math.Rand(10,30) --The next time we can engage baby crab spew mode
end

function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "event_emit step" then
		self:FootStepSoundCode()
	end
	if key == "event_mattack right" or key == "event_mattack left" or key == "event_mattack both" then
		self:MeleeAttackCode()
	end
	if key == "mattack right" or key == "mattack left" or key == "mattack both" then
		self:MeleeAttackCode()
	end
	
	if key == "event_pulloutcrab" then
		self:SetBodygroup(2,1) -- Set headcrab hand bodygroup
		self.BreederHeadcrabCount = self.BreederHeadcrabCount - 1 -- Decrease from our stored headcrab count
		self:ChangeBreederAttackMode(1) -- Switch to headcrab attack mode
	end
	if key == "event_dropcrab" then
		self:Dropheadcrab_hand()
		if self.VJ_IsBeingControlled == true then
			self.Breeder_NextPullHeadcrabTime = CurTime() + 2 --Players get a faster cooldown than NPCs
		else
			self.Breeder_NextPullHeadcrabTime = CurTime() +math.Rand(10,30)
		end
	end
	if key == "event_pulloutbarnacle" then --barnacle code is handled in the range attack stuff
		self:SetBodygroup(2,2) --show barnacle bodygroup
		self.CanFlinch = 0 --Don't interrupt
		timer.Simple(2, function() if IsValid(self) then self:SetBodygroup(2,0) self.CanFlinch = 1 end end)
	end
	if key == "event_throwbarnacle" then
		self:RangeAttackCode()
		self:SetBodygroup(2,0) --hide barnacle bodygroup
		self.CanFlinch = 1
	end
	if key == "event_shootbabycrab" then
		self:Shootbabycrab_hand()
	end
end

function ENT:ChangeBreederAttackMode(htype) 
self.BreederAttackMode = htype
if htype == 0 then --normal zombie
	self.AnimTbl_IdleStand = {ACT_IDLE}
	self.AnimTbl_Walk = {ACT_WALK}
	self.AnimTbl_Run = {ACT_RUN}
	self.CanEat = true
	self.CanFlinch = 1
	self.MeleeAttackDistance = 50 -- Distance to try melee attacking
	self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1} -- Melee Attack Animations
	self.MeleeAttackAnimationFaceEnemy = true -- Should it face the enemy while playing the melee attack animation?
	self.MeleeAttackAnimationAllowOtherTasks = false -- If set to true, the animation will not stop other tasks from playing, such as chasing | Useful for gesture attacks!
	self.HasRangeAttack = true -- Should the SNPC have a range attack?
	self.NextMeleeAttackTime = 0 -- How much time until it can use a melee attack?
	self.NextMeleeAttackTime_DoRand = false -- False = Don't use random time
	self.HasMeleeAttackSounds = true
	
elseif htype == 1 then -- holding headcrab
	self.AnimTbl_IdleStand = {ACT_IDLE_ANGRY_SHOTGUN}
	self.AnimTbl_Walk = {ACT_WALK_AIM_SHOTGUN}
	self.AnimTbl_Run = {ACT_WALK_AIM_SHOTGUN}
	self.CanEat = true
	self.CanFlinch = 1
	self.MeleeAttackDistance = 300
	self.AnimTbl_MeleeAttack = {ACT_SPECIAL_ATTACK1}
	self.MeleeAttackAnimationFaceEnemy = true
	self.MeleeAttackAnimationAllowOtherTasks = false
	self.NextMeleeAttackTime = 0
	self.NextMeleeAttackTime_DoRand = false
	self.HasMeleeAttackSounds = false
	self.HasRangeAttack = false
	if self.VJ_IsBeingControlled == true && self.ShownFirstHint_Headcrabs == false then
		self.VJ_TheController:ChatPrint("ATTACK1: Drop Held Headcrab") 
		self.ShownFirstHint_Headcrabs = true
	end
	
elseif htype == 2 then -- shooting out baby headcrabs
	self.AnimTbl_IdleStand = {ACT_IDLE_RIFLE}
	self.AnimTbl_Walk = {ACT_WALK_AIM_RIFLE}
	self.AnimTbl_Run = {ACT_WALK_AIM_RIFLE}
	self.CanEat = false
	self.CanFlinch = 0
	self.MeleeAttackDistance = 200
	self.AnimTbl_MeleeAttack = {ACT_IDLE_RIFLE}
	self.MeleeAttackAnimationFaceEnemy = false
	self.MeleeAttackAnimationAllowOtherTasks = true
	self.NextMeleeAttackTime = 0.1
	self.NextMeleeAttackTime_DoRand = 1.1 -- Picks a random number between the regular timer and this timer
	self.HasMeleeAttackSounds = false
	self.HasRangeAttack = false
	
	self.BreederBabycrabCount = math.random(1,8) --Randomise how many babycrabs we will shoot

end

end

function ENT:Dropheadcrab_hand()
local headcrab = ents.Create("npc_vj_hlrze_headcrab")
headcrab:SetPos(self:GetAttachment(1).Pos + Vector(0,0,-10))
headcrab:SetAngles(self:GetAngles()) 
headcrab:Spawn()

self:SetBodygroup(2,0)
self:ChangeBreederAttackMode(0) 
end

function ENT:Shootbabycrab_hand()
local headcrab = ents.Create("npc_vj_hlr1_headcrab_baby")
headcrab:SetPos(self:GetAttachment(1).Pos)
headcrab:SetAngles(self:GetAngles()) 
headcrab:SetOwner(self)
headcrab:SetLocalVelocity(Vector(self:GetForward()* math.Rand(10,100),self:GetUp()* math.Rand(0,5),self:GetRight()* math.Rand(-5,5))) -- fly in a random direction
headcrab.EntitiesToNoCollide = {"npc_vj_hlr1_gonarch","npc_vj_hlr1_headcrab_baby","npc_vj_hlrze_zbreeder","npc_vj_hlrze_headcrab"}
headcrab:Spawn()

VJ_EmitSound(self, "vj_hlr/hl1_weapon/sporelauncher/splauncher_fire.wav", 100)
end

function ENT:CustomOnInitialKilled(dmginfo, hitgroup) 

if self.BreederAttackMode == 1 then -- if we're holding a headcrab, drop it
	self:Dropheadcrab_hand()
end

self:SetBodygroup(2,0)

end

--function ENT:RangeAttackCode_GetShootPos(projectile)
--	local projPos = projectile:GetPos()
--	return self:CalculateProjectile("Curve", projPos, self:GetAimPosition(self:GetEnemy(), projPos, 1, 1500), 1500)
--end

--function ENT:RangeAttackCode_GetShootPos(projectile) return VJ.CalculateTrajectory(self, self:GetEnemy(), "Curve", projectile:GetPos(), 1, 10) end

function ENT:CustomOnThink()
	if self.BreederAttackMode == 0 && !self:BusyWithActivity() && self.BreederHeadcrabCount > 0 && CurTime() > self.Breeder_NextPullHeadcrabTime && ( (self.VJ_IsBeingControlled == false && !plyControlled && self.AttackState == VJ.ATTACK_STATE_NONE && IsValid(self:GetEnemy()) && (self:GetPos():Distance(self:GetEnemy():GetPos()) < 500) ) or (IsValid(self.VJ_TheController) && self.VJ_TheController:KeyDown(IN_RELOAD))) then
		--make sure we're available to pull out a crab, or if the player controller pressed R
		self:Breeder_PulloutHeadcrab()
	end
	
	if self.BreederAttackMode == 0 && !self:BusyWithActivity() && self.BreederBabycrabCount == 0 && self.BreederMaxBabycrabCount > 0 && CurTime() > self.Breeder_NextBabycrabTime && ( (self.VJ_IsBeingControlled == false && !plyControlled && self.AttackState == VJ.ATTACK_STATE_NONE && IsValid(self:GetEnemy()) && (self:GetPos():Distance(self:GetEnemy():GetPos()) < 950) ) or (IsValid(self.VJ_TheController) && self.VJ_TheController:KeyDown(IN_DUCK))) then
		--begin the spewing when valid, or if the player controller pressed crouch
		self:Breeder_BeginCrabSpew()
	end
	
--Active spewing code
	if self.BreederAttackMode == 2 && self.BreederBabycrabCount > 0 && CurTime() > self.Breeder_NextBabycrabTime then
		--self:VJ_ACT_PLAYACTIVITY(ACT_GESTURE_RANGE_ATTACK_AR2, false, 0, false, 0, {AlwaysUseGesture = true})
		--self:VJ_ACT_PLAYACTIVITY("vjges_babycrab_shoot_gesture", false, 0, false, 0)
		--self:AddGesture(ACT_GESTURE_RANGE_ATTACK_AR2, true )
		
		--self.BreederShotBabycrabCount = self.BreederShotBabycrabCount + 1
		self.BreederMaxBabycrabCount = self.BreederMaxBabycrabCount - 1
		
		self:AddLayeredSequence( self:LookupSequence("babycrab_shoot_gesture"), self.BreederBabycrabCount + 1 )
		VJ_EmitSound(self, "vj_hlr/hl1_npc/gonarch/gon_birth1.wav", 50)
		
		--self:SetLayerSequence( self.BreederBabycrabCount + 1, self:LookupSequence("babycrab_shoot_gesture") )
		--self:SetLayerPriority( self.BreederBabycrabCount + 1, self.BreederBabycrabCount )
		--self:SetLayerPriority( self.BreederBabycrabCount + 1, 1 )
		
		if self.BreederBabycrabCount > 1 then nextcrabdelay = math.Rand(0.1,1.1) else nextcrabdelay = 1.2 end
		self.Breeder_NextBabycrabTime = CurTime() + nextcrabdelay --time until shooting next babycrab
		self.BreederBabycrabCount = self.BreederBabycrabCount - 1 --decrease crab from total burst max
		
		--print("headcrabs left: ", self.BreederBabycrabCount, "delay: ", nextcrabdelay)

--Attack has ended, stop spewing
	elseif self.BreederAttackMode == 2 && self.BreederBabycrabCount <= 0 && CurTime() > self.Breeder_NextBabycrabTime then
		self:StopMoving()
		self:RemoveAllGestures() --This fixes baby crab shooting from breaking after being called 14 times
		self:VJ_ACT_PLAYACTIVITY(ACT_RELOAD_SMG1_LOW,true,false,false) --hand lower anim
		--self.BreederShotBabycrabCount = 0
		self:ChangeBreederAttackMode(0) 
		if self.VJ_IsBeingControlled == true then
			self.Breeder_NextBabycrabTime = CurTime() + 5
		else
			self.Breeder_NextBabycrabTime = CurTime() + math.Rand(15,40) --big cooldown
		end
	end
	
	if self.VJ_IsBeingControlled == true then
		if self.BreederAttackMode == 0 then
			if self.VJ_TheController:KeyDown(IN_RELOAD) && self.BreederHeadcrabCount <= 0 && CurTime() > self.Breeder_NextPullHeadcrabTime then 
				self.VJ_TheController:ChatPrint("Out of Headcrabs!") 
				self.Breeder_NextPullHeadcrabTime = CurTime() + 2
			end
		end
	end
end

function ENT:Breeder_PulloutHeadcrab() --Pull out headcrab and go into headcrab attack mode
	self:StopMoving()
	self:VJ_ACT_PLAYACTIVITY(ACT_RELOAD_SHOTGUN,true,1.2,false)
end

function ENT:Breeder_BeginCrabSpew() --Aim with hand and spew out baby crabs!
	self:StopMoving()
	self:VJ_ACT_PLAYACTIVITY(ACT_RELOAD_SMG1,true,false,false)
	self:ChangeBreederAttackMode(2) 
	self.Breeder_NextBabycrabTime = CurTime() + 0.5 -- Delay the spewing until our anim is finished

	if self.VJ_IsBeingControlled == true then 
		self.VJ_TheController:ChatPrint("Spewing Baby Headcrabs") 
	end
end

function ENT:MultipleMeleeAttacks()
	if self.BreederAttackMode == 0 then
		if math.random(1,2) == 1 then
			self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1}
			self.MeleeAttackDamage = 20
		else
			self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK2}
			self.MeleeAttackDamage = 40
		end
	end
end

local vecZ50 = Vector(0, 0, -50)
function ENT:CustomOnEat(status, statusInfo)
	if status == "CheckFood" then
		if self.BreederAttackMode == 1 then -- if we're hungry, drop the crab we're holding
			self:VJ_ACT_PLAYACTIVITY(ACT_SPECIAL_ATTACK1,true,false,false)
		end
		return (statusInfo.owner.BloodData && statusInfo.owner.BloodData.Color == "Red" && self.BreederAttackMode == 0) -- only start eating if the corpse is a human, and we're not at full health - epicplayer
	elseif status == "BeginEating" then
		self:SetIdleAnimation({ACT_GESTURE_RANGE_ATTACK1}, true)
		return self:VJ_ACT_PLAYACTIVITY(ACT_ARM, true, false)
	elseif status == "Eat" then
		VJ_EmitSound(self, "vj_hlr/hl1_npc/bullchicken/bc_bite"..math.random(1, 3)..".wav", 100) --more accurate to the mod - epicplayer
		-- Health changes
		local food = self.EatingData.Ent
		local damage = 15 -- How much damage food will receive
		local foodHP = food:Health() -- Food's health
		self:SetHealth(math.Clamp(self:Health() + ((damage > foodHP and foodHP) or damage), self:Health(), (self:GetMaxHealth() * 2))) -- Give health to the NPC, allow an overload of up to 2x max health.
		food:SetHealth(foodHP - damage) -- Decrease corpse health
		-- Blood effects
		local bloodData = food.BloodData
		if bloodData then
			local bloodPos = food:GetPos() + food:OBBCenter()
			local bloodParticle = VJ_PICK(bloodData.Particle)
			if bloodParticle then
				ParticleEffect(bloodParticle, bloodPos, self:GetAngles())
			end
			local bloodDecal = VJ_PICK(bloodData.Decal)
			if bloodDecal then
				local tr = util.TraceLine({start = bloodPos, endpos = bloodPos + vecZ50, filter = {food, self}})
				util.Decal(bloodDecal, tr.HitPos + tr.HitNormal + Vector(math.random(-45, 45), math.random(-45, 45), 0), tr.HitPos - tr.HitNormal, food)
			end
		end
		return 1
	elseif status == "StopEating" then
		if statusInfo != "Dead" && self.EatingData.AnimStatus != "None" then -- Do NOT play anim while dead or has NOT prepared to eat
			return self:VJ_ACT_PLAYACTIVITY(ACT_DISARM, true, false)
		end
	end
	return 0
end

function ENT:Controller_IntMsg(ply)
	ply:ChatPrint("JUMP: Detach Own Headcrab | MOUSE2: Throw Baby Barnacle")
	ply:ChatPrint("RELOAD: Pull Out Headcrab | CROUCH: Spew Baby Headcrabs")
end