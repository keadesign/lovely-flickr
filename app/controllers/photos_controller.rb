class PhotosController < ApplicationController
  before_action :require_current_user, except: [:show, :index, :search]
  before_action :set_current_user, only: [:show]

  def index
    # arel command - see query docs for 'arel'
    @photos = Photo.limit(50)
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user = @current_user
      if @photo.save
        redirect_to photo_path(@photo)
      else
        render action: :new
      end

      @comment = Comment.new(comment_params)
      @comment.commentable = Photo.find(params[:photo_path])
      # should this be to photo_id above?
      @comment.user = @current_user
      @comment.save

      redirect_to @comment.commentable
  end

  def buy
    # See Stripe docs for more info
    customer = Stripe::Customer.create(
      email: params[:email],
      card: params[:stripeToken]
      )

    # This will charge their credit card!
    Stripe::Charge.create(
      customer: customer.id,
      amount: Photo::PRICE,
      currency: 'usd'
      )

    rescue Stripe::CardError => error
      flash[:error] = error.message
      redirect_to photo_path(@photo)
    end


  def show
    @photo = Photo.find(params[:id])
  end

  def search
    @results = Photo.search_for params[:query]
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :upload)
  end

end
