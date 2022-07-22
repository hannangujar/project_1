class Api::BaseController < ActionController::Base
    self.responder = ApiResponder # Ignore this, just for now.
    respond_to :json
  end