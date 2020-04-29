Scriptname _aaaBattleScript extends ObjectReference 
 
import utility

Formlist property ListEnemy auto
ObjectReference[] property SpawnEnemy auto

int property CountEnemy auto
int property maxWaveEnemy auto
int property minWaveEnemy auto
int EnemyKilled = 0

bool property Boss = false auto
Formlist property ListBoss auto
bool SpavnBoss = true
bool LastWave = true

int property WaitBeforeFight = 0 auto
int property WaitBeforeNextWave = 0 auto
int property WaitBeforeBossWave = 0 auto
int property WaitBeforeDoorClosed = 0 auto

ObjectReference[] property Doors auto
ObjectReference property LastActivate auto

MusicType property BatlleMusic auto

Auto State Waiting
	Event onActivate(ObjectReference triggerRef)
		;Debug.MessageBox("Бой начался")
		StartFight()
	EndEvent
EndState

Event OnUpdate()	
	;Волны с мобами
	if (CountEnemy > EnemyKilled + maxWaveEnemy) && (game.GetPlayer().IsInCombat() == false)
		int SpawnCount = Utility.RandomInt(minWaveEnemy, maxWaveEnemy)
		SpawnMob(SpawnCount)		
	elseif(CountEnemy < EnemyKilled + maxWaveEnemy) && (game.GetPlayer().IsInCombat() == false) && (LastWave)
		int SpawnCount = (CountEnemy - EnemyKilled)
		SpawnMob(SpawnCount)
		if(Boss == false)
			UnRegisterForUpdate()
			EndFight()
		else
			LastWave = false 
		endif
		;Волна с боссом
	elseif(CountEnemy == EnemyKilled) && (game.GetPlayer().IsInCombat() == false) && (Boss) && (SpavnBoss)
		Wait(WaitBeforeBossWave)
		int g = Utility.RandomInt(0, (SpawnEnemy.Length - 1 ))
		SpawnEnemy[g].placeatme(ListBoss.GetAt(Utility.RandomInt(0, (ListBoss.GetSize() - 1 ))))
		;Debug.MessageBox("Босс заспавлен")
		Wait(1)
		SpavnBoss = false
	endif
	if (SpavnBoss == false) && (game.GetPlayer().IsInCombat() == false) 
		EndFight()
		UnRegisterForUpdate()
	endif
EndEvent

Function StartFight()
	if(ListEnemy.GetSize() == 0)
		Debug.MessageBox("Список мобов пуст")
	elseif(SpawnEnemy.Length == 0)
		Debug.MessageBox("Список спавнов отсутсвует")
	elseif(ListBoss.GetSize() == 0) && (Boss)
		Debug.MessageBox("Список боссов пуст")
	elseif(Doors.Length == 0)
		Debug.MessageBox("Список дверей пуст")
	endif
	;Конец проверки и запуск Update()
	ClosedDoor()
	Wait(WaitBeforeFight)
	BatlleMusic.Add()
	RegisterForUpdate(2) 	
EndFunction

Function EndFight()
	OpenDoor()
	BatlleMusic.Remove()
EndFunction

Function ClosedDoor()
	Wait(WaitBeforeDoorClosed)
	int i = 0
	While i <= (Doors.Length - 1)
		Doors[i].Activate(self)
		Doors[i].BlockActivation()
		;Debug.MessageBox("дверь закрылась")
		i += 1
	EndWhile
	Wait(1)
EndFunction

Function OpenDoor()
	int i = 0
	While i <= (Doors.Length - 1)
		Doors[i].BlockActivation(false)
		Doors[i].Activate(self)
		LastActivate.Activate(self)
		;Debug.MessageBox("дверь открылась")
		i += 1
	EndWhile
	Wait(1)
EndFunction

Function SpawnMob(int SpawnCount)
	Wait(WaitBeforeNextWave)
	int i = 0
	While i < SpawnCount
		int g = Utility.RandomInt(0, (SpawnEnemy.Length - 1 ))
		SpawnEnemy[g].placeatme(ListEnemy.GetAt(Utility.RandomInt(0, (ListEnemy.GetSize() - 1 ))))
		EnemyKilled += 1
		i += 1
	EndWhile
	;Debug.MessageBox("Заспавленно = " + i)
	Wait(1)
EndFunction