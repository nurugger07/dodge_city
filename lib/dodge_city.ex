defmodule DodgeCity.API do
  use Maru.Router

  plug Plug.Logger
  plug Plug.Parsers,
    pass: ["*/*"],
    json_decoder: Poison,
    parsers: [:urlencoded, :json]

  get "/food" do
    case Coyote.call({:get_items, "/food"}) do
      {:ok, response} ->
        json(conn, %{data: response})
      {:error, message} ->
        conn
        |> put_status(404)
        |> json(%{error: message})
    end
  end

  params do
    requires :name, type: String
    requires :cost, type: Float
  end
  post "/food" do
    case Coyote.call({:put_item, "/food", params}) do
      {:ok, response} ->
        json(conn, %{data: response})
      {:error, message} ->
        conn
        |> put_status(404)
        |> json(%{error: message})
    end
  end

end
