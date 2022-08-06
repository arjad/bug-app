class Bug < ApplicationRecord
    belongs_to :user, class_name: "User", :foreign_key => 'user_id', optional: true
    belongs_to :project, optional: true

    #image upload
    mount_uploader :screenshot, ImageUploader

    enum bugtype: [ :feature, :bug]
    enum status: [ :new_bug, :started, :resolved]

    #validation here
    validates :title, :des, presence: true
    validates :title, :des, length: { minimum: 2 }
    validates :title, uniqueness: { case_sensitive: false }
    validates :screenshot, allow_blank: true, format: {
        with: %r{\.png}i,
        message: 'only png images are accesptable'
      }
    def bug_params
        params.require(:bug).permit(:screenshot)
    end
end
