# encoding: utf-8

FactoryBot.define do

  ## Pages ##
  factory :page, class: Locomotive::Page do
    title 'A simple page'
    slug 'simple'
    published true
    site { Locomotive::Site.where(handle: 'acme').first || create(:site) }

    trait :index do
      after(:build) do |page, evaluator|
        page.parent = page.site.pages.root.first
        page.raw_template = nil
      end
    end

    factory :sub_page do
      title 'Subpage'
      slug 'subpage'
      published true
      site { Locomotive::Site.where(handle: 'acme').first || create(:site) }
      parent { Locomotive::Page.where(slug: 'index').first || create(:page) }
    end

    factory :page_with_editable_element do
      slug 'with_editable_element'
      after(:build) do |page, _|
        page.editable_elements << build(:editable_element)
        page.raw_template = '<a>a</a>'
        page.save
      end
    end
  end

end
