module: fundamentals

define abstract class <fundamental-collection> (<datastructure>)
end class <fundamental-collection>;

define generic get-size
    (collection :: <fundamental-collection>) => (size :: <integer>);
define generic is-empty?
    (collection :: <fundamental-collection>) => (empty-p :: <boolean>);

define abstract class <stack> (<fundamental-collection>, <iterable>)
end class <stack>;

define generic pop! (stack :: <stack>) => (element);
define generic push! (stack :: <stack>, element) => ();

define abstract class <queue> (<fundamental-collection>, <iterable>)
end class <queue>;

define generic dequeue! (queue :: <queue>) => (element);
define generic enqueue! (queue :: <queue>, element) => ();
