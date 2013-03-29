#9100
Stableboy Appears~
2 c 100
*~
switch %cmd%
  case search
  case kick
    if %arg% == bulge || %arg% == hay
      %load% mob 9100
      %send% %actor% After kicking the hay, you discover that the bulge was hiding a sleeping orphan! Somehow, you didn't even wake him up.
      %echoaround% %actor% After %actor.name% kicks the hay, you discover that the bulge was hiding a sleeping orphan! Somehow, %actor.name% didn't even wake him up.
      detach 9100 %self.id%
    end
  break
  default
    return 0
  break
done
~
#9101
Extra-Desc Swap Stableboy~
2 0 100
look~
%echo% This trigger commandlist is not complete!
~
$~
