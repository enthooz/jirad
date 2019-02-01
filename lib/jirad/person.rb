class Jirad::Person < Jirad::BaseModel
  attribute :name
  attribute :key
  attribute :account_id, key: 'accountId'
  attribute :email_address, key: 'emailAddress'
  attribute :display_name, key: 'displayName'
  attribute :is_active?, key: 'active'
  attribute :timezone, key: 'timeZone'

  alias_method :to_s, :display_name

  # Attributes in hash:
  # - self (uri)
  # - name
  # - key
  # - accountId
  # - emailAddress
  # - avatarUrls
  # - displayName
  # - active
  # - timeZone
end
