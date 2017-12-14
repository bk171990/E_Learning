class AddAttachmentPhotoToCourses < ActiveRecord::Migration[5.1]
  def self.up
    change_table :courses do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :courses, :photo
  end
end
