module: iterator

// We could use the forward-iteration-protocol instead but I find it somewhat
// bloated. Java's iterators are clear and simple. -- Rosario

define open abstract class <iterator> (<object>)
end class <iterator>;

define open generic has-next?
    (iterator :: <iterator>) => (has-next-p :: <boolean>);
define open generic get-next! (iterator :: <iterator>) => (next);

define open abstract class <iterable> (<object>)
end class <iterable>;

// get-iterator!() is allowed to modify the original datstructure
define open generic get-iterator
    (obj :: <iterable>) => (iterator :: <iterator>);
define open generic get-iterator!
    (obj :: <iterable>) => (iterator :: <iterator>);

define macro for-each-iterator
  { for-each-iterator (?var:variable in ?iterator:expression) ?:body end }
    =>
    {
     let iter :: <iterator> = ?iterator;
     while (has-next?(iter))
       let ?var = get-next!(iter);
       ?body
     end while;
     }
end macro for-each-iterator;

define macro for-each
  { for-each (?:variable in ?iterable:expression) ?:body end }
    =>
    { for-each-iterator(?variable in get-iterator(?iterable)) ?body end}
end macro for-each;

define macro for-each!
  { for-each! (?:variable in ?iterable:expression) ?:body end }
    =>
    { for-each-iterator(?variable in get-iterator!(?iterable)) ?body end}
end macro for-each!;
