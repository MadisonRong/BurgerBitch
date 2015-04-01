class Admin::RegistrationsController < Devise::RegistrationsController
  layout "admin"
***REMOVED*** before_filter :configure_sign_up_params, only: [:create]
***REMOVED*** before_filter :configure_account_update_params, only: [:update]

  ***REMOVED*** GET /resource/sign_up
  ***REMOVED*** def new
  ***REMOVED***   super
  ***REMOVED*** end

  ***REMOVED*** POST /resource
  ***REMOVED*** def create
  ***REMOVED***   super
  ***REMOVED*** end

  ***REMOVED*** GET /resource/edit
  ***REMOVED*** def edit
  ***REMOVED***   super
  ***REMOVED*** end

  ***REMOVED*** PUT /resource
  ***REMOVED*** def update
  ***REMOVED***   super
  ***REMOVED*** end

  ***REMOVED*** DELETE /resource
  ***REMOVED*** def destroy
  ***REMOVED***   super
  ***REMOVED*** end

  ***REMOVED*** GET /resource/cancel
  ***REMOVED*** Forces the session data which is usually expired after sign
  ***REMOVED*** in to be expired now. This is useful if the user wants to
  ***REMOVED*** cancel oauth signing in/up in the middle of the process,
  ***REMOVED*** removing all OAuth session data.
  ***REMOVED*** def cancel
  ***REMOVED***   super
  ***REMOVED*** end

  ***REMOVED*** protected

  ***REMOVED*** You can put the params you want to permit in the empty array.
  ***REMOVED*** def configure_sign_up_params
  ***REMOVED***   devise_parameter_sanitizer.for(:sign_up) << :attribute
  ***REMOVED*** end

  ***REMOVED*** You can put the params you want to permit in the empty array.
  ***REMOVED*** def configure_account_update_params
  ***REMOVED***   devise_parameter_sanitizer.for(:account_update) << :attribute
  ***REMOVED*** end

  ***REMOVED*** The path used after sign up.
  ***REMOVED*** def after_sign_up_path_for(resource)
  ***REMOVED***   super(resource)
  ***REMOVED*** end

  ***REMOVED*** The path used after sign up for inactive accounts.
  ***REMOVED*** def after_inactive_sign_up_path_for(resource)
  ***REMOVED***   super(resource)
  ***REMOVED*** end
end
