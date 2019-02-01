class Jirad::ChangeEvent < Jirad::BaseModel
  person     :author
  timestamp  :timestamp
  collection :changes,  type: Jirad::Change, key: 'items'
end
