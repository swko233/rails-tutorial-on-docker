# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name      { 'test' }
    email     { 'test@test.com' }
  end
end