defmodule AstarteAppengineApiTest do
  use ExUnit.Case
  doctest AstarteAppengineApi

  test "greets the world" do
    assert AstarteAppengineApi.hello() == :world
  end
end
