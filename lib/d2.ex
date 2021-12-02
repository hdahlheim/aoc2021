defmodule Aoc2021.D2 do
  @doc """
  D1

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
  D1 p2

  ## Examples

      iex> Aoc2021.D2.part_2([{:forward, 5},{:down, 5},{:forward, 8},{:up, 3},{:down, 8},{:forward, 2}])
      900

  """
  def part_2(moves) do
    moves
    |> Enum.reduce(%{x: 0, y: 0, aim: 0}, &move/2)
    |> final_depth()
  end

  defp move({:up, spaces}, %{x: _x, y: _y, aim: a} = pos),
    do: %{pos | aim: a - spaces}

  defp move({:down, spaces}, %{x: _x, y: _y, aim: a} = pos),
    do: %{pos | aim: a + spaces}

  defp move({:forward, spaces}, %{x: x, y: y, aim: a} = pos),
    do: %{pos | x: x + spaces, y: y + a * spaces}

  defp move({:up, spaces}, %{x: _x, y: y} = pos), do: %{pos | y: y - spaces}
  defp move({:down, spaces}, %{x: _x, y: y} = pos), do: %{pos | y: y + spaces}
  defp move({:forward, spaces}, %{x: x, y: _y} = pos), do: %{pos | x: x + spaces}

  defp final_depth(%{x: x, y: y}), do: x * y
end
