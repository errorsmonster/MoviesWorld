if [ -z "$UPSTREAM_REPO" ]
then
  echo "Cloning main Repository"
  git clone https://github.com/akarunachalamprogrammer/DQ-the-file-donor-bot DQ-the-file-donor-bot
else
  echo "Cloning Custom Repo from $UPSTREAM_REPO"
  git clone "$UPSTREAM_REPO" DQ-the-file-donor-bot
fi

cd DQ-the-file-donor-bot  # Change to the correct directory

# Check if 'requirements.txt' exists before attempting to install it
if [ -e requirements.txt ]
then
  pip install --upgrade pip
  pip install -U -r requirements.txt
else
  echo "ERROR: 'requirements.txt' not found in the current directory."
  exit 1  # Exit the script with an error code
fi

echo "Starting DQ-The-File-Donor...."
python3 bot.py
