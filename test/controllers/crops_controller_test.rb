require 'test_helper'

class CropsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crop = crops(:one)
  end

  test "should get index" do
    get crops_url
    assert_response :success
  end

  test "should get new" do
    get new_crop_url
    assert_response :success
  end

  test "should create crop" do
    assert_difference('Crop.count') do
      post crops_url, params: { crop: { area_covered: @crop.area_covered, covered_area_measure: @crop.covered_area_measure, description: @crop.description, farm_id: @crop.farm_id, harvest_date: @crop.harvest_date, life_span_days: @crop.life_span_days, life_span_months: @crop.life_span_months, life_span_years: @crop.life_span_years, name: @crop.name, season: @crop.season, sowing_date: @crop.sowing_date } }
    end

    assert_redirected_to crop_url(Crop.last)
  end

  test "should show crop" do
    get crop_url(@crop)
    assert_response :success
  end

  test "should get edit" do
    get edit_crop_url(@crop)
    assert_response :success
  end

  test "should update crop" do
    patch crop_url(@crop), params: { crop: { area_covered: @crop.area_covered, covered_area_measure: @crop.covered_area_measure, description: @crop.description, farm_id: @crop.farm_id, harvest_date: @crop.harvest_date, life_span_days: @crop.life_span_days, life_span_months: @crop.life_span_months, life_span_years: @crop.life_span_years, name: @crop.name, season: @crop.season, sowing_date: @crop.sowing_date } }
    assert_redirected_to crop_url(@crop)
  end

  test "should destroy crop" do
    assert_difference('Crop.count', -1) do
      delete crop_url(@crop)
    end

    assert_redirected_to crops_url
  end
end
