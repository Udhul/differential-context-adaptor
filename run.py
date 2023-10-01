from dotenv import load_dotenv
from pathlib import Path

# Overwrite existing environment variables with any variables of the same name given in the .env
env_path = Path('.') / '.env'
if env_path.exists():
    load_dotenv(env_path)

# Launch Code ...
print("Reached run.py")