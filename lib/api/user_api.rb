class User_API < Grape::API
  resource "users" do
    #全件取得
    desc "returns all users"
    # http://localhost:3000/api/users
    get do
      User.all
    end

    desc "return a user name"
    params do
      requires :name, type: String
    end
    get ':name' do
      User.find_by(name: params[:name])
    end
  end
end
