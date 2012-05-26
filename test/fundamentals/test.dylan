module: fundamentals-test

define function run-fundamentals-test () => ()
  stack-test();
  format-out("The stack test passed.\n");
  queue-test();
  format-out("The queue test passed.\n");
end function run-fundamentals-test;
