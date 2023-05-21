#!/bin/bash
# Define an array of team members
team=("Tarek" "Mohammad" "Abed" "Ali" "Hasan" "Ahmad")
# Define an array of positions
positions=("Forward" "Midfielder" "Defender" "Goalkeeper")
# Define an associative array of player positions
declare -A player_positions
# Initialize player positions to empty strings
for player in "${team[@]}"; do
player_positions["$player"]=""
done
# Function to add a player to the team
function add_player {
echo "Enter player name: "
read name
# Check if player is already on the team
if [[ "${team[@]}" =~ "$name" ]]; then
echo "Player already on the team."
return
fi
echo "Enter player position (Forward, Midfielder, Defender, Goalkeeper): "
read position
# Validate position
if [[ ! "${positions[@]}" =~ "$position" ]]; then
echo "Invalid position."
return
fi
# Add player to team
team+=($name)
# Assign player position
player_positions["$name"]=$position
echo "Player added."
}
# Function to remove a player from the team
function remove_player {
echo "Enter player name: "
read name
# Check if player is on the team
if [[ ! "${team[@]}" =~ "$name" ]]; then
echo "Player not found."
return
fi
# Remove player from team
team=("${team[@]/$name}")
# Remove player position
unset player_positions["$name"]
echo "Player removed."
}
# Function to list the team roster
function list_roster {
echo "Team Roster:"
for player in "${team[@]}"; do
position=${player_positions["$player"]}
echo "$player - $position"
done
}
# Function to modify a player's position
function modify_position {
echo "Enter player name: "
read name
# Check if player is on the team
if [[ ! "${team[@]}" =~ "$name" ]]; then
echo "Player not found."
return
fi
echo "Enter new player position (Forward, Midfielder, Defender, Goalkeeper): "
read position
# Validate position
if [[ ! "${positions[@]}" =~ "$position" ]]; then
echo "Invalid position."
return
fi
# Update player position
player_positions["$name"]=$position
echo "Player position updated."
}
# Main loop
while true; do
echo "Menu:"
echo "1. Add player"
echo "2. Remove player"
echo "3. List roster"
echo "4. Modify player position"
echo "5. Exit"
read choice
case $choice in
1)
add_player
;;
2)
remove_player
;;
3)
list_roster
;;
4)
modify_position
;;
5)
exit 0
;;
*)
echo "Invalid choice."
;;
esac
echo
done
