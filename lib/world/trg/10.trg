#1000
Orme TD Mob Raid Level 1 Script~
0 b 40
~
set actor %self%
eval room %self.room%
if %self.hitp% > -11
  while %room.vnum% != 1014
    if %self.fighting%
      wait 10 sec
      say Must destroy the crystal!
    else
      wait 7 sec
      eval room %room.vnum% + 1
      %echo% %self.name% moves closer to the crystal!
      %teleport% %self% %room.vnum%
      %echo% %self.name% has arrived.
      wait 1 sec
      growl
      wait 5 sec
    end
  done
  if %room.vnum% == 1014
    if %actor.fighting.vnum% != 1002
      wait 5 sec
      mkill crystal
    end
  end
end
~
#1001
Orme TD Tower Engage Script~
0 e 0
growls.~
if %actor.is_pc%
  return 0
  halt
elseif !%actor.is_pc%
  if %self.vnum(1001)%
    dg_cast 'magic missile' %actor%
  elseif %self.vnum(1004)%
    dg_cast 'fireball' %actor%
  end
end
~
#1002
Orme TD Tower Combat Script~
0 k 100
~
if %self.vnum(1001)%
  dg_cast 'magic missile' %actor%
elseif %self.vnum(1004)%
  dg_cast 'fireball' %actor%
end
~
#1003
Orme TD Mob Spawn Script~
1 c 100
en~
if %cmd.mudcommand% == enter && %arg% == portal
  if %actor.is_pc%
    eval room %actor.room%
    %send% %actor% As you attempt to enter the portal, a rift is formed in space!
    %echoaround% %actor% As %actor.name% touches the portal, a rift is formed!
    %at% 1014 %load% mob 1002
    set TD_total_npc 20
    remote TD_total_npc %global%
    set loops 20
    while %loops% != 0
      eval loops %loops% - 1
      wait 10 sec
      %load% mob 1000
      %echo% An orc has arrived through the portal!
    done
    if %loops% == 0
      wait 4 sec
      %echo% The portal closes in on itself...
      %purge% %self%
    end
  end
else
  return 0
end
~
#1004
Orme TD Tower Corpse Script~
0 f 100
~
%echo% 	R%self.name% 	Rexplodes in a violent display of colors!	n
%teleport% %self% 0
~
#1005
Orme TD Crystal Death Script~
0 f 100
~
%zoneecho% 1000 %self.name% has been destroyed!
%teleport% %self% 1001
set room_var %self.room%
set target_char %room_var.people%
while %target_char%
  set tmp_target %target_char.next_in_room%
  if %target_char.vnum% == 1003
    %zoneecho% 1000 Attaching Zone Purge Trigger to %target_char.name%!
    attach 1006 %target_char.id%
    %teleport% %self% 0
  end
  set target_char %tmp_target%
done
%teleport% %self% 0
~
#1006
Orme TD Zone Purge Level 1~
0 ab 100
~
set cycle 1014
%zoneecho% 1000 Purging Zone!
while %cycle% != 1001
  %teleport% %self% %cycle%
  %zoneecho% 1000 At %cycle% Purging!
  %purge%
  eval cycle %cycle% - 1
done
%teleport% %self% 1001
%zoneecho% 1000 Zone Purged - Detaching Self
detach 1006 %self.id%
~
#1007
Orme TD Crystal Victory Script~
0 ab 100
~
%zoneecho% 1000 %global.TD_total_npc% mobs left !
if %global.TD_total_npc% > 0
else
  %zoneecho% 1000 %self.name% has been saved!
  %teleport% %self% 1001
  set room_var %self.room%
  set target_char %room_var.people%
  while %target_char%
    set tmp_target %target_char.next_in_room%
    if %target_char.vnum% == 1003
      %zoneecho% 1000 Attaching Zone Purge Trigger to %target_char.name%!
      attach 1006 %target_char.id%
      %purge% %self%
    end
    set target_char %tmp_target%
  done
end
~
#1008
Orme TD Mob Death Script~
0 f 100
~
eval TD_total_npc %global.TD_total_npc% - 1
remote TD_total_npc %global%
~
#1009
Orme TD Mage Greet~
0 e 0
hand and greets you.~
if %actor.level% >= 31
  wait 3 sec
  %load% obj 1002
  kneel
  wait 3 sec
  give globe %actor.name%
  wait 3 sec
  say Master %actor.name%...
elseif %actor.varexists(has_greeted_gate_keeper)
  wait 3 sec
  nod
  wait 3 sec
  say Hello again.
  if !%actor.has_item(1002)%
    %load% obj 1002
    wait 3 sec
    give globe %actor.name%
  end
else
  set has_greeted_gate_keeper 1
  remote has_greeted_gate_keeper %actor.id%
  if !%actor.has_item(1002)%
    rdelete fb_left %actor.id%
    rdelete mm_left %actor.id%
    %load% obj 1002
    wait 3 sec
    peer
    wait 3 sec
    say Welcome %actor.name%!
    wait 3 sec
    say Soon, a dark elemental will send his minions through this portal.
    wait 3 sec
    pace
    wait 3 sec
    say I have focused my powers into this.  It will allow you to summon magical defenses.
    wait 3 sec
    give globe %actor.name%
    wait 3 sec
    say Enter the portal when your mystic blockade is in place, and protect the crystal at all cost!
  end
end
~
#1010
Orme ROSSA Mob Teleport RANDOM Script~
0 ab 100
~
set timer 0
while %timer% < 10
  wait 10 sec
  %teleport% %self% 1000
  %load% obj 1011
  drop portal
  enter portal
  eval room %self.room%
  gos I am at %room.name%
  eval timer %timer% + 1
done
%teleport% %self% 1000
say Bye!
%purge% %self%
~
#1011
Orme ROSSA Mob Quest Script~
0 g 100
~
if %actor.is_pc% && %actor.level% < 31
  wait 1 sec
  say You found me!
  gossip %actor.name% has found me!
  %load% obj 1010
  give voucher %actor.name%
else
end
~
#1012
Orme ROSSA Mob Quest Control Script~
0 d 1
*~
if %actor.is_pc% && %actor.level% > 30
  switch %speech.car%
    case quest
      if %speech.cdr% == start
        say Ok! Starting Quest
        gos A quest has started!  Come find me if you can!
        attach 1010 %self.id%
      elseif %speech.cdr% == stop
        say Ok! Stopping Quest Now!
        gos You are no fun!  I'm going home!
        detach 1010 %self.id%
      end
    break
    default
      return 0
    break
  done
end
~
#1030
Orme Summoner ShowStat Script~
1 c 1
*~
if %cmd% == showstat
  %send% %actor% 	C-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-	n
  %send% %actor% 	WMagic Missile Towers Left: 	R%actor.mm_left%	n
  %send% %actor% 	WFireball Towers Left:      	R%actor.fb_left%	n
  %send% %actor% 	C-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-	n
  %send% %actor% type 'place fireball' to set a fireball tower
  %send% %actor% type 'place missile' to set a magic missile tower
else
  return 0
end
~
#1031
Orme Summoner Wear Script~
1 j 100
~
if !%actor.varexists(mm_left)%
  set mm_left 3
  remote mm_left %actor.id%
end
if !%actor.varexists(fb_left)%
  set fb_left 3
  remote fb_left %actor.id%
end
~
#1032
Orme Summoner Control Script~
1 c 1
place~
if %cmd% == place
  if %arg% == missile
    if %actor.mm_left% > 0
      %send% %actor% Placing Magic Missile Tower
      %load% mob 1001
      eval mm_left %actor.mm_left% - 1
      remote mm_left %actor.id%
    else
      %send% %actor% You cannot place any more Magic Missile Towers!
    end
  elseif %arg% == fireball
    if %actor.fb_left% > 0
      %send% %actor% Placing Fireball Tower
      %load% mob 1004
      eval fb_left %actor.fb_left% - 1
      remote fb_left %actor.id%
    else
      %send% %actor% You cannot place any more Fireball Towers!
    end
  else
    %send% %actor% Place what\?  Type 'showstat' to see how.
  end
else
end
~
#1033
Orme Summoner Stay Zone Script~
1 ab 100
~
if %self.worn_by%
  set actor %self.worn_by%
  eval room %actor.room%
  if (%room.vnum% >= 1000) && (%room.vnum% <= 1099)
    return 0
    halt
  else
    %send% %actor% %self.shortdesc% 	Rshatters as you leave the zone!	n
    rdelete mm_left %actor.id%
    rdelete fb_left %actor.id%
    return 0
    %purge% %self%
  end
end
~
#1047
Orme Weapon Basic Variable Detach Script~
1 c 3
*~
if %self.worn_by%
  eval actor %self.worn_by%
  if !%actor.fighting% && %actor.varexists(has_attached_xp_script)%
    rdelete has_attached_xp_script %actor.id%
    %send% %actor% 	C-=- 	BYour 	n%self.shortdesc% 	Bappears to weaken slightly! 	C-=-	n
  end
end
return 0
~
#1048
Orme Weapon Basic Wear Script~
1 j 100
~
if !%actor.varexists(sword_exp)%
  set sword_exp 1
  remote sword_exp %actor.id%
end
if !%actor.varexists(sword_level)%
  set sword_level 1
  remote sword_level %actor.id%
end
%send% %actor% 	C-=- 	BYour 	n%self.shortdesc% 	Bbinds it's essence to you!	C -=-	n
detach 1048 %self.id%
~
#1049
Orme Weapon Basic Mob Xp Script~
0 f 100
~
if !%actor.varexists(sword_exp)%
  set sword_exp 1
  remote sword_exp %actor.id%
else
  set item %actor.eq(wield)%
  %send% %actor% 	C-=- 	BYour 	n%item.shortdesc% 	Bgrows in power! 	C-=-	n
  eval mob_exp %self.level% * 100
  eval sword_exp %actor.sword_exp% + %mob_exp%
  remote sword_exp %actor.id%
  rdelete has_attached_xp_script %actor.id%
end
~
#1050
Orme Weapon Main Kill Command Script~
1 c 1
k~
if %cmd.mudcommand% == kill
end
return 0
wait 1
eval target_mob %actor.fighting%
if %actor.fighting%
  if %target_mob.vnum% != -1 && !%actor.varexists(has_attached_xp_script)%
    attach 1049 %target_mob.id%
    set has_attached_xp_script 1
    remote has_attached_xp_script %actor.id%
  end
end
~
#1051
Orme Weapon Main Level Up Script~
1 b 100
~
if %self.worn_by%
  eval actor %self.worn_by%
  if !%actor.varexists(sword_exp)%
    set sword_exp 1
    remote sword_exp %actor.id%
  elseif %actor.sword_exp% >= 500000
    %send% %actor% Your %self.shortdesc% has gained enough experience to level up!
    *transform into higher level here
    *attach higher level script here to %self.id%
    *detach current level script here from %self.id%
  end
end
~
#1052
Orme Weapon WeapStat Script~
1 c 1
weapstat~
if %self.worn_by%
  if %actor.varexists(sword_exp)%
    %send% %actor% 	c-=-=-=-=-=-=-=-=-=-=-=-=-=-	n
    %send% %actor% Current Weapon Exp: 	R%actor.sword_exp%	n
    if %actor.sword_level% == 1
      %send% %actor% Experience Needed:  	R500000	n
    elseif %actor.sword_level% == 2
      %send% %actor% Experience Needed: 	R1000000	n
    else
      return 0
    end
    %send% %actor% 	c-=-=-=-=-=-=-=-=-=-=-=-=-=-	n
  end
end
~
#1053
Orme Weapon BIND Script~
1 his 100
~
if %actor.level% < 31
  %send% %actor% 	BThis item is bound to you!	n
  return 0
end
~
#1096
Orme Loop Test Script~
0 d 1
looptest~
if %speech% == looptest
  set loop_total 0
  set secondary_loop 0
  set primary_loop 0
  eval ploop 1
  while (%ploop%)
    eval primary_loop %primary_loop% + 1
    %echo% Primary loops begins: %primary_loop%
    eval loop_total %loop_total% + 1
    eval sloop 1
    while (%sloop% == 1)
      eval secondary_loop %secondary_loop% + 1
      %echo% Secondary loop begins: %secondary_loop%
      eval loop_total %loop_total% + 1
      %echo% total number of both loops: %loop_total%
      eval sloop 0
    done
  done
else
  return 0
end
~
#1097
Orme Mob Time Test Script~
0 ab 100
~
if %time.hour% > 12
  eval hour %time.hour% - 12
  set ampm pm
else
  set hour %time.hour%
  set ampm am
end
if %time.hour% == 0
  set hour 12
end
wait 5
say It is %time.hour%00 hours.
wait 5
say It is %hour% o'clock %ampm%
~
#1098
Orme Mob TRANSFORM Test~
0 ab 100
~
*  Evaluate what time it is
if %time.hour% > 12
  eval hour %time.hour% - 12
  set ampm pm
else
  set hour %time.hour%
  set ampm am
end
if %time.hour% == 0
  set hour 12
end
*  If it's daytime, make sure our male is out
if (%ampm% == am && %hour% >= 6) || (%ampm% == pm && %hour% <= 8)
  if %self.vnum(1098)%
    wait 5
    say I'm only here during the day, and it's %hour% o'clock %ampm%!
    wait 5
    %echo% %self.name% nervously watches the clock.
    halt
  end
  if %self.vnum(1097)%
    say It's %hour% o'clock %ampm%, and I shouldn't be here!
    wait 1
    %load% mob 1098
    wait 2
    %echo% The bright sun is to much for %self.name%, who disappears!
    %purge% %self%
    halt
  end
else
  *  Otherwise, it should be night, bring out the female
  if !%self.vnum(1097)%
    say It's %hour% o'clock %ampm%, and I shouldn't be here!
    wait 2
    %echo% %self.name% has left for bed.
    %load% mob 1097
    wait 2
    %purge% %self%
  end
end
~
#1099
Orme Target, Pos, Vnum Display Script~
0 b 100
~
say I'm a %self.class%
say My name is %self.name%
eval raname %random.50000%
say %raname% is the random
%self.name(%raname%)%
say My name is now %self.name%
~
$~
