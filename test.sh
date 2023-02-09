SHARE=$(pwd)
IMAGE=$1
NAME=$(sudo docker run -d -v ${SHARE}:/host/Users -it ${IMAGE} /bin/bash)
echo '****************'
sudo docker exec -i $NAME ./ask /host/Users/data/pokemon_characters/eevee_pokemon.txt 3 /host/Users/test_questions.txt
echo '****************'
sudo docker exec -i $NAME ./answer /host/Users/data /host/Users/test_questions.txt
echo '****************'
sudo docker stop $NAME >/dev/null
