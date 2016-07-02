defmodule AmericanPhoenix.UserTest do
  use AmericanPhoenix.ModelCase

  alias AmericanPhoenix.User

  @valid_attrs %{email: "foo@bar.com", password: "12345abc"}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with empty email" do
    changeset = User.changeset(
      %User{},
      Map.put(
        @valid_attrs,
        :email,
        ""
      )
    )

    refute changeset.valid?
  end

  test "changeset with improperly formed email" do
    changeset = User.changeset(
      %User{},
      Map.put(
        @valid_attrs,
        :email,
        "foo.com"
      )
    )

    refute changeset.valid?
  end

  test "registration_changeset with password that is too short" do
    changeset = User.registration_changeset(
      %User{},
      Map.put(
        @valid_attrs,
        :password,
        "12345"
      )
    )

    refute changeset.valid?
  end

  test "valid registration_changeset" do
    changeset = User.registration_changeset(
      %User{},
      @valid_attrs
    )
    assert changeset.changes.password_hash
    assert changeset.valid?
  end
end
