module: fundamentals

define class <list-queue> (<queue>)
  slot top :: false-or(<node>), init-value: #f;
  slot bottom :: false-or(<node>), init-value: #f;
  slot size :: <integer>, init-value: 0;
end class <list-queue>;

// We make <list-queue> the default implementation of <queue>
define method make (the-class == <queue>, #rest init-args, #key) => (queue)
  apply(make, <list-queue>, init-args)
end method make;

define method get-size (queue :: <list-queue>) => (size :: <integer>)
  size(queue)
end method get-size;

define method is-empty? (queue :: <list-queue>) => (empty-p :: <boolean>)
  top(queue) = #f
end method is-empty?;

define method enqueue! (queue :: <list-queue>, element) => ()
  let old-bottom :: false-or(<node>) = bottom(queue);
  queue.bottom := make(<node>, value: element);
  if (is-empty?(queue))
    queue.top := bottom(queue);
  else
    old-bottom.next := queue.bottom;
  end if;
  queue.size := queue.size + 1;
end method enqueue!;

define method dequeue! (queue :: <list-queue>) => (element)
  if (is-empty?(queue))
    error("Queue is empty");
  else
    let item = value(queue.top);
    queue.top := queue.top.next;
    if (is-empty?(queue))
      queue.bottom := #f;
    end if;
    queue.size := queue.size - 1;
    item
  end if
end method dequeue!;
