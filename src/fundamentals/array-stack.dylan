module: fundamentals

define constant $default-stack-capacity :: <integer> = 16;

define class <array-stack> (<stack>)
  slot size :: <integer>, init-value: 0;
  slot items :: <vector>;
end class <array-stack>;

define method initialize (stack :: <array-stack>, #key
                            capacity :: <integer> = $default-stack-capacity,
                          #all-keys)
  next-method();
  stack.items := make(<vector>, size: capacity);
end method initialize;

define method get-size (stack :: <array-stack>) => (size :: <integer>)
  stack.size
end method get-size;

define method is-empty? (stack :: <array-stack>) => (empty-p :: <boolean>)
  stack.size = 0
end method is-empty?;

define method resize (stack :: <array-stack>, to-size :: <integer>) => ()
  let new-items :: <vector> = make(<vector>, size: to-size);

  for (i :: <integer> from 0 below stack.size)
    new-items[i] := stack.items[i];
  end for;

  items(stack) := new-items;
end method resize;

define method push! (stack :: <array-stack>, element) => ()
  if (size(stack) = size(stack.items))
    resize(stack, size(stack) * 2);
  end if;
  stack.items[stack.size] := element;
  stack.size := stack.size + 1;
end method push!;

define method pop! (stack :: <array-stack>) => (element)
  stack.size := stack.size - 1;
  let item = stack.items[stack.size];
  stack.items[stack.size] := #f;

  if (size(stack) > 0 & size(stack) == truncate/(size(stack.items), 4))
    resize(stack, truncate/(size(stack.items), 2));
  end if;
  item
end method pop!;
