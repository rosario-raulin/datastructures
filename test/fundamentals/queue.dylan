module: fundamentals-test

define constant $queue-test-limit :: <integer> = 500000;

define function queue-test () => ()
  let q :: <queue> = make(<queue>);
  
  for (i :: <integer> from 1 to $queue-test-limit)
    enqueue!(q, i);
  end for;

  let size :: <integer> = get-size(q);
  if (size ~= $queue-test-limit)
    error("push!() does not properly work");
  end if;

  for-each (e in q)
  end for-each;

  if (size ~= get-size(q))
    error("for-each() destroyed the original queue");
  end if;

  for-each! (e in q)
  end for-each!;

  if (get-size(q) ~= 0)
    error("for-each!() did not properly modify the queue");
  end if;
end function queue-test;
