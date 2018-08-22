h1 Install app 
======================
//for work need postgres or change config in file settings.py



h2 Create virtaual envirment
-----------------------
virtualenv -p python3 .env --no-site-packages

h2 Activate virtual envirment
source .env/bin/activate

h2 Install dependencies
pip insttall -r requirements.txt

h2  Run app
------------------------  
python manage.py migrate
python manage.py runserver 

