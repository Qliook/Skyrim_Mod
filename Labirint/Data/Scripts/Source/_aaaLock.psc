Scriptname _aaaLock extends ObjectReference  

message property MessageAct auto

 Event OnInit()
BlockActivation()
EndEvent
Event OnActivate (ObjectReference akActionRef)
MessageAct.show()
endEvent