# frozen_string_literal: true

FactoryHelper.define(:change) do
  id        = Faker::Number.number(2)
  to_string = Faker::HitchhikersGuideToTheGalaxy.starship
  {
    'field'      => 'Sprint',
    'fieldtype'  => 'custom',
    'fieldId'    => 'customfield_10004',
    'from'       => '',
    'fromString' => '',
    'to'         => id,
    'toString'   => to_string
  }
end
