defmodule Aoc2021.D8 do
  @doc """
  D8 p1

  ## Examples

      iex> Aoc2021.D8.part_1(\"""
      iex> be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe
      iex> edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc
      iex> fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg
      iex> fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb
      iex> aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea
      iex> fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb
      iex> dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe
      iex> bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef
      iex> egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg | gbdfcae bgc cg cgb
      iex> gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce
      iex> \""")
      26
  """
  def part_1(inputs) do
    String.split(inputs, "\n", trim: true)
    |> Enum.map(fn line ->
      [i, o] = String.split(line, " | ")
      {String.split(i, " "), String.split(o, " ")}
    end)
    |> Enum.flat_map(fn {_ival, oval} ->
      oval
    end)
    |> Enum.count(fn code ->
      String.length(code) < 5 || String.length(code) > 6
    end)
  end

  @doc """
  D8 p2

  ## Examples
      iex> Aoc2021.D8.part_2(\"""
      iex> be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe
      iex> edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc
      iex> fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg
      iex> fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb
      iex> aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea
      iex> fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb
      iex> dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe
      iex> bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef
      iex> egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg | gbdfcae bgc cg cgb
      iex> gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce
      iex> \""")
      61229
  """
  def part_2(inputs) do
    String.split(inputs, "\n", trim: true)
    |> Enum.map(fn line ->
      [i, o] = String.split(line, " | ")

      {String.split(i, " ") |> Enum.map(&(String.graphemes(&1) |> Enum.sort())),
       String.split(o, " ") |> Enum.map(&(String.graphemes(&1) |> Enum.sort()))}
    end)
    |> Enum.map(fn {input, output} ->
      initail_key = %{
        0 => nil,
        1 => nil,
        2 => nil,
        3 => nil,
        4 => nil,
        5 => nil,
        6 => nil,
        7 => nil,
        8 => nil,
        9 => nil
      }

      partial_key =
        input
        |> Enum.reduce(initail_key, fn code, acc ->
          cond do
            length(code) == 2 -> Map.put(acc, 1, code)
            length(code) == 3 -> Map.put(acc, 7, code)
            length(code) == 4 -> Map.put(acc, 4, code)
            length(code) == 7 -> Map.put(acc, 8, code)
            :otherwise -> acc
          end
        end)

      Enum.reduce(input, partial_key, &get_full_key/2)
      |> reverse_key_map()
      |> decode_output(output)
      |> Integer.undigits()
    end)
    |> Enum.sum()
  end

  defp get_full_key(code, key) do
    int = decode_diget(code, key)

    if int != nil, do: Map.put(key, int, code), else: key
  end

  defp decode_diget(code, %{1 => one, 4 => four}) when length(code) == 6 do
    case length(code -- one) do
      5 ->
        6

      _ ->
        case length(code -- four) do
          2 -> 9
          _ -> 0
        end
    end
  end

  defp decode_diget(code, %{1 => one, 4 => four}) when length(code) == 5 do
    case length(code -- one) do
      3 ->
        3

      _ ->
        case length(code -- four) do
          3 -> 2
          _ -> 5
        end
    end
  end

  defp decode_diget(_, _), do: nil

  defp reverse_key_map(key) do
    for {k, v} <- key, into: %{} do
      {v, k}
    end
  end

  defp decode_output(key, output) do
    Enum.map(output, fn el ->
      Map.get(key, el)
    end)
  end
end
