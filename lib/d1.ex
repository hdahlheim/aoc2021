defmodule Aoc2021.D1 do
  @doc """
  D1

  ## Examples

      iex> Aoc2021.D1.part_1([199,200,208,210,200,207,240,269,260,263])
      7

  """
  def part_1(depths) do
    res =
      Enum.reduce(depths, %{incr: 0, prev: nil}, fn value, acc ->
        cond do
          acc[:prev] == nil ->
            %{acc | prev: value}

          acc[:prev] == value ->
            %{acc | prev: value}

          value < acc[:prev] ->
            %{acc | prev: value}

          value > acc[:prev] ->
            %{incr: acc[:incr] + 1, prev: value}
        end
      end)

    res[:incr]
  end

  @doc """
  D1 p2

  ## Examples

      iex> Aoc2021.D1.part_2([199,200,208,210,200,207,240,269,260,263])
      5

  """
  def part_2(depths) do
    depths_with_index = Enum.with_index(depths)

    res =
      Enum.reduce(depths_with_index, %{incr: 0, prev: nil}, fn {v1, i}, acc ->
        v2 = Enum.at(depths, i + 1, 0)
        v3 = Enum.at(depths, i + 2, 0)

        cond do
          acc[:prev] == nil ->
            %{acc | prev: v1 + v2 + v3}

          true ->
            sum = v1 + v2 + v3

            if sum > acc[:prev] do
              %{incr: acc[:incr] + 1, prev: sum}
            else
              %{acc | prev: sum}
            end
        end
      end)

    res[:incr]
  end
end
