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
      requires :account_id, type: String
      optional :name, type: String
      optional :height, type: Float
      optional :weight, type: Float
      optional :fat_rate, type: Float
    end
    # http://localhost:3000/api/users
    post do
      user = ActionController::Parameters.new(params).permit(:account_id, :name, :height, :weight, :fat_rate)
      user = User.new(user)
      user.save
    end

    desc "edit a User"
    # http://localhost:3000/api/users/{:id}
    params do
      optional :account_id, type: String
      optional :name, type: String
      optional :height, type: Float
      optional :weight, type: Float
      optional :fat_rate, type: Float
    end
    patch ':id' do
      user = User.find(params[:id])
      user.account_id = params[:account_id] if params[:account_id].present?
      user.name = params[:name] if params[:name].present?
      user.height = params[:height] if params[:height].present?
      user.weight = params[:weight] if params[:weight].present?
      user.fat_rate = params[:fat_rate] if params[:fat_rate].present?
      user.save
    end
  end
end
