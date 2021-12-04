defmodule Aoc2021.D1Nx do
  @doc """
  D1

  ## Examples

      iex> Aoc2021.D1Nx.part_1([199,200,208,210,200,207,240,269,260,263])
      7

  """
  def part_1(depths) do
    Nx.tensor(depths)
    |> compare_elements()
    |> Nx.sum()
    |> Nx.to_scalar()
  end

  @doc """
  D1 p2

  ## Examples

      iex> Aoc2021.D1Nx.part_2([199,200,208,210,200,207,240,269,260,263])
      5

  """
  def part_2(depths) do
    Nx.tensor(depths)
    |> Nx.window_sum({3})
    |> compare_elements()
    |> Nx.sum()
    |> Nx.to_scalar()
  end

  defp compare_elements(tensor) do
    Nx.greater(tensor[1..-1//1], tensor[0..-2//1])
  end
end
