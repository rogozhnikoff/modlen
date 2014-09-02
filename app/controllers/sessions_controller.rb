# app/controllers/sessions_controller.rb

class SessionsController < Devise::SessionsController
  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    sign_in_and_redirect(resource_name, resource)
  end

  def sign_in_and_redirect(resource_or_scope, resource=nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource
    resource.orders << @order
    resource.save
    guest = Guest.find session[:guest_id]
    begin
    rescue
      guest = Guest.new
    end
    add_variants resource, guest
    return render json: {success: true, user: resource}
  end

  def failure
    return render :json => {:success => false, :errors => ["Login failed."]}
  end

  private
  def add_variants user, guest
    guest.variants.each do |var|
      user.variants << var unless user.variants.include? var
    end
  end
end