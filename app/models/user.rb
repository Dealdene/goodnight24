class User < ApplicationRecord
  ONE_WEEK_DAYS = 7

  has_many :followings,  dependent: :destroy
  has_many :sleeps, dependent: :destroy

  def last_sleep
    sleeps.last
  end

  def last_week_records
    sleeps.where("start_time >= ?", ONE_WEEK_DAYS.days.ago)
  end

  def last_week_records_by_length
    last_week_records.order(:length).reverse
  end

  def test
    #again
  end
end

