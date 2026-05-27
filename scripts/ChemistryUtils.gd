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

static func get_formula(name: String) -> String:
	return reagent_map.get(name.to_lower(), name)

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
