module DeviseInvitable
  class Engine < ::Rails::Engine

    ActiveSupport.on_load(:action_controller) do
      include DeviseInvitable::Controllers::Helpers
    end

    # extend mapping with after_initialize because it's not reloaded
    config.after_initialize do
      Devise::Mapping.send :prepend, DeviseInvitable::Mapping
      Devise::ParameterSanitizer.send :prepend, DeviseInvitable::ParameterSanitizer
    end
  end
end
