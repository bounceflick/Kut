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

post '/followers' do
  @user=User.find_by(handle:params[:user])
  erb :"users/followers"
end

get '/follow/:id' do
  if user_logged_in?
    @user = User.find(session['user_id'])
    @user.follow(params[:id])

    redirect "/users/#{session['user_id']}"
  end

