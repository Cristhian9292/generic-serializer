defmodule GenericSerializerTest do
  use ExUnit.Case
  doctest GenericSerializer

  test "greets the world" do
    assert GenericSerializer.hello() == :world
  end
end
