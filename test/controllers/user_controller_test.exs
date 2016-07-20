defmodule AmericanPhoenix.UserControllerTest do
  use AmericanPhoenix.ConnCase

  alias AmericanPhoenix.User

  @valid_attrs %{email: "foo@bar.com", password: "foobar123"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {
      :ok,
      conn: put_req_header(
        conn,
        "accept",
        "application/json"
      )
    }
  end

  test "POST /api/users" do
    conn = build_conn
    |> post(user_path(build_conn, :create), user: @valid_attrs)
    |> doc

    body = json_response(conn, 201)

    assert body["data"]["id"]
    assert body["data"]["email"]
    assert body["data"]["access_token"]
    refute body["data"]["password"]

    assert Repo.get_by(User, email: "foo@bar.com")
  end

  test "does not create reource and renders an error when data is invalid" do
    conn = post build_conn, user_path(build_conn, :create), user: @invalid_attrs
    assert json_response(conn, 422)["errors"]
  end
end
