Scriptname _aaaStatsScript extends ObjectReference  

int Property HealthCol  Auto
int Property StaminaCol Auto
int Property MagickaCol Auto

float HealthColEx
float StaminaColEx
float MagickaColEx

formlist property ItemList auto
ObjectReference property Chest auto

;Вошёл в локацию
Event OnTriggerEnter(ObjectReference akActionREF)

   actor Player = game.GetPlayer() 

   Float fPlayerHealRate = Player.GetActorValue("HealRate")

   if akActionREF == Player

        int PlayerInventoryCount = Player.GetItemCount(ItemList as form)
        Player.RemoveItem(ItemList as form, PlayerInventoryCount, true, Chest) 

        HealthColEx = Player.GetActorValue("Health")
        StaminaColEx = Player.GetActorValue("Stamina")
        MagickaColEx = Player.GetActorValue("Magicka")

        Player.ModActorValue("Health", HealthCol)
        Player.ModActorValue("Stamina", StaminaCol)
        Player.ModActorValue("Magicka", MagickaCol)
        Player.SetActorValue("HealRate", -1)
	; disable save
	Game.SetInChargen(true, true, true)

   endif
EndEvent

;Вышел из локации
Event OnTriggerLeave(ObjectReference akActionREF)

          actor Player = game.GetPlayer() 
           Float fPlayerHealRate = Player.GetActorValue("HealRate")

    if akActionREF == Player

        int ChestInventoryCount = Chest.GetItemCount(ItemList as form)
        Chest.RemoveItem(ItemList as form, ChestInventoryCount, true, Player as ObjectReference)

        Player.ForceActorValue("health", HealthColEx)
        Player.ForceActorValue("Stamina", StaminaColEx)
        Player.ForceActorValue("Magicka", MagickaColEx)
        Player.ForceActorValue("HealRate", 10)

	;enable saving
	Game.SetInChargen(false, true, true)

   endif
EndEvent

