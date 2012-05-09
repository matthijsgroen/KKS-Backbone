
FactoryGirl.define do

  PORT_NAMES = ["Rotterdam", "Antwerp", "Harwich", "New York", "South Cape"]
  FREIGHTER_TYPES = %w(flght200 fmed400 flrg600)

  factory :shipment do
    ports_to_use = PORT_NAMES.sample 2
    id_code { "#{('A'..'Z').to_a.sample(3).join}-#{rand 999}" }
    arrival_time { (10 + rand(240)).minutes.from_now }
    destination_port ports_to_use.first
    origin_port ports_to_use.last
    freighter_type FREIGHTER_TYPES.sample
  end

end
