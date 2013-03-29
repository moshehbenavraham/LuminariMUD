#805
Spring of Life~
1 c 7
drink~
*By Zusuk - Spring of Life proc
if %cmd.mudcommand% /= drink && spring /= %arg%
  %send% %actor% You drink from the spring of life...
  %echoaround% %actor% %actor.name% drinks from the spring of life.
  dg_cast 'cure serious' %actor%
else
  * If it doesn't match let the command continue.
  return 0
end
~
#810
Orme Holy Avenger Paladin Only Script~
1 j 100
~
if %actor.has_class(paladin)% == 0
  %send% %actor% You are not 	Wholy	n enough to wield this!
  return 0
end
~
$~
