defmodule SwapiExample do
  @moduledoc """
  Documentation for SwapiExample.
  """

  @doc """
  Get only names from the http://swapi.com/people

  ## Examples

      iex> SwapiExample.get_names
      ["Luke Skywalker", "C-3PO", "R2-D2", "Darth Vader", "Leia Organa", "Owen Lars", "Beru Whitesun lars", "R5-D4", "Biggs Darklighter", "Obi-Wan Kenobi"]

  """
  def get_names do
    require Poison

    case Swapi.all("people") do
      {:ok, response} ->
        Poison.decode!(response)["results"]
      _ -> :error
    end
    |> Enum.map(fn(person) -> person["name"] end)
  end
end
