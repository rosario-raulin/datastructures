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

  export run-fundamentals-test;
end module fundamentals-test;

define module test
  use dylan;
  use format-out;
  use fundamentals-test;
end module test;
