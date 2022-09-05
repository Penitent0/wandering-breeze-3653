require 'rails_helper'

RSpec.describe 'Projects Show Page' do
  # User Story 1 of 3

  # As a visitor,
  # When I visit a project's show page ("/projects/:id"),
  # I see that project's name and material
  # And I also see the theme of the challenge that this project belongs to.
  # (e.g.    Litfit
  #   Material: Lamp Shade
  # Challenge Theme: Apartment Furnishings)
  
  describe ' When I visit a projects show page ("/projects/:id"),' do
    before :each do
      @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
      @jay = @news_chic.contestants.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      @gret = @news_chic.contestants.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    end
    it 'I see that projects name and material' do
      visit "/projects/#{@news_chic.id}"

      expect(page).to have_content("#{@news_chic.name}")
      expect(page).to have_content("#{@news_chic.material}")
    end

    it 'And I also see the theme of the challenge that this project belongs to' do
      visit "/projects/#{@news_chic.id}"

      expect(page).to have_content("#{@recycled_material_challenge.theme}")
    end
  end

  # User Story 3 of 3
  # As a visitor,
  # When I visit a project's show page
  # I see a count of the number of contestants on this project

  # (e.g.    Litfit
  #     Material: Lamp Shade
  #   Challenge Theme: Apartment Furnishings
  #   Number of Contestants: 3 )

  describe 'When I visit a projects show page' do
    before :each do
      @recycled_material_challenge = Challenge.create!(theme: "Recycled Material", project_budget: 1000)
      @news_chic = @recycled_material_challenge.projects.create!(name: "News Chic", material: "Newspaper")
      @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
      @jay = @news_chic.contestants.create!(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      @gret = @news_chic.contestants.create!(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
      @kentaro = @boardfit.contestants.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
      @erin = @boardfit.contestants.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)
      @mark = @boardfit.contestants.create(name: "Mark Smith", age: 44, hometown: "Denver", years_of_experience: 15)
    end
    it 'I see a count of the number of contestants on this project' do
      visit "/projects/#{@news_chic.id}"
      
      expect(page).to have_content("#{@news_chic.contestants.count}")
    end

    it 'I see a count of the number of contestants on another project' do
      visit "/projects/#{@boardfit.id}"

      expect(page).to have_content("#{@boardfit.contestants.count}")
    end
  end
end