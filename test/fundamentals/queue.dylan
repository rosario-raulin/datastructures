module: fundamentals-test

define function queue-test-small () => ()
  let q :: <queue> = make(<queue>);

  for (i :: <integer> from 1 to 100)
    enqueue!(q, i);
  end for;

  let size :: <integer> = get-size(q);
  format-out("The size of the queue: %d\n", size);

  for-each (e in q)
    format-out("%d\n", e);
  end for-each;

  if (size ~= get-size(q))
    error("for-each() destroyed the original queue");
  end if;
end function queue-test-small;

define function queue-test-large () => ()
  let q :: <queue> = make(<queue>);

  for (i :: <integer> from 1 to 5000000)
    enqueue!(q, i);
  end for;

  format-out("The size of the queue: %d\n", get-size(q));

  for-each! (e in q)
  end for-each!;

  if (get-size(q) ~= 0)
    error("for-each!() did not properly modify the queue");
  end if;
end function queue-test-large;
