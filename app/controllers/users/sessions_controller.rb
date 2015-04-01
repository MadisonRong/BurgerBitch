class Users::SessionsController < Devise::SessionsController
***REMOVED*** before_filter :configure_sign_in_params, only: [:create]

  ***REMOVED*** GET /resource/sign_in
  ***REMOVED*** def new
  ***REMOVED***   super
  ***REMOVED*** end

  ***REMOVED*** POST /resource/sign_in
  ***REMOVED*** def create
  ***REMOVED***   super
  ***REMOVED*** end

  ***REMOVED*** DELETE /resource/sign_out
  ***REMOVED*** def destroy
  ***REMOVED***   super
  ***REMOVED*** end

  ***REMOVED*** protected

  ***REMOVED*** You can put the params you want to permit in the empty array.
  ***REMOVED*** def configure_sign_in_params
  ***REMOVED***   devise_parameter_sanitizer.for(:sign_in) << :attribute
  ***REMOVED*** end
end
