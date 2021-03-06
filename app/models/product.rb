class Product < ActiveRecord::Base
  if Rails.env.development?
    has_attached_file :image, styles: { medium: "200x", thumb: "100x100>" }, default_url: "missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  else
    has_attached_file :image, styles: { medium: "200x", thumb: "100x100>" }, default_url: "missing.png",
                      :storage => :dropbox,
                      :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                      :path => ':style/:id_:filename'
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  end

  validates :name, :description, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :image, attachment_presence: true

  belongs_to :user

  default_scope { order(created_at: :desc) }
end
