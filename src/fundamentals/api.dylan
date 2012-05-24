module: fundamentals

define abstract class <fundamental-collection> (<datastructure>)
end class <fundamental-collection>;

define generic get-size (collection) => (size);
define generic is-empty? (collection) => (empty-p);

define abstract class <stack> (<fundamental-collection>)
end class <stack>;

define generic pop! (stack) => (element);
define generic push! (stack, element) => ();

define abstract class <queue> (<fundamental-collection>)
end class <queue>;

define generic dequeue (queue) => (element);
define generic enqueue (queue, element) => ();
