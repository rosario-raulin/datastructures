module: fundamentals-test

define function run-fundamentals-test () => ()
  stack-test-small();
  stack-test-large();
  queue-test-small();
  queue-test-large();
end function run-fundamentals-test;
