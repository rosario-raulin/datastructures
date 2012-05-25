module: fundamentals-test

define function stack-test-small () => ()
  let s :: <stack> = make(<stack>);
  // let s :: <stack> = make(<array-stack>);

  for (i :: <integer> from 1 to 100)
    push!(s, i);
  end for;

  format-out("The size of the stack: %d\n", get-size(s));

  until (is-empty?(s))
    let e :: <integer> = pop!(s);
    format-out("%d\n", e);
  end until;
end function stack-test-small;

define function stack-test-large () => ()
  let s :: <stack> = make(<stack>);
  // let s :: <stack> = make(<array-stack>);

  for (i :: <integer> from 1 to 5000000)
    push!(s, i);
  end for;

  format-out("The size of the stack: %d\n", get-size(s));

  until (is-empty?(s))
    let e :: <integer> = pop!(s);
  end until;
  format-out("It should now be 0: %d\n", get-size(s));
end function stack-test-large;
