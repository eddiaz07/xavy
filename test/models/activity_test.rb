# == Schema Information
#
# Table name: activities
#
#  id          :integer          not null, primary key
#  description :text
#  hardness    :string
#  name        :string
#  schedule    :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  venue_id    :integer
#
# Indexes
#
#  index_activities_on_venue_id  (venue_id)
#

require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  def setup
    @activity = activities(:one)
  end

  test 'should validate presence of name' do
    assert_must validate_presence_of(:name), @activity
  end

  test 'should validate uniquness of name' do
    assert_must validate_uniqueness_of(:name), @activity
  end

  test 'should validate presence of description' do
    assert_must validate_presence_of(:description), @activity
  end

  test 'should validate presence of schedule' do
    assert_must validate_presence_of(:schedule), @activity
  end

  test 'by_name should order activities alphabetically' do
    activities = Activity.by_name
    assert_equal 'Clase de crossfit', activities.first.name
    assert_equal 'Kundalini yoga', activities.last.name
  end
end
