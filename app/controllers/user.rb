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
 <<-HTML
  <h3>Under Development</h3>
  <br><br>
  <p>Wooo this is my timeline</p>
  <p> Hello user with id ##{params[:id]}!!
  HTML
end

get '/follow/:id' do
  if user_logged_in?
    @user = User.find(session['user_id'])
    @user.follow(params[:id])

    redirect "/users/#{session['user_id']}"
  end

