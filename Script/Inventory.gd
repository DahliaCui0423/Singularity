extends Node2D

const SlotClass = preload("res://Script/Slot.gd")
onready var inventorySlots = $GridContainer
var holdingItem = null

func _ready():
	var slots = inventorySlots.get_children()
	for i in range(slots.size()):
		slots[i].connect("gui_input", self, "slot_gui_input", [slots[i]])
		slots[i].slot_index = i
	initialize_inventory()

func initialize_inventory():
	var slots = inventorySlots.get_children()
	for i in range(slots.size()):
		if PlayerInventory.inventory.has(i):
			slots[i].initialize_item(PlayerInventory.inventory[i][0], PlayerInventory.inventory[i])

func slot_gui_input(event: InputEvent, slot: SlotClass):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.pressed:
			if holdingItem != null:
				if !slot.item: # Place holding item to slot
					left_click_empty_slot(slot)
					
				else: # Swap holding item with item in slot
					if holdingItem.itemName != slot.item.itemName:
						left_click_different_item(event, slot)
					else:
						left_click_same_item(slot)
			elif slot.item:
				left_click_not_holding(slot)

func _input(event):
	if holdingItem:
		holdingItem.global_position = get_global_mouse_position()

func left_click_empty_slot(slot: SlotClass):
	PlayerInventory.add_item_to_empty_slot(holdingItem, slot)
	slot.put_into_slot(holdingItem)
	holdingItem = null

func left_click_different_item(event: InputEvent, slot: SlotClass):
	PlayerInventory.remove_item(slot)
	PlayerInventory.add_item_to_empty_slot(holdingItem, slot)
	var temp = slot.item
	slot.pick_from_slot()
	temp.global_position = event.global_position
	slot.put_into_slot(holdingItem)
	holdingItem = temp

func left_click_same_item(slot: SlotClass):
	var stack_size = int(JsonData.itemData[slot.item.itemName]["StackSize"])
	var able_to_add = stack_size - slot.item.itemQuantity
	if able_to_add >= holdingItem.itemQuantity:
		PlayerInventory.add_item_quantity(slot, holdingItem.itemQuantity)
		slot.item.add_item_quantity(holdingItem.itemQuantity)
		holdingItem.queue_free()
		holdingItem = null
	else:
		PlayerInventory.add_item_quantity(slot, able_to_add)
		slot.item.add_item_quantity(able_to_add)
		holdingItem.decrease_item_quantity(able_to_add)

func left_click_not_holding(slot: SlotClass):
	PlayerInventory.remove_item(slot)
	holdingItem = slot.item
	slot.pick_from_slot()
	holdingItem.global_position = get_global_mouse_position()
