extends Node
class_name State
# State interface to use in Hierarchical State Machines. The lowest leaf tries
# to handle callbacks, and if it can't, it delegates the work to its parent.
#
# It's up to the user to call the parent state's functions, e.g.
# `_parent.physics_process(delta)`
#
# Use State as a child of a StateMachine node.


onready var _state_machine: = owner.get_node('StateMachine')
onready var parent = get_parent()

# Using the same class, i.e. State, as a type hint causes a memory leak in Godot
# 3.2.


func _ready() -> void:
	_state_machine.states[name] = self		#the state adds itself to StateMachine with its name as the key.


func unhandled_input(event: InputEvent) -> void:
	pass


func process(delta: float) -> void:
	pass


func physics_process(delta: float) -> void:
	pass


func enter(msg := {}) -> void:
	pass


func exit() -> void:
	pass
