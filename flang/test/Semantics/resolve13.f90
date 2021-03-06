! RUN: %S/test_errors.sh %s %t %f18
module m1
  integer :: x
  integer, private :: y
  interface operator(.foo.)
    module procedure ifoo
  end interface
  interface operator(-)
    module procedure ifoo
  end interface
  interface operator(.priv.)
    module procedure ifoo
  end interface
  interface operator(*)
    module procedure ifoo
  end interface
  private :: operator(.priv.), operator(*)
contains
  integer function ifoo(x, y)
    logical, intent(in) :: x, y
  end
end

use m1, local_x => x
!ERROR: 'y' is PRIVATE in 'm1'
use m1, local_y => y
!ERROR: 'z' not found in module 'm1'
use m1, local_z => z
use m1, operator(.localfoo.) => operator(.foo.)
!ERROR: Operator '.bar.' not found in module 'm1'
use m1, operator(.localbar.) => operator(.bar.)

!ERROR: 'y' is PRIVATE in 'm1'
use m1, only: y
!ERROR: Operator '.priv.' is PRIVATE in 'm1'
use m1, only: operator(.priv.)
!ERROR: 'operator(*)' is PRIVATE in 'm1'
use m1, only: operator(*)
!ERROR: 'z' not found in module 'm1'
use m1, only: z
!ERROR: 'z' not found in module 'm1'
use m1, only: my_x => z
use m1, only: operator(.foo.)
!ERROR: Operator '.bar.' not found in module 'm1'
use m1, only: operator(.bar.)
use m1, only: operator(-) , ifoo
!ERROR: 'operator(+)' not found in module 'm1'
use m1, only: operator(+)

end
