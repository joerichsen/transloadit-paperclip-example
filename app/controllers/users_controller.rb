class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
    @transloadit_params = {
      "auth" => { "key" => TRANSLOADIT[:auth_key] },
      "template_id" => TRANSLOADIT[:user_avatar_template_id],
      "redirect_url" => users_url
    }
  end

  def create
    @user = User.new(params[:user])

    # Fetch the avatar info
    avatar = ActiveSupport::JSON.decode(params[:transloadit]).symbolize_keys[:uploads].first.symbolize_keys
    @user.update_attributes(
      :avatar_file_name => avatar[:name], 
      :avatar_content_type => avatar[:mime], 
      :avatar_file_size => avatar[:size], 
      :avatar_unique_prefix => avatar[:id].insert(2, '/'))

    if @user.save
      redirect_to users_path, :notice => 'User was successfully created'
    else
      render new_user_path
    end
  end

end
