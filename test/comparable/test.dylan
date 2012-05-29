module: comparable-test

define function run-comparable-test () => ()
  test-compare-to();
  format-out("The compare-to() test passed.\n");
end function run-comparable-test;
