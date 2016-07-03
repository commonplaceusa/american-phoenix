defmodule AmericanPhoenix.ExAdmin.User do
  use ExAdmin.Register

  register_resource AmericanPhoenix.User do
    index do
      selectable_column

      column :email
      actions
    end

    form user do
      inputs do
        input user, :email
        input user, :password
      end
    end
  end
end
