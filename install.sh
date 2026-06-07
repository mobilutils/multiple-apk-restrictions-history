# quick script to get ready to use this repo

git clone https://github.com/mobilutils/apk-restrictions-extract.git
(
  cd apk-restrictions-extract/dependency
  bash ./dl-modified-gplaydl.sh
)
cd apk-restrictions-extract/dependency
python3 -m venv mvenv
source mvenv/bin/activate
pip3 install -r gplaydl/requirements.txt
