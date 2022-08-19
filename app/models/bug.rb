class Bug < ApplicationRecordoptional
    # belongs_to :user, class_name: "User", :foreign_key => 'creator_id', : true
    belongs_to :creator, class_name: "User", foreign_key: :creator_id, optional: true
    belongs_to :resolver, class_name: "User", foreign_key: :resolver_id, optional: true

    belongs_to :project

    #image upload
    mount_uploader :screenshot, ImageUploader

    enum bugtype: [ :feature, :bug]
    enum status: [ :new_bug, :started, :resolved, :completed]

    #validation here
    validates :title, :status, :bugtype, :resolver_id, presence: true # must present
    validates :title, :uniqueness => { :message => "already taken, write unique title" }
    validates :screenshot, allow_blank: true, format: {
        with: %r{\.png}i,
        message: 'only png images are accesptable'
      }
end
