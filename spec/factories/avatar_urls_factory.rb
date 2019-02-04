# frozen_string_literal: true

FactoryHelper.define(:avatar_urls) do
  sha1 = Faker::Crypto.sha1

  # rubocop:disable Metrics/LineLength
  {
    '48x48' => "https://avatar-cdn.atlassian.com/#{sha1}?s=48&d=https%3A%2F%2Fsecure.gravatar.com%2Favatar%2F#{sha1}%3Fd%3Dmm%26s%3D48%26noRedirect%3Dtrue",
    '24x24' => "https://avatar-cdn.atlassian.com/#{sha1}?s=24&d=https%3A%2F%2Fsecure.gravatar.com%2Favatar%2F#{sha1}%3Fd%3Dmm%26s%3D24%26noRedirect%3Dtrue",
    '16x16' => "https://avatar-cdn.atlassian.com/#{sha1}?s=16&d=https%3A%2F%2Fsecure.gravatar.com%2Favatar%2F#{sha1}%3Fd%3Dmm%26s%3D16%26noRedirect%3Dtrue",
    '32x32' => "https://avatar-cdn.atlassian.com/#{sha1}?s=32&d=https%3A%2F%2Fsecure.gravatar.com%2Favatar%2F#{sha1}%3Fd%3Dmm%26s%3D32%26noRedirect%3Dtrue"
  }
  # rubocop:enable Metrics/LineLength
end
