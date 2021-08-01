class Admin::GistsController < Admin::BaseController
  def create
  end

  def index
    @gists = Gist.all
  end
end
