module: datastructures

define abstract class <datastructure> (<object>)
end class <datastructure>;

define open generic get-size
    (collection) => (size :: <integer>);
define open generic is-empty?
    (collection :: <datastructure>) => (empty-p :: <boolean>);
