class StaticPagesController < ApplicationController
  def about_us
  end

  def terms_and_conditions
  end
  
  def original_app
  end
  
  def data
        render :json => [1,3,3,3,5]
  end
end
