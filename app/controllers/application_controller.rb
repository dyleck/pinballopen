class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize

  @@auth_matrix = {
      'Admin'  => [
        'users/index',
        'tables/new',
        'tables/create',
        'tables/update',
        'users/destroy',
        'matches/new',
        'matches/create',
        'matches/edit',
        'matches/update',
        'tournaments/init',
      ],
      'Player' => [
          'users/show',
          'users/udpate',
          'matches/show',
      ],
  }

  def authorize
    if session[:user_id]
      user = User.find(session[:user_id])
      return true if user.roles.map {|r| r.name }.include? 'SuperAdmin'
      perm_item = "#{params[:controller]}/#{params[:action]}"
      @@auth_matrix.keys.each do |key|
        if @@auth_matrix[key].include? perm_item
          role_req = Role.find_by_name(key)
          user.roles.each do |role|
            return true if role >= role_req
          end
        end
      end
    end
    redirect_to login_url, notice: 'Permission denied'
  end
end
