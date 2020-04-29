Scriptname _aaaOpenDoors extends ObjectReference  

import debug
import utility

ObjectReference Property Lever1 auto
ObjectReference Property Lever2 auto
ObjectReference Property Lever3 auto
ObjectReference Property Lever4 auto
ObjectReference Property Lever5 auto
ObjectReference Property Lever6 auto
ObjectReference Property Lever7 auto
ObjectReference Property Lever8 auto
ObjectReference Property Lever9 auto
ObjectReference Property Lever10 auto

ObjectReference Property Door1 auto
ObjectReference Property Door2 auto
ObjectReference Property Door3 auto
ObjectReference Property Door4 auto
ObjectReference Property Door5 auto
ObjectReference Property Door6 auto
ObjectReference Property Door7 auto
ObjectReference Property Door8 auto
ObjectReference Property Door9 auto
ObjectReference Property Door10 auto

Bool Lever1Up = False
Bool Lever2Up = False
Bool Lever3Up = False
Bool Lever4Up = False
Bool Lever5Up = False
Bool Lever6Up = False
Bool Lever7Up = False
Bool Lever8Up = False
Bool Lever9Up = False
Bool Lever10Up = False

Auto STATE WaitingForPlayer
  EVENT onActivate (objectReference triggerRef)
;     Debug.Trace("Activation in Waiting for Player State")
    if (triggerRef == Lever1)
      Door8.Activate(Self)
      Door3.Activate(Self)
      Door5.Activate(Self)
      Door7.Activate(Self)
      Door9.Activate(Self)
      if (Lever1Up)
        Lever1Up = False
        Lever1.playAnimationandWait("FullPull","FullPulledDown")
      Else
        Lever1Up = True
        Lever1.playAnimationandWait("FullPush","FullPushedUp")
      EndIf
      GotoState("WaitingForPlayer")
    ElseIf (triggerRef == Lever2)
      Door2.Activate(Self)
      Door4.Activate(Self)
      Door6.Activate(Self)
      Door8.Activate(Self)
      Door10.Activate(Self)
      Door1.Activate(Self)
      if (Lever2Up)
        Lever2Up = False
        Lever2.playAnimationandWait("FullPull","FullPulledDown")
      Else
        Lever2Up = True
        Lever2.playAnimationandWait("FullPush","FullPushedUp")
      EndIf
      GotoState("WaitingForPlayer")
    ElseIf (triggerRef == Lever3)
      Door1.Activate(Self)
      Door2.Activate(Self)
      Door3.Activate(Self)
      Door7.Activate(Self)
      Door8.Activate(Self)
      Door9.Activate(Self)
      if (Lever3Up)
        Lever3Up = False
        Lever3.playAnimationandWait("FullPull","FullPulledDown")
      Else
        Lever3Up = True
        Lever3.playAnimationandWait("FullPush","FullPushedUp")
      EndIf
      GotoState("WaitingForPlayer")
    ElseIf (triggerRef == Lever4)
      Door8.Activate(Self)
      Door4.Activate(Self)
      Door7.Activate(Self)
      Door10.Activate(Self)
      if (Lever4Up)
        Lever4Up = False
        Lever4.playAnimationandWait("FullPull","FullPulledDown")
      Else
        Lever4Up = True
        Lever4.playAnimationandWait("FullPush","FullPushedUp")
      EndIf
      GotoState("WaitingForPlayer")
    ElseIf (triggerRef == Lever5)
      Door1.Activate(Self)
      Door2.Activate(Self)
      Door4.Activate(Self)
      Door5.Activate(Self)
      Door7.Activate(Self)
      Door8.Activate(Self)
      if (Lever5Up)
        Lever5Up = False
        Lever5.playAnimationandWait("FullPull","FullPulledDown")
      Else
        Lever5Up = True
        Lever5.playAnimationandWait("FullPush","FullPushedUp")
      EndIf
      GotoState("WaitingForPlayer")
    ElseIf (triggerRef == Lever6)
      Door10.Activate(Self)
      Door6.Activate(Self)
      Door3.Activate(Self)
      Door1.Activate(Self)
      if (Lever6Up)
        Lever6Up = False
        Lever6.playAnimationandWait("FullPull","FullPulledDown")
      Else
        Lever6Up = True
        Lever6.playAnimationandWait("FullPush","FullPushedUp")
      EndIf
      GotoState("WaitingForPlayer")
    ElseIf (triggerRef == Lever7)
      Door1.Activate(Self)
      Door2.Activate(Self)
      Door3.Activate(Self)
      Door5.Activate(Self)
      Door8.Activate(Self)
      if (Lever7Up)
        Lever7Up = False
        Lever7.playAnimationandWait("FullPull","FullPulledDown")
      Else
        Lever7Up = True
        Lever7.playAnimationandWait("FullPush","FullPushedUp")
      EndIf
      GotoState("WaitingForPlayer")
    ElseIf (triggerRef == Lever8)
      Door9.Activate(Self)
      Door2.Activate(Self)
      Door3.Activate(Self)
      Door5.Activate(Self)
      Door6.Activate(Self)
      if (Lever8Up)
        Lever8Up = False
        Lever8.playAnimationandWait("FullPull","FullPulledDown")
      Else
        Lever8Up = True
        Lever8.playAnimationandWait("FullPush","FullPushedUp")
      EndIf
      GotoState("WaitingForPlayer")
    ElseIf (triggerRef == Lever9)
      Door2.Activate(Self)
      Door4.Activate(Self)
      Door6.Activate(Self)
      Door8.Activate(Self)
      Door9.Activate(Self)
      Door10.Activate(Self)
      if (Lever9Up)
        Lever9Up = False
        Lever9.playAnimationandWait("FullPull","FullPulledDown")
      Else
        Lever9Up = True
        Lever9.playAnimationandWait("FullPush","FullPushedUp")
      EndIf
      GotoState("WaitingForPlayer")
    ElseIf (triggerRef == Lever10)
      Door1.Activate(Self)
      Door2.Activate(Self)
      Door3.Activate(Self)
      Door4.Activate(Self)
      Door5.Activate(Self)
      Door7.Activate(Self)
      if (Lever10Up)
        Lever10Up = False
        Lever10.playAnimationandWait("FullPull","FullPulledDown")
      Else
        Lever10Up = True
        Lever10.playAnimationandWait("FullPush","FullPushedUp")
      EndIf
      GotoState("WaitingForPlayer")
    EndIf
  EndEvent
EndState

STATE WaitingForLever
  Event onActivate(objectReference triggerRef)
;     Debug.Trace("Activation in Waiting for Lever State")
    ;Do Nothing
  EndEvent
EndState