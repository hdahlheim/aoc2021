defmodule Aoc2021Test.D1 do
  use ExUnit.Case
  doctest Aoc2021.D1

  test "part 1" do
    input =
      File.read!("./test/input/d1_input.txt")
      |> String.split()
      |> Enum.map(fn v ->
        {int, _} = Integer.parse(v)
        int
      end)

    assert 1581 ==
             Aoc2021.D1.part_1(input)
             |> IO.inspect(label: :part_1)

    :ok
  end

  test "part 2" do
    input =
      File.read!("./test/input/d1_input.txt")
      |> String.split()
      |> Enum.map(fn v ->
        {int, _} = Integer.parse(v)
        int
      end)

    assert 1618 ==
             Aoc2021.D1.part_2(input)
             |> IO.inspect(label: :part_2)

    :ok
  end
end
