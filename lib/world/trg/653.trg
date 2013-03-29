#65300
Obj Cmd 65300 - Forest Trail (6092)~
1 c 7
en~
if %cmd.mudcommand% == enter && forest /= %arg%
%send% %actor% You enter the forest.
%echoaround% %actor% %actor.name% enters the forest.
%teleport% %actor% 6092
%force% %actor% look
%echoaround% %actor% %actor.name% just stepped through the forest.
else
%send% %actor% %cmd% what?!
end
~
#65301
Obj Cmd 65301 - Forest Trail (65348)~
1 c 7
en~
if %cmd.mudcommand% == enter && forest /= %arg%
%send% %actor% You enter the forest.
%echoaround% %actor% %actor.name% enters the forest.
%teleport% %actor% 65348
%force% %actor% look
%echoaround% %actor% %actor.name% just stepped through the forest.
else
%send% %actor% %cmd% what?!
end
~
$~
