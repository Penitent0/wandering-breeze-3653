require 'rails_helper'

RSpec.describe 'contestant index page' do
  # User Story 2 of 3

  # As a visitor,
  # When I visit the contestants index page ("/contestants")
  # I see a list of names of all the contestants
  # And under each contestants name I see a list of the projects (names) that they've been on

  # (e.g.   Kentaro Kameyama
  #         Projects: Litfit, Rug Tuxedo

  #         Jay McCarroll
  #         Projects: LeatherFeather)

  describe 'When I visit the contestants index page ("/contestants")' do
    before :each do
      @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      @gret = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
      @kent = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
      @erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)
      @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
      @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
      @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
      @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")
    end
    it 'I see a list of names of all the contestants' do
      visit "/contestants"
    
      expect(page).to have_content("#{@jay.name}")
      expect(page).to have_content("#{@gret.name}")
      expect(page).to have_content("#{@kent.name}")
      expect(page).to have_content("#{@erin.name}")
    end

    it 'And under each contestants name I see a list of the projects (names) that theyve been on' do
      ContestantProject.create(contestant_id: @gret.id, project_id: @boardfit.id)

      ContestantProject.create(contestant_id: @kent.id, project_id: @lit_fit.id)
    
      ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
      ContestantProject.create(contestant_id: @erin.id, project_id: @news_chic.id)

      visit "/contestants"
      save_and_open_page
      expect(page).to have_content("#{@lit_fit.name}")
      expect(page).to have_content("#{@news_chic.name}")
      expect(page).to have_content("#{@boardfit.name}")
    end
  end
end