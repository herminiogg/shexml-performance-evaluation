import json
import random

# Function to generate a random film entry
def generate_film_entry(film_id):
    return {
        "id": film_id,
        "name": f"Film-{film_id}",
        "year": str(random.randint(2000, 2022)),
        "country": random.choice(["USA", "UK", "Canada", "France", "Germany"]),
        "director": [
            f"Director-{random.randint(1, 10)}",
            f"Director-{random.randint(1, 10)}",
        ]
    }

# Generate 1000 film entries
films_data = {
    "films": [generate_film_entry(i) for i in range(1, 1001)]
}

# Create and save the JSON file
with open("films_1000_entries.json", "w") as json_file:
    json.dump(films_data, json_file, indent=2)