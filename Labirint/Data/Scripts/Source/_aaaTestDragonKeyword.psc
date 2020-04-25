Scriptname _aaaTestDragonKeyword extends ObjectReference  

; spells that can trigger this
Spell property triggerSpell1 auto		
Spell property triggerSpell2 auto		
Spell property triggerSpell3 auto		

Actor Property Dragon Auto  

Keyword property LinkCustom01 Auto
Keyword property LinkCustom02 Auto
Keyword property LinkCustom03 Auto
Keyword property LinkCustom04 Auto
Keyword property LinkCustom05 Auto
;************************************

auto State Waiting
	
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		Spell akSpell = akSource as Spell
; 		debug.trace(self + "OnHit by Spell=" + akSource)
		if akSpell
			if (triggerSpell1 && akSpell == triggerSpell1) || (triggerSpell2 && akSpell == triggerSpell2) || (triggerSpell3 && akSpell == triggerSpell3)
				if (GetLinkedRef(LinkCustom01) != None)
					GetLinkedRef(LinkCustom01).EnableNoWait()
				EndIf
				if (GetLinkedRef(LinkCustom02) != None)
					GetLinkedRef(LinkCustom02).EnableNoWait()
				EndIf
				if (GetLinkedRef(LinkCustom03) != None)
					GetLinkedRef(LinkCustom03).EnableNoWait()
				EndIf
				if (GetLinkedRef(LinkCustom04) != None)
					GetLinkedRef(LinkCustom04).EnableNoWait()
				EndIf
				if (GetLinkedRef(LinkCustom05) != None)
					GetLinkedRef(LinkCustom05).EnableNoWait()
				Dragon.EnableNoWait(self)	
				EndIf
			endif
		endif
	endEvent
endState