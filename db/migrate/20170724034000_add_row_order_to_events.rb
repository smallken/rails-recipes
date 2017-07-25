class AddRowOrderToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :row_order, :integer

    Event.find_each do |e|
      e.update( :row_order_position => :last )
    end

    add_index :events, :row_order
  end
end
