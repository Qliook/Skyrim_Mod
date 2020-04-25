Scriptname _aaaTestWaterScript extends ObjectReference  

float cor_X
float cor_Y 

float Property cor_Z Auto
float Property cor_Z_Slow Auto

float Property FirstSpeed Auto
float Property SecondSpeed Auto

float Speed

Event OnActivate(ObjectReference akActionRef)

    cor_x = Self.GetPositionX()
    cor_Y = Self.GetPositionY()

    if Self.GetPositionZ() >= cor_Z_Slow
        Speed = FirstSpeed
    else
        Speed = SecondSpeed
    endif

    Self.TranslateTo(cor_X, cor_Y, cor_Z, 0, 0, 0, Speed, 0)

EndEvent