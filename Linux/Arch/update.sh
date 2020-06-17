echo "Do you wanna check updates?"
read input
if [[ $input = +(Y|y)* ]];
    then
        {
            sudo pacman -Syyyyyyyu
        }
    else
        {
            echo "See you in next restart xD"
        }
fi