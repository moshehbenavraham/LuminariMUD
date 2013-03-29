#65400
Obj Command 65400 - West Gate Midgen~
1 c 7
en~
if %cmd.mudcommand% == enter && gate /= %arg%
%send% %actor% You enter the gate.
%echoaround% %actor% %actor.name% enters the gate.
%teleport% %actor% 65440
%force% %actor% look
%echoaround% %actor% %actor.name% just stepped through the gate.
else
%send% %actor% %cmd% what?!
end
~
#65401
Obj Command 65401 - East Gate Midgen~
1 c 7
en~
if %cmd.mudcommand% == enter && gate /= %arg%
%send% %actor% You enter the gate.
%echoaround% %actor% %actor.name% enters the gate.
%teleport% %actor% 65442
%force% %actor% look
%echoaround% %actor% %actor.name% just stepped through the gate.
else
%send% %actor% %cmd% what?!
end
~
#65402
Obj Cmd 65402 - Road (3503)~
1 c 7
en~
if %cmd.mudcommand% == enter && road /= %arg%
%send% %actor% You enter the road.
%echoaround% %actor% %actor.name% enters the road.
%teleport% %actor% 3503
%force% %actor% look
%echoaround% %actor% %actor.name% just stepped through the road.
else
%send% %actor% %cmd% what?!
end
~
#65403
Obj Cmd 65403 - Road (65444)~
1 c 7
en~
if %cmd.mudcommand% == enter && road /= %arg%
%send% %actor% You enter the road.
%echoaround% %actor% %actor.name% enters the road.
%teleport% %actor% 65444
%force% %actor% look
%echoaround% %actor% %actor.name% just stepped through the road.
else
%send% %actor% %cmd% what?!
end
~
#65440
Obj Command 65440 - West Gate Midgen~
1 c 7
en~
if %cmd.mudcommand% == enter && gate /= %arg%
%send% %actor% You enter the gate.
%echoaround% %actor% %actor.name% enters the gate.
%teleport% %actor% 3052
%force% %actor% look
%echoaround% %actor% %actor.name% just stepped through the gate.
else
%send% %actor% %cmd% what?!
end
~
#65442
Obj Command 65442 - East Gate Midgen~
1 c 7
en~
if %cmd.mudcommand% == enter && gate /= %arg%
%send% %actor% You enter the gate.
%echoaround% %actor% %actor.name% enters the gate.
%teleport% %actor% 3053
%force% %actor% look
%echoaround% %actor% %actor.name% just stepped through the gate.
else
%send% %actor% %cmd% what?!
end
~
$~
