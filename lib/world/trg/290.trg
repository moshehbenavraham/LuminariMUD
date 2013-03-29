#29000
grehk qmaster greet~
0 h 100
~
if %actor.questdone(29000)% && %actor.is_pc%
wait 1 sec
say Thank you %actor.name%, for defeating the prince.  Word of your heroics will be spread throughout the realm.
else
wait 3
say Wait %actor.race%!  I need your help.  I am exhausted from a long battle to get to these tunnels.  The lizardman prince is creating a large army and I need someone to help me. (quest list)
end
~
$~
