#5900
Yahg quest greet~
0 h 100
-1~
if %actor.questdone(5900)% && %actor.is_pc%
  wait 1 sec
  say Thank you %actor.name%, for you help in finding my friend.
elseif %actor.is_pc%
  wait 3
  say Wait %actor.race%!  Come here quietly.  I am in desperate need of help!
  wait 15
  say Please do me favor(quest list).  My friend has gone missing.
end
~
#5901
Tahgoth ghost upon quest item get~
1 g 100
~
wait 3
%echo% A half-orc 	Wghost	n appears suddenly before you.
wait 13
%echo% The 	Wghost	n of Tahgoth says, "Please return this amulet to Yahg.  He will know what do with it."
wait 28
%echo% The 	Wghost	n of Tahgoth says, "The magic these humans are using here is sacrificial, they must be stopped..."
wait 28
%echo% A half-orc 	Wghost	n fades away slowly...
wait 28
%echo% A faint voice says, "...don't forget, %actor.race%...the mages 	RNEED	n to be stopped..."
wait 9
%echo% The 	Wghost	n can no longer be seen.
~
#5902
burning corpse smell~
0 i 100
~
* No Script
~
#5903
smell trig for room 5904~
2 g 100
~
if !%actor.questdone(5900)% && %actor.is_pc%
wait 4
%echo% There is an awful 	rburning	n smell coming from the north.
end
~
#5904
smell trig for room 5909~
2 g 100
~
if !%actor.questdone(5900)% && %actor.is_pc%
wait 4
%echo% There is an awful 	rburning	n smell coming from the east.
end
~
#5905
smell trig for room 5912~
2 g 100
~
if !%actor.questdone(5900)% && %actor.is_pc%
wait 4
%echo% There is an awful 	rburning	n smell coming from the south.
end
~
#5906
smell trig for room 5906~
2 g 100
~
if !%actor.questdone(5900)% && %actor.is_pc%
wait 4
%echo% There is an awful 	rburning	n smell coming from the west.
end
~
#5907
strength spell rune~
1 c 4
touch~
%echo% A 	Bblue 	bmist	n rises from the rune and surrounds your body.
Wait 10
dg_cast 'strength' %actor%
~
#5908
magic missile spell rune~
1 c 4
touch~
%echo% A 	Rmagical	n 	rmissile	n rises from the rune and strikes your body.
Wait 10
dg_cast 'magic missile' %actor%
~
#5909
cleric flick candle~
0 h 100
~
wait 5
%echo% The cleric snaps her fingers and magically a candle starts to 	Wb	Yu	Wr	Yn	n.
wait 3
giggle
~
#5910
pull torch teleport~
1 c 4
pull~
%send% %actor% You reach out and grab a hold of the torch.  You pull it towards yourself.
%echoaround% %actor% %actor.name% reaches out and grabs hold of the torch. %actor.heshe% pulls it down like a lever. A black portal emerges and violently engulfs %actor.name%.  They disappear. 
wait 5 sec
%send% %actor% -Click-
Wait 3 sec
%send% %actor% A dark portal emerges and violently engulfs you into darkness.  Excruciating pain rips through your body as you are taken to the void.
wait 7 sec
%send% %actor% Your body is spinning and twirling in the nothingness of the void.  Thoughts of floating here eternally cross your mind.
%echoaround% A dark portal opens out of thin air and %actor% %actor.name% falls out screaming. %actor.heshe% hits the ground disheveled and confused.
Wait 7 sec
%send% %actor% You fall out of the dark portal, confused disheveled and completely lost. You look up.
Wait 4 sec
%teleport% %actor% 5942
%force% %actor% look
~
#5911
dissolve on drop~
1 h 100
~
%send% %actor% %self.shortdesc% drops to the ground, and dissolves.
%purge% %self%
~
#5912
Essence Key Assemble Script~
1 c 2
combine~
if %actor.inventory(5919)% && %actor.inventory(5920)% && %actor.inventory(5921)% && %actor.inventory(5922)% && %actor.inventory(5923)%
  %purge% %actor.inventory(5919)
  %purge% %actor.inventory(5920)
  %purge% %actor.inventory(5921)
  %purge% %actor.inventory(5922)
  %load% obj 5916 %actor%
  %send% %actor% You combine the elemental essences together, and form a key!
  %echoaround% %actor% %actor.name% combines the elemental essences together!
  %purge% %actor.inventory(5923)
else
  %send% %actor% You lack the required essences!
  %echoaround% %actor% %actor.name% tries to combine the essences, but fails...
end
~
#5913
curator sigh book teleport~
0 h 100
~
if %actor.is_pc%
  wait 5
  %echo% The curator mumbles to himself, 'We should have never let go of this book.  Now anybody in the realm can teleport wherever they want.  This was supposed to be our power and only our power.'
  wait 14
  %echo% The curator slides the original copy of "Name of Book(Taure)" onto the shelf.
  wait 9
  sigh
end
~
#5914
summon creature iii and attack actor, master summoner~
0 h 100
~
if %actor.is_pc% && %actor_level% < 10
  wait 1 sec
  say Well, well, well. You have caused quite the ruckus here %actor.name%.
  wait 4 sec
  say  I can not say I am pleased with what I have seen either.
  wait 4 sec
  say I think my friend and I will make this your last stop in the mansion.
  wait 4 sec
  dg_cast 'summon creature iii'
  wait 10 sec
  order followers kill %actor.name%
  kill %actor.name%
end
~
#5915
purge portal after use~
2 c 100
enter~
wait 2 sec
%purge% portal
~
#5916
lady raven portal enter~
2 g 100
~
if %actor.is_pc% && %actor_level% < 12
  wait 1 sec
  %force% lady grin
  Wait 2 sec
  %force% lady say %actor.name%, why must you cause so many troubles in my mansion?
  wait 4 sec
  %force% lady say  What we do here is none of your business.
  wait 4 sec
  %force% lady say I am feeling generous today and will give you a chance to leave.  Take this portal and don't come back.
  wait 4 sec
  %echo% Lady Raven opens her right hand and black smoke comes out and forms a portal next to her.
  if !%self.contents(5936)%
    %load% obj 5936
  end
  wait 4 sec
  %force% lady say If you choose not to leave now, your corpse will remain in the void for an eternity.
end
~
$~
