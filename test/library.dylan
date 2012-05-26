module: dylan-user

define library datastructures-test
  use dylan;
  use io;
  use datastructures;

  export
    fundamentals-test;
end library datastructures-test;

define module fundamentals-test
  use dylan;
  use format-out;
  use fundamentals;
  use iterator;

  export run-fundamentals-test;
end module fundamentals-test;

/*
define module symbol-tables-test
  use dylan;
  use format-out;
  use symbol-tables;

  export run-symbol-tables-test;
end module symbol-tables-test;
*/

define module test
  use dylan;
  use format-out;
  use fundamentals-test;
  // use symbol-tables-test;
end module test;
