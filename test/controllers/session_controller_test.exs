defmodule AmericanPhoenix.SessionControllerTest do
  use AmericanPhoenix.ConnCase

  alias AmericanPhoenix.Session
  alias AmericanPhoenix.User
  @valid_attrs %{email: "foo@bar.com", password: "12345abc"}

  setup %{conn: conn} do
    changeset = User.registration_changeset(
      %User{},
      @valid_attrs
    )
    Repo.insert changeset
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "POST /api/sessions", %{conn: conn} do
    conn = conn
    |> post(session_path(conn, :create), user: @valid_attrs)
    |> doc

    assert token = json_response(conn, 201)["data"]["token"]
    assert session = Repo.get_by(Session, token: token)
    assert session.user_id
  end

  test "does not create resource and renders errors when email is invalid" do
    conn = post conn, session_path(conn, :create), user: Map.put(@valid_attrs, :password, "notright")
    assert json_response(conn, 401)["errors"]
  end

  test "does not create resource and renders errors when password is invalid" do
    conn = post conn, session_path(conn, :create), user: Map.put(@valid_attrs, :email, "not@found.com")
    assert json_response(conn, 401)["errors"]
  end
end
