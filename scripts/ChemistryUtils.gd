extends Object
class_name ChemistryUtils

static var reagent_map = {
	"hydrogen": "H2",
	"oxygen": "O2",
	"nitrogen": "N2",
	"chlorine": "Cl2",
	"carbon": "C",
	"sodium": "Na",
	"sulfur": "S",
	"calcium": "Ca",

	"water": "H2O",
	"sodium_hydroxide": "NaOH",
	"hydrochloric_acid": "HCl",
	"carbon_dioxide": "CO2",
	"sulfur_dioxide": "SO2",
	"carbonic_acid": "H2CO3",
	"sulfurous_acid": "H2SO3",
	"calcium_hydroxide": "Ca(OH)2",
	"calcium_oxide": "CaO",
	"sodium_sulfite": "NaSO3",
	"ammonia": "NH3",
	"nitric_oxide": "NO",
	"hydrogen_sulfide": "H2S",
	"sodium_oxide": "Na2O",
	"nitrogen_dioxide": "NO2",
	"nitric_acid": "HNO3"
}

static var reagent_data = {
	"H2": {"color": Color(0.551, 0.843, 0.898, 1.0)},
	"O2": {"color": Color(0.809, 0.173, 0.217, 1.0)},
	"N2": {"color": Color(0.420, 0.470, 0.900, 1.0)},
	"Cl2": {"color": Color(0.420, 0.900, 0.200, 1.0)},
	"C": {"color": Color(0.150, 0.150, 0.150, 1.0)},
	"Na": {"color": Color(0.450, 0.900, 0.200, 1.0)},
	"S": {"color": Color(0.950, 0.850, 0.200, 1.0)},
	"Ca": {"color": Color(0.882, 0.882, 0.882, 1.0)},

	"H2O": {"color": Color(0.250, 0.700, 0.950, 1.0)},
	"NaOH": {"color": Color(0.600, 0.950, 0.300, 1.0)},
	"HCl": {"color": Color(0.200, 0.950, 0.300, 1.0)},
	"NaCl": {"color": Color(0.920, 0.920, 0.920, 1.0)},
	"CO2": {"color": Color(0.450, 0.450, 0.450, 1.0)},
	"SO2": {"color": Color(0.950, 0.300, 0.200, 1.0)},
	"H2CO3": {"color": Color(0.850, 0.850, 0.850, 1.0)},
	"H2SO3": {"color": Color(0.950, 0.700, 0.200, 1.0)},
	"Ca(OH)2": {"color": Color(0.900, 0.900, 0.900, 1.0)},
	"CaO": {"color": Color(0.800, 0.800, 0.800, 1.0)},
	"NaSO3": {"color": Color(0.700, 0.700, 0.700, 1.0)},
	"NH3": {"color": Color(0.8, 0.224, 0.996, 1.0)},
	"NO": {"color": Color(0.300, 0.600, 0.950, 1.0)},
	"H2S": {"color": Color(0.500, 0.800, 0.200, 1.0)},
	"Na2O": {"color": Color(0.600, 0.950, 0.250, 1.0)},
	"NO2": {"color": Color(0.850, 0.200, 0.150, 1.0)},
	"HNO3": {"color": Color(0.950, 0.850, 0.200, 1.0)}
}

static func get_formula(name: String) -> String:
	return reagent_map.get(name.to_lower(), name)

static func get_reagent_color(id: String) -> Color:
	if reagent_data.has(id):
		return reagent_data[id]["color"]
	return Color.WHITE

static func parse_reaction_cell(cell: String) -> Dictionary:
	cell = cell.strip_edges()

	if cell == "-":
		return {"type":"neutral","result":""}

	if cell.begins_with("p:"):
		return {
			"type": "positive",
			"result": cell.substr(2).strip_edges()
		}

	if cell.begins_with("b:"):
		return {
			"type": "bonus",
			"result": cell.substr(2).strip_edges()
		}

	return {"type":"neutral","result":""}
