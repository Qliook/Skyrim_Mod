Scriptname _aaaBattleScript extends ObjectReference 
 
import utility

;Formlist property ListBoss auto
;{List �����}

Formlist property ListEnemy auto
{List NPC}

int property ColVoEnemy auto
{Total number of spawn NPC}

int property minEnemy auto
{Min amount of spawn NPC}

int property maxEnemy auto
{Max amount of spawn NPC}

spell property MGTimeTeleportOutEffect auto 
{Visual appearance effect NPC}

MusicType property BatlleMusic auto

ObjectReference property LightOn auto
ObjectReference property Object1 auto
ObjectReference property Object2 auto
ObjectReference property Object3 auto
ObjectReference property Object4 auto
ObjectReference property Object5 auto
ObjectReference property LastActivate auto
ObjectReference[] property SpawnEnemy auto
{Spawn point NPC}

int NowEnemy
int RegulInt
int i	

Auto State Waiting
  Event onActivate(ObjectReference triggerRef)

    ;������ ������ � ������
  	wait(4)

  	Object1.Activate(self)
  	Object2.Activate(self)
  	Object3.Activate(self)
  	Object4.Activate(self)
  	Object5.Activate(self)

  	BatlleMusic.Add()
;�������� ����� ������� ����
	wait(9)
    Debug.MessageBox("������ ����� �����")

    NowEnemy = 0
    i = 0
    RegulInt = Utility.RandomInt(minEnemy, maxEnemy)

    While i < RegulInt
      int g = Utility.RandomInt(0, (SpawnEnemy.Length - 1 ))

	    SpawnEnemy[g].placeatme(ListEnemy.GetAt(Utility.RandomInt(0, (ListEnemy.GetSize() - 1 ))))
      SpawnEnemy[g].placeatme(MGTimeTeleportOutEffect)
      i +=1
    EndWhile

    Debug.MessageBox("���������� ������ = " + RegulInt) 
    RegisterForUpdate(1)     
  EndEvent
EndState

Event OnUpdate()

  wait(1.0)

	if game.GetPlayer().IsInCombat()
  	else       

		NowEnemy += i
		Debug.MessageBox("���������� ������ = " + NowEnemy)

		;���� ��� ����� ��������
		if ColVoEnemy > NowEnemy + maxEnemy
      
    		i = 0
    		RegulInt = Utility.RandomInt(minEnemy, maxEnemy)

   			;�������� ����� �������(�����������)
			wait(3.0)

			While i < RegulInt
			int g = Utility.RandomInt(0, (SpawnEnemy.Length - 1 ))
			SpawnEnemy[g].placeatme(ListEnemy.GetAt(Utility.RandomInt(0, (ListEnemy.GetSize() - 1 ))))
			SpawnEnemy[g].placeatme(MGTimeTeleportOutEffect)
			i +=1
		EndWhile

			Debug.MessageBox("��������� �����. ���-�� ������ = " + RegulInt)
			;���� ��� �������� ������ ��� ����������� �������� ����������
    else
		RegulInt = ColVoEnemy - NowEnemy
		i = 0
		;�������� ����� �������(����������)
		wait(5.0)

		While i < RegulInt
        int g = Utility.RandomInt(0, (SpawnEnemy.Length - 1 ))
        SpawnEnemy[g].placeatme(ListEnemy.GetAt(Utility.RandomInt(0, (ListEnemy.GetSize() - 1 ))))
        SpawnEnemy[g].placeatme(MGTimeTeleportOutEffect)
        i +=1
	EndWhile 

        Debug.MessageBox("�������� ����� " + (ColVoEnemy - NowEnemy))
        UnregisterForUpdate()

       ; SpawnEnemy[Utility.RandomInt(0, (SpawnEnemy.Length - 1 ))].placeatme(ListBoss.GetAt(Utility.RandomInt(0, (ListBoss.GetSize() - 1 ))))

        wait(3.0) 
		;��������� ������ � ���������� ������
  		Object1.Activate(self)
  		Object2.Activate(self)
  		Object3.Activate(self)
  		Object4.Activate(self)
  		Object5.Activate(self)
		LastActivate.Activate(self)

  		BatlleMusic.Remove()
    endif
  endif
EndEvent
