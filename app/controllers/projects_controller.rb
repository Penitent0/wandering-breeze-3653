class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @challenge = Challenge.where(id: "#{@project.challenge_id}").first
    @number_of_contestants = @project.number_of_contestants
  end
end