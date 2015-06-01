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
      requires :account_id, type: String
    end
    get ':account_id' do
      User.find_by(account_id: params[:account_id])
    end
  end
end
