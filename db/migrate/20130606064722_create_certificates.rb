class CreateCertificates < ActiveRecord::Migration
  def change
    create_table :certificates do |t|
      t.string :name

      t.timestamps
    end

    create_table :certificates_users, id: false do |t|
      t.integer :user_id
      t.integer :certificate_id
    end

  end


end
