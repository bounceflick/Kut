get '/users' do #show all users
 @users = User.all
 p @users[1].handle
 p "above this ine"
 erb :view_all
end

post '/users' do # create net user
  User.create(params[:user])
  redirect '/login'
end

get '/users/:id' do #user timeline (landing page after login)
 @user=User.find(params[:id])
 erb :"users/profile"
end

post '/tweet' do
  @user=User.find_by(handle:params[:user])
  <<-HTML
  <H3><%= @user %></H3>
  HTML
end
