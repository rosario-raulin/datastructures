module: fundamentals-test

define function queue-test-small () => ()
  let q :: <queue> = make(<queue>);

  for (i :: <integer> from 1 to 100)
    enqueue!(q, i);
  end for;

  format-out("The size of the queue: %d\n", get-size(q));

  until (is-empty?(q))
    let e :: <integer> = dequeue!(q);
    format-out("%=\n", e);
  end until;
end function queue-test-small;

define function queue-test-large () => ()
  let q :: <queue> = make(<queue>);

  for (i :: <integer> from 1 to 5000000)
    enqueue!(q, i);
  end for;

  format-out("The size of the queue: %d\n", get-size(q));

  until (is-empty?(q))
    let e :: <integer> = dequeue!(q);
  end until;

  format-out("It should now be 0: %d\n", get-size(q));
end function queue-test-large;
