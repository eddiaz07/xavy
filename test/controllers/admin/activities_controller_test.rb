require 'test_helper'

class Admin::ActivitiesControllerTest < ActionDispatch::IntegrationTest
  test "should display activities index" do
    get admin_activities_url
    assert_response :success
    assert_select 'td', 'Mental crossfit'
  end

  test "should create an activity" do
    get new_admin_activity_url
    assert_response :success

    assert_difference('Activity.count', 1) do
      post admin_activities_url, params: { activity: { name: 'actividad prueba',hardness: 'Dificultad', description: 'descripcion prueba', schedule: 'Lunes 5:00am', venue_id: venues(:one).id } }
    end
    assert_response :redirect
    follow_redirect!
    assert_response :success

    assert_select 'td', 'actividad prueba'
  end

  test "should edit an activity" do
    activity = activities(:one)
    get edit_admin_activity_url(activity.id)
    assert_response :success
    patch admin_activity_url(activity), params: { activity: {name: 'other',hardness: 'Dificultad', description: 'descripcion prueba', schedule: 'Lunes 5:00am',venue_id: venues(:one).id, tags: '', eliminar_tag: '' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    activity.reload

    assert activity.name, 'other'
  end

  test "should destroy an activity" do
    activity = activities(:one)
    assert_difference('Activity.count', -1) do
      delete admin_activity_url(activity)
    end
  end
end
