module: test

define function main () => ()
  block ()
    run-fundamentals-test();
    run-symbol-tables-test();
    run-comparable-test();

    format-out("All tests passed.\n");
  exception (e :: <condition>)
    format-out("%=\n", e);
  end block;
end function main;

main();
