get "/" do
redirect '/login'
end

get '/login' do
  erb :index
end

post '/login' do #peform login (post login data and decide what to do)  "landed"
  user = User.find_by(handle: params[:handle])
  redirect '/login' unless user
  if user.password == params[:password]
    session[:user_id] = user.id
    redirect "/users/#{session[:user_id]}"
  else
    redirect '/login'
  end
end

get '/logout' do
  session.delete :user_id
  redirect '/login'
end

