#!/bin/bash

# Function to create a 2D matrix workspace for a robot
function create_workspace() {
  local workspace=(
    "1 1 1 1 1"
    "1 1 1 1 1"
    "1 1 1 1 1"
    "1 1 1 1 1"
    "1 1 1 1 1"
  )
  local robot="R"
  local row=2
  local column=2
  
  function insert_obstacle() {
    local obstacle_row=$1
    local obstacle_column=$2
    if ((obstacle_row >= 0 && obstacle_row < 5 && obstacle_column >= 0 && obstacle_column < 5)); then
      workspace[$obstacle_row]="${workspace[$obstacle_row]:0:$((obstacle_column * 2))}0${workspace[$obstacle_row]:$((obstacle_column * 2 + 1))}"
      echo "Obstacle inserted at ($obstacle_row, $obstacle_column)"
    else
      echo "Invalid coordinates. Obstacle not inserted."
    fi
  }
  
  function move_up() {
    if ((row > 0 && workspace[$((row - 1))]:$((column * 2)) == "1")); then
      workspace[$row]="${workspace[$row]:0:$((column * 2))}1${workspace[$row]:$((column * 2 + 1))}"
      row=$((row - 1))
      workspace[$row]="${workspace[$row]:0:$((column * 2))}$robot${workspace[$row]:$((column * 2 + 1))}"
      echo "Robot moved up."
      visualize_workspace
    else
      echo "Invalid move. Robot cannot move up."
    fi
  }
  
  function move_down() {
    if ((row < 4 && workspace[$((row + 1))]:$((column * 2)) == "1")); then
      workspace[$row]="${workspace[$row]:0:$((column * 2))}1${workspace[$row]:$((column * 2 + 1))}"
      row=$((row + 1))
      workspace[$row]="${workspace[$row]:0:$((column * 2))}$robot${workspace[$row]:$((column * 2 + 1))}"
      echo "Robot moved down."
      visualize_workspace
    else
      echo "Invalid move. Robot cannot move down."
    fi
  }
  
  function move_left() {
    if ((column > 0 && workspace[$row]:$(((column - 1) * 2)) == "1")); then
      workspace[$row]="${workspace[$row]:0:$(((column - 1) * 2))}1${workspace[$row]:$(((column - 1) * 2 + 1))}"
      column=$((column - 1))
      workspace[$row]="${workspace[$row]:0:$((column * 2))}$robot${workspace[$row]:$((column * 2 + 1))}"
      echo "Robot moved left."
      visualize_workspace
    else
      echo "Invalid move. Robot cannot move left."
    fi
  }
  
  function move_right() {
    if ((column < 4 && workspace[$row]:$(((column + 1) * 2)) == "1")); then
      workspace[$row]="${workspace[$row]:0:$(((column + 1) * 2))}1${workspace[$row]:$(((column + 1) * 2 + 1))}"
      column=$((column + 1))
      workspace[$row]="${workspace[$row]:0:$((column * 2))}$robot${workspace[$row]:$((column * 2 + 1))}"
      echo "Robot moved right."
      visualize_workspace
    else
      echo "Invalid move. Robot cannot move right."
    fi
  }
  
  function visualize_workspace() {
    echo "Workspace:"
    for ((i = 0; i < 5; i++)); do
      echo "${workspace[$i]}"
    done
  }
  
  insert_obstacle 1 2
  insert_obstacle 3 4
  visualize_workspace
  
  move_up
  move_right
  move_right
  move_down
  move_down
  move_left
  move_up
}

# Call the create_workspace function
create_workspace

