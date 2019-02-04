# frozen_string_literal: true

FactoryHelper.define(:change_event) do
  id = Faker::Number.number(5)
  {
    'id'      => id,
    'author'  => FactoryHelper.build_from(:person),
    'created' => '2019-01-30T05:02:50.868-0800',
    'items'   => [FactoryHelper.build_from(:change)]
  }
end
