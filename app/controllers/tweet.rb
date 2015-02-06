post "/tweets/new" do
  if user_logged_in?
    @tweets = Tweet.create(content: params[:tweet][:content], user_id: session['user_id'])
    redirect '/profile'
  else
    redirect '/login'
  end
end

get "/tweets/new" do
  if user_logged_in?
    @tweets = Tweet.all
    erb :"/tweets/new"
  else
    redirect '/login'
  end
end

get "/tweets/:id" do
  if user_logged_in?
    @tweet = Tweet.find(params[:id])
    erb :"/tweets/show"
  else
    redirect '/login'
  end
end



post "/retweet" do
  if user_logged_in?
    tweet = Tweet.new(content: params[:tweet][:content], user_id: session['user_id'], parent_id: params[:parent_id])
    tweet.save
    redirect '/'
  else
    redirect '/login'
  end
end