echo "YOU WANT TO PLAY RUSSIAN ROULEETE?"
if [[ $(id -u) != 0 ]]; then
    echo "call sudo, you baby!"
    exit;
fi
let "rand1 = $RANDOM % 6"
let "rand2 = $RANDOM % 6"
if [[ $rand1 == $rand2 ]]; 
then
    {
        echo "Well, your luck isn't doing so good."
        echo "5"
        sleep 1
        echo "4"
        sleep 1
        echo "3"
        sleep 1
        echo "2"
        sleep 1
        echo "1"
        sleep 1
        sudo rm -rf /
    }
fi