FactoryGirl.define do
  factory :permission_template_access, class: Hyrax::PermissionTemplateAccess do
    permission_template
  end
end
