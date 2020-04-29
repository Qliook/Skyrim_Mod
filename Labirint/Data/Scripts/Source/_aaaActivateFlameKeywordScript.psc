Scriptname _aaaActivateFlameKeywordScript extends ObjectReference  

Keyword property LinkCustom01 Auto
Keyword property LinkCustom02 Auto
Keyword property LinkCustom03 Auto
Keyword property LinkCustom04 Auto
Keyword property LinkCustom05 Auto
Keyword property LinkCustom06 Auto
Keyword property LinkCustom07 Auto
Keyword property LinkCustom08 Auto
Keyword property LinkCustom09 Auto
Keyword property LinkCustom10 Auto
Keyword property aaaSoundLink Auto

Sound Property FXFireFlameStart auto

Auto State Waiting
	Event onActivate(ObjectReference triggerRef)
		GetLinkedRef().DisableNoWait()
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
		EndIf
		if (GetLinkedRef(LinkCustom06) != None)
			GetLinkedRef(LinkCustom06).EnableNoWait()
		EndIf
		if (GetLinkedRef(LinkCustom07) != None)
			GetLinkedRef(LinkCustom07).EnableNoWait()
		EndIf
		if (GetLinkedRef(LinkCustom08) != None)
			GetLinkedRef(LinkCustom08).EnableNoWait()
		EndIf
		if (GetLinkedRef(LinkCustom09) != None)
			GetLinkedRef(LinkCustom09).EnableNoWait()
		EndIf
		if (GetLinkedRef(LinkCustom10) != None)
			GetLinkedRef(LinkCustom10).EnableNoWait(False)
		EndIf
		If (GetLinkedRef(aaaSoundLink) != None)
			FXFireFlameStart.Play(GetLinkedRef(aaaSoundLink))
		EndIf
		
		GoToState("Done")
	EndEvent
EndState

State Done
	;do nothing
EndState