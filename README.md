```batch
                                                                                                                                                                                                             
 _    _ _       _____                      _ _         
| |  | (_)     /  ___|                    (_) |        
| |  | |_ _ __ \ `--.  ___  ___ _   _ _ __ _| |_ _   _ 
| |/\| | | '_ \ `--. \/ _ \/ __| | | | '__| | __| | | |
\  /\  / | | | /\__/ /  __/ (__| |_| | |  | | |_| |_| |
 \/  \/|_|_| |_\____/ \___|\___|\__,_|_|  |_|\__|\__, |
                                                  __/ |
                                                 |___/ 
            
```                                                                                                                                                                                                                     
                                                                                                                                                                                                                     


# windows-security #
# Explanations about the function of the program in brief

## When the user enters Windows and logs in, this program has 20 seconds to create a folder with the name sec in Windows document, and when it could not create it, Windows goes into lock mode, otherwise, it is free and can do its activities inside Windows.
This loop is repeated and if he logs in again and if the folder does not exist, he locks it again until the folder exists.
The command to run the bat file is executed in secret without displaying it on the screen

### copy run_hidden.vbs in shell:startup and edit Files and add check_folder.bat location in .vbs files
### dotnet-figlet
#### .NET global tool to convert in a figlet representation the given text.

# Install With Cmd
```batch
dotnet tool install -g dotnet-figlet
```
# File -> check_folder.bat
This is a Windows batch script that performs a specific task in a loop. Here's a breakdown of what each part of the code does:

### Breakdown of the Script

1. **`@echo off`**: This command prevents the commands in the script from being displayed in the command prompt window when the script runs.

2. **`:loop`**: This is a label that marks a point in the script that can be referenced by the `goto` command. You can think of it as a way to create a loop.

3. **`timeout /t 20 /nobreak`**: This command makes the script pause for 20 seconds. The `/nobreak` option ensures that this timer cannot be interrupted by pressing a key on the keyboard.

4. **`if not exist "%USERPROFILE%\Documents\sec"`**: This line checks if a directory named `sec` does not exist in the user's Documents folder. `%USERPROFILE%` is an environment variable that points to the current user's profile directory.

5. **`(` ... `)`**: The parentheses group commands that should be executed if the condition in the `if` statement is true.

6. **`rundll32.exe user32.dll,LockWorkStation`**: If the `sec` directory does not exist, this command will lock the workstation. This is effectively equivalent to hitting `Win + L` on the keyboard.

7. **`exit`**: If the workstation is locked, the script will exit and stop running.

8. **`goto loop`**: If the `sec` directory does exist, the script goes back to the `:loop` label and starts over, thus reinitiating the 20-second timer.

### Summary
In summary, this script continuously checks if the directory `sec` exists in the specified path. If it does not, the script locks the workstation after waiting for 20 seconds. If the directory is present, the script keeps running without locking the workstation. This could serve as a security measure for a workstation that should remain locked when not in use, unless a specific directory is created. 

To use this script, you can copy and paste it into a text editor and save it with a `.bat` file extension. To run it, simply double-click the file, and it will execute on your Windows machine.

# File -> run_hidden.vbs
The snippet you provided is a Visual Basic Script (VBS) that creates a shell to run a batch file (`check_folder.bat`) located in the `E:\` directory. Let's break it down:

### Code Breakdown

1. **Set WshShell = CreateObject("WScript.Shell")**: This line creates an instance of the WScript Shell object, which allows you to run external programs, scripts, or commands.

2. **WshShell.Run "E:\check_folder.bat", 0**: This line uses the `Run` method of the `WshShell` object to execute the specified batch file. The second argument `0` is used to specify the window style:
   - `0`: Runs the application hidden (invisible).
   - `1`: Runs the application in a normal window.
   - `2`: Runs the application minimized.
   - There are other options as well, but `0` is used for a hidden execution.

### Complete Example

Here is how you would put this into a complete `.vbs` file. Save this code in a file with a `.vbs` extension, for example, `run_bat_hidden.vbs`:

```vbscript
Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "E:\check_folder.bat", 0
```

### Usage

- **Running the Script**: To execute the VBS script, you can double-click on the `.vbs` file, or run it from the command line using `cscript run_bat_hidden.vbs`.
- **Batch File**: Ensure that the `check_folder.bat` file exists at the specified location (`E:\`). 

### Note

- If you want the script to run in a visible command prompt, you can change the `0` to `1` in the `Run` method.
- Ensure that your batch file (`check_folder.bat`) contains the commands you want to execute.

This script can be useful for automating tasks that you might want to run in the background without user interaction or without showing the command prompt window.

# File -> Time.bat
The code you provided is a Windows batch file that performs a countdown for a security check. Let’s break down what this script does step-by-step:

### Code Explanation

1. **`@echo off`**: This command disables the display of the commands being executed in the command prompt. It makes the output cleaner.

2. **`setlocal enabledelayedexpansion`**: This command starts a local environment for the batch file and enables delayed expansion of variables. Delayed expansion allows the use of `!variable!` syntax to access variables that might change during the execution of a loop.

3. **`set /a seconds=20`**: This sets a variable called `seconds` to 20. The `/a` flag is used to perform arithmetic operations.

4. **`:loop`**: This is a label used as a target for the `goto` command. The script will jump to this point repeatedly to create a loop.

5. **`cls`**: This command clears the console screen, providing a fresh display for each iteration of the loop.

6. **`figlet Security Check`**: This command attempts to use `figlet` to display "Security Check" in a stylized text format. Note: `figlet` may not be installed by default on Windows; if it’s not available, you may need to install it or replace it with an equivalent command.

7. **`echo checking You security..`**: This outputs a simple message indicating a security check is underway.

8. **`echo Time remaining: !seconds! seconds`**: This displays the remaining time on the console. The `!seconds!` uses delayed expansion to show the current value of the `seconds` variable.

9. **`timeout /t 1 >nul`**: This command pauses the script for 1 second. The `>nul` part suppresses any output from the timeout command.

10. **`set /a seconds-=1`**: This decreases the value of `seconds` by 1.

11. **`if !seconds! geq 0 goto loop`**: This checks if `seconds` is greater than or equal to zero. If true, it goes back to the `:loop` label to repeat the process.

12. **`echo Countdown finished!`**: This line executes once the countdown reaches zero, displaying a message indicating the countdown has finished.

13. **`pause`**: This command pauses the script and waits for the user to press any key before exiting.

### Summary
The script serves to visually display a countdown timer for a security check, clearing the screen and updating the countdown every second. It effectively uses a loop and conditional statements to manage the countdown and provides a basic user interaction at the end.

### Note
- Make sure you have `figlet` installed if you're using that command. Alternatively, you can use a simple `echo` command to display plain text.
- This script is meant to be run in a Command Prompt environment on Windows.

# File -> With clean.bat

This script is a Windows batch file that continuously checks for the existence of a specific folder (in this case, `mmd` inside the `Documents` directory of the current user) and takes actions based on whether or not the folder exists. Let’s break down its components:

### Breakdown of the Script:

1. **`@echo off`**: This command prevents the commands in the script from being shown in the command prompt window when they are executed.

2. **`setlocal`**: This command creates a local environment that can include environmental variable changes. It ensures that variables modified in this script do not affect the global environment.

3. **`:loop`**: This is a label used to create a loop. The script will jump to this label with the `goto` command.

4. **`timeout /t 20 >nul`**: This command pauses the script for 20 seconds. The `>nul` portion suppresses any output.

5. **`if exist "%USERPROFILE%\Documents\mmd\" (`**: This checks if the folder `mmd` exists in the user's Documents directory. 

6. **Inside the `if` block**:
   - **`echo "Folder exists."`**: If the folder exists, this line outputs that message to the command prompt.

7. **`else (`**: This part of the statement is executed if the folder does not exist.

8. **Inside the `else` block**:
   - **`echo "Folder does not exist. Locking screen."`**: This line outputs a message indicating the folder is not present.
   - **`rundll32.exe user32.dll,LockWorkStation`**: This command locks the workstation (the computer). 

9. **`goto loop`**: This command sends the script back to the `:loop` label, creating an infinite loop.

10. **`:cleanup`**: This label is defined for cleanup purposes, but it is never reached in this script since there is no `goto cleanup` call made.

11. **`rd /s /q "%USERPROFILE%\Documents\mmd"`**: This command is intended to delete the `mmd` folder and all its contents quietly (without prompting for confirmation). However, since this block is never called in the given code, it won't execute unless explicitly invoked.

12. **`exit`**: This command is used to exit the script or the command prompt session.

### Considerations and Usage:
- **Infinite Loop**: This script is designed to run indefinitely, checking the existence of the folder every 20 seconds. 
- **Lock Workstation**: This can be useful for security but could be disruptive, especially if you inadvertently delete the folder and the screen locks every 20 seconds.
- **Unreachable Cleanup**: The cleanup section isn't functional in its current state because there’s no mechanism to invoke it unless explicitly called.

### Suggestions for Improvement:
- **Add an Exit Condition**: You might want to include a way to exit the loop gracefully, such as by checking for a specific key press or through another condition.
- **Reorganize Cleanup**: If you intend to have cleanup functionality (to remove the folder), you should define when and how this should be triggered properly.
- **User Feedback**: Instead of just locking the screen, provide some user feedback on how to resolve the issue, like prompting to create the folder or offering guidance.

### Important Note:
To run scripts like this, you'll need appropriate permissions, and it’s important to ensure you understand the implications of locking the workstation in an automated manner.


