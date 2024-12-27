require "application_system_test_case"

class StreetFightersTest < ApplicationSystemTestCase
  setup do
    @street_fighter = street_fighters(:one)
  end

  test "visiting the index" do
    visit street_fighters_url
    assert_selector "h1", text: "Street fighters"
  end

  test "should create street fighter" do
    visit street_fighters_url
    click_on "New street fighter"

    fill_in "Character", with: @street_fighter.character
    fill_in "Move", with: @street_fighter.move
    fill_in "Quote", with: @street_fighter.quote
    click_on "Create Street fighter"

    assert_text "Street fighter was successfully created"
    click_on "Back"
  end

  test "should update Street fighter" do
    visit street_fighter_url(@street_fighter)
    click_on "Edit this street fighter", match: :first

    fill_in "Character", with: @street_fighter.character
    fill_in "Move", with: @street_fighter.move
    fill_in "Quote", with: @street_fighter.quote
    click_on "Update Street fighter"

    assert_text "Street fighter was successfully updated"
    click_on "Back"
  end

  test "should destroy Street fighter" do
    visit street_fighter_url(@street_fighter)
    click_on "Destroy this street fighter", match: :first

    assert_text "Street fighter was successfully destroyed"
  end
end
