module: dylan-user

define library datastructures
  use common-dylan;
  
  export
    fundamentals;
end library datastructures;

define module datastructures
  use common-dylan;

  export
    <datastructure>;
end module datastructures;

define module fundamentals
  use common-dylan;
  use datastructures;
  
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
    enqueue,
    dequeue;
end module fundamentals;
