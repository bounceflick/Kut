get "/" do
redirect '/login'
end



get '/login' do  #login page form
  #redirect '/user/#{session[:user_id]}' if session[:user_id]
  # <<-HTML
  # <h3>Login</h3>
  # <form action='/login' method='post'>
  #   <input type='text' name='handle'>
  #   <input type='password' name='password'>
  #   <input type='submit' value='submit'>
  # </form>
  # HTML
  erb :index
end

post '/login' do #peform login (post login data and decide what to do)
  "landed"
  user = User.find_by(handle: params[:handle])
  redirect '/login' unless user
  "landed"
  if user.password == params[:password]
    session[:user_id] = user.id
    redirect "/user/#{session[:user_id]}"
  else
    redirect '/login'
  end
end


get '/user/new' do  # registration form
  # redirect '/secret' if session[:user_id]

  # <<-HTML
  # <h3>Register as a User</h3>
  # <form action='/user' method='post'>
  #   <input type='text' name='user[handle]'>
  #   <input type='password' name='user[password]'>
  #   <input type='submit' value='submit'>
  # </form>
  # HTML
end

post '/user' do # create net user
  "landed"
  User.create(params[:user])
  redirect '/login'
end

get '/user/:id' do #user timeline (landing page after login)
 <<-HTML
  <h3>Under Development</h3>
  <br><br>
  <p>Wooo this is my timeline</p>
  <p> Hello user with id ##{params[:id]}!!
  HTML
end




get '/logout' do
  session.delete :user_id
  redirect '/login'
end

