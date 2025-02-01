class_name FiniteStateMachine
extends Node

var states : Dictionary = {}
var current_state = State
@export var initial_state : State

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.state_transition.connect(change_state)
	
	if initial_state:
		initial_state.Enter()
		current_state = initial_state

func _process(delta):
	if current_state:
		current_state.Update(delta)

# Use cautiously, as it ignores state transitions. EX): death
func force_change_state(new_state : String):
	var newState = states.get(new_state.to_lower())
	
	if !newState:
		print(new_state + " does not exist in dictionary!")
		return
	
	if current_state == newState:
		print("New state is already current state! Aborting...")
		return
	
	# If currently in state, exit current state
	if current_state:
		var exit_callable = Callable(current_state, "Exit")
		exit_callable.call_deferred()
	
	newState.Enter()
	current_state = newState

func change_state(old_state : State, new_state_name : String):
	if old_state != current_state:
		print("Invalid state change: trying from " + old_state.name + " but currently in " + current_state.name)
		return
	
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		print("New State does not exist")
		return
	
	if current_state:
		current_state.Exit()
	
	new_state.Enter()
	current_state = new_state
