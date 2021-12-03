defmodule Aoc2021Test.D1 do
  use ExUnit.Case
  alias Aoc2021.D1
  doctest D1

  setup_all do
    input =
      "./test/input/d1_input.txt"
      |> File.read!()
      |> String.split()
      |> Enum.map(fn v ->
        {int, _} = Integer.parse(v)
        int
      end)

    {:ok, input: input}
  end

  test "part 1", state do
    assert 1581 == D1.part_1(state[:input])

    #  |> IO.inspect(label: :part_1)
  end

  test "part 2", state do
    assert 1618 == D1.part_2(state[:input])

    #  |> IO.inspect(label: :part_2)
  end
end
