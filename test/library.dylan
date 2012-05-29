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
  use datastructures;
  use fundamentals;
  use iterator;

  export run-fundamentals-test;
end module fundamentals-test;

define module symbol-tables-test
  use dylan;
  use format-out;
  use datastructures;
  use symbol-tables;

  export run-symbol-tables-test;
end module symbol-tables-test;

define module comparable-test
  use dylan;
  use format-out;
  use comparable;
  
  export run-comparable-test;
end module comparable-test;

define module test
  use dylan;
  use format-out;
  use fundamentals-test;
  use symbol-tables-test;
  use comparable-test;
end module test;
