class DetailsController < ApplicationController
  def show
    @user= User.find_by_subdomain!(request.subdomain)

    @details = @user.details

    respond_to do |format|
      format.html
      format.xml  { render :xml => @participant }
      format.json
    end

  end

  def new
    @details = Details.new
    respond_to do |format|
      format.html
      #format.xml  { render :xml => @participant }
      #format.json
    end

  end

  def edit
    @details = Details.find(params[:id])

  end

  def create
    @details = Details.create(params[:details])
    @details.user_id = current_user.id

  end

  def update
  end

  def destroy
  end
end
