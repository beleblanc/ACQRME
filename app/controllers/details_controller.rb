class DetailsController < ApplicationController
  def show
    @details = Details.find(params[:id])

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
