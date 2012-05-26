module: test

define function main () => ()
  block ()
    run-fundamentals-test();

    format-out("All tests passed.\n");
  exception (e :: <condition>)
    format-out("%=\n", e);
  end block;
end function main;

main();
