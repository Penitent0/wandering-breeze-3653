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

  describe '' do
    
  end
end