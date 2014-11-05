json.array!(@bands) do |band|
	json.partial!("api/bands/band", :band => band)
end