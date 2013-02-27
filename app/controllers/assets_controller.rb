class AssetsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_signin_permission!
  before_filter :restrict_request_format

  def show
    @asset = Asset.find(params[:id])
  end

  def create
    @asset = Asset.new(params[:asset])

    if @asset.save
      render "create", :status => :created
    else
      error 422, @asset.errors.full_messages
    end
  end

private
  def restrict_request_format
    request.format = :json
  end
end
