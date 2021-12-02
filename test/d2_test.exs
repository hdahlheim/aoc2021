defmodule Aoc2021Test.D2 do
  use ExUnit.Case
  doctest Aoc2021.D2

  # @tag :skip
  test "part 1" do
    input =
      File.read!("./test/input/d2_input.txt")
      |> String.split("\n", trim: true)
      |> Enum.map(fn l ->
        [c, s] = String.split(l)
        c = String.to_existing_atom(c)
        {s, _} = Integer.parse(s)
        {c, s}
      end)

    Aoc2021.D2.part_1(input)
    |> IO.inspect(label: :part_1)

    :ok
  end

  # @tag :skip
  test "part 2" do
    input =
      File.read!("./test/input/d2_input.txt")
      |> String.split("\n", trim: true)
      |> Enum.map(fn l ->
        [c, s] = String.split(l)
        c = String.to_existing_atom(c)
        {s, _} = Integer.parse(s)
        {c, s}
      end)

    Aoc2021.D2.part_2(input)
    |> IO.inspect(label: :part_2)

    :ok
  end
end
