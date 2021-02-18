class CreateScheduledDeloveries < ActiveRecord::Migration[6.0]
  def change
    create_table :scheduled_deloveries do |t|

      t.timestamps
    end
  end
end
