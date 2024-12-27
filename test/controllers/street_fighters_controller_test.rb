require "test_helper"

class StreetFightersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @street_fighter = street_fighters(:one)
  end

  test "should get index" do
    get street_fighters_url
    assert_response :success
  end

  test "should get new" do
    get new_street_fighter_url
    assert_response :success
  end

  test "should create street_fighter" do
    assert_difference("StreetFighter.count") do
      post street_fighters_url, params: { street_fighter: { character: @street_fighter.character, move: @street_fighter.move, quote: @street_fighter.quote } }
    end

    assert_redirected_to street_fighter_url(StreetFighter.last)
  end

  test "should show street_fighter" do
    get street_fighter_url(@street_fighter)
    assert_response :success
  end

  test "should get edit" do
    get edit_street_fighter_url(@street_fighter)
    assert_response :success
  end

  test "should update street_fighter" do
    patch street_fighter_url(@street_fighter), params: { street_fighter: { character: @street_fighter.character, move: @street_fighter.move, quote: @street_fighter.quote } }
    assert_redirected_to street_fighter_url(@street_fighter)
  end

  test "should destroy street_fighter" do
    assert_difference("StreetFighter.count", -1) do
      delete street_fighter_url(@street_fighter)
    end

    assert_redirected_to street_fighters_url
  end
end
