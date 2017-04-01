defmodule DodgeCity.API do
  use Maru.Router
  plug Plug.Logger

  get do
    case GenServer.call(Coyote, {:GET, "/"}) do
      {:ok, response} ->
        text(conn, response)
      {:error, message} ->
        conn
        |> put_status(404)
        |> text(message)
    end
  end
end
