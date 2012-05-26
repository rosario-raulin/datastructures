module: fundamentals

define abstract class <fundamental-iterator> (<iterator>)
  constant slot data :: <fundamental-collection>, required-init-keyword: data:;
end class <fundamental-iterator>;

define method has-next?
    (iter :: <fundamental-iterator>) => (has-next-p :: <boolean>)
  ~ is-empty?(iter.data)
end method has-next?;

define class <stack-iterator> (<fundamental-iterator>)
end class <stack-iterator>;

define class <queue-iterator> (<fundamental-iterator>)
end class <queue-iterator>;

define method get-next! (iter :: <stack-iterator>) => (next)
  pop!(iter.data)
end method get-next!;

define method get-next! (iter :: <queue-iterator>) => (next)
  dequeue!(iter.data)
end method get-next!;

define method get-iterator! (obj :: <stack>) => (iterator :: <iterator>)
  make(<stack-iterator>, data: obj)
end method get-iterator!;

define method get-iterator! (obj :: <queue>) => (iterator :: <iterator>)
  make(<queue-iterator>, data: obj)
end method get-iterator!;

define method get-iterator (obj :: <stack>) => (iterator :: <iterator>)
  local method copy-stack (stack :: <stack>) => (copy :: <stack>)
          let tmp :: <vector> = make(<vector>, size: get-size(stack));
          let copy :: <stack> = make(<stack>);

          for (i :: <integer> from 0 below get-size(stack))
            tmp[i] := pop!(stack);
          end for;
          for (i :: <integer> from tmp.size - 1 to 0 by -1)
            push!(stack, tmp[i]);
            push!(copy, tmp[i]);
          finally
            copy
          end for
        end method copy-stack;

  get-iterator!(copy-stack(obj))
end method get-iterator;

define method get-iterator (obj :: <queue>) => (iterator :: <iterator>)
  local method copy-queue (queue :: <queue>) => (copy :: <queue>)
          let copy :: <queue> = make(<queue>);
          let tmp :: <vector> = make(<vector>, size: get-size(queue));
          for (i :: <integer> from 0 below get-size(queue))
            tmp[i] := dequeue!(queue);
            enqueue!(copy, tmp[i]);
          end for;
          for (element in tmp)
            enqueue!(queue, element);
          finally
            copy
          end for
        end method copy-queue;
  
  get-iterator!(copy-queue(obj))
end method get-iterator;
