# Checking Relays with Cardano Node Script

# Step 1: Prerequisites
Ensure that your Cardano block producer node is running and that you have the necessary permissions to access its files.

# Step 2: Download the Script
Open your preferred text editor.
Copy and paste the script provided earlier into the text editor.

# Step 3: Save the Script
Save the script with a meaningful name, for example, check_relays.sh.

# Step 4: Make the Script Executable
Open a terminal window.
Navigate to the directory where you saved the script.
```console
cd /path/to/script/directory
```
Make the script executable.
```console
chmod +x check_relays.sh
```

# Step 5: Edit the Script (Optional)
Open the script in your text editor if you want to customize any parameters (e.g., change the NODE_HOME directory).

# Step 6: Run the Script
Execute the script.
```console
./check_relays.sh
```

# Step 7: Review the Output
The script will output whether each relay specified in the pool.cert file is present in the topology.json file.
If there are errors, the script will notify you about relays that are not found in the topology.json.

# Step 8: Troubleshooting
If you encounter issues, ensure that the jq command is installed on your system. You can install it using your package manager (e.g., sudo apt-get install jq for Debian-based systems).

# Step 9: Script Completion
Once the script has completed, it will display a message indicating that the script execution has finished.
Note:

It's crucial to have accurate file paths and permissions for your Cardano node configuration files.
Ensure that the Cardano explorer's topology.json URL is accessible.
Regularly check for updates to the script based on any changes in Cardano node configurations or explorer endpoints.
That's it! You've successfully used the script to check if your specified relays match those listed in the topology.json file.
