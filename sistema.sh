arquivo="Banco.txt"
[ ! -e "$arquivo" ] && echo "ERRO . Arquivo não existe. " && exit 1
[ ! -r "$arquivo" ] && echo "ERRO . Permição de leitura. " && exit 1
[ ! -w "$arquivo" ] && echo "ERRO . Permição de escrita. " && exit 1

lista(){
    while read -r linha
        do
            ["$(echo $linha | cut -cl)" = "#" ] && continue
            [ ! "$linha" ] && continue

            local id = "$(echo $linha | cut -d : -f 1)"
            local nome = "$(echo $linha | cut -d : -f 2)"
            local email = "$(echo $linha | cut -d : -f 3)"

            echo -e "${verde} Id: ${vermelho}$id"
            echo -e "${verde} Nome: ${vermelho}$nome"
            echo -e "${verde} E-mail: ${vermelho}$email"
        done < "$arquivo"
}