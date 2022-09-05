class ContestantsController < ApplicationController
  def index
    @contestants = Contestant.joins(:projects)
  end
end