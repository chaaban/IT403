# ToDo List Bash Script

This Bash script enables you to manage a todo list through the command line. The script provides options to display the list, add tasks, edit tasks, mark tasks as done, and delete tasks.

## Functions

1. `display_todolist()`: Displays the current todo list by reading and printing the contents of the `list.txt` file.

2. `add_task()`: Appends a new task provided as an argument to the end of the `list.txt` file.

3. `edit_task()`: Modifies an existing task in the `list.txt` file. It accepts the new task and the task number to be edited as arguments. The function uses `sed` to replace the line containing the specified task number with the new task.

4. `mark_as_done()`: Marks a task as done in the `list.txt` file. It accepts the task number as an argument and modifies the line by adding `[DONE]` before the task.

5. `delete_task()`: Deletes a task from the `list.txt` file. It accepts the task number as an argument and removes the corresponding line from the file.

## Main Script

The script presents a menu-based interface that allows users to choose different actions for managing the todo list. The main loop continues until the user selects the "Exit" option.

## Example Usage

1. Save the script in a file (e.g., `todo.sh`).
2. Make the script executable by running `chmod +x todo.sh`.
3. Run the script using `./todo.sh`.
4. Follow the menu prompts to interact with the todo list (display, add, edit, mark as done, delete tasks).

Please note that the script assumes the presence of a `list.txt` file in the same directory to store the tasks.

