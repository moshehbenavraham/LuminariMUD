#2100
Orme Tent Leave Script~
2 c 100
leave~
%send% %actor% You exit the area.
%echoaround% %actor% %actor.name% leaves the area.
%teleport% %actor% 2159
%force% %actor% look
%echoaround% %actor% %actor.name% steps out of a Gypsy tent.
~
#2101
Orme Halfling Act Script~
0 h 100
~
if %actor.is_pc%
  switch %random.5%
    case 1
      wait 3 sec
      emote looks at you.
    break
    case 2
      wait 3 sec
      flee
    break
    case 3
      wait 3 sec
      shrug
    break
    default
      wait 3 sec
      yawn
    break
  done
else
end
~
#2159
Orme Tent Enter Script~
1 c 100
en~
if %cmd.mudcommand% == enter && tent /= %arg%
   %send% %actor% You step inside the tent.
   %echoaround% %actor% %actor.name% enters the tent.
   %teleport% %actor% 2100
   %force% %actor% look
   %echoaround% %actor% %actor.name% entered the tent.
else
   return 0
end
~
$~
