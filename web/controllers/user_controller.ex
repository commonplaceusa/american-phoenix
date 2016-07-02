defmodule AmericanPhoenix.UserController do
  use AmericanPhoenix.Web, :controller

  alias AmericanPhoenix.Session
  alias AmericanPhoenix.User

  plug :scrub_params, "user" when action in [:create]

  def create(conn, %{"user" => user_params}) do
    changeset = User.registration_changeset(
      %User{},
      user_params
    )

    case Repo.insert(changeset) do
      {:ok, user} ->
        session_changeset = Session.create_changeset(
          %Session{},
          %{
            user_id: user.id
          }
        )
        {:ok, session} = Repo.insert(session_changeset)

        conn
        |> put_status(:created)
        |> render("show.json", session: session, user: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(AmericanPhoenix.ChangesetView, "errors.json", changeset: changeset)
    end
  end
end
