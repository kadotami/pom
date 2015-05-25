class User_API < Grape::API
  resource "users" do
    #全件取得
    desc "returns all users"
    # http://localhost:3000/api/users
    get do
      User.all
    end
  end
end