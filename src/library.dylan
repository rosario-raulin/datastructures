module: dylan-user

define library datastructures
  use common-dylan;
  use io;
    
  export
    datastructures,
    fundamentals,
    iterator,
    comparable,
    symbol-tables;
end library datastructures;

define module datastructures
  use common-dylan;

  export
    <datastructure>,
    is-empty?,
    get-size;
end module datastructures;

define module iterator
  use common-dylan;
 
  export
    <iterator>,
    <iterable>,
    has-next?,
    get-next!,
    get-iterator,
    get-iterator!,
    for-each,
    for-each!;
end module iterator;

define module comparable
  use common-dylan;

  export compare-to;
end module comparable;

define module fundamentals
  use common-dylan;
  use datastructures;
  use iterator;
    
  export
    <fundamental-collection>,
    <stack>,
    <array-stack>,
    <list-stack>,
    push!,
    pop!,
    <queue>,
    <list-queue>,
    enqueue!,
    dequeue!;
end module fundamentals;

define module symbol-tables
  use common-dylan;
  use datastructures;
  use fundamentals;
  use iterator;
  use comparable;

  export
    <symbol-table>,
    <key-not-found>,
    <list-table>,
    <binary-search-tree>,
    put!,
    get,
    delete!,
    contains?,
    keys;
end module symbol-tables;
