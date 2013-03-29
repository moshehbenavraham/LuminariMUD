#2300
test trigger invis ring~
0 g 100
~
*test trigger for creating a magical ring of invisibility!
if %direction% == south
  if %actor.varexists(completed_invis_ring)%
    wait 1 sec
    say you seem to already have a magical ring.
    halt
  else
    wait 1 sec
    say Hello, %actor.name%. I could craft a very nice ring for you to elude your enemies!
    say Simply find me a few ingredients and return to me with them.
say If you agree, say yes, %actor.name%.
  end
end
~
#2301
invis ring accepted trigger~
0 d 100
yes~
if %actor.varexists(completed_invis_ring)% || !%actor.is_pc%
  halt
else
  wait 1 sec
  say Perfect, %actor.name%. I'll make this easy, bring me an Invisibility wand.
  say You can find one at the arcane goods vendor.
  wait 3 sec
  say I'd go get it myself, but I'm an old man and in need of his rest.
  wait 1 sec
end
~
#2302
new trigger~
0 j 100
~
if %object.vnum% == 3053 && !%actor.varexists(completed_invis_ring)%
  smile
  wait 1 sec
  say Thank you, %actor.name%. Here is a few experience points for your trouble.
  nop %actor.exp(150)%
  say Please wait while I enchant the ring.
  wait 1 sec
  emote begins to chant, holding the wand in one hand and a silvery ring in the other.
  wait 1 sec
  emote chants louder, reaching a fevered pitch.
  wait 1 sec
  say The enchantment is completed, here take your spoils.
  %load% obj 2304
  give ring %actor.name%
  set completed_invis_ring 1
  remote completed_invis_ring %actor.id%
  %purge% %object%
elseif %actor.varexists(completed_invis_ring)
  say I have already crafted for you a magical ring.
  junk %object.name%
  return 0
else
  say That is not what I asked for!
  junk %object.name%
end
~
#2303
new trigger~
1 c 7
use~
if %cmd.mudcommand% == use && stone /= %arg%
 if %actor.eq(held).vnum% == 2305
     %send% %actor% the striped stone begins to shimmer.
     %echoaround% %actor% %actor.name%'s form begins to shimmer.
     dg_cast 'stone skin' %actor%
else
  * If it doesn't match let the command continue.
  return 0
end
end
~
#2304
Entering Newbie Zone - Mage~
2 g 100
~
wait 1 sec
if %actor.varexists(intro)
return 0
halt
else
%echo% The sky has been slowly darkening all day, and the smell of rain has been thick in the air. Now it has finally begun to fall, accompanied by loud peals of thunder that seem to roll across the landscape.
wait 4 sec
%echo% The sun is hidden behind massive stormclouds, and a cold wind blows from the north. As bolts of lightning begin to slam from cloud to ground and pieces of hail begin to strike the ground, the need for shelter becomes obvious.
wait 4 sec
%echo% Ahead in the distance, a large tor rises from the ground, its form illuminated by the occasional lightning bolt. 
%echo% It seems rocky and solid, and though climbing it in this weather would be folly, it might have some outcropping that would provide safety from the storm. The only alternative is to endure the weather.
set intro 1
remote intro %actor.id%
end
~
#2305
Knowldge check at entrance~
2 g 100
~
wait 1 sec
if %actor.varexists(entrance_knowledge_check_failed)
halt
else %actor.int% > %random.15% || %actor.varexists(entrance_knowledge_check_pass)
%send% %actor.name% Your knowledge reveals that the broken remains of an immense, round stone scattered across the ground near the entrance. This stone once blocked the doorway, but it was blasted apart by lightning some weeks ago. 
%send% %actor.name% The door is heavy but well counterweighted. It is unlocked and opens easily, and it swings shut of its own accord unless propped open.
    set entrance_knowledge_check_pass 1
remote entrance_knowledge_check_pass %actor.id%
else
    set entrance_knowledge_check_failed 1
    remote entrance_knoweldge_check_fail %actor.id%
end
~
#2306
Rat onslaught~
2 g 100
~
wait 1 sec
if %actor.varexists(rat_swarm)
%door% 2303 north flags a
%door% 2303 south flags a
%door% 2303 east flags a
%door% 2303 west flags a
halt
else
%echo% The stone doors around you all slam shut, locking you in!
%door% 2303 north flags bcd
%door% 2303 south flags bcd
%door% 2303 east flags bcd
%door% 2303 west flags bcd
wait 8 sec
%echo% Suddenly, in conjunction with a particularly loud thunderclap, all three doors break open at once, falling from their doorways into the room with a great cacophony. 
%echo% Seconds later, the sounds of squeaking fill the air as a pack of rats swarms in from the largest doorway.
%load% mob 2301
%load% mob 2301
%load% mob 2301
%load% mob 2301
%load% mob 2301
%load% mob 2301
%load% mob 2301
set rat_swarm 1
remote rat_swarm %actor.id%
end
~
#2307
Hobgoblin stealth trigger~
2 g 100
~
wait 1
if %actor.varexists(hobgoblin_guards)
halt
end
if %actor.class% == Thief && %actor.affect(SNEAK)%
 %send% %actor% You manged to sneak up on a pair of sleeping guards.
 %load% mob 2302
 %load% mob 2302
 set hobgoblin_guards 1
 remote hobgoblin_guards %actor.id%
else
 %echo% Suddenly, two burly humanoids that were sleeping leap to their feet.
 %echo% Each stands more than 6 feet tall and has feral eyes and flat facial features.
 %echo% With a roar, the two draw their weapons and charge!
 %load% mob 2302
 %force% hobgoblin wake
 %force% hobgoblin stand
 %load% mob 2302
 %force% hobgoblin wake
 %force% hobgoblin stand
 set hobgoblin_guards 1
 remote hobgoblin_guards %actor.id%
end
~
#2308
Pearl of Power~
1 c 2
recall~
*Based on recall object By Rumble of The Builder Academy    tbamud.com 9091
%send% %actor% You are engulfed in the magic.  The world quickly shrinks and dissapears.
%echoaround% %actor% %actor.name% is engulfed in magic and disappears!
%teleport% %actor% 3001
wait 1 sec
%force% %actor% look
%send% %actor% The world explodes into existance.
%send% %actor% Your pearl, now devoid of power, crumbles to dust.
%echoaround% %actor% %actor.name% appears, and %actor.hisher% pearl, now devoid of power, crumbles to dust.
rdelete intro %actor.id%
rdelete rat_swarm %actor.id%
rdelete hobgoblin_guards %actor.id%
rdelete entrance_knowledge_check_pass %actor.id%
rdelete entrance_knowledge_check_fail %actor.id%
rdelete spider_spider %actor.id%
rdelete rat_swarm %actor.id%
rdelete chest_trap %actor.id%
rdelete vary_surprise %actor.id%
rdelete zombie_knight %actor.id%
%purge% %self%
~
#2309
Spider Spider~
2 q 100
~
* spider load and web player
if %actor.varexists(spider_spider)
*do nothing if they have done this prior
halt
elseif %direction% == south
  * Stop them and load spider goodness
return 0
%echo% As you attempt to leave this room, you stumble into a sticky web!
%echo% You have attracted the attention of a mother spider.
dg_affect %actor% grappled 2
%load% mob 2303
set spider_spider 1
remote spider_spider %actor.id%
end
~
#2310
load key upon spider death~
0 f 100
~
%echo% with a wail and a lot of twitching the spider ceases to be.
%load% obj 2307
~
#2311
Chest dart Trap~
1 c 4
o~
if %actor.varexists(chest_trap)
  halt
elseif %cmd.mudcommand% == open && chest /= %arg%
if %actor.skill(pick lock)% < 0
  %send% %actor% You have triggered a trap!
  %echoaround% %actor% %actor.name% has triggered a trap!
  %send% %actor% As you open the closet you feel a sharp pain in your neck.
  %echoaround% %actor% %actor.name% opens a closet and a dart shoots from the wall and hits %actor.name% in the neck.
  %damage% %actor% 5
  set chest_trap 1
  remote chest_trap %actor.id%
else if %actor.skill(pick lock) > 10 && %actor.dex% > %rand.20%
  detach self 2311
  set chest_trap 1
  remote chest_trap %actor.id%
else
  * If it doesn't match let the command continue.
  return 0
end
end
~
#2312
vargy attack~
2 g 100
~
*load vargouille upon entering room
wait 1
if %actor.varexists(vargy_surprise)
halt
else
%echo% Suddenly a bat-like creature emerges from the head of the sarcophagus!
%echo% the Vargouille screeches and attacks! 
%load% mob 2304
set vargy_surprise 1
remote vargy_surprise %actor.id%
~
#2313
vargy death load~
0 f 100
~
%echo% with an ear piercing screech the vargouille dies.
%load% obj 2309
~
#2314
Death knight blade~
0 k 20
~
%echo% The knight holds his blade up to his face and whispers to it in an arcane tongue.
%echo% The blade flares with a deep red glow!
%send% %actor% The blade pulses as it gets close to you.
dg_cast 'curse' %actor%
%echoaround% %actor% The knights blade pulses as it gets close to %actor.name%.
~
#2315
Entering Dark Knight room~
2 g 100
~
wait 1 sec
if %actor.varexists(zombie_knight)
halt
else
%echo% Something on the table begins to stir.
wait 1 sec
%echo% Suddenly, the corpse sits up, lifting an old, rusted longsword in one hand and a shield in the other.
%echo% As it climbs off the table, its mouth opens to loose an eerie moan
%load% mob 2300
set zombie_knight 1
remote zombie_knight %actor.id%
end
~
#2316
Dark Knight item drop~
0 f 100
~
* load pearl on death, player uses it and it strips them of all variables
%load% obj 2305
~
#2317
Helm of Brilliance~
1 j 100
~
* By Bakarus
if %actor.is_pc%
  if %actor.int% > 15
    %send% %actor% %self.shortdesc% reveals its secrets to you.
    %send% %actor% Simply speak the command words to use the gems in the crown.
    %send% %actor% Say 'use diamond' to see the invisible world.
%send% %actor% Say 'use ruby' to heal your wounds.
%send% %actor% Say 'use opal' to detect magic.
%send% %actor% Say 'use fire' to levitate yourself.
  end
  return 0
end
~
$~
