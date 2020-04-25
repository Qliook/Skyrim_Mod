Scriptname _aaaPlayerLevel_ extends ObjectReference  

objectReference property objectfalse auto
objectReference property objecttrue auto
message property nolvl auto
int property MinLevel = 1 Auto

Event onTriggerEnter(objectReference akActionRef)
    if akActionRef == Game.GetPlayer()
        if (Game.GetPlayer().GetLevel() <= MinLevel)
			nolvl.show()
        elseif (Game.GetPlayer().GetLevel() >= MinLevel)
			objecttrue.enable(self)
			objectfalse.disable(self)
        endIf
    endIf
EndEvent