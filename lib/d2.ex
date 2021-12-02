defmodule Aoc2021.D2 do
  @doc """
  D2

  ## Examples

      iex> Aoc2021.D2.part_1([{:forward, 5},{:down, 5},{:forward, 8},{:up, 3},{:down, 8},{:forward, 2}])
      150

  """
  def part_1(moves) do
    moves
    |> Enum.reduce(%{x: 0, y: 0}, &move/2)
    |> final_depth()
  end

  @doc """
  D2 p2

  ## Examples

      iex> Aoc2021.D2.part_2([{:forward, 5},{:down, 5},{:forward, 8},{:up, 3},{:down, 8},{:forward, 2}])
      900

  """
  def part_2(moves) do
    moves
    |> Enum.reduce(%{x: 0, y: 0, aim: 0}, &move/2)
    |> final_depth()
  end

  defp move({:up, units}, %{aim: a} = pos), do: %{pos | aim: a - units}

  defp move({:down, units}, %{aim: a} = pos), do: %{pos | aim: a + units}

  defp move({:forward, units}, %{x: x, y: y, aim: a} = pos),
    do: %{pos | x: x + units, y: y + a * units}

  defp move({:up, units}, %{y: y} = pos), do: %{pos | y: y - units}
  defp move({:down, units}, %{y: y} = pos), do: %{pos | y: y + units}
  defp move({:forward, units}, %{x: x} = pos), do: %{pos | x: x + units}

  defp final_depth(%{x: x, y: y}), do: x * y
end
