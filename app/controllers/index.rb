get '/login' do  #login page form
  redirect '/user/#{session[:user_id]}' if session[:user_id]
  <<-HTML
  <h3>Login</h3>
  <form action='/login' method='post'>
    <input type='text' name='username'>
    <input type='password' name='password'>
    <input type='submit' value='submit'>
  </form>
  HTML
  #erb :index
end

post '/login' do #peform login (post login data and decide what to do)
  user = User.find_by(username: params[:username])
  redirect '/login' unless user

  if user.password == params[:password]
    session[:user_id] = user.id
    redirect '/user/#{session[:user_id]}'
  else
    redirect '/login'
  end
end


get '/user/:id' do #user timeline (landing page after login)
 <<-HTML
  <h3>Under Development</h3>
  <br><br>
  <p>Wooo this is my timeline</p>
  HTML
end


get '/user/new' do  # registration form
  User.create(params[:user])
  redirect '/login'
end

post '/user' do # create net user
  User.create(params[:user])
  redirect '/login'
end

get '/logout' do
  session.delete :user_id
  redirect '/login'
end

