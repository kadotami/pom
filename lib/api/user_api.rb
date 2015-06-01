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

    desc "create a User"
    params do
      requires :name, type: String
      optional :height, type: Float
      optional :weight, type: Float
      optional :fat_rate, type: Float
    end
    # http://localhost:3000/api/user
    post do
      user = ActionController::Parameters.new(params).permit(:name, :height, :weight, :fat_rate)
      user = User.new(user)
      user.save
    end
  end
end
