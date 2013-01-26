class StylesController < ApplicationController
  def new
    @style = Styles.new
  end

  def create
    @style = Styles.new params[:styles]
    @style.url = "http://#{@style.url}" unless @style.url.match /^https?:\/\//i

    if @style.save
      @style.delay.calculate_css
      redirect_to @style, status: 303 # see other
    else
      render status: 400 # bad request
    end
  end

  def show
    begin
      @style = Styles.find params[:id]
      respond_to do |format|
        format.html
        format.css do
          render inline: @style.css
        end
        format.sass do
          render inline: @style.sass
        end
      end
    rescue ActiveRecord::RecordNotFound
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def done?
    result = {id: params[:id]}
    style = Styles.find_by_id params[:id]
    result[:done] = (style.present? && style.css.present?)
    render json: result
  end
end
