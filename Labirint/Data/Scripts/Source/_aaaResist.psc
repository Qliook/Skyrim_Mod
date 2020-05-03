Scriptname _aaaResist extends ObjectReference  

Spell property mySpell auto
objectReference property StaticPotion auto

;******************************************************

Auto State waiting
	Event onActivate(objectReference triggerRef)
			mySpell.Cast(game.getPlayer(), game.getPlayer())
			Self.Disable()
			StaticPotion.Disable()
	endEvent
endSTATE

;******************************************************