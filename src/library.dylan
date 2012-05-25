module: dylan-user

define library datastructures
  use common-dylan;
  use io;
  
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
  use format-out;
  
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
