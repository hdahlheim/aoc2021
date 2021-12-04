defmodule Aoc2021.D3Nx do
  @doc """
  D3

  ## Examples

      iex> Aoc2021.D3Nx.part_1([
      iex>   [0,0,1,0,0],
      iex>   [1,1,1,1,0],
      iex>   [1,0,1,1,0],
      iex>   [1,0,1,1,1],
      iex>   [1,0,1,0,1],
      iex>   [0,1,1,1,1],
      iex>   [0,0,1,1,1],
      iex>   [1,1,1,0,0],
      iex>   [1,0,0,0,0],
      iex>   [1,1,0,0,1],
      iex>   [0,0,0,1,0],
      iex>   [0,1,0,1,0],
      iex> ])
      198

  """
  def part_1(power) do
    t = Nx.tensor(power, type: {:u, 8}, names: [:numbers, :digits])

    l = elem(Nx.shape(t), 0)

    one_count = Nx.sum(t, axes: [:numbers])

    gamma = Nx.greater(one_count, l / 2)
    epsilon = Nx.logical_not(gamma)

    [gamma, epsilon]
    |> Enum.map(fn e ->
      Nx.to_flat_list(e)
      |> Integer.undigits(2)
    end)
    |> Enum.product()
  end

  @doc """
  D3 p2

  ## Examples

      iex> Aoc2021.D3Nx.part_2([
      iex>   [0,0,1,0,0],
      iex>   [1,1,1,1,0],
      iex>   [1,0,1,1,0],
      iex>   [1,0,1,1,1],
      iex>   [1,0,1,0,1],
      iex>   [0,1,1,1,1],
      iex>   [0,0,1,1,1],
      iex>   [1,1,1,0,0],
      iex>   [1,0,0,0,0],
      iex>   [1,1,0,0,1],
      iex>   [0,0,0,1,0],
      iex>   [0,1,0,1,0],
      iex> ])
      230

  """
  def part_2(_power) do
    :todo
  end
end
