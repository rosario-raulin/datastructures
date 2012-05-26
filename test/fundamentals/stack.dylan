module: fundamentals-test

define constant $stack-test-limit :: <integer> = 500000;

define function stack-test () => ()
  let s :: <stack> = make(<stack>);
  
  for (i :: <integer> from 1 to $stack-test-limit)
    push!(s, i);
  end for;

  let size :: <integer> = get-size(s);
  if (size ~= $stack-test-limit)
    error("push!() does not properly work");
  end if;

  for-each (e in s)
  end for-each;

  if (size ~= get-size(s))
    error("for-each() destroyed the original stack");
  end if;

  for-each! (e in s)
  end for-each!;

  if (get-size(s) ~= 0)
    error("for-each!() did not properly modify the stack");
  end if;
end function stack-test;
