import xml.etree.ElementTree as ET
import random

# Function to generate a random film entry
def generate_film_entry(film_id):
    film = ET.Element("film", {"id": str(film_id)})

    name = ET.SubElement(film, "name")
    name.text = f"Film-{film_id}"

    year = ET.SubElement(film, "year")
    year.text = str(random.randint(2000, 2022))

    country = ET.SubElement(film, "country")
    country.text = random.choice(["USA", "UK", "Canada", "France", "Germany"])

    directors = ET.SubElement(film, "directors")
    num_directors = random.randint(1, 3)
    for _ in range(num_directors):
        director = ET.SubElement(directors, "director")
        director.text = f"Director-{random.randint(1, 10)}"

    return film

# Create the root element
films = ET.Element("films")

# Generate 1000 film entries
for i in range(1, 1001):
    film_entry = generate_film_entry(i)
    films.append(film_entry)

# Create and save the XML file
tree = ET.ElementTree(films)
tree.write("films_1000_entries.xml")