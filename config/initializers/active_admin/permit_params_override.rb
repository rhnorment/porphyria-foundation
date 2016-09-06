module ActiveAdmin
  class ResourceDSL < DSL
    def permit_params(*args, &block)
      resource_sym = config.resource_name.singular.to_sym
      controller do
        define_method :permitted_params do
          params.permit :_method, :_wysihtml5_mode, :authenticity_token, :commit, :id, :utf8,
                        resource_sym =>
                        block ? instance_exec(&block) : args
        end
      end
    end
  end
end