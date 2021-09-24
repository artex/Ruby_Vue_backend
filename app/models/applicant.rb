class Applicant < ApplicationRecord
    validates :name, presence: true,  length: { maximum: 100 }
    # validates :profile_photo, presence: true
    # validates_attachment :profile_photo, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }, if: Proc.new {|a| a.attachment.present? }
    validates :date, presence: true
    validates :phone_no1, presence: true,:numericality => true, :length => { :minimum => 6, :maximum => 13 }
    validates :phone_no2, length: { maximum: 13 }
    validates :email, presence: true, uniqueness: true, length: { maximum: 100 }, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :current_address, presence: true, length: { maximum: 255 }
    validates :hometown_address, length: { maximum: 255 }
    validates :bachelor_university, length: { maximum: 100 }, presence: true
    validates :bachelor_year, length: { maximum: 20 }
    validates :bachelor_degree, length: { maximum: 100 }
    validates :master_university, length: { maximum: 100 }
    validates :master_year, length: { maximum: 100 }
    validates :master_degree, length: { maximum: 100 }
    validates :diploma_name, length: { maximum: 100 }
    validates :certificate, length: { maximum: 255 }
    validates :total_exp_year, length: { maximum: 3 }
    validates :english, length: { maximum: 255 }
    validates :japanese, length: { maximum: 255 }
    validates :other, length: { maximum: 255 }
    validates :programming, length: { maximum: 100 }
end
