#!/usr/bin/env python
import json
import sys
import zipfile
from pathlib import Path

import requests


def main():
    content = Path("packages.json").read_text()
    packages = json.loads(content)

    for package in packages:
        name = package["name"]
        url = package["url"]
        path = Path(f"temp/{name}.zip")
        path.parent.mkdir(exist_ok=True)

        print(f"Downloading {name} from {url}")

        req = requests.get(url)

        if not req.ok:
            print(f"Couldn't get the file for {name}: Code {req.status_code}", file=sys.stderr)
            continue

        print(f"File for {name} was downloaded, starting extraction")

        with open(path, "wb") as file:
            file.write(req.content)

        with zipfile.ZipFile(path) as zf:
            for c_file in zf.namelist():
                if not c_file.endswith(".pkg.tar.zst"):
                    continue

                zf.extract(c_file, "x86_64")
                print(f"Extracted {c_file}")

        path.unlink(missing_ok=True)

        print(f"Finished processing {name}")


if __name__ == "__main__":
    main()
