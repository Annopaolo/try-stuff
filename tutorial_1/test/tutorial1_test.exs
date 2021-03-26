defmodule Tutorial1Test do
  use ExUnit.Case
  doctest Tutorial1

  test "greets the world" do
    assert Tutorial1.hello() == :world
  end
end
