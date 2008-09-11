class ActionController::Base
   def requires_access_to_module(module_name)
    redirect_to access_denied_path unless current_user && current_user.has_access_to_module?(module_name)
  end
end
