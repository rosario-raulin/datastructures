module: fundamentals-test

define function queue-test () => ()
  let q :: <queue> = make(<queue>);

  for (i :: <integer> from 1 to 100)
    enqueue!(q, i);
  end for;

  format-out("The size of the queue: %d\n", get-size(q));

  until (is-empty?(q))
    let e = dequeue!(q);
    format-out("%=\n", e);
  end until;
end function queue-test;
