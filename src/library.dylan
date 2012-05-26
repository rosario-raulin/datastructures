module: dylan-user

define library datastructures
  use common-dylan;
    
  export
    fundamentals,
    iterator,
    symbol-tables;
end library datastructures;

define module datastructures
  use common-dylan;

  export
    <datastructure>;
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

define module fundamentals
  use common-dylan;
  use datastructures;
  use iterator;
    
  export
    <fundamental-collection>,
    get-size,
    is-empty?,
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

  export
    <symbol-table>,
    put!,
    get,
    delete!,
    contains?,
    keys;
end module symbol-tables;
