def login
  @user = User.find_by_email(params['email'])
  if @user.password == params['password']
    session['user_id'] = @user.id
    return true
  else
    return false
  end
end

def user_logged_in?
  session['user_id'] != nil
end