defmodule NombreProjectTest do
  use ExUnit.Case
  doctest NombreProject

  test "greets the world" do
    assert NombreProject.hello() == :world
  end
end
