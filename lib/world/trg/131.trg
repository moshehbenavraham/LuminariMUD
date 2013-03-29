#13101
Hidden Reeds Trigger~
2 c 100
op~
* Hidden Reeds script
* Luminarimud Idea from Vaprak
if %cmd.mudcommand% == open && reeds /= %arg%
  %send% %actor% You slowly part the reeds, and step through.
  %echoaround% %actor% %actor.name% parts the reeds and steps through.
  %teleport% %actor% 13269
  %force% %actor% look
  %echoaround% %actor% %actor.name% just stepped out of the reeds..
else
  %send% %actor% open what?!
end
~
#13102
Echo Room Name~
2 c 100
roomname~
%echo% %actor.room.name%
~
$~
