class HomesController < ApplicationController
  # GET /homes
  def index
    @homes = params[:search] ? Home.where("description LIKE ?", "%#{params["search"]["description"]}%") :
                               Home.all.order(price: :asc)
  end

  # GET /homes/1
  def show
    @home = Home.find(params[:id])
  end

  # GET /homes/new
  def new
    @home = Home.new
  end

  # GET /homes/1/edit
  def edit
    @home = Home.find(params[:id])
  end

  # POST /homes
  def create
    @home = Home.new(home_params)

    if @home.save
      redirect_to @home, notice: 'Home was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /homes/1
  def update
    @home = Home.find(params[:id])
    if @home.update(home_params)
      redirect_to @home, notice: 'Home was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /homes/1
  def destroy
    @home = Home.find(params[:id])
    @home.destroy
    redirect_to homes_url, notice: 'Home was successfully destroyed.'
  end

  private
  # Only allow a trusted parameter "white list" through.
  def home_params
    params.require(:home).permit(:address, :beds, :baths, :square_footage, :price, :description)
  end

  # def build_response_to_search_params(params)
  #   Home.where("price "), "%#{params[:search]}%") :
  # end

end
