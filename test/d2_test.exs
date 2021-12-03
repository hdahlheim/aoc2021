defmodule Aoc2021Test.D2 do
  use ExUnit.Case
  alias Aoc2021.D2
  doctest D2

  setup_all do
    input =
      File.read!("./test/input/d2_input.txt")
      |> String.split("\n", trim: true)
      |> Enum.map(fn l ->
        [c, s] = String.split(l)
        c = String.to_existing_atom(c)
        {s, _} = Integer.parse(s)
        {c, s}
      end)

    {:ok, input: input}
  end

  # @tag :skip
  test "part 1", state do
    assert 1_488_669 ==
             D2.part_1(state[:input])

    #  |> IO.inspect(label: :part_1)
  end

  # @tag :skip
  test "part 2", state do
    assert 1_176_514_794 ==
             D2.part_2(state[:input])

    #  |> IO.inspect(label: :part_2)
  end
end
