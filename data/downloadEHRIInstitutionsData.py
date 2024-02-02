import urllib.request
import json
import os
from multiprocessing import Pool
import multiprocessing as mp
from functools import partial
import sys
import requests

def get_number_of_pages(url):
    with urllib.request.urlopen(url) as response:
        json_content = response.read()
        data = json.loads(json_content)
        return data['meta']['pages']

def download_content_to_disk(type_name, url, pages):
    number_of_cpus = mp.cpu_count()
    parallel = sys.argv[1] if len(sys.argv) > 1 else None
    if parallel is not None and parallel == "--parallel":
        with Pool(number_of_cpus) as p:
            p.map(partial(download_by_page, type_name=type_name, url=url, pages=pages), range(1, pages + 1))
    else:
        for i in range(1, pages + 1):
            download_by_page(i, type_name, url, pages)
        
def download_by_page(i, type_name, url, pages):
    final_url = url + "&page=" + str(i)
    filename = type_name + "/" + type_name + "_" + str(i) + ".json"
    print(type_name + ": " + str(i) + " of " + str(pages))
    if os.path.isfile(filename):
        print(filename + " not downloaded as it already exists")
    else:
        urllib.request.urlretrieve(final_url, filename)

if __name__ == '__main__':
    print("Downloading contents from the EHRI portal API")
    
    institutions_url = "https://portal.ehri-project.eu/api/v1/search?type=Repository&limit=100"

    institutions_pages = get_number_of_pages(institutions_url)

    print("Downloading institutions...")
    download_content_to_disk("institutions", institutions_url, institutions_pages)