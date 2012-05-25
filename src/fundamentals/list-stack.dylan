module: fundamentals

define class <list-stack> (<stack>)
  slot top :: false-or(<node>), init-value: #f;
  slot size :: <integer>, init-value: 0;
end class <list-stack>;

// We make <list-stack> the default <stack> implementation
define method make (the-class == <stack>, #rest init-args, #key) => (stack)
  apply(make, <list-stack>, init-args)
end method make;

define method get-size (stack :: <list-stack>) => (size :: <integer>)
  size(stack)
end method get-size;

define method is-empty? (stack :: <list-stack>) => (empty-p :: <boolean>)
  size(stack) = 0
end method is-empty?;

define method pop! (stack :: <list-stack>) => (element)
  if (is-empty?(stack))
    error("Stack is empty");
  else
    let element = top(stack).value;
    stack.top := top(stack).next;
    stack.size := stack.size - 1;
    element
  end if
end method pop!;

define method push! (stack :: <list-stack>, element) => ()
  let new :: <node> = make(<node>, value: element);
  new.next := top(stack);
  stack.top := new;
  stack.size := stack.size + 1;
end method push!;
