module: fundamentals-test

define function stack-test () => ()
  //let s :: <stack> = make(<stack>);
  let s :: <stack> = make(<array-stack>);

  for (i :: <integer> from 1 to 5000000)
    push!(s, i);
  end for;

  format-out("The size of the stack: %d\n", get-size(s));

  until (is-empty?(s))
    let e :: <integer> = pop!(s);
  end until;
end function stack-test;
