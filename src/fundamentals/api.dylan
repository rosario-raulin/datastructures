module: fundamentals

define abstract class <fundamental-collection> (<datastructure>)
end class <fundamental-collection>;

define generic get-size (collection) => (size);
define generic is-empty? (collection) => (empty-p);

define abstract class <stack> (<fundamental-collection>)
end class <stack>;

define generic pop! (stack) => (element);
define generic push! (stack, element) => ();
