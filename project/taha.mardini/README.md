# File Management Program

This is an open-source File Management program developed as part of the IT-403 course at Global University during the Spring 2023 semester. The program, written in Bash scripting, provides a convenient way to perform various file operations such as viewing, creating, deleting, renaming, and searching files within a specific directory.

## Program Options

The File Management program offers the following six options:

1. **List Files**: This option calls the `list_files()` function to display all the files in the selected directory.

2. **Create a File**: Choosing this option triggers the `create_file()` function, which prompts the user to enter a file name for creating a new file in the specified directory. Upon successful creation, a confirmation message is displayed.

3. **Delete a File**: When this option is selected, the `delete_file()` function is invoked, prompting the user to enter the name of the file they wish to delete. The specified file is then deleted, and a success message is shown.

4. **Rename a File**: Selecting this option executes the `rename_file()` function. The user is asked to provide the current name of the file they want to rename, as well as the desired new name. The specified file is then renamed accordingly, and a confirmation message is displayed.

5. **Search for a File**: This option utilizes the `search_file()` function to prompt the user for a file name to search within the specified directory. If the file is found, it is returned to the user; otherwise, a message indicating that the file was not found is displayed.

6. **Exit**: Selecting this option terminates the program.

## Usage

The main program consists of a loop that repeatedly calls the `display_menu()` function, which displays the available options. The user is prompted to enter a number corresponding to their desired action.

If the user enters anything other than a number between 1 and 6, an error message is shown, indicating that the input is invalid. The user is then prompted to try again.

Please note that this program assumes basic familiarity with Bash scripting and requires the necessary permissions to perform file operations within the specified directory.

For any questions or feedback, please contact Taha Mardini.
