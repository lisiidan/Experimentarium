extends Node

signal reagent_discovered(reagent_id: String)
signal reaction_resolved(reaction_type: String, result: String, discovered: bool, failed: bool)
signal level_failed
