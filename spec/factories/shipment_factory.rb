
FactoryGirl.define do

  PORT_NAMES = ["Rotterdam", "Antwerp", "Harwich", "New York", "South Cape"]
  FREIGHTER_TYPES = %w(flght200 fmed400 flrg600)

  factory :shipment do
    id_code { "#{('A'..'Z').to_a.sample(3).join}-#{rand 999}" }
    arrival_time { ((10 + rand(240)) * 10).seconds.from_now }
    destination_port { PORT_NAMES.sample }
    origin_port { PORT_NAMES.reject { |i| i == destination_port }.sample }
    freighter_type { FREIGHTER_TYPES.sample }
  end

end
