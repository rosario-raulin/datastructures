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
    <stack>,
    <array-stack>,
    <list-stack>,
    push!,
    pop!,
    get-size,
    is-empty?;
end module fundamentals;
