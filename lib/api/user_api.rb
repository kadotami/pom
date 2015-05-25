class User_API < Grape::API
  resource "users" do
    #全件取得
    desc "returns all users"
    # http://localhost:3000/api/users
    get do
      User.all
    end

    desc "return a user"
    params do
      requires :id, type: Integer
    end
    get ' :id' do
      Document.find(parms[:id])
    end

  end
end
