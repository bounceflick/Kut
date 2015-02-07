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
  @content =params[:submittext]
  @user.tweets.create(content:@content)
  redirect "/users/#{@user.id}"
end

get '/followers' do
  @user=User.find_by(handle:params[:user])
  erb :"users/followers"
end

get '/users/:id/followers/new' do
  @user = User.find(params[:id])
  @nonfollowers = User.all - @user.followers - [@user]
  erb :"users/followers_new"
end

post '/users/:id/followers/new' do
  test= params[:user]
  p test
end
