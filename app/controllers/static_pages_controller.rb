class StaticPagesController < ApplicationController
  def home
    render "devise/sessions/new"
    # render "devise/shared/links"
  end
end
