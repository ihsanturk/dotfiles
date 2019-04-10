for((i = 0; i < 257; i++)); do 
    printf "\E[38;5;${i}m\$(tput setaf $i)  ";
    let i++;
    printf "\E[38;5;${i}m\$(tput setaf $i)  ";
    let i++;
    printf "\E[38;5;${i}m\$(tput setaf $i)  ";
    let i++;
    printf "\E[38;5;${i}m\$(tput setaf $i)\n";
done
