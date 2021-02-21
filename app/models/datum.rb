class Datum < ApplicationRecord
    has_attached_file :file_attch,  :url => "/files/:basename.:extension"
    do_not_validate_attachment_file_type :file_attch
    has_many :accounts
end
