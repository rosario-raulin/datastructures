module: fundamentals-test

define function stack-test () => ()
  let s :: <stack> = make(<stack>);

  for (i :: <integer> from 1 to 10000)
    push!(s, i);
  end for;

  let sum :: <integer> = 0;
  until (is-empty?(s))
    let e :: <integer> = pop!(s);
    format-out("%d\n", e);
    sum := sum + e;
  end until;
  
  format-out("The sum of this is: %d.\n", sum);
end function stack-test;
