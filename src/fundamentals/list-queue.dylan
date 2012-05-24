module: fundamentals

define class <list-queue> (<queue>)
  slot head :: false-or(<node>), init-value: #f;
  slot tail :: false-or(<node>), init-value: #f;
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
  size(queue) = 0
end method is-empty?;

define method enqueue (queue :: <list-queue>, element) => ()
  let new :: <node> = make(<node>, value: element);
  // TODO: implement
end method enqueue;

define method dequeue (queue :: <list-queue>) => (element)
  // TODO: implement
end method dequeue;
